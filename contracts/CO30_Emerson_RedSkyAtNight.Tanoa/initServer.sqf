// handle flashlights
{
    // skip INDFOR
    if (side (leader _x) == independent) exitWith {};

    // add flashlight to every group member
    {   
        _x addPrimaryWeaponItem "acc_flashlight"; 
    } forEach units _x;

    // if BLUFOR, force light on
    if (side (leader _x) == west) then {
        // force group to use flashlights
        _x enableGunLights "ForceOn";
    };
} forEach allGroups;

// scripts
FARE_fnc_boatHorn = compile preprocessFileLineNumbers "scripts\boatHorn.sqf";
FARE_fnc_fakeShipment = compile preprocessFileLineNumbers "scripts\fakeShipment.sqf";
FARE_fnc_mainAttack = compile preprocessFileLineNumbers "scripts\mainAttack.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";
FARE_fnc_boatBomb = compile preprocessFileLineNumbers "scripts\boatBomb.sqf";
FARE_fnc_crateFall = compile preprocessFileLineNumbers "scripts\crateFall.sqf";
FARE_fnc_drugDeal = compile preprocessFileLineNumbers "scripts\drugDeal.sqf";
FARE_fnc_enableSimulation = compile preprocessFileLineNumbers "scripts\enableSimulation.sqf";