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

FARE_fnc_rooftopAccess = compile preprocessFileLineNumbers "scripts\rooftopAccess.sqf";
FARE_fnc_fakeShipment = compile preprocessFileLineNumbers "scripts\fakeShipment.sqf";
FARE_fnc_mainAttack = compile preprocessFileLineNumbers "scripts\mainAttack.sqf";