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

missionNamespace setVariable ["#EM_FMin", 140];
missionNamespace setVariable ["#EM_FMax", 143];

missionNamespace setVariable ["#EM_SMin", -60];
missionNamespace setVariable ["#EM_SMax", -10];

[{
    private _values = [];
    {
        _x params ["_mhz", "_tower"];
        if (alive _tower) then {
            private _dir = player getDir _tower;
            private _looking = getDir player;
            private _error = abs (_looking - _dir);
            private _distance = (getPosASL player) distance (getPosASL _tower);
            private _strength = -80 + (((60 - ((_distance/400) * (_distance/400))) max 0) min 60) - _error;
            _values pushBack _mhz;
            _values pushBack _strength;
        };
        missionnamespace setVariable ["#EM_Values", _values];
    } forEach [[141.8,tower_a], [140.85,tower_b], [141.12,tower_c]];
}] call CBA_fnc_addPerFrameHandler;
