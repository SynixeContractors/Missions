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


private _target_1 = selectRandom [
    target_1,
    target_2,
    target_3
];

private _wp_1 = convoy_01 addWaypoint [getPos _target_1, 5];
_wp_1 setWaypointSpeed "LIMITED";
_wp_1 setWaypointFormation "COLUMN";

private _target_2 = selectRandom [
    target_4,
    target_5,
    target_6
];

private _wp_2 = convoy_01 addWaypoint [getPos _target_2, 5];
_wp_2 setWaypointType "GETOUT";
_wp_2 setWaypointSpeed "LIMITED";
_wp_2 setWaypointFormation "COLUMN";

_wp_2 setWaypointStatements [
    "true",
    "[vic_1] call fnc_malfunctionConvoy; 
     [vic_2] call fnc_malfunctionConvoy;
     [vic_3] call fnc_malfunctionConvoy;
     [vic_4] call fnc_malfunctionConvoy;
     [(units convoy_01), 0.6] call fnc_damageInfantryUntilDead;"
];

private _target_3 = selectRandom [
    target_7,
    target_8,
    target_9
];

private _wp_3 = convoy_01 addWaypoint [getPos _target_3, 5];
_wp_3 setWaypointSpeed "LIMITED";
_wp_3 setWaypointFormation "COLUMN";
