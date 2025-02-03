["ace_captiveStatusChanged", {
  params ["_unit", "_state", "_action"];
  if !(local _unit) exitWith {};
  if (_action != "SetHandcuffed") exitWith {};
  if (!_state) exitWith {};
  _unit call ENH_fnc_ambientAnimations_exit;
}] call CBA_fnc_addEventHandler;

Convoy_Go = false;
Convoy_Stop = true;
Kill_engines = true;

Checkpoint_1 = false;
Checkpoint_1T = true;

Checkpoint_2 = false;
Checkpoint_2T = true;

Checkpoint_3 = false;
Checkpoint_3T = true;

Checkpoint_4 = false;
Checkpoint_4T = true;

Checkpoint_5 = false;
Checkpoint_5T = true;

CheckFuel = true;

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;