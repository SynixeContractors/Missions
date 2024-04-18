mission_fnc_upload = compile preprocessFileLineNumbers "upload.sqf";

[
    server_laptop,
    1,
    734,
    60 * 8,
    "server-control",
    "root"
] call mission_fnc_upload;
