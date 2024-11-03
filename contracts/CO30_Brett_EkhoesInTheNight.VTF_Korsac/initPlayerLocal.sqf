#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

call compile preprocessFileLineNumbers "initSystem.sqf";
call compile preprocessFileLineNumbers "initModules.sqf";
call compile preprocessFileLineNumbers "initUnits.sqf";
call compile preprocessFileLineNumbers "initLockers.sqf";
call compile preprocessFIleLineNUmbers "initSoundModule.sqf";
