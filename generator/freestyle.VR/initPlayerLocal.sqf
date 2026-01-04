// Register freestyle modules
["Freestyle", "Spawn Location", {
    params ["_location", ""];
    missionNamespace setVariable ["synixe_freestyle_spawn_location", ASLtoAGL _location, true];
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
        if (_x getVariable ["ace_spectator_isSet", false]) then {
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
        ["synixe_freestyle_respawn", [_player, _location, _loadout]] call CBA_fnc_serverEvent;
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
        {
            if (_x getVariable ["ace_spectator_isSet", false]) then {
                ["synixe_freestyle_respawn", [_x, _location, _loadout]] call CBA_fnc_serverEvent;
            };
        } forEach allPlayers;
    }, {}, [_location]] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

if (side player == sideLogic) exitWith {};

// Start as spectator, wait for spawn location
[{time > 0 && !(isNull player)}, {
    player setPosASL [0,0,5];
    player enableSimulation false;
    
    if (player isEqualTo zeus) exitWith {};

    synixe_freestyle_spawn_pfh = [{
        if ((missionNamespace getVariable ["synixe_freestyle_spawn_location", []]) isNotEqualTo []) then {
            player enableSimulation true;
            [synixe_freestyle_spawn_pfh] call CBA_fnc_removePerFrameHandler;
            synixe_freestyle_spawn_pfh = nil;
            [{
                player setVelocity [0,0,0];
                [player, synixe_freestyle_spawn_location, true] call BIS_fnc_moveToRespawnPosition;
            }, [], 0.5] call CBA_fnc_waitAndExecute;
        };
    }, 1] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

["synixe_freestyle_respawn", {
    params ["_location", "_loadout"];
    [player, _loadout] call CBA_fnc_setLoadout;
    [false] call ace_spectator_fnc_setSpectator;
    [{
        player setVelocity [0,0,0];
        [player, _this, true] call BIS_fnc_moveToRespawnPosition;
    }, _location, 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

player addEventHandler ["Respawn", {
    [true] call ace_spectator_fnc_setSpectator;
}];

player addMPEventHandler ["MPKilled", {
    ["synixe_freestyle_killed", [player]] call CBA_fnc_serverEvent;
}];

[{time > 2}, {
    if (player isEqualTo zeus) then {
        openCuratorInterface;
    };
}] call CBA_fnc_waitUntilAndExecute;
