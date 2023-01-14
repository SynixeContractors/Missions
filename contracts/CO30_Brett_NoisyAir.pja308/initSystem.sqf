if !(hasInterface) exitWith {};

missionNamespace setVariable ["#EM_FMin", 0];
missionNamespace setVariable ["#EM_FMax", 100];

missionNamespace setVariable ["#EM_SelMin", 59];
missionNamespace setVariable ["#EM_SelMax", 60];

missionNamespace setVariable ["#EM_SMin", -130];
missionNamespace setVariable ["#EM_SMax", 10];

missionNamespace setVariable ["#EM_Transmit", false];

[{
    call mission_logic;
}] call CBA_fnc_addPerFrameHandler;

mission_signalCalc = {
    params ["_f", "_mW", "_receiver", "_source"];

    private _txPos = getPosASL _receiver;
    private _rxPos = getPosASL _source;
    private _distance = _txPos distance _rxPos;

    private _Lfs = -27.55 + 20*log(_f) + 20*log(_distance);
    private _Ptx = 10 * (log ((_mW)/1000)) + 30;

    private _ituLoss = 36;

    private _Ltx = 3;
    private _Lrx = 3;

    private _Lm = _ituLoss + ((random 1) - 0.5);

    private _Lb = _Ptx - _Ltx - _Lfs - _Lm  - _Lrx;

    _Lb
};

mission_dir = {
    private _position = ATLToASL positionCameraToWorld [0,0,0];
    private _direction = ATLToASL positionCameraToWorld [0,0,1];

    private _azimuth = ((_direction select 0) - (_position select 0)) atan2 ((_direction select 1) - (_position select 1));
    private _inclination = asin ((_direction select 2) - (_position select 2));

    if (_azimuth < 0) then {_azimuth = _azimuth + 360};

    [_azimuth, _inclination]
};

mission_process = mission_sources toArray false;
mission_values = createHashMap;
mission_interference = createHashMap;
mission_lastRun = 0;
mission_scanDuration = 2;
mission_scanTime = 0;

mission_logic = {
    (call mission_dir) params ["_looking", "_incline"];

    if (currentWeapon vehicle ace_player == "hgun_esd_01_F") then {
        mission_scanDuration = 0.2;
    } else {
        mission_scanDuration = 1.5;
    };

    private _total = count mission_sources;

    if (mission_process isEqualTo []) exitWith {
        private _now = diag_tickTime;
        if (_now - mission_lastRun < mission_scanDuration) exitWith {};
        {
            if (isEngineOn _x) then {
                mission_sources set [netId _x, [[(_x getSoundController "rpm") * 0.000001, 0.000001]]];
            } else {
                mission_sources deleteAt netId _x;
            };
        } forEach (entities "Car");

        mission_lastRun = _now;
        mission_process = mission_sources toArray false;
        mission_values = +mission_values_building;
        mission_interference = +mission_interference_building;
        private _em_values = [];
        {
            _em_values pushBack _x;
            _em_values pushBack _y;
        } forEach mission_values;
        missionNamespace setVariable ["#EM_Values", _em_values];
        mission_values_building = createHashMap;
        mission_interference_building = createHashMap;
    };

    private _timeSpent = diag_tickTime - mission_lastRun;
    private _bucket = floor (_total / (mission_scanDuration / diag_deltaTime));

    for "_i" from 0 to _bucket do {
        if (mission_process isEqualTo []) then { continue };
        private _start = diag_tickTime;
        private _object = mission_process deleteAt 0;
        _object params ["_x", "_y"];
        private _source = objectFromNetId _x;
        if (isNull _source) then {
            mission_sources deleteAt _x;
            continue;
        };
        if !(alive _source) exitWith {
            mission_sources deleteAt netId _source;
        };
        private _dir = ace_player getDir (
            _source modelToWorld (
                _source selectionPosition ["motor", "HitPoints", "FirstPoint"]
            )
        );
        private _targetDistance = (getPosASL _source) distance2D (getPosASL ace_player);
        private _heightDiff = ((getPosASL _source) select 2) - ((eyePos ace_player) select 2) + (0 boundingBoxReal _source)#1#2;
        private _targetIncline = atan (_heightDiff / _targetDistance);
        private _error = 180 - abs (abs (_dir - _looking) - 180) + ((abs (_incline - _targetIncline)) * 0.8);

        private _last = 0;
        
        {
            _x params ["_f", "_mW"];
            if (_f == 0) then { continue; };
            private _strength = [_f, _mW, ace_player, _source] call mission_signalCalc;
            private _visualStrength = _strength;
            _visualStrength = _visualStrength - (_error * 2);
            if (_visualStrength < -150) then { continue; };
            private _existing = mission_interference_building getOrDefault [_f, -1000];
            if (_existing != -1000) then {
                _strength = _strength max _existing;
            };
            if !(isPlayer _source) then {
                mission_interference_building set [_f, _strength];
            };
            private _existing = mission_values_building getOrDefault [_f, -1000];
            if (_existing == -1000) then {
                mission_values_building set [_f, _visualStrength];
            } else {
                mission_values_building set [_f, _visualStrength max _existing];
            };
            _last = _f;
        } forEach _y;
        mission_scanTime = mission_scanTime max (diag_tickTime - _start);
    };
};

