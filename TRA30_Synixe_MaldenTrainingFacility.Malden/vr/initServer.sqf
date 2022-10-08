training_vr_groups = createHashmap;
training_vr_group = createGroup east;

[{
	{
		{
			if !(alive _x) then {
				training_vr_entities deleteAt _forEachIndex;
				for "_i" from 0 to 6 do {
					_x setObjectTextureGlobal [_i, "#(argb,8,8,3)color(1,0,0,1,ca)"];
				};
				[{
					deleteVehicle _this;
				}, _x, 10] call CBA_fnc_waitAndExecute;
			};
		} forEach units _x;
	} forEach values training_vr_groups;
}, 0.5] call CBA_fnc_addPerFrameHandler;

training_get_unit = {
	params ["_side"];
	private _ret = switch (_side) do {
		case west: {
			"B_Soldier_VR_F"
		};
		case east: {
			"O_Soldier_VR_F"
		};
		case resistance: {
			"I_Soldier_VR_F"
		};
	};
	systemChat format ["%1", _ret];
	_ret
};

["training_vr_spawnUnit", {
	params ["_tag", "_side", "_posATL", "_code"];
	private _tagGroup = training_vr_groups getOrDefault [_tag, grpNull];
	if (isNull _tagGroup) then {
		_tagGroup = createGroup east;
		training_vr_groups set [_tag, _tagGroup];
	};
	private _unit = _tagGroup createUnit [[_side] call training_get_unit, _posATL, [], 0, "NONE"];
	[_unit] call _code;
	["training_vr_unit", [_unit]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

["training_vr_spawnGroup", {
	params ["_tag", "_side", "_posATL", "_count", "_code"];
	private _tagGroup = training_vr_groups getOrDefault [_tag, grpNull];
	if (isNull _tagGroup) then {
		_tagGroup = createGroup east;
		training_vr_groups set [_tag, _tagGroup];
	};
	for "_i" from 1 to _count do {
		private _unit = _tagGroup createUnit [[_side] call training_get_unit, _posATL, [], 0, "NONE"];
		["training_vr_unit", [_unit]] call CBA_fnc_globalEvent;
	};
	[_tagGroup] call _code;
}] call CBA_fnc_addEventHandler;

["training_vr_resetGroup", {
	params ["_tag"];
	private _tagGroup = training_vr_groups getOrDefault [_tag, grpNull];
	if (isNull _tagGroup) exitWith {};
	{
		deleteVehicle _x;
	} forEach units _tagGroup;
}] call CBA_fnc_addEventHandler;
