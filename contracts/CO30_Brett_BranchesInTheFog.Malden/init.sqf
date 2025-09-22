// Alpha 59.625
// Bravo 59.75
// Charlie 59.875

[{
    ["HAMMER", 59.625] call sai_commander_fnc_register;
    ["HAMMER", arty_1] call sai_artillery_fnc_register;
    ["HAMMER", arty_2] call sai_artillery_fnc_register;
    ["HAMMER", arty_3] call sai_artillery_fnc_register;
    ["HAMMER", arty_4] call sai_artillery_fnc_register;
},[],5] call CBA_fnc_waitAndExecute;

{
    [
        _x,
        0,  // texture source
        500 + ((random 3) * 500), // size in GB
        300 + (random 300),  // time to upload in seconds
        {},
        {
            mission_uploads = mission_uploads + 1;
            [{
                params ["_object"];
                _object setObjectTextureGlobal [0, "a3\missions_f_oldman\data\img\screens\csatntb_co.paa"];
            }, _this, 5] call CBA_fnc_waitAndExecute;
        },
        { !(_target getVariable ["mission_locked", false]) },
        [
            ["showAtStart", false]
        ]
    ] call synixe_missions_fnc_computerUpload;
} forEach [control_laptop_1, control_laptop_2];
