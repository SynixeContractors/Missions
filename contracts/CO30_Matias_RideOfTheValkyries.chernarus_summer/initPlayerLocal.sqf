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

{
  if !(isNull _x) then {
    persistent_gear_shop_arsenal_shops pushBack _x;
  };
} forEach [shop_1, shop_2, shop_3, shop_4, shop_5, shop_6, shop_7, shop_8, shop_9, shop_10];

call persistent_gear_shop_arsenal_fnc_create_actions;
