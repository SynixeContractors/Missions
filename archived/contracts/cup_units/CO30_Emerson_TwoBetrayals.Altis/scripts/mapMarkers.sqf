params ["_layer"];

_entities = getMissionLayerEntities _layer;
_objects = _entities select 0;
_markers = _entities select 1;

// make markers visible
{
    _x setMarkerAlpha 1;
} forEach _markers;