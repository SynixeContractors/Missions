#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[firstintel, 2, false, 1, "Get Intel", [], 2, "Kangas Intel", "Treat wounded and move back to Huhtala to reinforce. Bring the IDAP paramedics. Holding aid workers here."] call zen_modules_fnc_addIntelAction;
[secondintel, 2, false, 1, "Get Intel", [], 2, "Huhtala Intel", "Reinforcements arrived at Juusola. Preparations for Hoopakka ambush under way. Remaining forces including IDAP hostages relocated to Kettula."] call zen_modules_fnc_addIntelAction;
