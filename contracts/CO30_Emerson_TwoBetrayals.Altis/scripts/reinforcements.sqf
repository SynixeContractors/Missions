params ["_layer"];

_entities = getMissionLayerEntities _layer;
_objects = _entities select 0;
_markers = _entities select 1;

// turn off dynamic sim and fully simulate
{
    [_x, false] remoteExec ["enableDynamicSimulation"];
    [_x, true] remoteExec ["enableSimulationGlobal", 2]; // server only
} forEach _objects;