#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

["mission_intel", {
    player createDiaryRecord ["Diary", ["Missing Inventory", "Miyović's guys have ambushed the convoy and stolen vital military assets that could potentially cause catastrophic damage. CDF UAV surveillance has tracked high activity in the red zone marked on the map. That may be a good place to start your search."]];
}] call CBA_fnc_addEventHandler;

[
    officer,    // variable name of the officer unit
    "Officer",  // class from CfgSounds in description.ext
    {},
    {
        params ["_unit", "", "_first"];
        if (_first) then {
            [_unit, "PutDown"] call ace_common_fnc_doGesture;
            ["mission_intel"] call CBA_fnc_globalEventJIP;
        };
    }
] call synixe_missions_fnc_speak;

// [convoyOff, 2, false, 1, "Get Intel", [], 10,
// "Missing Inventory",
// "The convoy was hoping to avoid attention by taking these secluded roads to avoid attention but it made the perfect opportunity for Miyović's guys to raid their assets. These trucks were transporting vital military assets – missile and air-to-ground bombing units. Miyović might not be able to deploy these complex weapons systems himself, but we fear his forces could extract the deadly warheads and unleash catastrophic damage. We have to get those missiles secured before they fall into the wrong hands. CDF has been constantly carrying out UAV surveillance and has tracked high activty in the red zone marked on the map. That may be a good place to start your search."
// ] call zen_modules_fnc_addIntelAction;

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
    [5, [reinforcementsRadio, player], _onFinish, nil, "Calling Reinforcements", nil] call ace_common_fnc_progressBar;
  },
  {
    reinforcementsRadio getVariable ["reinforcementsCalled", true]
  }
] call ace_interact_menu_fnc_createAction;

[reinforcementsRadio, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;



laptop setObjectTextureGlobal [0, "#(rgb,1024,1024,3)text(1,3,""RobotoCondensed"",0.1,""#000000"",""#ffffff"",""        Use the radio\n        to signal convoy"")"];