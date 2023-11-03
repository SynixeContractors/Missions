#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

player setUnitFreefallHeight 10000;

call compile preprocessFile "functions\sam.sqf";
call compile preprocessFile "functions\tp.sqf";
call compile preprocessFile "functions\modules.sqf";
call compile preprocessFile "functions\halloween.sqf";
