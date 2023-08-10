params ["_obj"];

_statement = {
    assaultStarted = true;
    publicVariable "assaultStarted";
};

_action = [
    "AssaultAction", // name
    "Start the Assault!", // name shown in menu
    "", // icon
    _statement, // statement
    {true}, // condition
    {}, // children code
    [_obj], // parameters
    [0,0,0], // position
    3 // distance
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;