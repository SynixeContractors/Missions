missionBriefing = false;

["mission_applyDamage", {
  _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;

["ace_captiveStatusChanged", {
  params ["_unit", "_state", "_action"];
  if !(local _unit) exitWith {};
  if (_action != "SetHandcuffed") exitWith {};
  if (!_state) exitWith {};
  _unit call ENH_fnc_ambientAnimations_exit;
}] call CBA_fnc_addEventHandler;

{ [_x, 1000, 1138, []] call BIS_fnc_destroyCity; } forEach ["city_1", "city_2", "city_3", "city_4", "city_5", "city_6", "city_7"];

mission_fnc_scheduleEarthquake = {
    [mission_fnc_earthquake, "", random [300,600,900]] call CBA_fnc_waitAndExecute;
};
mission_fnc_earthquake = {
  [selectRandom [1,2,3,4]] spawn bis_fnc_earthquake;
  call mission_fnc_scheduleEarthquake;
};
call mission_fnc_earthquake;