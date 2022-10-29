private _unit = (createGroup west) createUnit ["B_Soldier_VR_F", getMarkerPos "engineer_vr_start", [], 0, "NONE"];
private _player = player;
missionNamespace setVariable ["training_engineer_vr_old_unit", _player];
selectPlayer _unit;
// player setVariable ["eng_vr_unit", _unit, true];
// player remoteControl _unit;
// _unit switchCamera "internal";	

_player enableSimulationGlobal false;
_player allowDamage false;

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
		player enableSimulationGlobal true;
		player allowDamage true;
	};
}] call CBA_fnc_addPerFrameHandler;
