#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

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