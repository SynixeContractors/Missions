#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
    "Forward Operating Base"
] call mission_fnc_briefing;

// ** UNCOMMENT TO USE THE CODE BELOW **

[
    officer,    // variable name of the officer unit
    "Officer",  // class from CfgSounds in description.ext
    {},
    {
        params ["_unit", "", "_first"];
        if (_first) then {
            [_unit, "PutDown"] call ace_common_fnc_doGesture;
            ["mission_intel"] call CBA_fnc_globalEventJIP;
        };
    }
] call synixe_missions_fnc_speak;

[board, 2, false, 1, "Get Intel", // Edit this if you want to change the intel ACE action name
[], 5,

"Operation Execution", // Edit this for intel title

"Conduct clearance operations in marked areas, neutralizing all hostile forces within the Area of Operations (AO).
A CDF infantry section, augmented by an armored Armored Personnel Carrier (APC), will provide security and firepower as you maneuver to objectives.
Attempt to clear the artillery camp located on the north-eastern perimeter, but be prepared for intense hostile retaliation, as this objective lies outside the AO.
Carry sufficient explosives to effectively destroy armored camps, which are expected to be stationed with tanks, APCs, and artillery.
Be advised that enemy forces may deploy the armored assets, including main battle tanks. To counter this threat, ensure that HAT launchers are also carried and prepared for deployment.
Exercise extreme caution and maintain heightened vigilance throughout the operation." // Edit this for intel content

] call zen_modules_fnc_addIntelAction;