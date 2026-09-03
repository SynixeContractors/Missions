[] spawn {
    waitUntil { !isNil "Nibbles_fnc_cbrnZone" && !isNil "Nibbles_fnc_processCBRN" };

    {
        [_x] call Nibbles_fnc_cbrnZone;
    } forEach [
        "cbrn_zone_0",
        "cbrn_zone_1",
        "cbrn_zone_2",
        "cbrn_zone_3",
        "cbrn_zone_4",
        "cbrn_zone_5"
    ];

    [] call Nibbles_fnc_processCBRN;
};
