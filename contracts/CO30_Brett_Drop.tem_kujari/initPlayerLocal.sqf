#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[ 
    smuggler, 
    "Ready to Go!", 
    { 
        missionNamespace setVariable ["mission_ready", true, true];
        plane setFuel 1;
    } 
] call synixe_missions_fnc_action;
