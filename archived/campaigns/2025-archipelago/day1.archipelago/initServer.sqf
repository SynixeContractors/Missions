["outro_trigger", {
    if (isNil "mission_plane") exitWith {};
    ["outro_start", [], mission_plane] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
