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

// Example object (replace with your specific object)
_guidanceSystem = missile1; 

// Variable to track if the guidance system is destroyed
_guidanceSystem setVariable ["isDestroyed", false];

// Add ACE Interaction to destroy the guidance system
[_guidanceSystem, 0, ["ACE_MainActions"], "ACE_Interaction", {
    _guidanceSystem = _this select 0;
    if (!(_guidanceSystem getVariable ["isDestroyed", false])) then {
        _guidanceSystem setVariable ["isDestroyed", true];
        hint "The guidance system has been destroyed!";
        
        // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\explosions\expl_medium_1", _guidanceSystem];
        _guidanceSystem setDamage 1; // Optional: Destroys the object itself
        
        // Custom explosion effect
        _explosionPos = getPosATL _guidanceSystem;
        _explosion = "Bo_GBU12_LGB" createVehicle _explosionPos;
        _explosion setDamage 1;
        deleteVehicle _explosion;
    } else {
        hint "The guidance system is already destroyed.";
    }
}, "Destroy Guidance System"
] call ace_interact_menu_fnc_addActionToObject;
 
 // Example object (replace with your specific object)
_guidanceSystem = missile2; 

// Variable to track if the guidance system is destroyed
_guidanceSystem setVariable ["isDestroyed", false];

// Add ACE Interaction to destroy the guidance system
[_guidanceSystem, 0, ["ACE_MainActions"], "ACE_Interaction", {
    _guidanceSystem = _this select 0;
    if (!(_guidanceSystem getVariable ["isDestroyed", false])) then {
        _guidanceSystem setVariable ["isDestroyed", true];
        hint "The guidance system has been destroyed!";
        
        // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\explosions\expl_medium_1", _guidanceSystem];
        _guidanceSystem setDamage 1; // Optional: Destroys the object itself
        
        // Custom explosion effect
        _explosionPos = getPosATL _guidanceSystem;
        _explosion = "Bo_GBU12_LGB" createVehicle _explosionPos;
        _explosion setDamage 1;
        deleteVehicle _explosion;
    } else {
        hint "The guidance system is already destroyed.";
    }
}, "Destroy Guidance System"
] call ace_interact_menu_fnc_addActionToObject;

// Example object (replace with your specific object)
_guidanceSystem = missile3; 

// Variable to track if the guidance system is destroyed
_guidanceSystem setVariable ["isDestroyed", false];

// Add ACE Interaction to destroy the guidance system
[_guidanceSystem, 0, ["ACE_MainActions"], "ACE_Interaction", {
    _guidanceSystem = _this select 0;
    if (!(_guidanceSystem getVariable ["isDestroyed", false])) then {
        _guidanceSystem setVariable ["isDestroyed", true];
        hint "The guidance system has been destroyed!";
        
        // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\explosions\expl_medium_1", _guidanceSystem];
        _guidanceSystem setDamage 1; // Optional: Destroys the object itself
        
        // Custom explosion effect
        _explosionPos = getPosATL _guidanceSystem;
        _explosion = "Bo_GBU12_LGB" createVehicle _explosionPos;
        _explosion setDamage 1;
        deleteVehicle _explosion;
    } else {
        hint "The guidance system is already destroyed.";
    }
}, "Destroy Guidance System"
] call ace_interact_menu_fnc_addActionToObject;

// Example object (replace with your specific object)
_guidanceSystem = missile4; 

// Variable to track if the guidance system is destroyed
_guidanceSystem setVariable ["isDestroyed", false];

// Add ACE Interaction to destroy the guidance system
[_guidanceSystem, 0, ["ACE_MainActions"], "ACE_Interaction", {
    _guidanceSystem = _this select 0;
    if (!(_guidanceSystem getVariable ["isDestroyed", false])) then {
        _guidanceSystem setVariable ["isDestroyed", true];
        hint "The guidance system has been destroyed!";
        
        // Play sound or trigger effect
        playSound3D ["A3\sounds_f\weapons\explosions\expl_medium_1", _guidanceSystem];
        _guidanceSystem setDamage 1; // Optional: Destroys the object itself
        
        // Custom explosion effect
        _explosionPos = getPosATL _guidanceSystem;
        _explosion = "Bo_GBU12_LGB" createVehicle _explosionPos;
        _explosion setDamage 1;
        deleteVehicle _explosion;
    } else {
        hint "The guidance system is already destroyed.";
    }
}, "Destroy Guidance System"
] call ace_interact_menu_fnc_addActionToObject;