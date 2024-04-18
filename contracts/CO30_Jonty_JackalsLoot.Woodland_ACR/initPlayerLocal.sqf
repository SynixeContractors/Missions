#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[convoyOff, 2, false, 1, "Get Intel", [], 5,
"Missing Inventory",
"We got hit bad. Miyović's men ambushed us in this damn forest. We were hoping to avoid attention by taking these secluded roads but it made the perfect opportunity for Miyović's guys to raid our assets. These trucks were transporting vital military assets – missile and air-to-ground bombing units. Miyović, that psycho, might not be able to deploy these complex weapons systems himself, but we fear his forces could extract the deadly warheads and unleash catastrophic damage. We gotta get those missiles secured before they fall into the wrong hands. UAV surveillance has tracked high activty in the red zone marked on the map. That may be a good place to start your search."
] call zen_modules_fnc_addIntelAction;

[campNotepad, 2, false, 1, "Get Intel", [], 5,
"Message from HQ",
"Moving assets to Hideout:023060. Reinforcements arriving soon. Keep your guard up."
] call zen_modules_fnc_addIntelAction;

private _action = [
  "CallReinforcements",
  "Call Reinforcements",
  "",
  {
    params ["_target", "_caller", "_actionId", "_arguments"];

    // Code to execute upon successful completion
    private _onFinish = {
      // Set the trigger variable to true, replace "my_trigger_var" with your actual variable name
      missionNamespace setVariable ["reinforcementsCalled", true, true];
    };

    // Call the progress bar function with no condition for canceling the action, change the first element to no. of seconds
    [2, [objectToAddInteractionOn, player], _onFinish, nil, "Calling Reinforcements", nil] call ace_common_fnc_progressBar;
  },
  {
    objectToAddInteractionOn getVariable ["reinforcementsCalled", true]
  },
  nil,
  nil,
  true, // Show in interaction menu
  true  // Requires line of sight
] call ace_interact_menu_fnc_createAction;

[objectToAddInteractionOn, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;



laptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ffffff"",""        Use the radio\n        to signal convoy"")"];