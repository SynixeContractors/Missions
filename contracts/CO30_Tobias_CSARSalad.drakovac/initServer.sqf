// Transponder

[] spawn {
    while {true} do {
        ["marker_0", 3, 1] remoteExec ["nibbles_fnc_blinkMarker", 0, false];
        sleep ((18 + random 5) * 60);
    };
};

// QRF 1

[] spawn {
    waitUntil {
        ((date select 3) >= 4) && 
        ((date select 4) >= 20) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 100] call nibbles_fnc_createUnloadWaypoint;
    [qrf_3, "marker_0", 100] call nibbles_fnc_createUnloadWaypoint;

    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

};

[] spawn {
    waitUntil {
        ((date select 3) >= 4) && 
        ((date select 4) >= 40) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

};

[] spawn {
    waitUntil {
        ((date select 3) >= 5) && 
        ((date select 4) >= 0) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

};

// QRF 1 + 2

[] spawn {
    waitUntil {
        ((date select 3) >= 5) && 
        ((date select 4) >= 20) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

};

[] spawn {
    waitUntil {
        ((date select 3) >= 5) && 
        ((date select 4) >= 40) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

};

// QRF 1 + 2 + 3

[] spawn {
    waitUntil {
        ((date select 3) >= 6) && 
        ((date select 4) >= 0) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_4, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

};

// QRF 1 + 2 + 3 + 4

[] spawn {
    waitUntil {
        ((date select 3) >= 6) && 
        ((date select 4) >= 20) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_4, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [group qrf_4, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_5, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_6, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_7, "marker_0", 100] call nibbles_fnc_createSADWaypoint;

};

[] spawn {
    waitUntil {
        ((date select 3) >= 6) && 
        ((date select 4) >= 40) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_4, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [group qrf_4, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_5, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_6, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_7, "marker_0", 100] call nibbles_fnc_createSADWaypoint;

};

[] spawn {
    waitUntil {
        ((date select 3) >= 7) && 
        ((date select 4) >= 0) &&
        !(synixe_spectator_allowed)
    };

    [qrf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [qrf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_1, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_2, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [heli_inf_3, "marker_0", 25] call nibbles_fnc_createSADWaypoint;
    [heli_inf_4, "marker_0", 25] call nibbles_fnc_createSADWaypoint;

    [group qrf_4, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_5, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_6, "marker_0", 100] call nibbles_fnc_createSADWaypoint;
    [group qrf_7, "marker_0", 100] call nibbles_fnc_createSADWaypoint;

};
