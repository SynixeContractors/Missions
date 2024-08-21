#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[
    laptop,
    1,  // texture source
    100, // size in GB
    300,  // time to upload in seconds
    {
        systemChat "Server: Upload Started...";
    },
    {
        systemChat "Server: Upload Finished. LAUNCH ABORTED!";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [1, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
    }
] call synixe_missions_fnc_computerUpload;

[
    Priest,    // variable name of the officer unit
    "Priest",  // class from CfgSounds in description.ext
    {
        systemChat "Priest: Thanks";
    },
    {
        systemChat "Priest: I'm out of here";
        // The first time we interact, play an animation and give intel
			if (_first) then {
            [_unit, "PutDown"] call ace_common_fnc_doGesture;
            systemChat "Intel Received!";
			};
    }
] call synixe_missions_fnc_speak;