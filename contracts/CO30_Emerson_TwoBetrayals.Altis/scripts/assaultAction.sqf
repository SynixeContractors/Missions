params ["_obj"];

// sets the assault variable
_statement = {
    assaultStarted = true;
    publicVariable "assaultStarted";
};

// to show assault action, the briefing action must be used first 
// and the assaualt variable, if it exists, needs to be false
_condition = {
    stavrouBriefingAdded && (isNil "assaultStarted" || !assaultStarted)
};

_action = [
    "AssaultAction", // name
    "Start the Assault!", // name shown in menu
    "", // icon
    _statement, // statement
    _condition, // condition
    {}, // children code
    [_obj], // parameters
    [0,0,0], // position
    3 // distance
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;