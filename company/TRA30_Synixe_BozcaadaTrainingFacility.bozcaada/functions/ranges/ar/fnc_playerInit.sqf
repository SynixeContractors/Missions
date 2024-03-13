private _clearAll = ["AutoClearAll","Clear All Units","",{
    ["vr_resetGroup", ["autorifleman"]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[ar_control, 0, ["ACE_MainActions"], _clearAll] call ace_interact_menu_fnc_addActionToObject;

ar_fnc_group = {
    params ["_group"];
    {
        _x setUnitLoadout [[["arifle_TRG21_F","","","",["30Rnd_556x45_Stanag",30],[],""],[],[],[],["V_Chestrig_oli",[["30Rnd_556x45_Stanag",4,30],["HandGrenade",1,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_blue",2,1]]],[],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]], false];
    } forEach units _group;
    if (count waypoints _group == 1) then {
        _group addWaypoint [ATLtoASL getMarkerPos "ar_target", 40];
    };
};

private _fireteam = ["AutoStep1","Fireteam","",{
    ["vr_spawnGroup", ["autorifleman", east, getMarkerPos "ar_spawn", 4, ar_fnc_group]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[ar_control, 0, ["ACE_MainActions"], _fireteam] call ace_interact_menu_fnc_addActionToObject;

private _squad = ["AutoStep2","Squad","",{
    ["vr_spawnGroup", ["autorifleman", east, getMarkerPos "ar_spawn", 8, ar_fnc_group]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[ar_control, 0, ["ACE_MainActions"], _squad] call ace_interact_menu_fnc_addActionToObject;
