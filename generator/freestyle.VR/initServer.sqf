synixe_freestyle_loadouts = createHashMap;

// A player has been killed
["synixe_freestyle_killed", {
    params ["_unit"];
    synixe_freestyle_loadouts set [getPlayerUID _unit, [_unit] call CBA_fnc_getLoadout];
}] call CBA_fnc_addEventHandler;

// Requesting a respawn
["synixe_freestyle_respawn", {
    params ["_player", "_location", "_loadout"];
    private _loadout = if (_loadout) then {
        synixe_freestyle_loadouts get [getPlayerUID _player, [_unit] call CBA_fnc_getLoadout]
    } else {
        []
    };
    ["synixe_freestyle_respawn", [_location, _loadout], _player] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
