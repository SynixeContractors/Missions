// scripts
FELIX_fnc_setupDeliveries = compile preprocessFileLineNumbers "scripts\setupDeliveries.sqf";
FELIX_fnc_checkDeliveries = compile preprocessFileLineNumbers "scripts\checkDeliveries.sqf";
FELIX_fnc_addCheckDeliveriesAction = compile preprocessFileLineNumbers "scripts\addCheckDeliveriesAction.sqf";

// setup deliveries immediately
call FELIX_fnc_setupDeliveries;

// add check delivery ACE action to object
[checkDeliveriesBoard] call FELIX_fnc_addCheckDeliveriesAction;
