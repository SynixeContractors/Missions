#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

mission_fnc_disableLaptop = {
    params ["_laptop"];
    _laptop setVariable ["mission_locked", true, true];
    private _handle = _laptop getVariable ["synixe_missions_computerUploadHandle", -1];
    if (_handle != -1) then {
        ["mission_cancel_upload", _handle] call CBA_fnc_serverEvent;
    };
    _laptop setObjectTextureGlobal [0, ""];
};

private _dummy_actions = ["诊断","更新","内存","截图","发呆"];
private _disable_actions = ["锁定", "断网", "擦盘"];
{
    private _laptop = _x;
    {
        [
            _laptop,
            _x,
            {
                [_target] call mission_fnc_disableLaptop;
            },
            true,
            { !(_target getVariable ["mission_locked", false]) }
        ] call synixe_missions_fnc_action;
    } forEach _disable_actions;
    [
        _laptop,
        "控制",
        {
            // Control a random gun
            private _guns = [launcher_1, launcher_2, launcher_3, launcher_4] select {alive _x};
            if (count _guns == 0) exitWith {};
            private _target = selectRandom _guns;
            gunner _target switchCamera "Internal";
            player remoteControl gunner _target;
        },
        true,
        { !(_target getVariable ["mission_locked", false]) }
    ] call synixe_missions_fnc_action;
    [
        _laptop,
        "求援",
        {
            missionNamespace setVariable ["mission_request_reinforcements", true, true];
        },
        true,
        { !(_target getVariable ["mission_locked", false]) }
    ] call synixe_missions_fnc_action;
    {
        [
            _laptop,
            _x,
            { comment ""; },
            true,
            { !(_target getVariable ["mission_locked", false]) }
        ] call synixe_missions_fnc_action;
    } forEach _dummy_actions;
} forEach [control_laptop_1, control_laptop_2, control_laptop_3];

voices = [
    "prep_9",
    "prep_8",
    "prep_7",
    "prep_6",
    "prep_5",
    "prep_4",
    "prep_3",
    "prep_2",
    "prep_1",
    "naked_2",
    "naked_1",
    "close_3",
    "close_2",
    "close_1",
    "matias_1",
    "chaplain_2",
    "chaplain_1",
    "bolland_1",
    "delay_1",
    "return_1"
];

voices_available = +voices;
voices_used = [];

[
    "Branches In The Fog",
    "playSound3D",
    {
        [
        "playSound3D",
        [
            ["COMBO", "Sound", [voices_available, voices_available, 0]]
        ],
        {
            params ["_values", "_args"];
            private _sound = _values select 0;
            playSound3D [getMissionPath format ["vl\%1.ogg", _sound], officer, false, eyePos officer, 8, 1, 80];
            voices_available = voices_available - [_sound];
            voices_used = voices_used + [_sound];
            ["mission_toggleLip", [officer, true] ] call CBA_fnc_globalEvent;
            private _delay = 5;
            if (_sound in ["pep_1", "pep_2"]) then {
                _delay = 20;
            };

            [{
                ["mission_toggleLip", [officer, false] ] call CBA_fnc_globalEvent;
            }, [], _delay] call CBA_fnc_waitAndExecute
        },
        {},
        _this
        ] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;
[
    "Branches In The Fog",
    "playSound3D - Repeat",
    {
        [
        "playSound3D - Repeat",
        [
            ["COMBO", "Sound", [voices_used, voices_used, 0]]
        ],
        {
            params ["_values", "_args"];
            private _sound = _values select 0;
            playSound3D [getMissionPath format ["vl\%1.ogg", _sound], officer, false, eyePos officer, 8, 1, 80];
            ["mission_toggleLip", [officer, true] ] call CBA_fnc_globalEvent;
            private _delay = 5;
            if (_sound in ["pep_1", "pep_2"]) then {
                _delay = 20;
            };

            [{
                ["mission_toggleLip", [officer, false] ] call CBA_fnc_globalEvent;
            }, [], _delay] call CBA_fnc_waitAndExecute
        },
        {},
        _this
        ] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;
[
    "Branches In The Fog",
    "Teams Call",
    {
        playSound3D [getMissionPath "teams.ogg", officer, false, eyePos officer, 5, 1, 80];
        0 spawn {
            sleep 7;
            ["mission_toggleLip", [officer, true] ] call CBA_fnc_globalEvent; 
            sleep 86;
            ["mission_toggleLip", [officer, false] ] call CBA_fnc_globalEvent;
        };
    }
] call zen_custom_modules_fnc_register;
[
    "Branches In The Fog",
    "Briefing",
    {
        playSound3D [getMissionPath "briefing.ogg", officer, false, eyePos officer, 5, 1, 80];
        ["mission_briefing"] call CBA_fnc_serverEvent;
    }
] call zen_custom_modules_fnc_register;

["mission_toggleLip", {
    params ["_unit", "_state"];
    _unit setRandomLip _state;
}] call CBA_fnc_addEventHandler;

["mission_switchScreen", {
    _this call synixe_spectator_fnc_switchScreen;
}] call CBA_fnc_addEventHandler;
