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
		deleteVehicle abort;
	}
] call synixe_missions_fnc_computerUpload;

[
    Priest,    // variable name of the officer unit
    "Priest"  // class from CfgSounds in description.ext   
] call synixe_missions_fnc_speak;

[
	missile_1, 
	"Destroy Guidance System",
    {
       // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\mines\deactivate_mine_1.wss", missile_1];
        [_player, "PutDown"] call ace_common_fnc_doGesture;
        ["SmokeShellRed", getPosATL missile_1, 3] call BIS_fnc_effectSmoke;
    }
] call synixe_missions_fnc_action;
 
[
	missile2, 
	"Destroy Guidance System",
    {
       // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\mines\deactivate_mine_1.wss", missile2];
        [_player, "PutDown"] call ace_common_fnc_doGesture;
        ["SmokeShellRed", getPosATL missile2, 3] call BIS_fnc_effectSmoke;
    }
] call synixe_missions_fnc_action;

[
	missile3, 
	"Destroy Guidance System",
    {
       // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\mines\deactivate_mine_1.wss", missile3];
        [_player, "PutDown"] call ace_common_fnc_doGesture;
        ["SmokeShellRed", getPosATL missile3, 3] call BIS_fnc_effectSmoke;
    }
] call synixe_missions_fnc_action;

[
	missile4, 
	"Destroy Guidance System",
    {
       // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\mines\deactivate_mine_1.wss", missile4];
        [_player, "PutDown"] call ace_common_fnc_doGesture;
        ["SmokeShellRed", getPosATL missile4, 3] call BIS_fnc_effectSmoke;
    }
] call synixe_missions_fnc_action;