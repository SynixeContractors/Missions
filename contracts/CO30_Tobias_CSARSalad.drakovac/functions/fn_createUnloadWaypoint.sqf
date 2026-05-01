params [
    ["_input", objNull, [objNull, grpNull]],
    ["_marker", "", [""]],
    ["_spread", 200, [0]]
];

private _grp = if (_input isEqualType grpNull) then {_input} else {group _input};

if (isNull _grp) exitWith {
    diag_log "[createUnloadWaypoint] ERROR: Group is null.";
};

private _mPos = markerPos _marker;
private _pos = _mPos getPos [random _spread, random 360];

private _veh = vehicle (leader _grp);
private _isHeli = _veh isKindOf "Helicopter";

if (_isHeli) then {
    private _wpLand = _grp addWaypoint [_pos, 0];
    _wpLand setWaypointType "SCRIPTED";
    _wpLand setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
    _wpLand setWaypointSpeed "NORMAL";
    _wpLand setWaypointBehaviour "SAFE";
};

private _wpUnload = _grp addWaypoint [_pos, 0];
_wpUnload setWaypointType "TR UNLOAD";
_wpUnload setWaypointBehaviour "SAFE";
_wpUnload setWaypointCombatMode "RED";
_wpUnload setWaypointSpeed "LIMITED";
_wpUnload setWaypointFormation "COLUMN";

if (_isHeli) then {
    private _wpFollow = _grp addWaypoint [markerPos "_marker", 0];
    _wpFollow setWaypointType "MOVE";
    _wpFollow setWaypointSpeed "FULL";
    _wpFollow setWaypointBehaviour "AWARE";
};


_wpUnload
