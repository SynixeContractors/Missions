#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

loadBox1 = [
    "Load Box", 
    "Load Box", 
    "", 
    {
        if ((truck distance this) < 5)
        then
        {
        [25, [], {truck setVehicleCargo box1; Hint "Finished Loading The Boxes!"}, {Hint "Failed To Load The Boxes!"}, "Loading Boxes"] call ace_common_fnc_progressBar;
        }
        else
        {Hint "Truck Is Too Far Away"};
    
    }, 
    {true;}
    ] call ace_interact_menu_fnc_createAction;

loadBox2 = [
    "Load Box", 
    "Load Box", 
    "", 
    {
        if ((truck distance this) < 5)
        then
        {
        [25, [], {truck setVehicleCargo box2; Hint "Finished Loading The Boxes!"}, {Hint "Failed To Load The Boxes!"}, "Loading Boxes"] call ace_common_fnc_progressBar;
        }
        else
        {Hint "Truck Is Too Far Away"};
    
    }, 
    {true;}
    ] call ace_interact_menu_fnc_createAction;

loadBox3 = [
    "Load Box", 
    "Load Box", 
    "", 
    {
        if ((truck distance this) < 5)
        then
        {
        [25, [], {truck setVehicleCargo box3; Hint "Finished Loading The Boxes!"}, {Hint "Failed To Load The Boxes!"}, "Loading Boxes"] call ace_common_fnc_progressBar;
        }
        else
        {Hint "Truck Is Too Far Away"};
    
    }, 
    {true;}
    ] call ace_interact_menu_fnc_createAction;

loadBox4 = [
    "Load Box",
    "Load Box",
    "",
    {
        if ((truck distance this) < 5)
        then
        {
        [5, [], {truck setVehicleCargo box4; Hint "Finished Loading The Box!"}, {Hint "Failed To Load The Box!"}, "Loading Box"] call ace_common_fnc_progressBar;
        }
        else
        {Hint "Truck Is Too Far Away"};
    },
    {true;}
] call ace_interact_menu_fnc_createAction;

[box1, 0, ["ACE_MainActions"], loadBox1] call ace_interact_menu_fnc_addActionToObject;
[box2, 0, ["ACE_MainActions"], loadBox2] call ace_interact_menu_fnc_addActionToObject;
[box3, 0, ["ACE_MainActions"], loadBox3] call ace_interact_menu_fnc_addActionToObject;
[box4, 0, ["ACE_MainActions"], loadBox4] call ace_interact_menu_fnc_addActionToObject;
