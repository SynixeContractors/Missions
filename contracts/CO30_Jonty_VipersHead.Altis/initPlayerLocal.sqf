#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

["mission_intel", {
  [tablelaptop, 2, false, 1, "Read Files", [], 10, "Decrypted Files", "Coordinates Found: Radio Station Magos - 045.154"] call zen_modules_fnc_addIntelAction;
}] call CBA_fnc_addEventHandler;

[underling, 2, false, 1, "Read Last Text", [], 5, "Cellphone Text", "Viper [04:56]: Wrap it up. Execute exfiltration protocols then bring the cargo to radio station. Squeeze every last bit of information from these fuckers. Load them up or eliminate if non cooperative."] call zen_modules_fnc_addIntelAction;
[tabledoc, 2, false, 1, "Read Document", [], 5, "Hostage Info. Documents", "Loyalists Captured: Arion Bouras, Sotridis Liosi, Sotiris Papadopoulos. Held at: Radio Station"] call zen_modules_fnc_addIntelAction;

tablelaptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ffffff"",""           Communications Enabled"")"];

private _action = [
  "DisableComms",
  "Disable Communication",
  "",
  {
    params ["_target", "_caller", "_actionId", "_arguments"];
    
    // Arguments to pass to the condition, fail and finish functions
    private _args = [_target]; 
    
    // Code to execute upon successful completion
    private _onFinish = {
      tablelaptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ff0000"",""         Communications Disabled\n         Unauthorized Access\n         Encryption Enabled"")"];
      tablelaptop setVariable ["comms_enabled", false, true];
      radio setObjectTextureGlobal [0, ""];
    };

    // Title of the progress bar
    private _title = "Disabling communications...";

    // Call the progress bar function with no condition for canceling the action
    [2, [tablelaptop, player], _onFinish, nil, _title, nil] call ace_common_fnc_progressBar;
  },
  {
    tablelaptop getVariable ["comms_enabled", true]
  },
  nil,
  nil,
  true, // Show in interaction menu
  true  // Requires line of sight
] call ace_interact_menu_fnc_createAction;
  
[tablelaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// New code to define the 'Hack Hard Drive' action
private _hackHardDriveAction = [
  "HackHardDrive",
  "Hack Hard Drive",
  "",
  {
    // Code to execute upon successful completion of hacking
    private _onFinishHacking = {
      tablelaptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#00FF00"",""                  Access Granted\n           Files Available To Read"")"];
      ["mission_intel"] call CBA_fnc_globalEvent;
      tablelaptop setVariable ["hacking_enabled", false, true];
    };

    // Title of the hacking progress bar
    private _titleHacking = "Hacking Hard Drive...";

    // Call the progress bar function with no condition for canceling the action
    [30, [tablelaptop, player], _onFinishHacking, nil, _titleHacking, nil] call ace_common_fnc_progressBar;
  },
  {
    // Condition to show this action: only when communications are disabled
    !(tablelaptop getVariable ["comms_enabled", true]) && (tablelaptop getVariable ["hacking_enabled", true])
  },
  nil,
  nil,
  true, // Show in interaction menu
  true  // Requires line of sight
] call ace_interact_menu_fnc_createAction;

[tablelaptop, 0, ["ACE_MainActions"], _hackHardDriveAction] call ace_interact_menu_fnc_addActionToObject;