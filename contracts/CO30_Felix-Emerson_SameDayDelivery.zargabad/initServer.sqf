// scripts
FELIX_fnc_setupDeliveries = compile preprocessFileLineNumbers "scripts\setupDeliveries.sqf";
FELIX_fnc_checkDeliveries = compile preprocessFileLineNumbers "scripts\checkDeliveries.sqf";

[{
    // setup deliveries immediately
    call FELIX_fnc_setupDeliveries;
}] call CBA_fnc_execNextFrame;

[{
    call FELIX_fnc_checkDeliveries;
}, 15] call CBA_fnc_addPerFrameHandler;

// randomly delete triggers that would convert IND units to EAST
private _triggers = (getMissionLayerEntities "Convert Triggers") select 0;
{
    private _chance = random 1;
    // 50/50 chance a trigger gets deleted
    if (_chance > 0.5) then {
        deleteVehicle _x;
    }
} forEach _triggers;
