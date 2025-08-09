private _clearAll = ["AutoClearAll","Clear All Units","",{
    ["vr_resetGroup", ["grenadier"]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[gl_control, 0, ["ACE_MainActions"], _clearAll] call ace_interact_menu_fnc_addActionToObject;

private _sectionOne = ["SectionOne","Section 1 - Ranges","",{},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[gl_control, 0, ["ACE_MainActions"], _sectionOne] call ace_interact_menu_fnc_addActionToObject;
for "_i" from 1 to 4 do {
    private _step1 = [format ["GrenSec1Step%1", _i],format ["Step %1", _i],"",{
        params ["", "", "_i"];
        ["vr_resetGroup", ["grenadier"]] call CBA_fnc_serverEvent;
        ["vr_spawnUnit", ["grenadier", independent, getMarkerPos format ["grenadier_sec1_%1", _i], {
            params ["_unit"];
            _unit disableAI "all";
        }]] call CBA_fnc_serverEvent;
    },{player getVariable ["VR_isVR", false]},{},_i] call ace_interact_menu_fnc_createAction;
    [gl_control, 0, ["ACE_MainActions","SectionOne"], _step1] call ace_interact_menu_fnc_addActionToObject;
};

private _sectionTwo = ["SectionTwo","Section 2 - Cover","",{},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[gl_control, 0, ["ACE_MainActions"], _sectionTwo] call ace_interact_menu_fnc_addActionToObject;
for "_i" from 1 to 2 do {
    private _step1 = [format ["GrenSec2Step%1", _i],format ["Step %1", _i],"",{
        params ["", "", "_i"];
        ["vr_resetGroup", ["grenadier"]] call CBA_fnc_serverEvent;
        ["vr_spawnUnit", ["grenadier", independent, getMarkerPos format ["grenadier_sec2_%1", _i], {
            params ["_unit"];
            _unit disableAI "all";
            private _pos = getPosATL _unit;
            _pos set [2, 10];
            ["vr_spawnObject", ["VR_3DSelector_01_default_F", _pos, _unit]] call CBA_fnc_serverEvent;
        }]] call CBA_fnc_serverEvent;
    },{player getVariable ["VR_isVR", false]},{},_i] call ace_interact_menu_fnc_createAction;
    [gl_control, 0, ["ACE_MainActions","SectionTwo"], _step1] call ace_interact_menu_fnc_addActionToObject;
};

gl_fnc_group = {
    params ["_group", "", "_target"];
    {
        _x setUnitLoadout [[["arifle_TRG21_F","","","",["30Rnd_556x45_Stanag",30],[],""],[],[],[],["V_Chestrig_oli",[["30Rnd_556x45_Stanag",4,30],["HandGrenade",1,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_blue",2,1]]],[],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]], false];
    } forEach units _group;
    if (count waypoints _group == 1) then {
        _group addWaypoint [ATLtoASL getMarkerPos format ["gl_target_%1", _target], 40];
    };
};

private _sectionFive = ["SectionFive","Section 5 - Moving Towards","",{
    ["vr_spawnGroup", ["grenadier", east, getMarkerPos "gl_spawn_1", 4, { (_this + [1] ) call gl_fnc_group }]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[gl_control, 0, ["ACE_MainActions"], _sectionFive] call ace_interact_menu_fnc_addActionToObject;

private _sectionSix = ["SectionSix","Section 6 - Moving Sideways","",{
    ["vr_spawnGroup", ["grenadier", east, getMarkerPos "gl_spawn_2", 4, { (_this + [2] ) call gl_fnc_group }]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[gl_control, 0, ["ACE_MainActions"], _sectionSix] call ace_interact_menu_fnc_addActionToObject;
