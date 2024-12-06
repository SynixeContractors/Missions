// scripts
FELIX_fnc_setupDeliveries = compile preprocessFileLineNumbers "scripts\setupDeliveries.sqf";
FELIX_fnc_checkDeliveries = compile preprocessFileLineNumbers "scripts\checkDeliveries.sqf";
FELIX_fnc_addCheckDeliveriesAction = compile preprocessFileLineNumbers "scripts\addCheckDeliveriesAction.sqf";

[{
    // setup deliveries immediately
    call FELIX_fnc_setupDeliveries;

    // add check deliveries ACE action to object for everyone
    ["FELIX_addCheckDeliveriesAction", [checkDeliveriesBoard]] call CBA_fnc_globalEventJIP;
}] call CBA_fnc_execNextFrame;

// event handlers
["FELIX_checkDeliveries", {
    params ["_player"];
    [_player] call FELIX_fnc_checkDeliveries;
}] call CBA_fnc_addEventHandler;

// randomly delete triggers that would convert IND units to EAST
private _triggers = (getMissionLayerEntities "Convert Triggers") select 0;
{
    private _chance = random 1;
    // 50/50 chance a trigger gets deleted
    if (_chance > 0.5) then {
        deleteVehicle _x;
    }
} forEach _triggers;
