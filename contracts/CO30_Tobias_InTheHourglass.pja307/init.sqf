#include "functions\fn_injuries.sqf"
#include "functions\fn_malfunctionConvoy.sqf"

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;


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
