// turn off dynamic sim and fully simulate
["FARE_enableSimulation", [drugGrp], leader drugGrp] call CBA_fnc_targetEvent;

["FARE_enableSimulation", [drugWorker], drugWorker] call CBA_fnc_targetEvent;

// make worker join BLUFOR
[drugWorker] joinSilent (createGroup west);
drugWorker setUnitPos "UP";

// make the bad guys shoot the worker
{
    _x setBehaviourStrong "AWARE";
    _x reveal drugWorker;
    _x doTarget drugWorker;
    _x doFire drugWorker;
} forEach units drugGrp;

// put destroy waypoint on worker
private _wp1 = drugGrp addWaypoint [drugWorker, 0];
_wp1 waypointAttachVehicle drugWorker;
_wp1 setWaypointType "DESTROY";

// enable pathing for bad guys after few seconds
[
    {
        {
            (weaponState _x) params ["", "_muzzle", "_firemode"];
            _x forceWeaponFire [_muzzle, _firemode];
            _x enableAI "PATH";
        } forEach units drugGrp;
    },
    [],
    5
] call CBA_fnc_waitAndExecute;
