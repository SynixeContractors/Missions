#include "functions\fn_injuries.sqf"
#include "functions\fn_malfunctionConvoy.sqf"

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;
