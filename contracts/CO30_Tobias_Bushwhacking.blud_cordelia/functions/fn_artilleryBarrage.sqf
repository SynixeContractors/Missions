params [
    ["_artillery", [], [[]]],
    ["_marker", "", [""]],
    ["_spread", 300, [0]],
    ["_rounds", 4, [0]],
    ["_delayRange", [60, 90], [[]]]
];

if (!isServer) exitWith {};

[
    _artillery,
    _marker,
    _spread,
    _rounds,
    _delayRange
] spawn {

    params ["_artillery", "_marker", "_spread", "_rounds", "_delayRange"];

    for "_iGun" from 0 to ((count _artillery) - 1) do {

        private _gun = _artillery select _iGun;
        if (isNull _gun || {!alive _gun}) then { continue };

        private _mags = getArtilleryAmmo [_gun];
        if (_mags isEqualTo []) then { continue };

        private _ammo = _mags select 0;

        for "_i" from 1 to _rounds do {

            private _impactPos = (markerPos _marker) getPos [random _spread, random 360];

            _gun doArtilleryFire [_impactPos, _ammo, 1];

            private _delay = _delayRange#0 + random (_delayRange#1 - _delayRange#0);
            sleep _delay;
        };
    };
};
