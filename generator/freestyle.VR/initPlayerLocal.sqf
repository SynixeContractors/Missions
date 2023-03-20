// Register freestyle modules
["Freestyle", "Spawn Location", {
    params ["_location", ""];
    missionNamespace setVariable ["SFS_SPAWN_POS", ASLtoAGL _location, true];
}] call zen_custom_modules_fnc_register;

["Freestyle", "Kill", {
    params ["", "_target"];
    _target setDamage 1;
}] call zen_custom_modules_fnc_register;

["Freestyle", "Respawn Player", {
    params ["_location", ""];
    private _deadPlayers = [];
    private _deadNames = [];
    {
        if (SFS_SPECTATORS getVariable [getPlayerUID _x, false]) then {
            _deadPlayers pushBack _x;
            _deadNames pushBack (name _x);
        };
    } forEach allPlayers;
    if (count _deadPlayers == 0) exitWith {
        ["ERROR: No Dead Players"] call zen_common_fnc_showMessage
    };
    ["Respawn Player", [
        ["COMBO", "Player", [_deadPlayers, _deadNames]],
        ["CHECKBOX", "Keep Loadout", [false]]
    ], {
        params ["_values", "_args"];
        _values params ["_player", "_loadout"];
        _args params ["_location"];
        ["SFS_RESPAWN", [_location, _loadout], _player] call CBA_fnc_targetEvent;
    }, {}, [_location]] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["Freestyle", "Respawn All", {
    params ["_location", ""];
    ["Respawn All", [
        ["CHECKBOX", "Keep Loadout", [false]]
    ], {
        params ["_values", "_args"];
        _values params ["_loadout"];
        _args params ["_location"];
        ["SFS_RESPAWN", [_location, _loadout]] call CBA_fnc_globalEvent;
    }, {}, [_location]] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

if (side player == sideLogic) exitWith {};

// Start as spectator, wait for spawn location
[{time > 0 && !(isNull player)}, {
    player setPosASL [0,0,5];
    player enableSimulation false;
    
    if (player isNotEqualTo zeus) then {
        [true] call ace_spectator_fnc_setSpectator;
    };

    SFS_SPAWN_PFH = [{
        if !((missionNamespace getVariable ["SFS_SPAWN_POS", []]) isEqualTo []) then {
            [player, SFS_SPAWN_POS, true] call BIS_fnc_moveToRespawnPosition;
            player enableSimulation true;
            if (player isNotEqualTo zeus) then {
                [false] call ace_spectator_fnc_setSpectator;
            };
            [SFS_SPAWN_PFH] call CBA_fnc_removePerFrameHandler;
            SFS_SPAWN_PFH = nil;
        };
    }, 1] call CBA_fnc_addPerFrameHandler;

    // Return to spectator if the player was in spectator when they disconnected
    if (SFS_SPECTATORS getVariable [getPlayerUID player, false]) then {
        [player, true] call ace_medical_fnc_setDead;
    };
}] call CBA_fnc_waitUntilAndExecute;

["SFS_RESPAWN", {
    params ["_location", "_loadout"];
    player setPos _location;
    player enableSimulation true;
    [false] call ace_spectator_fnc_setSpectator;
    SFS_SPECTATORS setVariable [getPlayerUID player, false, true];
    deleteVehicle (player getVariable ["SFS_CORPSE", objNull]);
    if (_loadout) then {
        player setUnitLoadout [(SFS_LOADOUTS getVariable [getPlayerUID player, getUnitLoadout player]), false];
    };
}] call CBA_fnc_addEventHandler;

player addEventHandler ["Respawn", {
    params ["", "_corpse"];
    private _pos = getPosASL _corpse;
    [true] call ace_spectator_fnc_setSpectator;
    player setVariable ["SFS_CORPSE", _corpse, true];
    SFS_SPECTATORS setVariable [getPlayerUID player, true, true];
    player enableSimulation false;
    _pos spawn {
        sleep 0.2;
        ace_spectator_camera setPosASL _this;
    };
}];

player addMPEventHandler ["MPKilled", {
    SFS_LOADOUTS setVariable [getPlayerUID player, getUnitLoadout player, true];
}];

[{time > 2}, {
    if (player isEqualTo zeus) then {
        openCuratorInterface;
    };
}] call CBA_fnc_waitUntilAndExecute;
