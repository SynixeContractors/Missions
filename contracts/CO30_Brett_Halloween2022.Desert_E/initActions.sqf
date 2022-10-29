// Laptops

private _unlockAction = ["Unlock", "Unlock", "", {
	[
		"Unlock Computer",
		[
			["EDIT", "Password", []]
		],
		{
			params ["_values", "_args"];
			if ((_values#0 isEqualTo (_args#0 getVariable ["halloween_password", "1234"]))) then {
				_args#0 setVariable ["halloween_locked", false, true];
				_args#0 setObjectTextureGlobal [1, "a3\missions_f_oldman\data\img\screens\csatntb_co.paa"];
			};
		},
		{},
		[_target]
	] call zen_dialog_fnc_create;
}, {
	_target getVariable ["halloween_locked", false]
}] call ace_interact_menu_fnc_createAction;
private _lockAction = ["Lock", "Lock", "", {
	_target setVariable ["halloween_locked", true, true];
	_target setObjectTextureGlobal [1, ""];
}, {
	!(_target getVariable ["halloween_locked", false])
}] call ace_interact_menu_fnc_createAction;

private _detonateArmouryAction = ["DetonateArmoury", "Initialize Portside Protocol", "", {
	("satchelcharge_remote_ammo" createVehicle (getPos charge_armoury_1)) setDamage 1;
	("satchelcharge_remote_ammo" createVehicle (getPos charge_armoury_2)) setDamage 1;
	("satchelcharge_remote_ammo" createVehicle (getPos charge_armoury_3)) setDamage 1;
	("satchelcharge_remote_ammo" createVehicle (getPos charge_armoury_4)) setDamage 1;
	deleteVehicle charge_armoury_1;
	deleteVehicle charge_armoury_2;
	deleteVehicle charge_armoury_3;
	deleteVehicle charge_armoury_4;
	missionNamespace setVariable ["halloween_armouryDetonated", true, true];
}, {
	!(_target getVariable ["halloween_locked", false]) && {!(missionNamespace getVariable ["halloween_armouryDetonated", false])}
}] call ace_interact_menu_fnc_createAction;

private _resetAccessCode = ["ResetAccessCode", "Reset Access Code", "", {
	[
		"Reset Access Code",
		[
			["EDIT", "New Access Code", []]
		],
		{
			params ["_values", "_args"];
			contain_layer_1 setVariable ["halloween_password", _values#0, true];
		}
	] call zen_dialog_fnc_create;
}, {
	!(_target getVariable ["halloween_locked", false])
}] call ace_interact_menu_fnc_createAction;

[doctor_laptop, 0, ["ACE_MainActions"], _unlockAction] call ace_interact_menu_fnc_addActionToObject;
[doctor_laptop, 0, ["ACE_MainActions"], _lockAction] call ace_interact_menu_fnc_addActionToObject;
[doctor_laptop, 0, ["ACE_MainActions"], _detonateArmouryAction] call ace_interact_menu_fnc_addActionToObject;
[doctor_laptop, 0, ["ACE_MainActions"], _resetAccessCode] call ace_interact_menu_fnc_addActionToObject;
[entry_tablet, 0, ["ACE_MainActions"], _unlockAction] call ace_interact_menu_fnc_addActionToObject;
[entry_tablet, 0, ["ACE_MainActions"], _lockAction] call ace_interact_menu_fnc_addActionToObject;

// Control Laptops

private _readExperimentNotes = ["ReadExperimentNotes", "Read Experiment Notes", "", {
	params ["_object", "_unit", "_args"];
	["zen_modules_addIntel", ["Experiment Notes", "The doctor is requesting we bypass the generators and connect the wind output to the injection system directly. Note that there is no way for us to disconnect it here, it will require a shutdown at the power station."], [_unit]] call CBA_fnc_targetEvent;
}, {
	!(_target getVariable ["halloween_locked", false])
}] call ace_interact_menu_fnc_createAction;

{
	[_x, 0, ["ACE_MainActions"], _readExperimentNotes] call ace_interact_menu_fnc_addActionToObject;
	[_x, 0, ["ACE_MainActions"], _unlockAction] call ace_interact_menu_fnc_addActionToObject;
	[_x, 0, ["ACE_MainActions"], _lockAction] call ace_interact_menu_fnc_addActionToObject;
} forEach [
	control_laptop_1,
	control_laptop_2,
	control_laptop_3,
	control_laptop_4,
	control_laptop_5,
	control_laptop_6,
	control_laptop_7
];

// Doors

private _unlockDoorAction = ["UnlockDoor", "Unlock Door", "", {
	[
		"Unlock Door",
		[
			["EDIT", "Access Code", []]
		],
		{
			params ["_values", "_args"];
			if ((_values#0 isEqualTo (_args#0 getVariable ["halloween_password", "1234"]))) then {
				_args#0 setVariable ["halloween_locked", false, true];
				_args#0 getVariable ["halloween_door", objNull] setVariable ["bis_disabled_Door_1", 0, true];
			};
		},
		{},
		[_target]
	] call zen_dialog_fnc_create;
}, {
	_target getVariable ["halloween_locked", false]
}] call ace_interact_menu_fnc_createAction;
private _lockDoorAction = ["LockDoor", "Lock Door", "", {
	_target setVariable ["halloween_locked", true, true];
	_target getVariable ["halloween_door", objNull] setVariable ["bis_disabled_Door_1", 1, true];
}, {
	!(_target getVariable ["halloween_locked", false])
}] call ace_interact_menu_fnc_createAction;

[contain_layer_1, 0, ["ACE_MainActions"], _unlockDoorAction] call ace_interact_menu_fnc_addActionToObject;
[contain_layer_1, 0, ["ACE_MainActions"], _lockDoorAction] call ace_interact_menu_fnc_addActionToObject;
[contain_layer_2, 0, ["ACE_MainActions"], _unlockDoorAction] call ace_interact_menu_fnc_addActionToObject;
[contain_layer_2, 0, ["ACE_MainActions"], _lockDoorAction] call ace_interact_menu_fnc_addActionToObject;

// Power

private _powerOnAction = ["PowerOn", "Power On", "", {
	missionNamespace setVariable ["halloween_powered", true, true];
	{
		_x setObjectTextureGlobal [0, "assets\images\status_connected.jpg"]
	} forEach [
		screen_1,
		screen_2,
		screen_3,
		screen_4
	];
}, {
	!(missionNamespace getVariable ["halloween_powered", true])
}] call ace_interact_menu_fnc_createAction;
private _powerOffAction = ["PowerOff", "Power Off", "", {
	missionNamespace setVariable ["halloween_powered", false, true];
	{
		_x setObjectTextureGlobal [0, "assets\images\status_disconnected.jpg"]
	} forEach [
		screen_1,
		screen_2,
		screen_3,
		screen_4
	];
}, {
	(missionNamespace getVariable ["halloween_powered", true])
}] call ace_interact_menu_fnc_createAction;

[power_switch , 0, ["ACE_MainActions"], _powerOnAction] call ace_interact_menu_fnc_addActionToObject;
[power_switch , 0, ["ACE_MainActions"], _powerOffAction] call ace_interact_menu_fnc_addActionToObject;
