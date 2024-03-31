#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

// Helicopters

private _action = [
  "SignalTakeOff", // unique id
  "Signal to Take Off", // text
  "", // icon
  { missionNamespace setVariable ["vehicle_go", true, true]; }, // statment
  { !vehicle_go } // condition
] call ace_interact_menu_fnc_createAction;
[heli, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "SignalTakeOff1", // unique id
  "Signal to Take Off", // text
  "", // icon
  { missionNamespace setVariable ["ok_heli1", true, true]; }, // statment
  { !ok_heli1 } // condition
] call ace_interact_menu_fnc_createAction;
[heli1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "SignalTakeOff2", // unique id
  "Signal to Take Off", // text
  "", // icon
  { missionNamespace setVariable ["ok_heli2", true, true]; }, // statment
  { !ok_heli2 } // condition
] call ace_interact_menu_fnc_createAction;
[heli2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "SignalTakeOff3", // unique id
  "Signal to Take Off", // text
  "", // icon
  { missionNamespace setVariable ["ok_heli3", true, true]; }, // statment
  { !ok_heli3 } // condition
] call ace_interact_menu_fnc_createAction;
[heli3, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Terminal

private _action = [
  "CallHeli1", // unique id
  "Call for Pickup LZ Uptown", // text
  "", // icon
  { missionNamespace setVariable ["call_heli1", true, true]; }, // statment
  { !call_heli1 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CallHeli3", // unique id
  "Call for Pickup LZ Midtown", // text
  "", // icon
  { missionNamespace setVariable ["call_heli3", true, true]; }, // statment
  { !call_heli3 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CallHeli2", // unique id
  "Call for Pickup LZ Downtown", // text
  "", // icon
  { missionNamespace setVariable ["call_heli2", true, true]; }, // statment
  { !call_heli2 } // condition
] call ace_interact_menu_fnc_createAction;
[terminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;