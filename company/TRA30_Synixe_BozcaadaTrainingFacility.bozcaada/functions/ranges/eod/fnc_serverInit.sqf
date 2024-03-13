#include "..\..\..\script_component.hpp"

{
    _x hideObjectGlobal true;
    _x enableSimulationGlobal false;
} forEach ((getMissionLayerEntities "EOD - Tripwires") select 0);
{
    _x hideObjectGlobal true;
    _x enableSimulationGlobal false;
} forEach ((getMissionLayerEntities "EOD - Garbage") select 0);
{
    _x hideObjectGlobal true;
    _x enableSimulationGlobal false;
} forEach ((getMissionLayerEntities "EOD - Cars") select 0);

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

[QEGVAR(eod,tablets), [(getMissionLayerEntities "EOD - Tablets") select 0]] call CBA_fnc_globalEvent;

[QEGVAR(eod,reset), {
    {
        _x hideObjectGlobal true;
        _x enableSimulationGlobal false;
    } forEach ((getMissionLayerEntities "EOD - Garbage") select 0);
    {
        _x hideObjectGlobal true;
        _x enableSimulationGlobal false;
    } forEach ((getMissionLayerEntities "EOD - Cars") select 0);
    private _objects = (nearestObjects [getPosATL eod_spawn, [], 40]) - ((getMissionLayerEntities "EOD") select 0);
    {
        if !(isPlayer _x) then {
            deleteVehicle _x;
        };
    } forEach (_objects inAreaArray eod_spawn);
    eod_objects = [];
    for "_i" from 0 to 15 do {
        private _pos = eod_spawn call BIS_fnc_randomPosTrigger;
        private _obj = selectRandom eod_mines;
        private _obj = createVehicle [_obj, _pos, [], 0, "CAN_COLLIDE"];
        eod_objects pushBack _obj;
    };
    private _tripwires = ((getMissionLayerEntities "EOD - Tripwires") select 0);
    for "_i" from 0 to (floor random count _tripwires) do {
        private _tripwire = _tripwires select _i;
        private _obj = createVehicle ["tacgt_ModuleMine_ApersTripMine_Training_F", position _tripwire, [], 0, "CAN_COLLIDE"];
        _obj setDir (getDir _tripwire);
        eod_objects pushBack _obj;
    };
    private _garbage = ((getMissionLayerEntities "EOD - Garbage") select 0);
    for "_i" from 0 to (floor random count _garbage) do {
        private _garbage = _garbage select _i;
        _garbage hideObjectGlobal false;
    };
    private _cars = ((getMissionLayerEntities "EOD - Cars") select 0);
    for "_i" from 0 to (floor random count _cars) do {
        private _car = _cars select _i;
        _car hideObjectGlobal false;
    };
    missionNamespace setVariable [QEGVAR(eod,objects), eod_objects, true];
}] call CBA_fnc_addEventHandler;
