#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
    "Employee Lists"
] call mission_fnc_briefing;

[{
    private _vehicle = vehicle ace_player;
    if (_vehicle == ace_player) exitWith {};
    if (typeOf _vehicle != "TACU_Police_V_B_Offroad_Blue") exitWith {};
    if (driver _vehicle != ace_player) exitWith {};
    if !(local _vehicle || alive _vehicle) exitWith {};
    if (_vehicle animationPhase "BeaconsStart" != 1) exitWith {};
    if (inputAction "CarBack" == 1 || inputAction "CarFastForward" == 0) exitWith {};
    if !(isTouchingGround _vehicle) exitWith {};
    if (speed _vehicle > 125 || !(isEngineOn _vehicle)) exitWith {};
    private _vel = velocity _vehicle;
    private _dir = direction _vehicle;
    private _speed = 1.03;
    _vehicle setVelocity [
        (_vel select 0) + (sin _dir * _speed),
        (_vel select 1) + (cos _dir * _speed),
        (_vel select 2)
    ];
}, 0.1] call CBA_fnc_addPerFrameHandler;
