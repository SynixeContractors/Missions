{
    [_x, true, [0, 1, 0]] call ace_dragging_fnc_setCarryable;
    [_x, 1] call ace_cargo_fnc_setSize;
} forEach [
    box_1,
    box_2,
    box_3,
    box_4,
    box_5
];
