#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

mission_fnc_flying1 = compile preprocessFileLineNumbers "flying1.sqf";

_action = 
[
    "Flying1Action", // <---- action identifier
    "Takeoff",
    "",
    {
        [helo1, true] remoteExec ["engineOn", helo1];
        call mission_fnc_flying1;
        ["flying1_remove_action"] call CBA_fnc_globalEvent;
    },
    {true},
] call ace_interact_menu_fnc_createAction;

[
    helo1,
    0,
    ["ACE_MainActions"], // <---- parent path of new action
    _action
] call ace_interact_menu_fnc_addActionToObject;

[
    "flying1_remove_action", 
    {
        [
            helo1,
            0,
            ["ACE_MainActions", "Flying1Action"] // <---- full path, parent + ident
        ] call ace_interact_menu_fnc_removeActionFromObject;
    }
] call CBA_fnc_addEventHandler;