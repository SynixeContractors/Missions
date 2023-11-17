#include "..\..\..\script_component.hpp"

eod_mines = [
    "tacgt_ModuleMine_APERSBoundingMine_Training_F",
    "tacgt_ModuleMine_APERSMine_Training_F",
    "tacgt_ModuleMine_ApersTripMine_Training_F",
    "tacgt_ModuleMine_ATMine_Training_F",
    "tacgt_ModuleMine_Claymore_Training_F"
];

eod_objects = [];

{
    _x hideObject true;
    _x enableSimulation false;
} forEach ((getMissionLayerEntities "EOD - Tripwires") select 0);
{
    _x hideObject true;
    _x enableSimulation false;
} forEach ((getMissionLayerEntities "EOD - Garbage") select 0);
{
    _x hideObject true;
    _x enableSimulation false;
} forEach ((getMissionLayerEntities "EOD - Cars") select 0);

MFUNC(eod,reset) = {
    {
        _x hideObject true;
        _x enableSimulation false;
    } forEach ((getMissionLayerEntities "EOD - Garbage") select 0);
    {
        _x hideObject true;
        _x enableSimulation false;
    } forEach ((getMissionLayerEntities "EOD - Cars") select 0);
    private _objects = (nearestObjects [getPosATL eod_spawn, [], 40]) - ((getMissionLayerEntities "EOD") select 0);
    private _objectsInField = _objects inAreaArray eod_spawn;
    {
        if !(isPlayer _x) then {
            deleteVehicle _x;
        };
    } forEach _objectsInField;
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
        _garbage hideObject false;
    };
    private _cars = ((getMissionLayerEntities "EOD - Cars") select 0);
    for "_i" from 0 to (floor random count _cars) do {
        private _car = _cars select _i;
        _car hideObject false;
    };
};

private _eodField = ["EngEODField","Reset Field","",{
    call MFUNC(eod,reset);
}, {true}] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions"], _eodField] call ace_interact_menu_fnc_addActionToObject;
} forEach ((getMissionLayerEntities "EOD - Tablets") select 0);

[{
    private _count = { alive _x } count eod_objects;
    private _texture = format ["#(rgb,256,512,3)text(0.5,1,""PuristaLight"",0.3,""#000000"",""#ffffff"",""Remaining\n%1"")", _count];
    {
        _x setObjectTexture [0, _texture];
    } forEach ((getMissionLayerEntities "EOD - Tablets") select 0);
}, 1] call CBA_fnc_addPerFrameHandler;
