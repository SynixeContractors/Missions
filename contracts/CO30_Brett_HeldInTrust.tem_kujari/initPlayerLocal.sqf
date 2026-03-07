#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html", then add "Example" here
] call mission_fnc_briefing;

["lip", {
    params ["_duration"];
    contact setRandomLip true;
    0 spawn {
        sleep _duration;
        contact setRandomLip false;
    };
}] call CBA_fnc_addEventHandler;
