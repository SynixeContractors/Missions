#include "..\..\..\script_component.hpp"

params ["_range"];

{
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

[QEGVAR(eod,tablets), [(getMissionLayerEntities format ["%1 - Tablets", _range]) select 0]] call CBA_fnc_globalEvent;

[QEGVAR(eod,reset), {
    params ["_range"];
    if (_range == "") exitWith {
        diag_log "EOD Reset: Range not specified.";
    };
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
    missionNamespace setVariable [QEGVAR(eod,objects), eod_objects, true];
}] call CBA_fnc_addEventHandler;
