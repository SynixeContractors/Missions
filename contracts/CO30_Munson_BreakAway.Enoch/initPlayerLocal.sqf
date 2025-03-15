#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;


[intel_1, 2, false, 1, "Get Intel", // Edit this if you want to change the intel ACE action name
[], 5,

"STASH UPDATE", // Edit this for intel title

"We have now moved 90% of the crates to .---- .---- ...-- , ----- ....- ..--- END. // Edit this for intel content

] call zen_modules_fnc_addIntelAction;