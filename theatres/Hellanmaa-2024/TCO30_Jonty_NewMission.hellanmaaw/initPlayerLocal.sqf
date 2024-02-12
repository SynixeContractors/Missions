#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

["mission_intel", {
    [mainterminal, 2, false, 1, "Read Coordinates", [], 10, "Radio Towers", " "] call zen_modules_fnc_addIntelAction;
}] call CBA_fnc_addEventHandler;


mainterminal setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ffffff"",""        Communications Enabled\n\n        Radio Pings Detected"")"];

private _action = [
    "DisableComms",
    "Disable Communications",
    "",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        // Arguments to pass to the condition, fail and finish functions
        private _args = [_target]; 
        
        // Code to execute upon successful completion
        private _onFinish = {
            mainterminal setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ff0000"",""     All Radio Towers Disabled"")"];
            mainterminal setVariable ["comms_enabled", false, true];
            radio setObjectTextureGlobal [0, ""];
        };

        // Call the progress bar function with no condition for canceling the action
        [2, [mainterminal, player], _onFinish, nil, "Disabling All Radio Towers", nil] call ace_common_fnc_progressBar;
    },
    {
        mainterminal getVariable ["comms_enabled", true]
    },
    nil,
    nil,
    true, // Show in interaction menu
    true  // Requires line of sight
] call ace_interact_menu_fnc_createAction;

[mainterminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// New code to define the 'Hack Hard Drive' action
private _hackHardDriveAction = [
    "HackHardDrive",
    "Find Radio Locations",
    "",
    {
        // Code to execute upon successful completion of hacking
        private _onFinishHacking = {
            mainterminal setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#00FF00"",""                  Access Granted\n           Files Available To Read"")"];
            ["mission_intel"] call CBA_fnc_globalEvent;
            mainterminal setVariable ["hacking_enabled", false, true];
        };

        // Call the progress bar function with no condition for canceling the action
        [30, [mainterminal, player], _onFinishHacking, nil, "Searching Radio Locations", nil] call ace_common_fnc_progressBar;
    },
    {
        // Condition to show this action: only when communications are disabled
        !(mainterminal getVariable ["comms_enabled", true]) && (mainterminal getVariable ["hacking_enabled", true])
    },
    nil,
    nil,
    true, // Show in interaction menu
    true  // Requires line of sight
] call ace_interact_menu_fnc_createAction;

[mainterminal, 0, ["ACE_MainActions"], _hackHardDriveAction] call ace_interact_menu_fnc_addActionToObject;
