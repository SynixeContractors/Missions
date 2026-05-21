params ["_unit", "_intensity"];

private _next = _unit getVariable ["CBRN_NextDamageTime", 0];
if (_next > time) exitWith {};
_unit setVariable ["CBRN_NextDamageTime", time + 10];

private _hasSuit = [_unit] call Nibbles_fnc_hasCBRNSuit;
private _hasAPR  = [_unit] call Nibbles_fnc_hasAPR;

if (_hasSuit && _hasAPR) exitWith {};

private _damage = _intensity * 0.05;
private _count  = floor (1 + random 3);

if (!_hasSuit) then {
    for "_i" from 1 to _count do {
        ["mission_applyDamage", [
            _unit,
            _damage,
            selectRandom ["body","hand_l","hand_r","leg_l","leg_r"],
            "burn"
        ], _unit] call CBA_fnc_targetEvent;
    };
};

if (!_hasAPR) then {
    for "_i" from 1 to _count do {
        ["mission_applyDamage", [
            _unit,
            _damage * 2,
            selectRandom ["head","body"],
            "burn"
        ], _unit] call CBA_fnc_targetEvent;
    };
};

[_unit, -0.4] call ace_medical_status_fnc_adjustOxygenSaturation;
