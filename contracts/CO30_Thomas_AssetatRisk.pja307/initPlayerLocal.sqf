#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

mission_fnc_flying1 = compile preprocessFileLineNumbers "flying1.sqf";
["mission_takeoff", {
    helo1 engineOn true;
    0 spawn mission_fnc_flying1;
}] call CBA_fnc_addEventHandler;

private _action = [
    "Flying1Action", // <---- action identifier
    "Takeoff",
    "",
    {
        ["mission_takeoff", [], [helo1]] call CBA_fnc_targetEvent;
        ["mission_remove_action"] call CBA_fnc_globalEvent;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[
    helo1,
    0,
    ["ACE_MainActions"], // <---- parent path of new action
    _action
] call ace_interact_menu_fnc_addActionToObject;

["mission_remove_action", {
    [
        helo1,
        0,
        ["ACE_MainActions", "Flying1Action"] // <---- full path, parent + ident
    ] call ace_interact_menu_fnc_removeActionFromObject;
}] call CBA_fnc_addEventHandler;

mission_canCallExtract = false;
mission_hasCalledExtract = false;
["acre_startedSpeaking", {
  mission_extractStart = 0;
  // Only check if extract is allowed
  if (!mission_canCallExtract) exitWith {};
  // Only check if the extract has not been called yet
  if (mission_hasCalledExtract) exitWith {};

  params ["_unit", "_onRadio", "_radio", "_type"];
  if (!_onRadio) exitWith {};
  if (_unit != player) exitWith {};

  // Only check if the player is using the PRC152
  if ([_radio] call acre_api_fnc_getBaseRadio != "ACRE_PRC152") exitWith {};

  // Only check if the player is using the correct channel
  private _radioChannel = [_radio] call acre_api_fnc_getRadioChannel;
  if (_radioChannel != 6) exitWith {};

  mission_extractStart = CBA_missionTime;
}] call CBA_fnc_addEventHandler;

["acre_stoppedSpeaking", {
  params ["_unit", "_onRadio"];
  if (!_onRadio) exitWith {};
  if (_unit != player) exitWith {};
  // Only check if extract is allowed
  if (mission_extractStart == 0) exitWith {};
  if (CBA_missionTime - mission_extractStart > 2) then {
    missionNamespace setVariable ["mission_hasCalledExtract", true, true];
    HeloPilot sideChat "Copy, we're 5 out, see you soon.";
  };
}] call CBA_fnc_addEventHandler;

["ACRE_PRC152", "synixe", 6, "label", "EXTRACT"] call acre_api_fnc_setPresetChannelField;