#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

private _unlockAction = ["Unlock", "Unlock", "", {
    [
        "Unlock",
        [
            ["EDIT", "Password", []]
        ],
        {
            params ["_values", "_args"];
            if ((_values#0 isEqualTo (_args#0 getVariable ["mission_password", "99999999"]))) then {
                _args#0 setVariable ["mission_locked", false, true];
                _args#0 setObjectTextureGlobal [0, "a3\structures_f_epc\items\electronics\data\electronics_screens_laptop_device_co.paa"];
            };
        },
        {},
        [_target]
    ] call zen_dialog_fnc_create;
}, {
    _target getVariable ["mission_locked", true]
}] call ace_interact_menu_fnc_createAction;

private _lockAction = ["Lock", "Lock", "", {
    _target setVariable ["mission_locked", true, true];
    _target setObjectTextureGlobal [0, "a3\structures_f_heli\items\electronics\data\tablet_screen_co.paa"];
}, {
    !(_target getVariable ["mission_locked", true])
}] call ace_interact_menu_fnc_createAction;

private _readAction = ["Read", "Read", "", {
    [
        "Notes",
        [
            ["EDIT:MULTI", "Content", [_target getVariable ["mission_content", ""]]]
        ]
    ] call zen_dialog_fnc_create;
}, {
    !(_target getVariable ["mission_locked", true]) && {(_target getVariable ["mission_content", ""] != "")}
}] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions"], _unlockAction] call ace_interact_menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions"], _lockAction] call ace_interact_menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions"], _readAction] call ace_interact_menu_fnc_addActionToObject;
} forEach [tablet_kappa7, tablet_kappa9];

private _searchAction = ["Search", "Search", "", {
    if (_target == leader_kappa7) then {
        hint format ["Found Note\n\nFacebook: b7lhis4hl8s\nTinder: nlasw8msg82\nMilitary Tablet: 7294"];
    } else {
        hint "Nothing found";
    };
}, {
    (configName configOf _target) find "Vanguard" != -1
}] call ace_interact_menu_fnc_createAction;
["CAManBase", 0, ["ACE_MainActions"], _searchAction, true] call ace_interact_menu_fnc_addActionToClass;
