#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

_talkSurvivor = ["Talk to survivor", "Talk to survivor", "", {survivor globalChat "Oh great, they hired you clowns to fix this. They came out of nowhere, they spoke russian. Only thing I understood was Syndikat anb Buawa. Go I'll be fine, already called in a medevac"}, {true}] call ace_interact_menu_fnc_createAction;
[survivor, 0, ["ACE_MainActions"], _talkSurvivor] call ace_interact_menu_fnc_addActionToObject;

_talkCivilian = ["Talk to civlian", "Talk to civilian", "", {ambush_civ globalChat "So much carnage, it was over in minutes. They had very advanced weapons, nothing like what Syndikat has"}, {true}] call ace_interact_menu_fnc_createAction;
[ambush_civ, 0, ["ACE_MainActions"], _talkCivilian] call ace_interact_menu_fnc_addActionToObject;

_talkCivilian2 = ["Talk to civlian", "Talk to civilian", "", {ambush_civ2 globalChat "They came from the jungle, earlier a gendarmerie van had passed by. They took the trucks with the yellow things in the back and followed the road south. What are those yellow things?"}, {true}] call ace_interact_menu_fnc_createAction;
[ambush_civ2, 0, ["ACE_MainActions"], _talkCivilian2] call ace_interact_menu_fnc_addActionToObject;
