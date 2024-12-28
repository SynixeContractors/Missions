#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

mission_bunnies = 0;

private _bunnyAction = ["BunnyCollect","Bunny","",{
    mission_bunnies = mission_bunnies + 1;
    hint format ["Bunny Collected! %1/5", mission_bunnies];
    _target setVariable ["collected", true];
},{
    !(_target getVariable ["collected", false])
}] call ace_interact_menu_fnc_createAction;
{
    [_x, 0, ["ACE_MainActions"], _bunnyAction] call ace_interact_menu_fnc_addActionToObject;
} forEach [bunny1, bunny2, bunny3, bunny4, bunny5];

mission_penguins = 0;

private _penguinAction = ["PenguinCollect","Penguin","",{
    mission_penguins = mission_penguins + 1;
    hint format ["Penguin Collected! %1/5", mission_penguins];
    _target setVariable ["collected", true];
},{
    !(_target getVariable ["collected", false])
}] call ace_interact_menu_fnc_createAction;
{
    [_x, 0, ["ACE_MainActions"], _penguinAction] call ace_interact_menu_fnc_addActionToObject;
} forEach [penguin1, penguin2, penguin3, penguin4];
