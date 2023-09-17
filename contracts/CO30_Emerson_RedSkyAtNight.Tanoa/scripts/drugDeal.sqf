// turn off dynamic sim and fully simulate
{
    [_x, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for objects
    [group _x, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for groups
    [_x, true] remoteExec ["enableSimulationGlobal", 2]; // server only
} forEach units drugGrp;

[drugWorker, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for objects
[group drugWorker, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for groups
[drugWorker, true] remoteExec ["enableSimulationGlobal", 2]; // server only

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