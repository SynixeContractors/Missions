#include "..\..\script_component.hpp"

{
    call compile preprocessFileLineNumbers format ["functions\ranges\%1\fnc_serverInit.sqf", _x];
} forEach [
    "at",
    "eod"
];
