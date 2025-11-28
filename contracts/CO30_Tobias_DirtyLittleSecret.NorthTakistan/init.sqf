nibs_startAttack = false;

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;

missionNameSpace setVariable ["switchSides", false, true];
