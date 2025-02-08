mission_fnc_convoy_go = {
    missionNamespace setVariable ["convoy_move", true, true];
    missionNamespace setVariable ["kill_engines", false, true];
    (driver V1) enableAI "PATH";
    (driver V2) enableAI "PATH";
    (driver V3) enableAI "PATH";
    (driver V4) enableAI "PATH";
    (driver V5) enableAI "PATH";
    (driver V6) enableAI "PATH";
};
["convoy_go", {
    call mission_fnc_convoy_go;
}] call CBA_fnc_addEventHandler;

mission_fnc_convoy_stop = {
    missionNamespace setVariable ["convoy_move", false, true];
    missionNamespace setVariable ["kill_engines", false, true];
    (driver V1) disableAI "PATH";
    (driver V2) disableAI "PATH";
    (driver V3) disableAI "PATH";
    (driver V4) disableAI "PATH";
    (driver V5) disableAI "PATH";
    (driver V6) disableAI "PATH";
};
["convoy_stop", {
    call mission_fnc_convoy_stop;
}] call CBA_fnc_addEventHandler;

mission_fnc_kill_engines = {
    V1 engineOn false; 
    V2 engineOn false; 
    V3 engineOn false; 
    V4 engineOn false; 
    V5 engineOn false; 
    V6 engineOn false;
};
["kill_engines", {
    call mission_fnc_kill_engines;
}] call CBA_fnc_addEventHandler;

[V1T, V1] call BIS_fnc_attachToRelative;
[V2T, V2] call BIS_fnc_attachToRelative;
[V3T, V3] call BIS_fnc_attachToRelative;
[V4T, V4] call BIS_fnc_attachToRelative;
[V5T, V5] call BIS_fnc_attachToRelative;
[V6T, V6] call BIS_fnc_attachToRelative;
