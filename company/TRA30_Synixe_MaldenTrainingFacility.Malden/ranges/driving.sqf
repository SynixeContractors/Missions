//This is the action for the First Aid Kit for players to heal themselves

_fakHeal = ["Heal Yourself", "Heal Yourself", "", {player setDamage 0;}, {true}] call ace_interact_menu_fnc_createAction;

[drivingFAK, 0, ["ACE_MainActions"], _fakHeal] call ace_interact_menu_fnc_addActionToObject;

//This will register the position of the roadblock Hilux's so that players can reset them 

private _blockHiluxPos1 = getMarkerPos "hiluxBarricade1";
private _blockHiluxPos2 = getMarkerPos "hiluxBarricade2";

_roadblockResetPos = ["Reset barricade", "Reset barricade", "", 
{hiluxBlockVic1 setPos (getMarkerPos "hiluxBarricade1"); 
hiluxBlockVic2 setPos (getMarkerPos "hiluxBarricade2");
hiluxBlockVic1 setDir (getDir vic1DirSetter);
hiluxBlockVic2 setDir (getDir vic2DirSetter);}, 
{true}] call ace_interact_menu_fnc_createAction;

[drivingLap, 0, ["ACE_MainActions"], _roadBlockResetPos] call ace_interact_menu_fnc_addActionToObject;
