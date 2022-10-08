#include "do_not_edit\script_component.hpp"

[QGVAR(setDate), {setDate _this}] call CBA_fnc_addEventHandler;


// -----------------------------------------------------------------

// probing event handler for mission, used to play SFX when sample is scanned
probe_EH = [missionnamespace, "probingEnded", {
    params["_data","_success"];
	// research sample objects in mission
	_open_objs = [open_obj_1, open_obj_2, open_obj_3];
    if (_success) then {
		_scanned_obj = _data select 0;
		//hint str _scanned_obj;

		// play sound if successful scan
		if (_scanned_obj in _open_objs) then {
			// play sound for everyone
			[_scanned_obj, "probeSuccess"] remoteExec ["say3D", 0];
			// check if player in UAV, need to play SFX in ears because say3D super quiet
			_uav = getConnectedUAV player;
			if (!isNull _uav) then {
				playSound "probeSuccess";
			};
		};
	};
}] call bis_fnc_addScriptedEventHandler;