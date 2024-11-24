#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

// post process
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1,1.02,-0.005,[0,0,0,0],[1,0.8,0.6,0.65],[0.199,0.587,0.115,0]];
"colorCorrections" ppEffectCommit 0;

// scripts
FELIX_fnc_offroadSpeedLimiter = compile preprocessFileLineNumbers "scripts\offroadSpeedLimiter.sqf";

// start speed limiter per frame handler
call FELIX_fnc_offroadSpeedLimiter;
