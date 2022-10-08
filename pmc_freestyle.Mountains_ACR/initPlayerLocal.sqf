// Register freestyle modules
["Freestyle", "Base Location", {
	params ["_location", ""];
	if ((missionNamespace getVariable ["SFS_SPAWN_POS", []]) isEqualTo []) exitWith {};
	missionNamespace setVariable ["SFS_SPAWN_POS", ASLtoAGL _location, true];

	// Create Respawn Marker
	createMarkerLocal ["respawn", _location];
	"respawn" setMarkerType "Empty";

	// Create Spectator Screen
	"synixe_spectator_screen" createVehicle _location;

	// Create Shop
	private _shop = "CargoNet_01_box_F" createVehicle _location;
	persistent_gear_shop_arsenal_shops pushBackUnique _shop;
	call persistent_gear_shop_arsenal_fnc_create_actions;
}] call zen_custom_modules_fnc_register;

if (side player == sideLogic) exitWith {};

// Start as spectator, wait for spawn location
[{time > 0 && !(isNull player)}, {
	player setPosASL [0,0,5];
	player enableSimulation false;
	[true] call ace_spectator_fnc_setSpectator;

	SFS_SPAWN_PFH = [{
		if !((missionNamespace getVariable ["SFS_SPAWN_POS", []]) isEqualTo []) then {
			[player, SFS_SPAWN_POS, true] call BIS_fnc_moveToRespawnPosition;
			player enableSimulation true;
			[false] call ace_spectator_fnc_setSpectator;
			[SFS_SPAWN_PFH] call CBA_fnc_removePerFrameHandler;
			SFS_SPAWN_PFH = nil;
		};
	}, 1] call CBA_fnc_addPerFrameHandler;

	// Return to spectator if the player was in spectator when they disconnected
	if (SFS_SPECTATORS getVariable [getPlayerUID player, false]) then {
		[player, true] call ace_medical_fnc_setDead;
	};
}] call CBA_fnc_waitUntilAndExecute;
