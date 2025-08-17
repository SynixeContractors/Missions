{
    // marker starts with rolearea_
    if (_x select [0, 9] != "rolearea_") then {
        continue;
    };
    private _roles = switch (markerText _x) do {
        case "medic": {
            ["780136967677411389"]
        };
        case "engineer": {
            ["1038406302935810078", "1038406347114426410", "1038406394925301792"]
        };
        default {
            []
        };
    };
    private _trigger = createTrigger ["EmptyDetector", getMarkerPos _x, false];
    (markerSize _x) params ["_mx", "_my"];
    _trigger setTriggerArea [_mx, _my, markerDir _x, true];
    _trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
    _trigger setTriggerStatements [
        "player in thisList",
        format ["[""synixe_rolearea_enter"", [%1]] call CBA_fnc_localEvent", _roles],
        "[""synixe_rolearea_exit""] call CBA_fnc_localEvent"
    ];
} forEach allMapMarkers;

["synixe_rolearea_enter", {
    params ["_roles"];
    if (isNil "_roles") exitWith {
        diag_log "Rolearea Enter: No roles specified.";
    };
    rolearea_original_roles = player getVariable ["crate_client_discord_roles", []];
    player setVariable ["crate_client_discord_roles", _roles + rolearea_original_roles, true];
    call crate_client_discord_fnc_setTraits;
}] call CBA_fnc_addEventHandler;

["synixe_rolearea_exit", {
    player setVariable ["crate_client_discord_roles", rolearea_original_roles, true];
    call crate_client_discord_fnc_setTraits;
}] call CBA_fnc_addEventHandler;
