#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"
#include "functions\fnc_empPulse.sqf"
#include "functions\fnc_radioSignal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[
    police_1,    // variable name of the officer unit
    "police",  // class from CfgSounds in description.ext
    {},
    {
        nibs_startAttack = true;
    }
] call synixe_missions_fnc_speak;
