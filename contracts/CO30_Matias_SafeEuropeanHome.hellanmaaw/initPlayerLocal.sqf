#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

_target = getPosASL hvt;

[intel_laptop, 2, false, 1, "Read chat logs", [], 30, "Important message", format ["The VIP has been moved to the follow coordinates: %1, keep him safe at all cost", _target]] call zen_modules_fnc_addIntelAction;