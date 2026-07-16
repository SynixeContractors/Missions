[
    antena1,
    0,  // texture source
    32, // size in GB
    300,  // time to upload in seconds
    {
        systemChat "Server: Upload Started";
    },
    {
        systemChat "Server: Upload Finished";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [0, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;

	 mission_antenna1 = true;        
    }
] call synixe_missions_fnc_computerUpload;

[
    antena2,
    0,  // texture source
    42, // size in GB
    300,  // time to upload in seconds
    {
        systemChat "Server: Upload Started";
    },
    {
        systemChat "Server: Upload Finished";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [0, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;

        mission_antenna2 = true;
    }
] call synixe_missions_fnc_computerUpload;

[
    antena3,
    0,  // texture source
    61, // size in GB
    300,  // time to upload in seconds
    {
        systemChat "Server: Upload Started";
    },
    {
        systemChat "Server: Upload Finished";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [0, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
	
	mission_antenna3 = true;
    }
] call synixe_missions_fnc_computerUpload;
