#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

private _action = ["UnlockServerRoom","Enter Code","",{
    params ["_target", "_player", "_params"];
    [
        "Door Keypad",
        [
            ["EDIT", "Code", []]
        ],
        {
            params ["_values", "_args"];
            if (_values#0 == "2933") then {
                server_building setVariable ["bis_disabled_Door_1", 0, true];
                server_room_lock setObjectTextureGlobal [0, ""];
            };
        },
        {},
        [_target]
    ] call zen_dialog_fnc_create;
},{
    server_building getVariable ["bis_disabled_Door_1", 1] == 1
},{},[]] call ace_interact_menu_fnc_createAction;
[server_room_lock, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
