#include "do_not_edit\script_component.hpp"

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;

[QGVAR(missionStartTime), {
    [
        [
            [getMissionConfigValue ["onLoadName", ""], "<t size = '1.5' underline = '1'>%1</t><br/>"],
            ["Synixe Contractors"],
            [getText (configFile >> "CfgWorlds" >> worldName >> "description"), "<t size = '1' font='puristaSemiBold'>%1</t>", 70]
        ], 0.75, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
    ] spawn BIS_fnc_typeText;
}] call CBA_fnc_addEventHandler;

// TODO replace with function
[player] execVM "edit_me\briefing.sqf";

// -----------------------------------------------------------------

// init chemical detector and chemical damage for mission
// yes, I know it's execVM but it runs once at beginning of mission
[
  {time > 1},
  {
    execVM "scripts\chemicalDetector.sqf";
    execVM "scripts\chemicalDamage.sqf";
  }
] call CBA_fnc_waitUntilAndExecute;
