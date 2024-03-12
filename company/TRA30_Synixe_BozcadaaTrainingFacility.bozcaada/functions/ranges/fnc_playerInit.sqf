#include "..\..\script_component.hpp"

{
    call compile preprocessFileLineNumbers format ["functions\ranges\%1\fnc_playerInit.sqf", _x];
} forEach [
    "ar"
];

player setVariable ["ACE_isEngineer", true, true];
player setVariable ["ACE_isEOD", true, true];
player setVariable ["ace_medical_medicClass", 1, true];
