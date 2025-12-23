// Register freestyle modules
["Freestyle", "Base Location", {
    params ["_location", ""];
    if ((missionNamespace getVariable ["SFS_SPAWN_POS", []]) isNotEqualTo []) exitWith {};
    missionNamespace setVariable ["SFS_SPAWN_POS", ASLtoAGL _location, true];

    // Create Respawn Marker
    createMarker ["respawn", [0,0,0]];
    "respawn" setMarkerPos _location;
    "respawn" setMarkerType "Empty";
}] call zen_custom_modules_fnc_register;

["Freestyle", "Create Shop", {
    params ["_location", ""];
    private _shop = "CargoNet_01_box_F" createVehicle _location;
    missionNamespace setVariable ["crate_client_gear_shop_boxes", [_shop], true];
    crate_client_gear_fnc_shop_init remoteExec ["call"];
}] call zen_custom_modules_fnc_register;

["Freestyle", "Add Shop", {
    params ["", "_shop"];
    if (isPlayer _shop) exitWith {};
    missionNamespace setVariable ["crate_client_gear_shop_boxes", [_shop], true];
    crate_client_gear_fnc_shop_init remoteExec ["call"];
}] call zen_custom_modules_fnc_register;

["Freestyle", "Spawn Point (Land)", {
    params ["_location", ""];
    deleteMarker "spawn_land";
    createMarkerLocal ["spawn_land", _location];
    "spawn_land" setMarkerType "Empty";
}] call zen_custom_modules_fnc_register;

["Freestyle", "Spawn Point (Thing)", {
    params ["_location", ""];
    deleteMarker "spawn_thing";
    createMarkerLocal ["spawn_thing", _location];
    "spawn_thing" setMarkerType "Empty";
}] call zen_custom_modules_fnc_register;

["Freestyle", "Spawn Point (Air)", {
    params ["_location", ""];
    deleteMarker "spawn_air";
    createMarkerLocal ["spawn_air", _location];
    "spawn_air" setMarkerType "Empty";
}] call zen_custom_modules_fnc_register;

["Freestyle", "Spawn Point (Sea)", {
    params ["_location", ""];
    deleteMarker "spawn_sea";
    createMarkerLocal ["spawn_sea", _location];
    "spawn_sea" setMarkerType "Empty";
}] call zen_custom_modules_fnc_register;

if (side player == sideLogic) exitWith {};

// Start as spectator, wait for spawn location
[{time > 0 && !(isNull player)}, {
    player setPosASL [0,0,5];
    player enableSimulation false;

    SFS_SPAWN_PFH = [{
        if ((missionNamespace getVariable ["SFS_SPAWN_POS", []]) isNotEqualTo []) then {
            player enableSimulation true;
            if (player isNotEqualTo zeus) then {
                [false] call ace_spectator_fnc_setSpectator;
            };
            [SFS_SPAWN_PFH] call CBA_fnc_removePerFrameHandler;
            SFS_SPAWN_PFH = nil;
            [{
                player setVelocity [0,0,0];
                [player, SFS_SPAWN_POS, true] call BIS_fnc_moveToRespawnPosition;
            }, [], 0.5] call CBA_fnc_waitAndExecute;
        };
    }, 1] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
