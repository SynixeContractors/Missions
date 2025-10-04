#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

// -------------------

FARE_fnc_assaultAction = compile preprocessFileLineNumbers "scripts\assaultAction.sqf";
FARE_fnc_briefingAction = compile preprocessFileLineNumbers "scripts\briefingAction.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";
FARE_fnc_mapMarkers = compile preprocessFileLineNumbers "scripts\mapMarkers.sqf";
FARE_fnc_reinforcements = compile preprocessFileLineNumbers "scripts\reinforcements.sqf";

[laptop_1] call FARE_fnc_assaultAction; // add action to laptop that starts the assault
[map_1] call FARE_fnc_briefingAction; // add action to map to start briefing