["ace_captiveStatusChanged", {
  params ["_unit", "_state", "_action"];
  if !(local _unit) exitWith {};
  if (_action != "SetHandcuffed") exitWith {};
  if (!_state) exitWith {};
  _unit call ENH_fnc_ambientAnimations_exit;
}] call CBA_fnc_addEventHandler;

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;

//////// Bool //////////

hackedTarget1_1 = false;
hackedTarget1_2 = false;
hackedTarget1_3 = false;
hackedTarget2_1 = false;
hackedTarget2_2 = false;
hackedTarget2_3 = false;
hackedTarget3_1 = false;
hackedTarget3_2 = false;
hackedTarget3_3 = false;

doorClosed = true;
rearDoorClosed = true;
hack = false;

//////// Van //////////

private _action = [
  "open_side_door", // unique id
  "Open side door", // text
  "", // icon
  { 
      van_1 animateDoor ["Door_3_source", 1];
      missionNamespace setVariable ["doorClosed", false, false]; 
  }, // statement
  { doorClosed } // condition
] call ace_interact_menu_fnc_createAction;
[van_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "close_side_door", // unique id
  "Close side door", // text
  "", // icon
  { 
      van_1 animateDoor ["Door_3_source", 0];
      missionNamespace setVariable ["doorClosed", true, true]; 
  }, // statement
  { !doorClosed } // condition
] call ace_interact_menu_fnc_createAction;
[van_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "open_rear_doors", // unique id
  "Open rear doors", // text
  "", // icon
  { 
      van_1 animateDoor ["Door_4_source", 1];
      missionNamespace setVariable ["rearDoorClosed", false, false];
      missionNamespace setVariable ["hack", false, false]; 
  }, // statement
  { rearDoorClosed } // condition
] call ace_interact_menu_fnc_createAction;
[van_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "close_rear_doors", // unique id
  "Close rear doors", // text
  "", // icon
  {
      van_1 animateDoor ["Door_4_source", 0];
      missionNamespace setVariable ["rearDoorClosed", true, true]; 
  }, // statement
  { !rearDoorClosed } // condition
] call ace_interact_menu_fnc_createAction;
[van_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//////// Terminal //////////

private _action = [
    "signal_check", // unique id
    "Check signal", // text
    "", // icon
    {
        private _termDist1 = terminal_1 distance target_1;
        private _termDist2 = terminal_1 distance target_2;
        private _termDist3 = terminal_1 distance target_3;

        private _bestSignal = _termDist1 min _termDist2 min _termDist3;
        private _signalText = switch (true) do {
            case (_bestSignal < 250): {
                "Signal strong"
            };
            case (_bestSignal < 500): {
                "Signal weak"
            };
            default {
                "No signal"
            };
        };

        [ ["", _signalText, 0] ] spawn BIS_fnc_EXP_camp_playSubtitles;

        private _runHack1 = _termDist1 < 250;
        if (_runHack1 != (missionNamespace getVariable ["runHack1", false])) then {
            missionNamespace setVariable ["runHack1", _runHack1, true];
        };
        private _runHack2 = _termDist2 < 250;
        if (_runHack2 != (missionNamespace getVariable ["runHack2", false])) then {
            missionNamespace setVariable ["runHack2", _runHack2, true];
        };
        private _runHack3 = _termDist3 < 250;
        if (_runHack3 != (missionNamespace getVariable ["runHack3", false])) then {
            missionNamespace setVariable ["runHack3", _runHack3, true];
        };
    }, // statement
    { !doorClosed } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//////// Hacking Target 1 //////////

private _action = [
    "start_hack_1", // unique id
    "Breach security protocols", // text
    "", // icon
    {
      [
        10, // Duration
        [], // Condition
        { 
          [
	          ["", "Breached security protocols", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget1_1", true, true];    
        }, // On finish
        {}, // On failure
        "Breaching security protocols..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { runHack1 && !hackedTarget1_1 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "start_hack1_2", // unique id
    "Access Mainframe ", // text
    "", // icon
    {
      [
        10, // Duration
        [], // Condition
        { 
          [
	          ["", "Accessed Mainframe", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget1_2", true, true];    
        }, // On finish
        {}, // On failure
        "Accessing Mainframe..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { hackedTarget1_1 && !hackedTarget1_2 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "start_hack1_3", // unique id
    "Install backdoor", // text
    "", // icon
    {
      [
        10, // Duration
        [], // Condition
        { 
          [
	          ["", "Installed backdoor", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget1_3", true, true];    
        }, // On finish
        {}, // On failure
        "Installing backdoor..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { hackedTarget1_2 && !hackedTarget1_3 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//////// Hacking Target 2 //////////

private _action = [
    "start_hack2_1", // unique id
    "Breach security protocols", // text
    "", // icon
    {
      [
        20, // Duration
        [], // Condition
        { 
          [
	          ["", "Breached security protocols", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget2_1", true, true];    
        }, // On finish
        {}, // On failure
        "Breaching security protocols..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { runHack2 && !hackedTarget2_1 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "start_hack2_2", // unique id
    "Locate test results", // text
    "", // icon
    {
      [
        30, // Duration
        [], // Condition
        { 
          [
	          ["", "Located test results", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget2_2", true, true];    
        }, // On finish
        {}, // On failure
        "Locating test results..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { hackedTarget2_1 && !hackedTarget2_2 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "start_hack2_3", // unique id
    "Secure intel", // text
    "", // icon
    {
      [
        60, // Duration
        [], // Condition
        { 
          [
	          ["", "Secured test results", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget2_3", true, true];    
        }, // On finish
        {}, // On failure
        "Securing intel..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { hackedTarget2_2 && !hackedTarget2_3 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//////// Hacking Target 3 //////////

private _action = [
    "start_hack3_1", // unique id
    "Breach security protocols", // text
    "", // icon
    {
      [
        20, // Duration
        [], // Condition
        { 
          [
	          ["", "Breached security protocols", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget3_1", true, true];    
        }, // On finish
        {}, // On failure
        "Breaching security protocols..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { runHack3 && !hackedTarget3_1 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "start_hack3_2", // unique id
    "Secure intel", // text
    "", // icon
    {
      [
        120, // Duration
        [], // Condition
        { 
          [
	          ["", "Secured flight logs", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget3_2", true, true];    
        }, // On finish
        {}, // On failure
        "Securing intel..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { hackedTarget3_1 && !hackedTarget3_2 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
    "start_hack3_3", // unique id
    "Install backdoor", // text
    "", // icon
    {
      [
        30, // Duration
        [], // Condition
        { 
          [
	          ["", "Installed backdoor", 0]
              ] spawn BIS_fnc_EXP_camp_playSubtitles;
          missionNamespace setVariable ["hackedTarget3_3", true, true];    
        }, // On finish
        {}, // On failure
        "Installing backdoor..." // Progressbar title
      ] call ace_common_fnc_progressBar
    }, // statement
    { hackedTarget3_2 && !hackedTarget3_3 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;