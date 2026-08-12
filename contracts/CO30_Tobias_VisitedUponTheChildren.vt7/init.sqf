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
    private _locationHospital = createLocation ["NameLocal", [15183.7, 14158.1, 0], 1, 1];
    _locationHospital setText "Mercy-West Hospital";

    private _locationStadium = createLocation ["NameLocal", [15933, 14953.5, 0], 1, 1];
    _locationStadium setText "Virojoki Arena Stadium";

}, 4] call CBA_fnc_waitAndExecute;
