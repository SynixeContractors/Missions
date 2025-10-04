//This will allow spies to choose an infil point 

//The direction players will face

//This creates the actions 
_infilPoint1 = ["Select Infil Point 1", "Select Infil Point 1", "", {player setPos (getMarkerPos "inf_1");}, {true}] call ace_interact_menu_fnc_createAction;
_infilPoint2 = ["Select Infil Point 2", "Select Infil Point 2", "", {player setPos (getMarkerPos "inf_2");}, {true}] call ace_interact_menu_fnc_createAction;
_infilPoint3 = ["Select Infil Point 3", "Select Infil Point 3", "", {player setPos (getMarkerPos "inf_3");}, {true}] call ace_interact_menu_fnc_createAction;
_infilPoint4 = ["Select Infil Point 4", "Select Infil Point 4", "", {player setPos (getMarkerPos "inf_4");}, {true}] call ace_interact_menu_fnc_createAction;
_infilPoint5 = ["Select Infil Point 5", "Select Infil Point 5", "", {player setPos (getMarkerPos "inf_5");}, {true}] call ace_interact_menu_fnc_createAction;

//This adds the actions to the laptop
[infil_selector, 0, ["ACE_MainActions"], _infilPoint1] call ace_interact_menu_fnc_addActionToObject;
[infil_selector, 0, ["ACE_MainActions"], _infilPoint2] call ace_interact_menu_fnc_addActionToObject;
[infil_selector, 0, ["ACE_MainActions"], _infilPoint3] call ace_interact_menu_fnc_addActionToObject;
[infil_selector, 0, ["ACE_MainActions"], _infilPoint4] call ace_interact_menu_fnc_addActionToObject;
[infil_selector, 0, ["ACE_MainActions"], _infilPoint5] call ace_interact_menu_fnc_addActionToObject;
