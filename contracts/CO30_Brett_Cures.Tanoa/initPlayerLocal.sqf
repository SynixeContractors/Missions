#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

voices = [];

private _voiceDefs = [
    ["casual", 38],
    ["food_info", 5],
    ["food_open", 4],
    ["intel", 7],
    ["thank_info", 4],
    ["thank_open", 6],
    ["water_info", 4],
    ["water_open", 6]
];

{
    private _name = _x select 0;
    private _count = _x select 1;
    private _arr = [];
    for "_i" from 1 to _count do {
        _arr pushBack format ["%1_%2", _name, _i];
    };
    voices pushBack [_name, _arr];
} forEach _voiceDefs;

private _action = ["IntelSpeak", "Speak", "\a3\ui_f\data\igui\cfg\actions\talk_ca.paa", {
    private _voice_line = _target getVariable ["mission_voice_line", ""];
    if (_voice_line isEqualTo "") then {
        if (random 1 < 0.3) then {
            if (random 1 < 0.5) then {
                _voice_line = selectRandom (voices select 7 select 1);
            } else {
                _voice_line = selectRandom (voices select 2 select 1);
            };
        } else {
            if (random 1 < 0.8) then {
                _voice_line = selectRandom (voices select 0 select 1);
            } else {
                if (random 1 < 0.5) then {
                    _voice_line = selectRandom (voices select 1 select 1);
                } else {
                    _voice_line = selectRandom (voices select 6 select 1);
                };
            };
        };
        _target setVariable ["mission_voice_line", _voice_line, true];
    };
    ["synixe_missions_speak", [_target, _voice_line, {}, {}, "noid", true]] call CBA_fnc_globalEvent;
}, {
    side _target == civilian && !(_target getVariable ["synixe_missions_speaking", false])
}] call ace_interact_menu_fnc_createAction;
["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

private _action = ["GiveFood", "Give Ration", "\a3\ui_f\data\igui\cfg\actions\take_ca.paa", {
    [ace_player, "PutDown"] call ace_common_fnc_doGesture;
    private _voice_line = _target getVariable ["mission_voice_line", ""];
    if (_voice_line find "food_info" == 0) then {
        if (random 1 < 0.2) then {
            _voice_line = selectRandom (voices select 4 select 1);
        } else {
            _voice_line = selectRandom (voices select 3 select 1);
        };
    };
    if (_voice_line find "food_open" == 0) then {
        _voice_line = selectRandom (voices select 5 select 1);
    };
    _target setVariable ["mission_voice_line", _voice_line, true];
}, {
    side _target == civilian && alive _target && "ACE_Humanitarian_Ration" in (items ace_player)
}] call ace_interact_menu_fnc_createAction;
["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
private _action = ["GiveWater", "Give Water", "\a3\ui_f\data\igui\cfg\actions\take_ca.paa", {
    [ace_player, "PutDown"] call ace_common_fnc_doGesture;
    private _voice_line = _target getVariable ["mission_voice_line", ""];
    if (_voice_line find "water_info" == 0) then {
        if (random 1 < 0.2) then {
            _voice_line = selectRandom (voices select 4 select 1);
        } else {
            _voice_line = selectRandom (voices select 3 select 1);
        };
    };
    if (_voice_line find "water_open" == 0) then {
        _voice_line = selectRandom (voices select 5 select 1);
    };
    _target setVariable ["mission_voice_line", _voice_line, true];
}, {
    side _target == civilian && alive _target && "ACE_WaterBottle" in (items ace_player)
}] call ace_interact_menu_fnc_createAction;
["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
