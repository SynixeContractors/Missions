//Different times to set
_setZeroDarkThirty = ["Set Zero Dark Thirty","Set Zero Dark Thirty","",{setDate [2022, 12, 12, 0, 30];},{true}] call ace_interact_menu_fnc_createAction;
_setDawn = ["Set Dawn","Set Dawn","",{setDate [2022, 12, 12, 6, 0];},{true}] call ace_interact_menu_fnc_createAction;
_setNoon = ["Set Noon","Set Noon","",{setDate [2022, 12, 12, 12, 0];},{true}] call ace_interact_menu_fnc_createAction;
_setDusk = ["Set Dusk","Set Dusk","",{setDate [2022, 12, 12, 17, 0];},{true}] call ace_interact_menu_fnc_createAction;

//Option to skip an hour
_skipHour = ["Skip an hour","Skip an hour","",{skipTime 1;},{true}] call ace_interact_menu_fnc_createAction;
_reverseHour = ["Reverse an hour", "Reverse an hour", "", {skipTime -1;},{True}] call ace_interact_menu_fnc_createAction;

//Add skip hour to time_setter
[time_setter, 0, ["ACE_MainActions"], _skipHour] call ace_interact_menu_fnc_addActionToObject;
[time_setter, 0, ["ACE_MainActions"], _reverseHour] call ace_interact_menu_fnc_addActionToObject;

//Add set time to time_setter
[time_setter, 0, ["ACE_MainActions"], _setZeroDarkThirty] call ace_interact_menu_fnc_addActionToObject;
[time_setter, 0, ["ACE_MainActions"], _setDawn] call ace_interact_menu_fnc_addActionToObject;
[time_setter, 0, ["ACE_MainActions"], _setNoon] call ace_interact_menu_fnc_addActionToObject;
[time_setter, 0, ["ACE_MainActions"], _setDusk] call ace_interact_menu_fnc_addActionToObject;