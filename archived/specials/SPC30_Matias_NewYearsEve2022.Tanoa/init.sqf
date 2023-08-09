//Firework actions
private _detonatePlat1 = ["Detonate Platform 1 Fireworks", "Detonate Platform 1 Fireworks", "", {fireworksTriggerPlat1 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat1] call ace_interact_menu_fnc_addActionToObject;

private _detonatePlat2 = ["Detonate Platform 2 Fireworks", "Detonate Platform 2 Fireworks", "", {fireworksTriggerPlat2 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat2] call ace_interact_menu_fnc_addActionToObject;

private _detonatePlat3 = ["Detonate Platform 3 Fireworks", "Detonate Platform 3 Fireworks", "", {fireworksTriggerPlat3 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat3] call ace_interact_menu_fnc_addActionToObject;

private _detonatePlat4 = ["Detonate Platform 4 Fireworks", "Detonate Platform 4 Fireworks", "", {fireworksTriggerPlat4 setDamage 1}, {true}] call ace_interact_menu_fnc_createAction;
[fireworksDetonator, 0, ["ACE_MainActions"], _detonatePlat4] call ace_interact_menu_fnc_addActionToObject;


//Music actions 

private _playTunes = ["Start Playing Music", "Start Playing Music", "", {playMusic "Track01";},{true}] call ace_interact_menu_fnc_createAction;


[musicControl, 0, ["ACE_MainActions"], _playTunes] call ace_interact_menu_fnc_addActionToObject;
