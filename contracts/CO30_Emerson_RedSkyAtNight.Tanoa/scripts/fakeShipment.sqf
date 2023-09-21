params ["_layer"];

_entities = getMissionLayerEntities _layer;
_objects = _entities select 0;
_markers = _entities select 1;

// turn off dynamic sim and fully simulate
{
    ["FARE_enableSimulation", [_x], _x] call CBA_fnc_targetEvent;

    // if dudes were prone, set them back to auto stance
    if (_x isKindOf "Man") then {
        _x setUnitPos "AUTO";
    }
} forEach _objects;
true