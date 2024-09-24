#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
    "Forward Operating Base"
] call mission_fnc_briefing;

// ** UNCOMMENT TO USE THE CODE BELOW **

// [
//     officer,    // variable name of the officer unit
//     "Officer",  // class from CfgSounds in description.ext
//     {},
//     {
//         params ["_unit", "", "_first"];
//         if (_first) then {
//             [_unit, "PutDown"] call ace_common_fnc_doGesture;
//             ["mission_intel"] call CBA_fnc_globalEventJIP;
//         };
//     }
// ] call synixe_missions_fnc_speak;

// [board, 2, false, 1, "Get Intel", // Edit this if you want to change the intel ACE action name
// [], 5,

// "Intel For Today's Mission", // Edit this for intel title

// "KILL EVERYONE!!!" // Edit this for intel content

// ] call zen_modules_fnc_addIntelAction;

[
    laptop,
    1,  // texture source
    50, // size in GB
    60,  // time to upload in seconds
    {
        systemChat "Server: Upload Started";
    },
    {
        systemChat "Server: Upload Finished";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [1, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
    }
] call synixe_missions_fnc_computerUpload;