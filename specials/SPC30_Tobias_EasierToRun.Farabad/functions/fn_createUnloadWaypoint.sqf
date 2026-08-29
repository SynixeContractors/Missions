params [
    ["_input", objNull, [objNull, grpNull]],
    ["_marker", "", [""]],
    ["_spread", 200, [0]]
];

// Resolve group from input
private _grp = if (_input isEqualType grpNull) then {
    _input
} else {
    group _input
};

if (isNull _grp) exitWith {};

private _pos = (markerPos _marker) getPos [random _spread, random 360];

private _wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "TR UNLOAD";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "YELLOW";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointFormation "COLUMN";

_wp
