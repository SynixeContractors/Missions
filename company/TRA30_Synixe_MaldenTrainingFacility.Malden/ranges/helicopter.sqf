training_heli_active = false;

private _condition = {!training_heli_active && {count (vehicles inAreaArray heli_spawn_area) == 0}};

private _mh6mSpawn = ["HeliMH6MSpawn","Spawn MH-6M","",{
    ["CUP_I_MH6M_ION"] call compile preprocessFileLineNumbers "courses\helicopter.sqf";
}, _condition] call ace_interact_menu_fnc_createAction;
[heli_control, 0, ["ACE_MainActions"], _mh6mSpawn] call ace_interact_menu_fnc_addActionToObject;

private _uh60mSpawn = ["HeliUH60MSpawn","Spawn UH-60M","",{
    ["CUP_B_UH60M_US"] call compile preprocessFileLineNumbers "courses\helicopter.sqf";
}, _condition] call ace_interact_menu_fnc_createAction;
[heli_control, 0, ["ACE_MainActions"], _uh60mSpawn] call ace_interact_menu_fnc_addActionToObject;
