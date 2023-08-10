#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

// -------------------

FARE_fnc_assaultAction = compile preprocessFileLineNumbers "scripts\assaultAction.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";

[laptop_1] call FARE_fnc_assaultAction; // add action to laptop to start the assault