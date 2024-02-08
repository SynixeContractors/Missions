#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[underling, 2, false, 1, "Read Last Text", [], 3, "Cellphone Text", "Viper [04:56]: Wrap it up. Execute exfiltration protocols then bring the cargo to Magos. Squeeze every last bit of information from these fuckers. Load them up or eliminate if non cooperative."] call zen_modules_fnc_addIntelAction;
[tabledoc, 2, false, 1, "Read Document", [], 3, "Hostage Info. Documents", "Loyalists Captured: Arion Bouras, Sotridis Liosi, Sotiris Papadopoulos (KIA escape attempt). Held at: Radio Station"] call zen_modules_fnc_addIntelAction;

tablelaptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""EtelkaMonospacePro"",0.1,""#000000"",""#ffffff"",""    Communications\n       Enabled"")"];
private _action = [
  "DisableComms", // Unique ID
  "Disable Communication", // Action Text
  "", // Icon
  { // Code ran when the action is activated
    tablelaptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""EtelkaMonospacePro"",0.1,""#000000"",""#ffffff"",""    Communications\n       Disabled"")"];
    tablelaptop setVariable ["comms_enabled", false, true];
  },{ // Code to check if the action is allowed
    tablelaptop getVariable ["comms_enabled", true]
  }] call ace_interact_menu_fnc_createAction;
[tablelaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;