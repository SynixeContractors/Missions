#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html", then add "Example" here
] call mission_fnc_briefing;

mission_fnc_initTarget = {
    player setCaptive true;
    private _target = "CBA_B_InvisibleTarget" createVehicle getPosASL player;
    createVehicleCrew _target;
    private _pos = getPosASL player;
    _target attachTo [player, [0,0,10]];
    player setVariable ["mission_target", _target, true];
    _target setCaptive true;
};

player addEventHandler ["Killed", {
    private _target = player getVariable ["mission_target", objNull];
    if (isNull _target) exitWith {};
    deleteVehicle _target;
    player setVariable ["mission_target", objNull, true];
}];

player addEventHandler ["Respawn", {
    call mission_fnc_initTarget;
}];

mission_zones = [
    ["zone_1", 1],
    ["zone_2", 2]
];

mission_fnc_determineLevel = {
    params ["_unit"];
    private _maxLevel = 0;
    mission_zones apply {
        if (_unit inArea (_x select 0)) then {
            _maxLevel = (_x select 1) max _maxLevel;
        };
    };
    _maxLevel
};

mission_fnc_changeLevel = {
    params ["_unit", "_level"];
    private _current = _unit getVariable ["mission_level", 0];
    if (_current == _level) exitWith {};
    _unit setVariable ["mission_level", _level, true];
    private _target = _unit getVariable ["mission_target", objNull];
    if (isNull _target) exitWith {};
    switch (_level) do {
        case 0: {
            _unit setCaptive true;
            _target setCaptive true;
        };
        case 1: {
            _unit setCaptive true;
            _target setCaptive false;
            (nearestObjects [player, ["Man"], 300]) apply {
                [_x, [_target, 1]] remoteExec ["reveal", _x];
            };
        };
        case 2: {
            _unit setCaptive false;
            _target setCaptive true;
            (nearestObjects [player, ["Man"], 300]) apply {
                [_x, [_unit, 1]] remoteExec ["reveal", _x];
            };
        };
    };
};

[{
    // private _level = player getVariable ["mission_level", 0];
    private _level = player call mission_fnc_determineLevel;
    private _target = player getVariable ["mission_target", objNull];
    private _warningShotCounter = player getVariable ["mission_warningShotCounter", 0];
    private _warningCooldown = (missionNamespace getVariable ["mission_warningCooldown", 4]);
    if (_level == 1) then {
        if (_warningShotCounter < (_warningCooldown * 0.7)) then {
                [player, 0] call mission_fnc_changeLevel;
            } else { // fire a warning shot
                [player, 1] call mission_fnc_changeLevel;
            };
            _warningShotCounter = _warningShotCounter + 1;
            if (_warningShotCounter > _warningCooldown) then {
                _warningShotCounter = 0;
            };
            player setVariable ["mission_warningShotCounter", _warningShotCounter];
    } else {
        [player, _level] call mission_fnc_changeLevel;
    };
}, 1] call CBA_fnc_addPerFrameHandler;

call mission_fnc_initTarget;
