{
    // marker starts with rolearea_
    if (_x select [0, 9] != "rolearea_") then {
        continue;
    };
    systemChat format ["%1", _x select [0, 9]];
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
        format ["systemChat 'activate'; this setVariable ['crate_client_discord_roles', %1, true]; call crate_client_discord_fnc_setTraits;", _roles],
        "systemChat 'deactivate'; this setVariable ['crate_client_discord_roles', [], true]; call crate_client_discord_fnc_setTraits;"
    ];
} forEach allMapMarkers;
