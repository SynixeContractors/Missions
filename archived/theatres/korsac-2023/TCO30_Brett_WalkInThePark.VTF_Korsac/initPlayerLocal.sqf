#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

["mission_speak", {
    params ["_unit", "_sound"];
    _unit setVariable ["mission_speaking", true];
    private _duration = getNumber (missionConfigFile >> "CfgSounds" >> _sound >> "duration");
    [_unit, _duration] spawn {
        params ["_unit", "_duration"];
        sleep _duration;
        _unit setRandomLip false;
        _unit setVariable ["mission_speaking", false];
    };
    _unit setRandomLip true;
    _unit say3D _sound;
}] call CBA_fnc_addEventHandler;

mission_fnc_speak = {
    params ["_unit", "_sound"];
    private _action = [
        format ["Speak%1", _sound],
        "Speak",
        "",
        {
            _this#2 params ["_unit", "_sound"];
            ["mission_speak", [_unit, _sound]] call CBA_fnc_globalEvent;
        },
        {
            !(_target getVariable ["mission_speaking", false])
        },
        {},
        [_unit, _sound]
    ] call ace_interact_menu_fnc_createAction;
    [_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

["mission_ramble", {
    params ["_unit"];
    _unit setVariable ["mission_speaking", true];
    mission_fnc_loop = {
        params ["_unit"];
        _unit say3D "RambleLoop";
        sleep getNumber (missionConfigFile >> "CfgSounds" >> "RambleLoop" >> "duration");
        [_unit] spawn mission_fnc_loop;
    };
    [_unit] spawn {
        params ["_unit"];
        sleep getNumber (missionConfigFile >> "CfgSounds" >> "RambleIntro" >> "duration");
        [_unit] spawn mission_fnc_loop;
    };
    _unit setRandomLip true;
    _unit say3D "RambleIntro";
}] call CBA_fnc_addEventHandler;

mission_fnc_ramble = {
    params ["_unit"];
    private _action = [
        "Ramble",
        "Speak",
        "",
        {
            _this#2 params ["_unit"];
            ["mission_ramble", [_unit]] call CBA_fnc_globalEvent;
        },
        {
            !(_target getVariable ["mission_speaking", false])
        },
        {},
        [_unit]
    ] call ace_interact_menu_fnc_createAction;
    [_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

[guy_1, "Speak01"] call mission_fnc_speak;
[guy_2, "Speak02"] call mission_fnc_speak;
[guy_4, "Speak04"] call mission_fnc_speak;
[guy_5, "Speak05"] call mission_fnc_speak;
[guy_6, "Speak06"] call mission_fnc_speak;
[guy_8, "Speak08"] call mission_fnc_speak;

[guy_3] call mission_fnc_ramble;
