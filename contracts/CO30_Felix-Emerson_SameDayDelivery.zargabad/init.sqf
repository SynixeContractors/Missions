// event handlers
["FELIX_addCheckDeliveriesAction", {
    call FELIX_fnc_addCheckDeliveriesAction;
}] call CBA_fnc_addEventHandler;

["FELIX_checkDeliveries", {
    params ["_player"];
    [_player] call FELIX_fnc_checkDeliveries;
}] call CBA_fnc_addEventHandler;

["FELIX_hintSilent", {
    params ["_text"];
    hintSilent parseText format [_text];
}] call CBA_fnc_addEventHandler;
