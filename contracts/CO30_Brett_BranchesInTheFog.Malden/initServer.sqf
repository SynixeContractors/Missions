private _defense = [[independent, blufor]] call ace_missile_defense_fnc_createSystem;

[_defense, tracker_mobile_1] call ace_missile_defense_fnc_registerTracker;
[_defense, tracker_mobile_2] call ace_missile_defense_fnc_registerTracker;
[_defense, tracker_dome] call ace_missile_defense_fnc_registerTracker;

[_defense, launcher_1] call ace_missile_defense_fnc_registerLauncher;
[_defense, launcher_2] call ace_missile_defense_fnc_registerLauncher;
[_defense, launcher_3] call ace_missile_defense_fnc_registerLauncher;
[_defense, launcher_4] call ace_missile_defense_fnc_registerLauncher;
