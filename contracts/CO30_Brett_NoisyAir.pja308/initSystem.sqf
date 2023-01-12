
missionNamespace setVariable ["#EM_FMin", 0];
missionNamespace setVariable ["#EM_FMax", 100];

missionNamespace setVariable ["#EM_SelMin", 59];
missionNamespace setVariable ["#EM_SelMax", 60];

missionNamespace setVariable ["#EM_SMin", -120];
missionNamespace setVariable ["#EM_SMax", 0];

missionNamespace setVariable ["#EM_Transmit", false];

mission_jams = createHashMap;

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

mission_logic = {
    {
        if (isEngineOn _x) then {
            mission_sources set [netId _x, [[(_x getSoundController "rpm") * 0.000001, 0.000001]]];
        } else {
            mission_sources deleteAt netId _x;
        };
    } forEach (entities "Car");

    (call mission_dir) params ["_looking", "_incline"];

    private _values = createHashMap;
    private _interference = createHashMap;
    {
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

        private _error = 180 - abs (abs (_dir - _looking) - 180) + (abs (_incline - _targetIncline));
        {
            _x params ["_f", "_mW"];
            private _strength = [_f, _mW, ace_player, _source] call mission_signalCalc;
            systemChat format ["%1@%2 (%3): %4", _f, _mW, _source, _strength];
            private _visualStrength = _strength;
            private _existing = _interference getOrDefault [_f, -1000];
            if (_existing != -1000) then {
                _strength = _strength max _existing;
            };
            if !(isPlayer _source) then {
                _interference set [_f, _strength];
            };
            private _existing = _values getOrDefault [_f, -1000];
            _visualStrength = _visualStrength - (_error * 2);
            if (_existing == -1000) then {
                _values set [_f, _visualStrength];
            } else {
                _values set [_f, _visualStrength max _existing];
            };
        } forEach _y;
    } forEach mission_sources;
    private _em_values = [];
    {
        _em_values pushBack _x;
        _em_values pushBack _y;
    } forEach _values;
    missionNamespace setVariable ["#EM_Values", _em_values];
    mission_jams = +_interference;
};

[{
    call mission_logic;
}] call CBA_fnc_addPerFrameHandler;

mission_changeSettings = {
    private _unit = missionNamespace getVariable ["mission_unit", 1];
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

    private _jam = mission_jams getOrDefault [_f, -1000];

    if (_jam > _maxSignal) then {
        _Px = 0;
    };

    [_Px, _maxSignal]
}] call acre_api_fnc_setCustomSignalFunc;

addUserActionEventHandler ["nextweapon", "Activate", {
    if (currentWeapon vehicle player != "hgun_esd_01_F") exitWith {};
    call mission_changeSettings;
}];
