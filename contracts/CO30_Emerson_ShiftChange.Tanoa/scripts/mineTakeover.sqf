// turn off dynamic sim and fully simulate
{
    ["FARE_enableSimulation", [_x], _x] call CBA_fnc_targetEvent;

    // if dudes were prone, set them back to auto stance
    _x setUnitPos "AUTO";
} forEach ((getMissionLayerEntities "Mine Takeover Baddies") select 0);
