if (isNil "heli_1") exitWith {};
if (isNull heli_1) exitWith {};
if (!alive heli_1) exitWith {};

heli_1 hideObjectGlobal false;

[6, true, true] call BIS_fnc_setDate;

sleep 5;

{
    if (!isNull _x && {alive _x}) then {
        _x moveInCargo heli_1;
    };
} forEach allPlayers;

