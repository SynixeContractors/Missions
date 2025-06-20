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

[board, 2, false, 1, "Get Intel", // Edit this if you want to change the intel ACE action name
[], 5,

"Intel", // Edit this for intel title

"Aerial recon reports no enemy air assets in the vicinity, providing a clear window for the operation, and allowing for safe overflight in the area. Feel free to use a bird to fly in the AO. RSA may attempt to reinforce the area by sending heavy armor from the airfield, which is approximately 5km east of the oil fields, so be prepared to adapt to changing circumstances. Intel suggests the Field HQ is situated near a radio tower, likely used for communication and coordination by the RSA. Locate a terminal inside the Field HQ, such as a laptop or command center console, and hack into it to upload critical intel." // Edit this for intel content

] call zen_modules_fnc_addIntelAction;

["mission_intel", {
    player createDiaryRecord ["Diary", ["Comms Data", "Data successfully decrypted and sent to CDF. Reinforcements inbound."]];
}] call CBA_fnc_addEventHandler;

[
    laptop,
    1,  // texture source
    50, // size in GB
    2,  // time to upload in seconds
    {
    },
    {
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [1, ""];
            ["mission_intel"] call CBA_fnc_globalEventJIP;
            missionNamespace setVariable ["reinforcementsCalled", true, true];
        }, _this, 2] call CBA_fnc_waitAndExecute;
    }
] call synixe_missions_fnc_computerUpload;