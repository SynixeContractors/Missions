private _clearAll = ["AutoClearAll","Clear All Units","",{
    ["training_vr_resetGroup", ["autorifleman"]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[ar_control, 0, ["ACE_MainActions"], _clearAll] call ace_interact_menu_fnc_addActionToObject;

private _step1 = ["AutoStep1","Fireteam","",{
    ["training_vr_spawnGroup", ["autorifleman", east, getMarkerPos "autorifleman_start", 4, {
        params ["_group"];
        {
            _x setUnitLoadout [[["arifle_TRG21_F","","","",["30Rnd_556x45_Stanag",30],[],""],[],[],[],["V_Chestrig_oli",[["30Rnd_556x45_Stanag",4,30],["HandGrenade",1,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_blue",2,1]]],[],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]], false];
        } forEach units _group;
        _group addWaypoint [ATLtoASL getMarkerPos "autorifleman_wp_1", 40];		
        _group addWaypoint [ATLtoASL getMarkerPos "autorifleman_wp_2", 40];
    }]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[ar_control, 0, ["ACE_MainActions"], _step1] call ace_interact_menu_fnc_addActionToObject;

private _step1 = ["AutoStep2","Squad","",{
    ["training_vr_spawnGroup", ["autorifleman", east, getMarkerPos "autorifleman_start", 8, {
        params ["_group"];
        {
            _x setUnitLoadout [[["arifle_TRG21_F","","","",["30Rnd_556x45_Stanag",30],[],""],[],[],[],["V_Chestrig_oli",[["30Rnd_556x45_Stanag",4,30],["HandGrenade",1,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_blue",2,1]]],[],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]], false];
        } forEach units _group;
        _group addWaypoint [ATLtoASL getMarkerPos "autorifleman_wp_1", 40];		
        _group addWaypoint [ATLtoASL getMarkerPos "autorifleman_wp_2", 40];
    }]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[ar_control, 0, ["ACE_MainActions"], _step1] call ace_interact_menu_fnc_addActionToObject;
