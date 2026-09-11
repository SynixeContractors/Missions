#include "functions\fn_malfunction.sqf"

    mission_parts = [
        "HitLFWheel","HitRFWheel",
        "HitLF2Wheel","HitRF2Wheel",
        "HitLMWheel","HitRMWheel",
        "HitLBWheel","HitRBWheel",
        "HitFuel","HitEngine"
    ];

{
    for "_i" from 1 to 3 do {
        private _dmg  = 0.3 + random 0.4;
        private _part = selectRandom mission_parts;

        _x setHitPointDamage [_part, _dmg];
    };
} forEach [vic_1, vic_2, vic_3, vic_4];

TAG_fnc_setHP = {
    params ["_veh","_part","_dmg"];
    _veh setHitPointDamage [_part, _dmg];
};

fnc_malfunctionLoop = {

    private _veh = selectRandom allMissionObjects "car";

    if (!isNull _veh && { isEngineOn _veh }) then {
        [_veh] call fnc_malfunction;
    };

    [
        { [] call fnc_malfunctionLoop },
        [],
        30 + random 60
    ] call CBA_fnc_waitAndExecute;
};

[
    { [] call fnc_malfunctionLoop },
    [],
    30 + random 60
] call CBA_fnc_waitAndExecute;
