#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[intel_1, 2, false, 1, "Get Intel", // Edit this if you want to change the intel ACE action name
[], 5,

"Bill of Sale", // Edit this for intel title

"Sale of the T-100 has been completed. The IRANIAN's will make the pick up at the local Airfield. 
Seize the Airfield with the T-100, BM-2 Stalker and ZSU Truck and await the arrival of the IRANIAN transport plane. 
Once captured we will move the Mi-35 to the Airfield to provide cover. 
FOR THE PEOPLE!" // Edit this for intel content

] call zen_modules_fnc_addIntelAction;