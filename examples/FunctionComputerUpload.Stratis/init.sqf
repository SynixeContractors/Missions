[
    laptop,
    1,  // texture source, (in the attributes of the object, Texture #X)
    50, // size in GB
    8,  // time to upload in seconds
    {
        systemChat "Server: Upload Started";
    },
    {
        systemChat "Server: Upload Finished";
        // Clear the screen after 2 seconds
        [{
            params ["_object"];
            _object setObjectTextureGlobal [1, ""];
        }, _this, 2] call CBA_fnc_waitAndExecute;
    }
] call synixe_missions_fnc_computerUpload;
