#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[underling, 2, false, 1, "Read Last Text", [], 1, "Intel!", "Notes..."] call zen_modules_fnc_addIntelAction;