#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[reporter, 2, false, 1, "Get Intel", [], 2, "UNA Outpost Intel Report", "UNA has located an abandoned radio station, previously set up and operated by Russian forces, which is now controlled by the Kardishev Front. This central relay point connects numerous smaller outposts, equipped with short range radio towers. Disable the main radio tower to interrupt communications and get the location of the hidden outposts. Additionally, our reconnaissance team has uncovered a guarded roadblock on the crossroads near the station. Both objectives are marked on the map for immediate action."] call zen_modules_fnc_addIntelAction;

[
    "mission_intel", {
        // Objective marker for East Tower
        createMarker ["marker1", [5663,6165]];
        "marker1" setMarkerType "hd_objective";
        "marker1" setMarkerText "East Tower";
        "marker1" setMarkerColor "ColorYellow";

        // Objective marker for North East Tower
        createMarker ["marker2", [5206,6644]];
        "marker2" setMarkerType "hd_objective";
        "marker2" setMarkerText "North East Tower";
        "marker2" setMarkerColor "ColorRed";

        // Objective marker for Western Tower
        createMarker ["marker3", [3789,  5987]];
        "marker3" setMarkerType "hd_objective";
        "marker3" setMarkerText "Western Tower";
        "marker3" setMarkerColor "ColorGreen";

        // Objective marker for North West Tower
        createMarker ["marker4", [3910,  6478]];
        "marker4" setMarkerType "hd_objective";
        "marker4" setMarkerText "North West Tower";
        "marker4" setMarkerColor "ColorBlue";

        // Objective marker for South East Tower
        createMarker ["marker5", [5700,  5257]];
        "marker5" setMarkerType "hd_objective";
        "marker5" setMarkerText "South East Tower";
        "marker5" setMarkerColor "ColorOrange";
    }
] call CBA_fnc_addEventHandler;


screen setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ffffff"",""        Communications Enabled\n\n        Radio Pings Detected"")"];

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
            screen setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ff0000"",""     All Radio Towers Disabled"")"];
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
            ["mission_intel"] call CBA_fnc_globalEvent;
            mainterminal setVariable ["hacking_enabled", false, true];
        };

        // Call the progress bar function with no condition for canceling the action
        [2, [mainterminal, player], _onFinishHacking, nil, "Searching Radio Locations", nil] call ace_common_fnc_progressBar;
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
