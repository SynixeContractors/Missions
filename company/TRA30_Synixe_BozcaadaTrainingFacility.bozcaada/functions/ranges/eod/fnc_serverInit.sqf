#include "..\..\..\script_component.hpp"

params ["_range"];
diag_log format ["EOD: Initializing range '%1'.", _range];


private _rangeShort = switch (_range) do {
    case "EOD Urban": { missionNamespace setVariable [format ["%1_%2", QEGVAR(eod,objects), "urban"], [], true]; "urban" };
    case "EOD House": { missionNamespace setVariable [format ["%1_%2", QEGVAR(eod,objects), "house"], [], true]; "house" };
};

{
    diag_log format ["EOD: Hiding layer '%1 - %2'.", _range, _x];
    private _layer = getMissionLayerEntities format ["%1 - %2", _range, _x];
    if (count _layer > 0) then {
        {
            _x hideObjectGlobal true;
            _x enableSimulationGlobal false;
        } forEach (_layer select 0);
    };
} forEach ["Tripwires", "Garbage", "Cars"];

eod_mines = [
    "tacgt_ModuleMine_APERSBoundingMine_Training_F",
    "tacgt_ModuleMine_APERSMine_Training_F",
    "tacgt_ModuleMine_APERSBoundingMine_Training_F",
    "tacgt_ModuleMine_APERSMine_Training_F",
    "tacgt_ModuleMine_APERSBoundingMine_Training_F",
    "tacgt_ModuleMine_APERSMine_Training_F",
    "tacgt_ModuleMine_ATMine_Training_F",
    "tacgt_ModuleMine_Claymore_Training_F"
];

private _tablets = (getMissionLayerEntities format ["%1 - Tablets", _range]) select 0;
diag_log format ["EOD: Initializing %2 tablets '%1'.", _range, count _tablets];
[QEGVAR(eod,tablets), [_tablets, _range, _rangeShort]] call CBA_fnc_globalEventJIP;
diag_log format ["EOD: Tablets for range '%1' initialized.", _range];

[QEGVAR(eod,reset), {
    params ["_range"];
    if (_range == "") exitWith {
        diag_log "EOD Reset: Range not specified.";
    };
    diag_log format ["EOD Reset: Resetting range '%1'.", _range];
    private _spawn = switch (_range) do {
        case "EOD Urban": { eod_urban_spawn };
        case "EOD House": { eod_house_spawn };
    };
    if (isNil "_spawn") exitWith {
        diag_log format ["EOD Reset: Spawn point for range '%1' not found.", _range];
    };
    {
        private _layer = getMissionLayerEntities format ["%1 - %2", _range, _x];
        if (count _layer > 0) then {
            {
                _x hideObjectGlobal true;
                _x enableSimulationGlobal false;
            } forEach (_layer select 0);
        };
    } forEach ["Garbage", "Cars"];
    private _objects = (nearestObjects [getPosATL _spawn, [], 40]) - ((getMissionLayerEntities "EOD") select 0);
    {
        if ((!isPlayer _x) && (!isObjectHidden _x)) then {
            deleteVehicle _x;
        };
    } forEach (_objects inAreaArray _spawn);
    eod_objects = [];
    for "_i" from 0 to 15 do {
        private _pos = _spawn call BIS_fnc_randomPosTrigger;
        _pos set [2, 0]; // Force ground level
        private _obj = selectRandom eod_mines;
        private _obj = createVehicle [_obj, _pos, [], 0, "CAN_COLLIDE"];
        eod_objects pushBack _obj;
    };
    private _tripwires = ((getMissionLayerEntities format ["%1 - Tripwires", _range]) select 0);
    [_tripwires, true] call CBA_fnc_shuffle;
    for "_i" from 0 to (floor random count _tripwires) do {
        private _tripwire = _tripwires select _i;
        private _obj = createVehicle ["tacgt_ModuleMine_ApersTripMine_Training_F", position _tripwire, [], 0, "CAN_COLLIDE"];
        _obj setDir (getDir _tripwire);
        eod_objects pushBack _obj;
    };
    {
        private _layer = getMissionLayerEntities format ["%1 - %2", _range, _x];
        if (count _layer > 0) then {
            private _layer = _layer select 0;
            [_layer, true] call CBA_fnc_shuffle;
            for "_i" from 0 to (floor random count _layer) do {
                private _item = _layer select _i;
                _item hideObjectGlobal false;
            };
        };
    } forEach ["Garbage", "Cars"];
    private _rangeShort = switch (_range) do {
        case "EOD Urban": { "urban" };
        case "EOD House": { "house" };
    };
    missionNamespace setVariable [format ["%1_%2", QEGVAR(eod,objects), _rangeShort], eod_objects, true];
}] call CBA_fnc_addEventHandler;

diag_log format ["EOD: Server '%1' initialization complete.", _range];
