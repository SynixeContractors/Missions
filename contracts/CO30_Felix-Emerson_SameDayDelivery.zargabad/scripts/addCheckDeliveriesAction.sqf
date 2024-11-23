params ["_obj"];

private _statement = {
    ["FELIX_checkDeliveries", [player]] call CBA_fnc_serverEvent;
};

private _action = [
    "CheckDeliveries", // action name
    "Check Delivery Status", // menu name
    "", // icon
    _statement, // statement
    {true} // condition
] call ace_interact_menu_fnc_createAction;

// add ace action for everyone
[_obj, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;
