#include "..\..\script_component.hpp"

{
    call compile preprocessFileLineNumbers format ["functions\ranges\%1\fnc_serverInit.sqf", _x];
} forEach [
    "at"
];

["EOD Urban"] call compile preprocessFileLineNumbers "functions\ranges\eod\fnc_serverInit.sqf";
// ["EOD House"] call compile preprocessFileLineNumbers "functions\ranges\eod\fnc_serverInit.sqf";
