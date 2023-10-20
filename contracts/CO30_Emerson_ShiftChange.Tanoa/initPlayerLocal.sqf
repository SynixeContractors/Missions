#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

FARE_fnc_enableSimulation = compile preprocessFileLineNumbers "scripts\enableSimulation.sqf";
FARE_fnc_surrenderEH = compile preprocessFileLineNumbers "scripts\surrenderEH.sqf";
