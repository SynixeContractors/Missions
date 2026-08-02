["ace_captiveStatusChanged", {
  params ["_unit", "_state", "_action"];
  if !(local _unit) exitWith {};
  if (_action != "SetHandcuffed") exitWith {};
  if (!_state) exitWith {};
  _unit call ENH_fnc_ambientAnimations_exit;
}] call CBA_fnc_addEventHandler;

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;

[{
    location_0 = createLocation ["NameLocal", [15183.7,14158.1,0], 1, 1]; 
    location_0 setText "Mercy-West Hospital"; 

    location_1 = createLocation ["NameLocal", [15933,14953.5,0], 1, 1]; 
    location_1 setText "Virojoki Arena Stadium"; 

}, 4] call CBA_fnc_waitAndExecute;
