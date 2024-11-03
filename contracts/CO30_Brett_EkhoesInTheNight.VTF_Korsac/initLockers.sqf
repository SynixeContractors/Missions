["open_safe", {
    params ["_safe", "_state"];
    _safe setVariable ["cominbation", ""];
    _safe lockInventory _state;
}] call CBA_fnc_addEventHandler;

private _unlockAction = ["Unlock", "Unlock", "", {
    [
        "Open Safe",
        [
            ["EDIT", "Combination", []]
        ],
        {
            params ["_values", "_args"];
            if (_values#0 isEqualTo (_args#0 getVariable ["combination", "boom"])) then {
                ["open_safe", [_args#0, false]] call CBA_fnc_globalEvent;
            };
        },
        {},
        [_target]
    ] call zen_dialog_fnc_create;
}, {
    (_target getVariable ["combination", ""]) != ""
}] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions"], _unlockAction] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    locker_dud_1,
    locker_dud_2,
    locker_dud_3,
    locker_dud_4,
    locker_gun
];
