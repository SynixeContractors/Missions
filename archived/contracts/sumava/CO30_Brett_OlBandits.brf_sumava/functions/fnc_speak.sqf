params ["_unit", "_text"];

private _action = 
    [
        "Speak",
        "Ask to Speak",
        "",
        {
            _target globalChat _this#2#0
        },
        {true},
        {},
        [_text]
    ] call ace_interact_menu_fnc_createAction;
[
    _unit,
    0,
    ["ACE_MainActions"],
    _action
] call ace_interact_menu_fnc_addActionToObject;
