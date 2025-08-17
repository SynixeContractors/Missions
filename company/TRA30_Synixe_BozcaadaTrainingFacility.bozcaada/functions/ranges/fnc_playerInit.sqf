#include "..\..\script_component.hpp"

{
    call compile preprocessFileLineNumbers format ["functions\ranges\%1\fnc_playerInit.sqf", _x];
} forEach [
    "ar",
    "at",
    "gl",
    "marksman"
];
