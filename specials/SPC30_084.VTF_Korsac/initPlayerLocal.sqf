#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html", then add "Example" here
] call mission_fnc_briefing;

ace_player setVariable ["mission_current_layer", "overworld", true];
mission_current_layer = "overworld";
current_time = 8;
current_rain = 0.2;
current_overcast = 0.7;

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
        if (_x getVariable ["mission_solo", false]) then { continue };
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
    if (_to == mission_current_layer) exitWith {};
    private _blocked = ace_player getVariable ["mission_blocked", false];
    ace_player setVariable ["mission_blocked", true];
    private _from = mission_current_layer;
    [_from] call mission_fnc_hideLayer;
    [_from] call mission_fnc_leave;
    [_to] call mission_fnc_showLayer;
    [_to] call mission_fnc_enter;
    [_to] call mission_fnc_pp;
    ["mission_went", [ace_player, _to]] call CBA_fnc_globalEvent;
    ace_player setVariable ["mission_current_layer", _to, true];
    mission_current_layer = _to;
    [{ace_player setVariable ["mission_blocked", false]} , [], 5] call CBA_fnc_waitAndExecute;
};

["mission_go", mission_fnc_go] call CBA_fnc_addEventHandler;
["mission_went", {
    params ["_player", "_to"];
    if (_player == ace_player) exitWith {};
    if (_to != mission_current_layer) then {
        _player hideObject true;
    } else {
        if (_player getVariable ["mission_solo", false]) exitWith {};
        _player hideObject false;
    };
}] call CBA_fnc_addEventHandler;

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
    if (_layer != "sierra") then {
        call mission_fnc_ppreset;
    };
    switch (_layer) do {
        case "delta";
        case "juliet";
        case "kilo";
        case "mike";
        case "papa";
        case "tango";
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
        case "romeo": {
            mission_pp1 = ppEffectCreate ["DynamicBlur", 401];
            mission_pp1 ppEffectEnable true;
            mission_pp1 ppEffectAdjust [0];
            mission_pp1 ppEffectCommit 0;
        };
        case "sierra": {
            mission_pp1 = ppEffectCreate ["DynamicBlur", 401];
            mission_pp1 ppEffectEnable true;
            mission_pp1 ppEffectAdjust [4];
            mission_pp1 ppEffectCommit 0;
        };
        default {};
    };
};

