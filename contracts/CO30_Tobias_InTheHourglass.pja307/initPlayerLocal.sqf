#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[ace_player, 0.3, 0.5, true] call BIS_fnc_sandstorm; 

fnc_dirtLoop = {
    [ace_player] call ace_goggles_fnc_applyDirtEffect;

    [
        { [] call fnc_dirtLoop },
        [],
        10 + random 20
    ] call CBA_fnc_waitAndExecute;
};

[
    { [] call fnc_dirtLoop },
    [],
    10 + random 20
] call CBA_fnc_waitAndExecute;
