params [
    ["_mortars", [], [[]]],
    ["_marker", "", [""]],
    ["_spread", 300, [0]],
    ["_rounds", 4, [0]],
    ["_delayRange", [60, 90], [[]]]
];

if (!isServer) exitWith {};

private _aliveMortars = _mortars select { alive _x };

if (_aliveMortars isEqualTo []) exitWith {};

[
    {
        params ["_aliveMortars"];
        { unitReady _x } count _aliveMortars == count _aliveMortars
    },

    {
        params ["_aliveMortars", "_marker", "_spread", "_rounds", "_delayRange"];

        private _delayMin = _delayRange select 0;
        private _delayMax = _delayRange select 1;

        if (_delayMax < _delayMin) then {
            private _tmp = _delayMin;
            _delayMin = _delayMax;
            _delayMax = _tmp;
        };

        {
            private _mortar = _x;

            for "_i" from 1 to _rounds do {

                private _impactPos = (markerPos _marker) getPos [
                    random _spread,
                    random 360
                ];

                _mortar doArtilleryFire [
                    _impactPos,
                    "8Rnd_82mm_Mo_Smoke_white",
                    1
                ];

                sleep (_delayMin + random (_delayMax - _delayMin));
            };

        } forEach _aliveMortars;
    },

    [_aliveMortars, _marker, _spread, _rounds, _delayRange]

] call CBA_fnc_waitUntilAndExecute;