mission_fnc_enter = {
    params ["_layer"];
    switch (_layer) do {
        case "overworld": {
            current_time = 8;
            current_rain = 0.2;
            current_overcast = 0.7;
            ace_player setCaptive true;
        };
        case "delta";
        case "alpha": {
            current_time = 4;
        };
        case "bravo": {
            current_time = 12;
            ["bravo"] call mission_fnc_teleport;
        };
        case "echo": {
            current_time = 15;
            current_rain = 0;
            current_overcast = 0;
            ace_player setPosASL (getPosASL echo_tp);
            ace_player setDir (getDir echo_tp);
            ace_player setVariable ["acre_sys_core_isDisabled", true, true];
            ace_player hideObjectGlobal true;
            ace_player hideObject false;
            ace_player setVariable ["mission_solo", true, true];
            if !(is3DENPreview) then {
                ace_player forceWalk true;
            };
        };
        case "juliet": {
            current_time = 4;
        };
        case "kilo": {
            ace_player setPosASL (getPosASL kilo_tp);
            ace_player setDir (getDir kilo_tp);
            current_time = 21;
            current_rain = 0;
            current_overcast = 0.3;
        };
        case "lima": {
            current_time = 5;
            current_rain = 0;
            current_overcast = 0.1;
            private _loadout = [ace_player] call CBA_fnc_getLoadout;
            ace_player setVariable ["mission_loadout", _loadout, true];
            [ace_player, [[[],[],[],["Atlas_U_I_Afghanka_01_ardi_full_F",[]],[],[],"","",[],["","","","ItemCompass","ItemWatch",""]],[]]] call CBA_fnc_setLoadout;
            ace_player call ace_medical_fnc_fullHeal;
            private _spawns = [lima_tp_1, lima_tp_2, lima_tp_3, lima_tp_4, lima_tp_5, lima_tp_6, lima_tp_7, lima_tp_8, lima_tp_9, lima_tp_10, lima_tp_11, lima_tp_12];
            private _spawnIndex = _spawns findIf { _x getVariable ["available", true] };
            private _spawn = if (_spawnIndex == -1) then {
                selectRandom _spawns;
            } else {
                _spawns select _spawnIndex;
            };
            _spawn setVariable ["available", false, true];
            ace_player setPosASL (getPosASL _spawn);
            ace_player setDir (getDir _spawn);
            if (profileName != "Brett Harrison") then {
                disableUserInput true;
                cutText ["", "BLACK"];
            };
        };
        case "mike": {
            ace_player setPosASL (getPosASL mike_tp);
            ace_player setDir (getDir mike_tp);
            current_time = 21;
            current_rain = 0;
            current_overcast = 0.3;
            [{
                ["mission_say", [russel_7, "russel_consumed", "mike"]] call CBA_fnc_localEvent;
            }, [], 2] call CBA_fnc_waitAndExecute;
        };
        case "november": {
            current_time = 7;
            current_rain = 0;
            current_overcast = 0.3;
            ace_player setVariable ["acre_sys_core_isDisabled", true, true];
            private _spawns = [oscar_tp_1, oscar_tp_2, oscar_tp_3, oscar_tp_4, oscar_tp_5, oscar_tp_6, oscar_tp_7, oscar_tp_8, oscar_tp_9, oscar_tp_10, oscar_tp_11, oscar_tp_12];
            private _spawnIndex = _spawns findIf { _x getVariable ["available", true] };
            private _spawn = if (_spawnIndex == -1) then {
                selectRandom _spawns;
            } else {
                _spawns select _spawnIndex;
            };
            _spawn setVariable ["available", false, true];
            ace_player setPosASL (getPosASL _spawn);
            ace_player setDir (getDir _spawn);
            if (profileName != "Brett Harrison") then {
                disableUserInput true;
            };
            private _loadout = [ace_player] call CBA_fnc_getLoadout;
            ace_player setVariable ["mission_loadout", _loadout, true];
            [ace_player, [[[],[],[],["U_B_ParadeUniform_01_US_F",[]],[],[],"H_ParadeDressCap_01_US_F","",[],["","","","","",""]],[]]] call CBA_fnc_setLoadout;
            ace_player call ace_medical_fnc_fullHeal;
        };
        case "oscar": {
            ace_player setVariable ["acre_sys_core_isDisabled", true, true];
            current_time = 19;
            current_rain = 0.5;
            current_overcast = 0.8;
        };
        case "papa": {
            if (ace_player distance2d papa_tp > 500) then {
                ace_player setPosASL (getPosASL papa_tp);
                ace_player setDir (getDir papa_tp);
            };
            current_time = 21;
            current_rain = 0;
            current_overcast = 0.3;
        };
        case "quebec": {
            current_time = 12;
            current_rain = 0.2;
            current_overcast = 0.7;
        };
        case "romeo": {
            current_time = 15;
            current_overcast = 0;
            current_rain = 0;
            ace_player setVariable ["mission_solo", true, true];
            ace_player setVariable ["acre_sys_core_isDisabled", true, true];
            ace_player setPosASL (getPosASL romeo_tp);
            ace_player setDir (getDir romeo_tp);
            ace_player forceWalk true;
        };
        case "sierra": {
            current_time = 4;
        };
        case "tango": {
            ace_player setPosASL (getPosASL tango_tp);
            ace_player setDir (getDir tango_tp);
            current_time = 21;
            current_rain = 0;
            current_overcast = 0.3;
        };
        default {};
    };
};

mission_fnc_leave = {
    params ["_layer"];
    switch (_layer) do {
        case "overworld": {
            ace_player setCaptive false;
        };
        case "delta": {
            ace_player setVariable ["acre_sys_core_isDisabled", false, true];
        };
        case "juliet": {
            ace_player setVariable ["acre_sys_core_isDisabled", false, true];
            ace_player setVariable ["mission_solo", false, true];
            ace_player forceWalk false;
            ace_player hideObjectGlobal false;
        };
        case "lima": {
            [ace_player, ace_player getVariable ["mission_loadout", []]] call CBA_fnc_setLoadout;
        };
        case "november": {
            ace_player setVariable ["acre_sys_core_isDisabled", false, true];
            disableUserInput false;
        };
        case "oscar": {
            ace_player setVariable ["acre_sys_core_isDisabled", false, true];
            [ace_player, ace_player getVariable ["mission_loadout", []]] call CBA_fnc_setLoadout;
        };
        case "sierra": {
            ace_player setVariable ["mission_solo", false, true];
            ace_player forceWalk false;
            ace_player setVariable ["acre_sys_core_isDisabled", false, true];
        };
        default {

        };
    };
};

