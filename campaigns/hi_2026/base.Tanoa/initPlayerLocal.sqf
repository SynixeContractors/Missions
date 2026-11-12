#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html", then add "Example" here
] call mission_fnc_briefing;

["ace_medicalMenuOpened", {
    params ["", "_other", "_display"];
    if (group ace_player == group _other) exitWith {};
    (_display displayCtrl (1210)) ctrlSetText "";
}] call cba_fnc_addEventHandler;
