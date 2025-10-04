#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

mission_fnc_toggleLights = compile preprocessFileLineNumbers "fnc_toggleLights.sqf";

{
    private _lights = [worldSize/2,worldSize/2] nearObjects [_x, worldSize];

    {
        _x switchLight "OFF";
    } forEach _lights;
} forEach [
    "Lamps_Base_F",
    "PowerLines_base_F",
    "House"
];

["lighttoggle", {
    _this call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;
