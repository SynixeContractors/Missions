#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[radio, 2, true, 1, "Listen in on radio", [], 30, "Radio transmission", "The last shipment is leaving the barnyard. Once it reaches destination I want you to go and recover the bodies of our fallen comrades."] call zen_modules_fnc_addIntelAction;
