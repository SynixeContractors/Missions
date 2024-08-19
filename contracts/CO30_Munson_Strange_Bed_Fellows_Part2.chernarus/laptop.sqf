[
    laptop,
    1,  // texture source
    100, // size in GB
    300,  // time to upload in seconds
    {
        systemChat "Server: Upload Started...";
    },
    {
        systemChat "Server: Upload Finished., LAUNCH ABORTED!";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [1, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
    }
] call synixe_missions_fnc_computerUpload;
