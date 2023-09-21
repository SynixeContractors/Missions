// turn off dynamic sim and fully simulate
["FARE_enableSimulation", [drugGrp], leader drugGrp] call CBA_fnc_targetEvent;

["FARE_enableSimulation", [drugWorker], drugWorker] call CBA_fnc_targetEvent;

// make worker join BLUFOR 
_grp = createGroup west;
[drugWorker] joinSilent _grp;
drugWorker setUnitPos "UP";

// make the bad guys shoot the worker
{
	_x setBehaviourStrong "AWARE";
	_x reveal drugWorker;
	_x doTarget drugWorker;
	_x doFire drugWorker;
} forEach units drugGrp;

// put destroy waypoint on worker
_wp1 = drugGrp addWaypoint [drugWorker, 0];
_wp1 waypointAttachVehicle drugWorker;
_wp1 setWaypointType "DESTROY";

// enable pathing for bad guys after few seconds
[
    {
        {
            _x forceWeaponFire [(weaponState _x) select 1, (weaponState _x) select 2];
            _x enableAI "PATH";
        } forEach units drugGrp;
    },
    [drugGrp],
    5
] call CBA_fnc_waitAndExecute;
true