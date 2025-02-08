["ace_captiveStatusChanged", {
  params ["_unit", "_state", "_action"];
  if !(local _unit) exitWith {};
  if (_action != "SetHandcuffed") exitWith {};
  if (!_state) exitWith {};
  _unit call ENH_fnc_ambientAnimations_exit;
}] call CBA_fnc_addEventHandler;

mission_fnc_hasStarted = {
    ((date select 3) >= 07) && ((date select 4) >= 00)
};

convoy_move = false;

checkpoint_1 = false;
checkpoint_1T = true;

checkpoint_2 = false;
checkpoint_2T = true;

checkpoint_3 = false;
checkpoint_3T = true;

checkpoint_4 = false;
checkpoint_4T = true;

checkpoint_5 = false;
checkpoint_5T = true;

["mission_applyDamage", {
    _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;