mission_changeSettings = {
    private _unit = missionNamespace getVariable ["mission_unit", 2];
    private _unitIndex = switch (_unit) do {
        case 0.000001: { 0 };
        case 0.001: { 1 };
        case 1000: { 3 };
        default { 2 };
    };
    [
        "Change Settings",
        [
            [
                "SLIDER",
                "Min Frequency",
                [
                    0,
                    1000,
                    (missionNamespace getVariable ["#EM_FMin", 0]) / _unit,
                    0
                ]
            ],
            [
                "SLIDER",
                "Window",
                [
                    1,
                    1000,
                    (missionNamespace getVariable ["mission_window", 100]),
                    0
                ]
            ],
            [
                "SLIDER",
                "Selector",
                [
                    0.1,
                    100,
                    (missionNamespace getVariable ["mission_selector", 1]),
                    0
                ]
            ],
            [
                "COMBO",
                "Unit",
                [
                    [
                        0.000001,
                        0.001,
                        1,
                        1000
                    ],
                    [
                        "Hz",
                        "kHz",
                        "MHz",
                        "GHz"
                    ],
                    _unitIndex
                ]
            ]
        ],
        {
            params ["_values"];
            _values params ["_fMin", "_window", "_selector", "_unit"];
            private _min = _fMin * _unit;
            private _max = _min + (_window * _unit);
            missionNamespace setVariable ["#EM_FMin", _min];
            missionNamespace setVariable ["#EM_FMax", _max];
            private _start = (_min + ((_max - _min) / 2));
            missionNamespace setVariable ["#EM_SelMin", _start];
            missionNamespace setVariable ["#EM_SelMax", _start + (_selector * _unit)];
            missionNamespace setVariable ["mission_unit", _unit];
            missionNamespace setVariable ["mission_window", _window];
            missionNamespace setVariable ["mission_selector", _selector];
        }
    ] call zen_dialog_fnc_create;
};

["acre_remoteStartedSpeaking", {
    params ["_unit", ["_onRadio", 0], ["_radioID", ""]];
    if (_unit == ace_player) exitWith {};
    if (_onRadio == 0) exitWith {};
    private _dataRemote = [_radioID, "getCurrentChannelData"] call acre_sys_data_fnc_dataEvent;
    private _frequencyRemote = _dataRemote getVariable ["frequencyTX", 0];
    mission_sources set [netId _unit, [[_frequencyRemote, 5000]]];
}] call CBA_fnc_addEventHandler;

["acre_remoteStoppedSpeaking", {
    params ["_unit"];
    if (_unit == ace_player) exitWith {};
    mission_sources deleteAt netId _unit;
}] call CBA_fnc_addEventHandler;

[{
    params ["_f", "_mW", "_receiverClass", "_transmitterClass"];
    private _coreSignal = _this call acre_sys_signal_fnc_getSignalCore;
    _coreSignal params ["_Px", "_maxSignal"];
    _maxSignal = _maxSignal - 15;
    private _jam = mission_interference getOrDefault [_f, -1000];
    if (_jam > _maxSignal) then {
        _Px = 0;
    };
    [_Px, _maxSignal]
}] call acre_api_fnc_setCustomSignalFunc;

addUserActionEventHandler ["nextweapon", "Activate", {
    if (currentWeapon vehicle ace_player != "hgun_esd_01_F") exitWith {};
    call mission_changeSettings;
}];

["grad_civs_lifecycle_civ_added", {
    {
        private _seed = parseNumber ((netid _x) select [2,10]);
        private _delay = (_seed random [0,0]) * 8;
        private _freq = (_seed random [1,1]) * 20 + 700;
        [_x, _delay, [[_freq, 150]]] call mission_delay;
        systemChat format ["%1: %2 - %3", _x, _seed, _freq];
    } forEach _this;
}] call CBA_fnc_addEventHandler;

["mission_addSource", {
    params ["_object", "_frequencies"];
    mission_sources set [netId _object, _frequencies];
}] call CBA_fnc_addEventHandler;

["mission_removeSource", {
    params ["_object"];
    mission_sources deleteAt netId _object;
}] call CBA_fnc_addEventHandler;

["mission_addDelay", {
    params ["_object", "_delay", "_frequencies"];
    [_object, _delay, _frequencies] call mission_delay;
}] call CBA_fnc_addEventHandler;

["mission_burst", {
    params ["_object", "_frequencies", "_duration"];
    private _id = netId _object;
    mission_sources set [_id, _frequencies];
    [{
        params ["_id"];
        mission_sources deleteAt _id;
    }, [_id], _duration] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["lambs_danger_OnPanic", {
    params ["_unit"];
    ["mission_burst", [_unit, [[random [55, 65, 75], 2000]], 6]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

["lambs_danger_OnArtilleryCalled", {
    params ["_unit", "_position"];
    ["mission_burst", [_unit, [[random [55, 65, 75], 4000]], 6]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;
