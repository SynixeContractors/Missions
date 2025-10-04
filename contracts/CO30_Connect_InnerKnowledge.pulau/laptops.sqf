isHacked = false; // Used for a trigger to avoid having to program the moves manually.

[
    laptop1,
    1,  // texture source
    50, // size in GB
    300,  // time to upload in seconds
    {
        systemChat "Laptop: Download Started";
	[{
	    isHacked = true;
	    {
	      _x setObjectTextureGlobal [0, "hacked.jpg"];
	    } forEach ((getMissionLayerEntities "hacked") select 0);
	    {
	      _x setObjectTextureGlobal [0, "hacked.jpg"];
	      _x setObjectTextureGlobal [1, "hacked.jpg"];
	    } forEach ((getMissionLayerEntities "hacked_dual") select 0);

        }, _this, 10] call CBA_fnc_waitAndExecute;
    },
    {
        systemChat "Laptop: Download Finished";
	private _pos = getPosASL _object;
	private _usb = createVehicle ["Item_FlashDisk", [0,0,0]];
	_usb setPosASL [(_pos select 0)+0.5, (_pos select 1), (_pos select 2)-0.054];
        // Clear the screen after 2 seconds
        [{
	    systemChat "Pickup flashdrive";
            params ["_object"];
            _object setObjectTextureGlobal [1, "screen1.jpg"];

        }, _this, 1] call CBA_fnc_waitAndExecute;
    },
    "joostlaptop",
    "jst92"
] call synixe_missions_fnc_computerUpload;
