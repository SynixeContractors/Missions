/*
[_artillery, _targets, _spread, _rounds, _delayRange] call nibs_fnc_artilleryBarrage;
*/

params [
    ["_artillery", [], [[]]],
    ["_targets", [], [[]]],
    ["_spread", 300, [0]],
    ["_rounds", 12, [0]],
    ["_delayRange", [60, 90], [[]]]
];

if (!isServer) exitWith {};

[
    _artillery,
    _targets,
    _spread,
    _rounds,
    _delayRange
] spawn {

    params ["_artillery", "_targets", "_spread", "_rounds", "_delayRange"];

    {
        private _gun = _x;
        if (isNull _gun || {!alive _gun}) then { continue };

        private _marker = selectRandom _targets;

        private _impactPos = (markerPos _marker) getPos [random _spread, random 360];

        private _mags = getArtilleryAmmo [_gun];
        if (_mags isEqualTo []) then { continue };

        private _ammo = _mags select 0;

        _gun doArtilleryFire [_impactPos, _ammo, _rounds];

        private _delay = _delayRange#0 + random (_delayRange#1 - _delayRange#0);
        sleep _delay;

        sleep 20;

        _x setAmmo [currentWeapon _x, 12];

    } forEach _artillery;
};
