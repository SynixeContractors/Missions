mission_follow = false;
mission_reinforcements = false;

private _action = ["follow", "Make group follow tank", "", {missionNamespace setVariable ["mission_follow", true];}, {!(missionNamespace getVariable ["mission_follow", true])}] call ace_interact_menu_fnc_createAction;
[tank, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
