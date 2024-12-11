#include "..\..\script_component.hpp"

{
    call compile preprocessFileLineNumbers format ["functions\ranges\%1\fnc_init.sqf", _x];
} forEach [
    "eod"
];
