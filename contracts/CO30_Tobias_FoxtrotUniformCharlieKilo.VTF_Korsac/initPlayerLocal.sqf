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
  { missionNamespace setVariable ["Convoy_Go", true, true]; }, // statment
  { !Convoy_Go } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "HoldOrder1", // unique id
  "Stop Moving!", // text
  "", // icon
  { missionNamespace setVariable ["Convoy_Stop", true, true]; }, // statment
  { !Convoy_Stop } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "KillEngines", // unique id
  "Kill engines!", // text
  "", // icon
  { missionNamespace setVariable ["Kill_engines", true, true]; }, // statment
  { !Kill_engines && Convoy_Stop } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Checkpoint1", // unique id
  "Waypoint 1 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_1", true, true]; }, // statment
  { !Checkpoint_1T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Checkpoint2", // unique id
  "Waypoint 2 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_2", true, true]; }, // statment
  { !Checkpoint_2T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Checkpoint3", // unique id
  "Waypoint 3 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_3", true, true]; }, // statment
  { !Checkpoint_3T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Checkpoint4", // unique id
  "Waypoint 4 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_4", true, true]; }, // statment
  { !Checkpoint_4T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Checkpoint5", // unique id
  "Waypoint 5 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_5", true, true]; }, // statment
  { !Checkpoint_5T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//// Convoy Movement outside ////

private _action = [
  "MoveOrder2", // unique id
  "Start Moving!", // text
  "", // icon
  { missionNamespace setVariable ["Convoy_Go", true, true]; }, // statment
  { !Convoy_Go } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "HoldOrder2", // unique id
  "Stop Moving!", // text
  "", // icon
  { missionNamespace setVariable ["Convoy_Stop", true, true]; }, // statment
  { !Convoy_Stop } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "KillEngines2", // unique id
  "Kill engines!", // text
  "", // icon
  { missionNamespace setVariable ["Kill_engines", true, true]; }, // statment
  { !Kill_engines && Convoy_Stop } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Waypoint1", // unique id
  "Waypoint 1 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_1", true, true]; }, // statment
  { !Checkpoint_1T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Waypoint2", // unique id
  "Waypoint 2 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_2", true, true]; }, // statment
  { !Checkpoint_2T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Waypoint3", // unique id
  "Waypoint 3 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_3", true, true]; }, // statment
  { !Checkpoint_3T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Waypoint4", // unique id
  "Waypoint 4 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_4", true, true]; }, // statment
  { !Checkpoint_4T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "Waypoint5", // unique id
  "Waypoint 5 clear!", // text
  "", // icon
  { missionNamespace setVariable ["Checkpoint_5", true, true]; }, // statment
  { !Checkpoint_5T } // condition
] call ace_interact_menu_fnc_createAction;
[Offroad, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//// Convoy check fuel ////

private _action = [
  "CheckFuelV1", // unique id
  "Check fuel", // text
  "", // icon
  { hint format ["Fuel gauge reads %1!", fuel V1];  }, // statment
  { CheckFuel } // condition
] call ace_interact_menu_fnc_createAction;
[V1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CheckFuelV2", // unique id
  "Check fuel", // text
  "", // icon
  { hint format ["Fuel gauge reads %1!", fuel V2];  }, // statment
  { CheckFuel } // condition
] call ace_interact_menu_fnc_createAction;
[V2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CheckFuelV3", // unique id
  "Check fuel", // text
  "", // icon
  { hint format ["Fuel gauge reads %1!", fuel V3];  }, // statment
  { CheckFuel } // condition
] call ace_interact_menu_fnc_createAction;
[V3, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CheckFuelV4", // unique id
  "Check fuel", // text
  "", // icon
  { hint format ["Fuel gauge reads %1!", fuel V4];  }, // statment
  { CheckFuel } // condition
] call ace_interact_menu_fnc_createAction;
[V4, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CheckFuelV5", // unique id
  "Check fuel", // text
  "", // icon
  { hint format ["Fuel gauge reads %1!", fuel V5];  }, // statment
  { CheckFuel } // condition
] call ace_interact_menu_fnc_createAction;
[V5, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
  "CheckFuelV6", // unique id
  "Check fuel", // text
  "", // icon
  { hint format ["Fuel gauge reads %1!", fuel V6];  }, // statment
  { CheckFuel } // condition
] call ace_interact_menu_fnc_createAction;
[V6, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;