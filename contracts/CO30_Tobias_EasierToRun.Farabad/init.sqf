#include "functions\boxCargo.sqf"

missionNamespace setVariable ["rcws_1_connect", false, true];
missionNamespace setVariable ["rcws_2_connect", false, true];
missionNamespace setVariable ["rcws_3_connect", false, true];
missionNamespace setVariable ["ugv_1_connect", false, true];
missionNamespace setVariable ["reaper_1_connect", true, true];

private _action = [
    "rcws_1",
    "Connect terminal to RCWS UGV (Red)",
    "",
    {
        [10,[],{
            [rcws_1] call nibs_fnc_joinSide; missionNamespace setVariable ["rcws_1_connect", true, true]; 
        },{},"Connecting to UGV..."] call ace_common_fnc_progressBar
    },
    {   !(missionNamespace getVariable ["rcws_1_connect", true]) &&
        ("B_UavTerminal" == assignedItems player select { _x == "B_UavTerminal" } param [0,""])
    }
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "rcws_2",
    "Connect terminal to RCWS UGV (Green)",
    "",
    {
        [10,[],{
            [rcws_2] call nibs_fnc_joinSide; missionNamespace setVariable ["rcws_2_connect", true, true]; 
        },{},"Connecting to UGV..."] call ace_common_fnc_progressBar
    },
    {   !(missionNamespace getVariable ["rcws_2_connect", true]) &&
        ("B_UavTerminal" == assignedItems player select { _x == "B_UavTerminal" } param [0,""])
    }
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "rcws_3",
    "Connect terminal to RCWS UGV (Blue)",
    "",
    {
        [10,[],{
            [rcws_3] call nibs_fnc_joinSide; missionNamespace setVariable ["rcws_3_connect", true, true]; 
        },{},"Connecting to UGV..."] call ace_common_fnc_progressBar
    },
    {   !(missionNamespace getVariable ["rcws_3_connect", true]) &&
        ("B_UavTerminal" == assignedItems player select { _x == "B_UavTerminal" } param [0,""])
    }
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "ugv_1",
    "Connect terminal to unarmed UGV",
    "",
    {
        [10,[],{
            [ugv_1] call nibs_fnc_joinSide; missionNamespace setVariable ["ugv_1_connect", true, true]; 
        },{},"Connecting to UGV..."] call ace_common_fnc_progressBar
    },
    {   !(missionNamespace getVariable ["ugv_1_connect", true]) &&
        ("B_UavTerminal" == assignedItems player select { _x == "B_UavTerminal" } param [0,""])
    }
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "reaper_1",
    "Connect to Reaper",
    "",
    {
        [10,[],{
            [reaper_1] call nibs_fnc_joinSide; missionNamespace setVariable ["ugv_1_connect", true, true]; 
        },{},"Connecting to Reaper..."] call ace_common_fnc_progressBar
    },
    {   !(missionNamespace getVariable ["reaper_1_connect", true]) &&
        ("B_UavTerminal" == assignedItems player select { _x == "B_UavTerminal" } param [0,""])
    }
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
