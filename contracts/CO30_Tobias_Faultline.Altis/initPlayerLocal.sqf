#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

// BRIEFING

[
    chief,    // variable name of the officer unit
    "briefingAudio"  // class from CfgSounds in description.ext
] call synixe_missions_fnc_speak;