#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

{
    _x setSkill ["aimingAccuracy", 0];
    _x setSkill ["aimingShake", 0];
    _x setSkill ["aimingSpeed", 0.01];
    _x setSkill ["spotTime", 0.5];
} forEach allUnits;
