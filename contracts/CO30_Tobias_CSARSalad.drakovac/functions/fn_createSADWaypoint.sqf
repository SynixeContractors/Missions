params [
    ["_grp", grpNull, [grpNull]],
    ["_marker", "", [""]],
    ["_spread", 200, [0]]
];

if (isNull _grp) exitWith {};

private _pos = (markerPos _marker) getPos [random _spread, random 360];

private _wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "LINE";

_wp
