// scripts
FELIX_fnc_setupDeliveries = compile preprocessFileLineNumbers "scripts\setupDeliveries.sqf";
FELIX_fnc_addDeliveriesBriefing = compile preprocessFileLineNumbers "scripts\addDeliveriesBriefing.sqf";
FELIX_fnc_checkDeliveries = compile preprocessFileLineNumbers "scripts\checkDeliveries.sqf";
FELIX_fnc_addCheckDeliveriesAction = compile preprocessFileLineNumbers "scripts\addCheckDeliveriesAction.sqf";

// setup deliveries immediately
call FELIX_fnc_setupDeliveries;

// add delivery briefing once deliveries have been determined and mission has started
call FELIX_fnc_addDeliveriesBriefing;

[checkDeliveriesBoard] call FELIX_fnc_addCheckDeliveriesAction;