["mission_say", {
    params ["_object", "_sound", "_layer"];
    if (_layer == mission_current_layer) then {
        _object say _sound;
    };
}] call CBA_fnc_addEventHandler;
mission_said = [];
["mission_say_once", {
    params ["_object", "_sound", "_layer"];
    if !(_sound in mission_said) then {
        mission_said pushBack _sound;
        ["mission_say", [_object, _sound, _layer]] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addEventHandler;

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
    0 setRain current_rain;
    0 setOvercast current_overcast;
    forceWeatherChange;
}, 0] call CBA_fnc_addPerFrameHandler;

["0-8-4", "[Lima] Wake Up", {
    ["mission_lima_wake_up"] call CBA_fnc_globalEvent;
}] call zen_custom_modules_fnc_register;

["0-8-4", "[Lima] Drive", {
    missionNamespace setVariable ["mission_lima_drive", true, true];
}] call zen_custom_modules_fnc_register;

["mission_lima_wake_up", {
    cutText ["", "BLACK IN"];
    disableUserInput false;
    [{
        ["mission_say", [lima_commander, "commander_wake_up", "lima"]] call CBA_fnc_localEvent;
    }, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["0-8-4", "[November] Post", {
    ["mission_november_post"] call CBA_fnc_globalEvent;
    [{
        ["mission_say", [november_commander, "funeral", "november"]] call CBA_fnc_localEvent;
        [{
            ["mission_go", ["oscar"]] call CBA_fnc_globalEvent;
        }, [], 30] call CBA_fnc_waitAndExecute;
    }, [], 91] call CBA_fnc_waitAndExecute;
}] call zen_custom_modules_fnc_register;

["mission_november_post", {
    ["mission_say", [november_speaker, "post", "november"]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["mission_doctor_blur", {
    [{
        mission_pp1 ppEffectAdjust [4]; 
        mission_pp1 ppEffectCommit 30;
        [{
            ["mission_go", ["sierra"]] call CBA_fnc_localEvent;
        }, [], 30] call CBA_fnc_waitAndExecute;
    }, [], 22] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["0-8-4", "[Tango] Cobb Why", {
    ["mission_cobb_why"] call CBA_fnc_globalEvent;
}] call zen_custom_modules_fnc_register;

["mission_cobb_why", {
    ["mission_say", [ace_player, "cobb_why", "tango"]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["mission_final", {
    ["mission_go", ["alpha"]] call CBA_fnc_globalEvent;
    ace_player setPosASL (getPosASL final_tp);
    ace_player setDir (getDir final_tp);
}] call CBA_fnc_addEventHandler;

["0-8-4", "[Final] Speech", {
    ["mission_final_speech"] call CBA_fnc_globalEvent;
}] call zen_custom_modules_fnc_register;

["mission_final_speech", {
    ["mission_say", [ace_player, "final_1", "alpha"]] call CBA_fnc_localEvent;
    [{
        private _line = switch (profileName) do {
            case "Brett Harrison": { "final_2_brett" };
            case "Chaplain Yi": { "final_2_chaplain" };
            case "Jacob Best": { "final_2_jacob" };
            case "Matías Jackson": { "final_2_matias" };
            case "Michael Reyes": { "final_2_michael" };
            case "Michael Shevchenko": { "final_2_michael" };
            case "Oscar GhostBear": { "final_2_oscar" };
            case "Philippe Connect": { "final_2_philippe" };
            case "Roberto Moreno": { "final_2_roberto" };
            case "Tobias Jennings": { "final_2_tobias" };
            case "Thomas Watson": { "final_2_thomas" };
            case "Valkyrie Valentine": { "final_2_valkyrie" };
            default { "final_2" };
        };
        ["mission_say", [ace_player, _line, "alpha"]] call CBA_fnc_localEvent;
        [{
            ["mission_say", [ace_player, "final_3", "alpha"]] call CBA_fnc_localEvent;
        }, [], 3] call CBA_fnc_waitAndExecute;
    }, [], 90] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["0-8-4", "[Final] Collapse Portals", {
    deleteVehicle alpha_portal;
    deleteVehicle overworld_portal;
    missionNamespace setVariable ["mission_collapsed", true, true];
}] call zen_custom_modules_fnc_register;

["0-8-4", "[Briefing]", {
    ["mission_say", [briefer, "briefing", "overworld"]] call CBA_fnc_globalEvent;
}] call zen_custom_modules_fnc_register;
