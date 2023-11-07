#include "..\..\script_component.hpp"

call compile preprocessFileLineNumbers "functions\ranges\at\fnc_init.sqf";
call compile preprocessFileLineNumbers "functions\ranges\grenades\fnc_init.sqf";
call compile preprocessFileLineNumbers "functions\ranges\eod\fnc_init.sqf";

player setVariable ["ACE_isEngineer", true, true];
player setVariable ["ACE_isEOD", true, true];
player setVariable ["ace_medical_medicClass", 1, true];
