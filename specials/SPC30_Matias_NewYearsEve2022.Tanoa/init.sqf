#include "do_not_edit\script_component.hpp"
#include "do_not_edit\init.sqf"

//Firework actions
_detonatePlat1 = ["Detonate Platform 1 Fireworks", "Detonate Platform 1 Fireworks", "", {fireworksTriggerPlat1 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat1] call ace_interact_menu_fnc_addActionToObject;

_detonatePlat2 = ["Detonate Platform 2 Fireworks", "Detonate Platform 2 Fireworks", "", {fireworksTriggerPlat2 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat2] call ace_interact_menu_fnc_addActionToObject;

_detonatePlat3 = ["Detonate Platform 3 Fireworks", "Detonate Platform 3 Fireworks", "", {fireworksTriggerPlat3 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat3] call ace_interact_menu_fnc_addActionToObject;

_detonatePlat4 = ["Detonate Platform 4 Fireworks", "Detonate Platform 4 Fireworks", "", {fireworksTriggerPlat4 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat4] call ace_interact_menu_fnc_addActionToObject;


//Music actions 
_trackList = ["Track01","Track02","Track03","Track04","Track05"];

_playTunes = ["Start Playing Music", "Start Playing Music", "",     
   {playMusic "Track01";},{true}] call ace_interact_menu_fnc_createAction;


[musicControl, 0, ["ACE_MainActions"], _playTunes] call ace_interact_menu_fnc_addActionToObject;
