[
    antena1,
    0,  // texture source
    32, // size in GB
    300,  // time to upload in seconds
    {
        diag_log "Server: Upload Started 1";
    },
    {
        diag_log "Server: Upload Finished 1";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [0, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
	flashdrive1 setPosASL (getPosASL place1);
	mission_antena1 = true;
    }
] call synixe_missions_fnc_computerUpload;

[
    antena2,
    0,  // texture source
    42, // size in GB
    300,  // time to upload in seconds
    {
        diag_log "Server: Upload Started 2";
    },
    {
        diag_log "Server: Upload Finished 2";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [0, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
	flashdrive2 setPosASL (getPosASL place2);
        mission_antena2 = true;
    }
] call synixe_missions_fnc_computerUpload;

[
    antena3,
    0,  // texture source
    61, // size in GB
    300,  // time to upload in seconds
    {
        diag_log "Server: Upload Started 3";
    },
    {
        diag_log "Server: Upload Finished 3";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [0, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
	flashdrive3 setPosASL (getPosASL place3);
	mission_antena3 = true;
    }
] call synixe_missions_fnc_computerUpload;
