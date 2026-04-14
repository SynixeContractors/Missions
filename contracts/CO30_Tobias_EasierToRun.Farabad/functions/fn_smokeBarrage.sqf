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

            _mortar doArtilleryFire [_impactPos, "8Rnd_82mm_Mo_Smoke_white", 1];

            sleep (5 + random 5);
        };
    };

} forEach _mortars;
