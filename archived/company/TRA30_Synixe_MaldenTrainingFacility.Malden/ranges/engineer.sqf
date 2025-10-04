engineer_fence_fnc_make_clones = {
    {
        deleteVehicle _x;
    } forEach engineer_fence_clones;
    {
        _x hideObjectGlobal true;
        private _posATL = getPosATL _x;
        private _posClone = +_posATL;
        _posClone set [2, 0];
        _posATL set [2, 40];
        private _clone = (typeOf _x) createVehicle _posClone;
        _clone setPosATL _posClone;
        _clone setVectorDirAndUp [vectorDir _x, vectorUp _x];
        engineer_fence_clones pushBack _clone;
        publicVariable "engineer_fence_clones";
    } forEach engineer_fence_originals
};

call engineer_fence_fnc_make_clones;

private _fenceReset = ["EngFenceReset","Reset Fence","",{
    call engineer_fence_fnc_make_clones;
}, {true}] call ace_interact_menu_fnc_createAction;
[engineer_wirecutter_control, 0, ["ACE_MainActions"], _fenceReset] call ace_interact_menu_fnc_addActionToObject;

engineer_eod_props = [
    "Land_Wreck_Skodovka_F",
    "Land_WrecK_CarDismantled_F",
    "Land_Wreck_Truck_F",
    "Land_Wreck_Car2_F",
    "Land_Wreck_Car_F",
    "Land_Wreck_Car3_F",
    "Land_Wreck_Hunter_F",
    "Land_Wreck_Van_F",
    "Land_Wreck_Offroad_F",
    "Land_Wreck_Offroad2_F",
    "Land_Wreck_UAZ_F",
    "Land_Wreck_Ural_F",
    "Land_Wreck_Truck_dropside_F",
    "Land_Wreck_BMP2_F"
];

engineer_eod_mines = [
    "tacgt_ModuleMine_APERSBoundingMine_Training_F",
    "tacgt_ModuleMine_APERSMine_Training_F",
    "tacgt_ModuleMine_ApersTripMine_Training_F",
    "tacgt_ModuleMine_ATMine_Training_F",
    "tacgt_ModuleMine_Claymore_Training_F"
];

engineer_eod_fnc_field = {
    private _objects = (nearestObjects [getPosATL engineer_eod_spawn, [], 40]) - [engineer_eod_spawn];
    private _objectsInField = _objects inAreaArray engineer_eod_spawn;
    {
        if !(isPlayer _x) then {
            deleteVehicle _x;
        };
    } forEach _objectsInField;
    for "_i" from 0 to 2 do {
        private _pos = engineer_eod_spawn call BIS_fnc_randomPosTrigger;
        private _obj = selectRandom engineer_eod_props;
        private _obj = _obj createVehicle _pos;
    };
    for "_i" from 0 to 15 do {
        private _pos = engineer_eod_spawn call BIS_fnc_randomPosTrigger;
        private _obj = selectRandom engineer_eod_mines;
        private _obj = _obj createVehicle _pos;
    };
};

private _eodField = ["EngEODField","Reset Field","",{
    call engineer_eod_fnc_field;
}, {true}] call ace_interact_menu_fnc_createAction;
[engineer_eod_control, 0, ["ACE_MainActions"], _eodField] call ace_interact_menu_fnc_addActionToObject;
