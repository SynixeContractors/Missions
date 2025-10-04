#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

//// Convoy Movement inside ////

private _action = [
  "MoveOrder1", // unique id
  "Start Moving!", // text
  "", // icon
  { ["convoy_go"] call CBA_fnc_serverEvent }, // statment
  { call mission_fnc_hasStarted && !convoy_move } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "HoldOrder1", // unique id
  "Stop Moving!", // text
  "", // icon
  { ["convoy_stop"] call CBA_fnc_serverEvent }, // statment
  { call mission_fnc_hasStarted && convoy_move } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "KillEngines", // unique id
  "Kill engines!", // text
  "", // icon
  { ["kill_engines"] call CBA_fnc_serverEvent }, // statment
  { call mission_fnc_hasStarted && !kill_engines } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "checkpoint1", // unique id
  "Waypoint 1 Clear!", // text
  "", // icon
  { missionNamespace setVariable ["checkpoint_1", true, true];
  missionNamespace setVariable ["checkpoint_1T", true, true]; }, // statment
  { !checkpoint_1T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "checkpoint2", // unique id
  "Waypoint 2 Clear!", // text
  "", // icon
  { missionNamespace setVariable ["checkpoint_2", true, true];
  missionNamespace setVariable ["checkpoint_2T", true, true]; }, // statment
  { !checkpoint_2T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "checkpoint3", // unique id
  "Waypoint 3 Clear!", // text
  "", // icon
  { missionNamespace setVariable ["checkpoint_3", true, true];
  missionNamespace setVariable ["checkpoint_3T", true, true]; }, // statment
  { !checkpoint_3T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "checkpoint4", // unique id
  "Waypoint 4 Clear!", // text
  "", // icon
  { missionNamespace setVariable ["checkpoint_4", true, true]; 
  missionNamespace setVariable ["checkpoint_4T", true, true]; }, // statment
  { !checkpoint_4T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "checkpoint5", // unique id
  "Waypoint 5 Clear!", // text
  "", // icon
  { missionNamespace setVariable ["checkpoint_5", true, true]; 
  missionNamespace setVariable ["checkpoint_5T", true, true]; }, // statment
  { !checkpoint_5T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//// Convoy check fuel ////

private _action = [
  "checkFuel", // unique id
  "Check Fuel", // text
  "", // icon
  { hint format ["Fuel Gauge: %1%%", round (fuel _target * 100)];  }, // statment
  { true } // condition
] call ace_interact_menu_fnc_createAction;
[V1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[V2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[V3, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[V4, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[V5, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[V6, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
