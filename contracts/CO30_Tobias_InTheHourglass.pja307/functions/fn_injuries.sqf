fnc_damageInfantryUntilDead = {
    params ["_units", "_damage"];

    private _alive = _units select { alive _x };

    if (_alive isEqualTo []) exitWith {};

    private _unit = selectRandom _alive;

    private _count = 1 + floor (random 3);

    for "_i" from 1 to _count do {
        ["mission_applyDamage", [
            _unit,
            _damage,
            selectRandom ["body","hand_l","hand_r","leg_l","leg_r"],
            "burn"
        ], _unit] call CBA_fnc_targetEvent;
    };

    [
        {
            [_thisArgs select 0, _thisArgs select 1] call fnc_damageInfantryUntilDead;
        },
        [_units, _damage],
        60 + random 120
    ] call CBA_fnc_waitAndExecute;
};
