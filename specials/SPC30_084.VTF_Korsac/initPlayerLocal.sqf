#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html", then add "Example" here
] call mission_fnc_briefing;

ace_player setVariable ["mission_current_layer", "overworld", true];
current_time = 8;

mission_fnc_setTime = {
    params ["_hour", "_minute"];
    private _current = date;
    private _new = [_current select 0, _current select 1, _current select 2, _hour, _minute];
    setDate _new;
};

mission_fnc_portalShow = compile preprocessFileLineNumbers "portalShow.sqf";
mission_fnc_portalHide = compile preprocessFileLineNumbers "portalHide.sqf";

mission_fnc_teleport = {
    params ["_gate"];
    // reference objects
    private _from_pos = call compile format ["%1_from_pos", _gate];
    private _from_dir = call compile format ["%1_from_dir", _gate];
    private _to_pos = call compile format ["%1_to_pos", _gate];
    private _to_dir = call compile format ["%1_to_dir", _gate];
    // Teleport from from to to, using offsets from the objects
    private _pos_offset = (getPosASL ace_player) vectorDiff (getPosASL _from_pos);
    private _dir_offset = ace_player getRelDir _from_dir;
    ace_player setPosASL ((getPosASL _to_pos) vectorAdd _pos_offset);
    ace_player setDir ((_to_pos getRelDir _to_dir) + _dir_offset);
};

mission_fnc_showLayer = {
    params ["_layer"];
    private _objects = missionNamespace getVariable [format ["mission_layer_%1", _layer], []];
    {
        if (typeOf _x == "Land_AirHorn_01_F") then {
            _x hideObject true;
            [_x] call mission_fnc_portalShow;
        } else {
            _x hideObject false;
        };
    } forEach _objects;
    {
        if (_x == ace_player) then { continue };
        private _other_layer = _x getVariable ["mission_current_layer", "overworld"];
        _x hideObject (_other_layer != _layer);
    } forEach allPlayers;
};

mission_fnc_hideLayer = {
    params ["_layer"];
    private _objects = missionNamespace getVariable [format ["mission_layer_%1", _layer], []];
    {
        if (typeOf _x == "Land_AirHorn_01_F") then {
            _x hideObject true;
            [_x] call mission_fnc_portalHide;
        } else {
            _x hideObject true;
        };
    } forEach _objects;
};

mission_fnc_go = {
    params ["_to"];
    if (_to == (ace_player getVariable ["mission_current_layer", "overworld"])) exitWith {};
    private _blocked = ace_player getVariable ["mission_blocked", false];
    ace_player setVariable ["mission_blocked", true];
    private _from = ace_player getVariable ["mission_current_layer", "overworld"];
    [_from] call mission_fnc_hideLayer;
    [_from] call mission_fnc_leave;
    [_to] call mission_fnc_showLayer;
    [_to] call mission_fnc_enter;
    [_to] call mission_fnc_pp;
    ["mission_went", [ace_player, _to]] call CBA_fnc_globalEvent;
    ace_player setVariable ["mission_current_layer", _to, true];
    [{ace_player setVariable ["mission_blocked", false]} , [], 5] call CBA_fnc_waitAndExecute;
};

["mission_go", mission_fnc_go] call CBA_fnc_addEventHandler;
["mission_went", {
    params ["_player", "_to"];
    if (_player == ace_player) exitWith {};
    if (_to != (ace_player getVariable ["mission_current_layer", "overworld"])) then {
        _player hideObject true;
    } else {
        _player hideObject false;
    };
}];

mission_fnc_ppreset = {
    [mission_pp1, mission_pp2] apply {
        if (!isNil "_x") then {
            _x ppEffectEnable false;
            _x ppEffectCommit 0;
            ppEffectDestroy _x;
            _x = nil;
        };
    };
};

mission_fnc_pp = {
    params ["_layer"];
    // apply different pp effects per layer

    // overworld - reset pp effects
    switch (_layer) do {
        case "overworld": {
            call mission_fnc_ppreset;
        };
        case "alpha": {
            mission_pp1 = ppEffectCreate ["ColorCorrections", 1];
            mission_pp1 ppEffectEnable true;
            mission_pp1 ppEffectAdjust [
                0.6,                       // Brightness
                0.4,                      // Contrast
                -0.02,                     // Offset
                [0.1, 0.15, 0.2, 0.1],    // Blend color: subtle blue-grey
                [0.7, 0.75, 0.8, 0.3],    // Color weighting
                [0.1, 0.1, 0.1, 0.0]  // Desaturated output
            ];
            mission_pp1 ppEffectCommit 0;
            mission_pp2 = ppEffectCreate ["FilmGrain", 2000];
            mission_pp2 ppEffectEnable true;
            mission_pp2 ppEffectAdjust [
                0.2,
                1.25,
                2.01,
                0.75,
                1.0,
                0
            ];
            mission_pp2 ppEffectCommit 0;
        };
        case "bravo": {
            call mission_fnc_ppreset;
        };
        default {
            
        };
    };
};

mission_fnc_enter = {
    params ["_layer"];
    switch (_layer) do {
        case "overworld": {
            current_time = 8;
        };
        case "alpha": {
            current_time = 4;
            ace_player setVariable ["acre_sys_core_isDisabled", true, true];
        };
        case "bravo": {
            current_time = 12;
            ["bravo"] call mission_fnc_teleport;
        };
        default {
            
        };
    };
};

mission_fnc_leave = {
    params ["_layer"];
    switch (_layer) do {
        case "alpha": {
            ace_player setVariable ["acre_sys_core_isDisabled", false, true];
        };
        default {
            
        };
    };
};

mission_fnc_toggleMemory = {
    params ["_object", "_set"];
    private _effects = _object getVariable ["bis_effects",[]];
    {
        deleteVehicle (_x select 0);
    } forEach _effects;
};

[{
    if (ace_player getVariable ["acre_sys_core_isDisabled", false]) then {
        call ace_common_fnc_endRadioTransmission;
    };
}, 0.1] call CBA_fnc_addPerFrameHandler;

[{
    ["overworld"] call mission_fnc_showLayer;
}, [], 2] call CBA_fnc_waitAndExecute;

[{
    [current_time, 0] call mission_fnc_setTime;
}, 0] call CBA_fnc_addPerFrameHandler;
