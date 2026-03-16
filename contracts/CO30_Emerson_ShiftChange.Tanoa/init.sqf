// event handlers
["FARE_enableSimulation", {
    call FARE_fnc_enableSimulation;
}] call CBA_fnc_addEventHandler;

["FARE_dropWeapon", {
    params ["_target", "_weapon"];
    [_target, _weapon] call CBA_fnc_dropWeapon;
}] call CBA_fnc_addEventHandler;

["FARE_surrender", {
    params ["_target", "_state"];
    [_target, _state] call ACE_captives_fnc_setSurrendered;
}] call CBA_fnc_addEventHandler;
