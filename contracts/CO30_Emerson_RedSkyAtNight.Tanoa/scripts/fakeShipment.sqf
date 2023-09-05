params ["_layer"];

_entities = getMissionLayerEntities _layer;
_objects = _entities select 0;
_markers = _entities select 1;

// turn off dynamic sim and fully simulate
{
    [_x, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for objects
    [group _x, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for groups
    [_x, true] remoteExec ["enableSimulationGlobal", 2]; // server only

    // if dudes were prone, set them back to auto stance
    if (_x isKindOf "Man") then {
        _x setUnitPos "AUTO";
    }
} forEach _objects;