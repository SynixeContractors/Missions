params [[
    "_controls", [], [[]]
]];

private _weather = ["Weather","Change Weather","",{
    [objNull] call zen_modules_fnc_moduleWeather;
}, {true}] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions"], _weather] call ace_interact_menu_fnc_addActionToObject;
} forEach _controls;
