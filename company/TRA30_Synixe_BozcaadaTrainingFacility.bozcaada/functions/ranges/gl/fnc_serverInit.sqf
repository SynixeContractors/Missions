gl_fnc_group = {
    params ["_group", "", "_target"];
    {
        _x setUnitLoadout [[["arifle_TRG21_F","","","",["30Rnd_556x45_Stanag",30],[],""],[],[],[],["V_Chestrig_oli",[["30Rnd_556x45_Stanag",4,30],["HandGrenade",1,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_blue",2,1]]],[],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]], false];
    } forEach units _group;
    if (count waypoints _group == 1) then {
        _group addWaypoint [ATLtoASL getMarkerPos format ["gl_target_%1", _target], 40];
    };
};
