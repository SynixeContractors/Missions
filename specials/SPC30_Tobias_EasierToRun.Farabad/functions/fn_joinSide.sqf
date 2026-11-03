params [
    ["_ugv", objNull, [objNull]]
];

if (isNull _ugv) exitWith {};

private _crew = crew _ugv;
if (_crew isEqualTo []) exitWith {};

private _newGrp = createGroup west;

{
    [_x] joinSilent _newGrp;
} forEach _crew;

_newGrp
