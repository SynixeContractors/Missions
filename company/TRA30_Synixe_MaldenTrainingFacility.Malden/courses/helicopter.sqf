params ["_vehicle"];

training_heli_active = true;

training_heli_vehicle = _vehicle createVehicle getMarkerPos "heli_spawn";

training_heli_unit = (createGroup west) createUnit ["B_Soldier_VR_F", getMarkerPos "heli_spawn", [], 0, "NONE"];
training_heli_unit moveInDriver training_heli_vehicle;
training_heli_old_unit = player;
selectPlayer training_heli_unit;
training_heli_old_unit enableSimulationGlobal false;
training_heli_old_unit allowDamage false; 

training_heli_unit setUnitLoadout [[[],[],[],["synixe_contractors_Uniform_Contractor_Shirt",[]],["milgp_lot_v_battle_belt_assaulter_blk",[]],[],"SP_SPH4Helmet_Yellow","G_Tactical_Clear",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]], false];

training_heli_cleanup = [];

training_heli_tick = [{
	if (!(alive training_heli_unit) || {!(alive training_heli_vehicle)}) then {
		training_heli_active = false;
		[training_heli_tick] call CBA_fnc_removePerFrameHandler;
		selectPlayer training_heli_old_unit;
		player allowDamage true;
		player enableSimulationGlobal true;
		deleteVehicle training_heli_vehicle;
		private _group = group training_heli_unit;
		deleteVehicle training_heli_unit;
		deleteGroup _group;
	};
}] call CBA_fnc_addPerFrameHandler;
