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
} forEach [intel_phone, boss_laptop];

private _searchAction = ["Search", "Search", "", {
    if (_target == swamp_camp_leader) then {
        hint format ["Found Note\n\nImportant PINs:\nDebit Card PIN: 1354\nPhone PIN: 6969"];
    }     
    else {
        hint "Nothing found";
    };
}, {
    (configName configOf _target) find "African_Militia" != -1
}] call ace_interact_menu_fnc_createAction;
["CAManBase", 0, ["ACE_MainActions"], _searchAction, true] call ace_interact_menu_fnc_addActionToClass;

private _askDecryptKey = ["Ask for decryption key", "Ask for decryption key", "", {hint "It's hidden under one of the cushions behind me"}, {true}] call ace_interact_menu_fnc_createAction;
[boss, 0, ["ACE_MainActions"], _askDecryptKey] call ace_interact_menu_fnc_addActionToObject;

[river_laptop, 2, false, 1, "Inspect laptop", [], 30, "Information from laptop", loadFile "river_camp.txt"] call zen_modules_fnc_addIntelAction;
[intel_radio, 2, true, 1, "Listen in on radio", [], 15, "Radio transmission from poacher stronghold", loadFile "radio_transmission.txt"] call zen_modules_fnc_addIntelAction;