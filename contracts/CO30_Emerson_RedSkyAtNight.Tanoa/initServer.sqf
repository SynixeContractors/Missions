// handle flashlights
{
    // skip INDFOR
    _side = side (leader _x);
    if (_side == independent) exitWith {};

    // add flashlight to every group member
    {   
        _x addPrimaryWeaponItem "acc_flashlight"; 
    } forEach units _x;

    // if BLUFOR, force light on
    if (_side == west) then {
        // force group to use flashlights
        _x enableGunLights "ForceOn";
    };
} forEach allGroups;

// scripts
FARE_fnc_rooftopAccess = compile preprocessFileLineNumbers "scripts\rooftopAccess.sqf";
FARE_fnc_boatHorn = compile preprocessFileLineNumbers "scripts\boatHorn.sqf";
FARE_fnc_fakeShipment = compile preprocessFileLineNumbers "scripts\fakeShipment.sqf";
FARE_fnc_mainAttack = compile preprocessFileLineNumbers "scripts\mainAttack.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";
FARE_fnc_boatBomb = compile preprocessFileLineNumbers "scripts\boatBomb.sqf";
FARE_fnc_crateFall = compile preprocessFileLineNumbers "scripts\crateFall.sqf";
FARE_fnc_drugDeal = compile preprocessFileLineNumbers "scripts\drugDeal.sqf";
FARE_fnc_enableSimulation = compile preprocessFileLineNumbers "scripts\enableSimulation.sqf";

// event handlers 
["FARE_enableSimulation", FARE_fnc_enableSimulation] call CBA_fnc_addEventHandler;
["FARE_allowDamage", {
    params ["_unit"];
    _unit allowDamage true;
}] call CBA_fnc_addEventHandler;
["FARE_radioMessage", {
    params ["_unit", "_sound"];
    _unit globalRadio _sound;
}] call CBA_fnc_addEventHandler;
["FARE_transcript", FARE_fnc_transcript] call CBA_fnc_addEventHandler;