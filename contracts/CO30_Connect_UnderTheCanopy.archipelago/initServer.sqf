mission_fnc_paradrop = compile preprocessFile "paradrop.sqf";
mission_start_paradrop = false;


mission_paratroopers = (getMissionLayerEntities "paratroopers") select 0;

{
    _x moveInAny c130;
} forEach mission_paratroopers;