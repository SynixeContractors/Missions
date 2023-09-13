#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

private _informant = [
    "Informant",
    "Talk",
    "",
    {
        informant say3d "Informant";
        missionNamespace setVariable ["informed", true, true];
        [{
            missionNamespace setVariable ["informed", false, true];
        }, [], 86] call CBA_fnc_waitAndExecute;
    },
    {
        !(missionNamespace getVariable ["informed", false])
    }
] call ace_interact_menu_fnc_createAction;
[informant, 0, ["ACE_MainActions"], _informant] call ace_interact_menu_fnc_addActionToObject;
