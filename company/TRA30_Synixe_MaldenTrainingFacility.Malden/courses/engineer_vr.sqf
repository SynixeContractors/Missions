if (missionNamespace getVariable ["training_engineer_vr_active", false]) exitWith {};
missionNamespace setVariable ["training_engineer_vr_active", true, true];

private _unit = (createGroup west) createUnit ["B_Soldier_VR_F", getMarkerPos "engineer_vr_start", [], 0, "NONE"];
missionNamespace setVariable ["training_engineer_vr_old_unit", player];
selectPlayer _unit;
// player setVariable ["eng_vr_unit", _unit, true];
// player remoteControl _unit;
// _unit switchCamera "internal";	

missionNamespace setVariable ["training_engineer_vr_unit", _unit, true];

training_engineer_vr_cleanup = [];

training_engineer_vr_tick = [{
	private _unit = missionNamespace getVariable ["training_engineer_vr_unit", objNull];
	if !(alive _unit) then {
		missionNamespace setVariable ["training_engineer_vr_active", false, true];
		[training_engineer_vr_tick] call CBA_fnc_removePerFrameHandler;
		// objNull remoteControl _unit;
		// player switchCamera "internal";
		systemChat "Training complete.";
		selectPlayer (missionNamespace getVariable ["training_engineer_vr_old_unit", objNull]);
	};
}] call CBA_fnc_addPerFrameHandler;

// Generate mines
