heli3 engineOn true;
[heli3, _data] call BIS_fnc_unitPlay;
heli3 engineOn false;
{
    _x allowDamage true;
} forEach allPlayers;