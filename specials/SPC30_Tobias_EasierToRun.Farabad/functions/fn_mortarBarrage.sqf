params [
    ["_mortars", [], [[]]],
    ["_marker", "", [""]],
    ["_spread", 300, [0]],
    ["_rounds", 4, [0]],
    ["_delayRange", [60, 90], [[]]]
];

if (!isServer) exitWith {};

{
    private _mortar = _x;

    if (!isNull _mortar && {alive _mortar}) then {

        for "_i" from 1 to _rounds do {

            private _impactPos = (markerPos _marker) getPos [random _spread, random 360];

            _mortar doArtilleryFire [_impactPos, "8Rnd_82mm_Mo_shells", 1];

            private _delayMin = 0;
            private _delayMax = 0;

            if ((count _delayRange) >= 2) then {
                _delayMin = _delayRange select 0;
                _delayMax = _delayRange select 1;
            } else {
                _delayMin = 30;
                _delayMax = 60;
            };

            if (_delayMax < _delayMin) then {
                private _tmp = _delayMin;
                _delayMin = _delayMax;
                _delayMax = _tmp;
            };

            sleep (_delayMin + random (_delayMax - _delayMin));
        };
    };

} forEach _mortars;
