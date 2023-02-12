if ((!isServer) && (player != player)) then {waitUntil {player == player};};

["Wacky Modules", "[Electronics] Scramble Start", {
	params ["", "_object"];
	_object setVariable ["wack_scramble", true, true];
}] call zen_custom_modules_fnc_register;
["Wacky Modules", "[Electronics] Scramble Stop", {
	params ["", "_object"];
	_object setVariable ["wack_scramble", false, true];
}] call zen_custom_modules_fnc_register;

["Wacky Modules", "[ACRE] No Talking", {
	params ["", "_object"];
	_object setVariable ["acre_sys_core_isDisabled", true, true];
}] call zen_custom_modules_fnc_register;
["Wacky Modules", "[ACRE] Can Talk", {
	params ["", "_object"];
	_object setVariable ["acre_sys_core_isDisabled", false, true];
}] call zen_custom_modules_fnc_register;

["Wacky Modules", "[Invincible] Safe", {
	params ["", "_object"];
	_object allowDamage false;
}] call zen_custom_modules_fnc_register;
["Wacky Modules", "[Invincible] Vulnerable", {
	params ["", "_object"];
	_object allowDamage true;
}] call zen_custom_modules_fnc_register;

["Wacky Modules", "[Cursed] Curse", {
	params ["", "_object"];
	_object setVariable ["wack_cursed", true, true];
}] call zen_custom_modules_fnc_register;
["Wacky Modules", "[Cursed] Bless", {
	params ["", "_object"];
	_object setVariable ["wack_cursed", false, true];
}] call zen_custom_modules_fnc_register;
["Wacky Modules", "[Cursed] Mark", {
	params ["", "_object"];
	_object setVariable ["wack_marked", !(_object getVariable ["wack_marked", false]), true];
}] call zen_custom_modules_fnc_register;

// Fucked in the head

["Wacky Modules", "Make Fucked in the head", {
	params ["", "_player"];
	_player setVariable ["wack_fucked_in_the_head", true, true];
	["wack_fucked_in_the_head", [], _player] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["Wacky Modules", "Make Sane in the head", {
	params ["", "_player"];
	_player setVariable ["wack_fucked_in_the_head", false, true];
}] call zen_custom_modules_fnc_register;

["wack_fucked_in_the_head", {
	if (player getVariable ["wack_fucked_in_the_head", false]) then {
		0 = ["ChromAberration", 200, [(random [-0.5, 0, 0.5]), (random [-0.5, 0, 0.5]), true]] spawn {
			params ["_name", "_priority", "_effect"]; 
			while { 
				fucked_in_the_head = ppEffectCreate [_name, _priority]; 
				fucked_in_the_head < 0 
			} do { 
				_priority = _priority + 1; 
			}; 
			fucked_in_the_head ppEffectEnable true; 
			fucked_in_the_head ppEffectAdjust _effect; 
			fucked_in_the_head ppEffectCommit 1; 
			waitUntil {ppEffectCommitted fucked_in_the_head};
			["wack_fucked_in_the_head"] call CBA_fnc_localEvent;
		};
	} else {
		0 spawn {
			fucked_in_the_head ppEffectAdjust [0,0,true];
			fucked_in_the_head ppEffectCommit 5;
			waitUntil {ppEffectCommitted fucked_in_the_head};
			ppEffectDestroy fucked_in_the_head;
		};
	};
}] call CBA_fnc_addEventHandler;

// Literally Blind

["Wacky Modules", "[Blind] Remove Sight", {
	params ["", "_player"];
	_player setVariable ["wack_blind", true, true];
	["wack_blind", [], _player] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["Wacky Modules", "[Blind] Grant Sight", {
	params ["", "_player"];
	_player setVariable ["wack_blind", false, true];
	["wack_not_blind", [], _player] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["wack_blind", {
	private _priority = 150;
	while {
		wack_blind = ppEffectCreate ["DynamicBlur", _priority];
		wack_blind < 0
	} do {
		_priority = _priority + 1;
	};
	wack_blind ppEffectEnable true;
	wack_blind ppEffectAdjust [10];
	wack_blind ppEffectCommit 5;
}] call CBA_fnc_addEventHandler;

["wack_not_blind", {
	0 spawn {
		wack_blind ppEffectEnable true;
		wack_blind ppEffectAdjust [0];
		wack_blind ppEffectCommit 5;
		waitUntil {ppEffectCommitted wack_blind};
		wack_blind ppEffectEnable false;
		ppEffectDestroy wack_blind;
	};
}] call CBA_fnc_addEventHandler;

// Drugged

["Wacky Modules", "[Drugs] Drug", {
	params ["", "_player"];
	_player setVariable ["wack_drugged", true, true];
	["wack_drugged", [], _player] call CBA_fnc_targetEvent;
}] call zen_custom_modules_fnc_register;

["Wacky Modules", "[Drugs] Sober", {
	params ["", "_player"];
	_player setVariable ["wack_drugged", false, true];
}] call zen_custom_modules_fnc_register;

["wack_drugged", {
	if (player getVariable ["wack_drugged", false]) then {
		// [random [0.8, 1, 1.2], random [0, 0.4, 0.8], random [-0.2,0,0.2], [random [0, 0.5, 1], random [0, 0.5, 1], random [0, 0.5, 1], random [0, 0.5, 1]], [random [0,0.5,1], random [0,0.5,1], random [0,0.5,1], random[0,0.5,1]], [random [0,0.5,1], random [0,0.5,1], random [0,0.5,1], random[0,0.5,1]]]
		0 = ["ColorInversion", 2500, [random [0, 0.5, 1], random [0, 0.5, 1], random [0, 0.5, 1]]] spawn {
			params ["_name", "_priority", "_effect"]; 
			while { 
				drugged = ppEffectCreate [_name, _priority]; 
				drugged < 0 
			} do { 
				_priority = _priority + 1; 
			}; 
			drugged ppEffectEnable true; 
			drugged ppEffectAdjust _effect; 
			drugged ppEffectCommit 2; 
			waitUntil {ppEffectCommitted drugged};
			["wack_drugged"] call CBA_fnc_localEvent;
		};
	} else {
		0 spawn {
			drugged ppEffectAdjust [0, 0, 0];
			drugged ppEffectCommit 2;
			waitUntil {ppEffectCommitted drugged};
			ppEffectDestroy drugged;
		};
	};
}] call CBA_fnc_addEventHandler;

[{
	{
		if (_x getVariable ["wack_marked", false]) then {
			_x hideObject !(player getVariable ["wack_cursed", false]);
		};
	} forEach nearestObjects [player, [], 800];
	if (player getVariable ["wack_scramble", false]) then {
		private _radios = [] call acre_api_fnc_getCurrentRadioList;
		{
			call ace_common_fnc_endRadioTransmission;
			[_x, random 90] call acre_api_fnc_setRadioChannel;
			private _display = uiNamespace getVariable ["acre_sys_prc152_currentDisplay", displayNull];
			if !(isNull _display) then {
				["ENT", _display displayCtrl 100012] call acre_sys_prc152_fnc_onbuttonPress;
			};
		} forEach _radios;
	};
	if (player getVariable ["acre_sys_core_isDisabled", false]) then {
		call ace_common_fnc_endRadioTransmission;
	};
}, 0.25] call CBA_fnc_addPerFrameHandler;

[{!isNull findDisplay 12},
{
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
		if (player getVariable ["wack_scramble", false]) then {
			params ["_mapCtrl"];
			private _mapDisplay = ctrlParent _mapCtrl;
			private _ctrl = _mapDisplay displayCtrl 913590;
			_ctrl ctrlSetText str round (random 360);  // Set Heading
			_ctrl = _mapDisplay displayCtrl 913591;
			_ctrl ctrlSetText str round (random 200); // Set Altitude
			_ctrl = _mapDisplay displayCtrl 913592;
			_ctrl ctrlSetText format ["%1%2%3%4%5%6", round random 9, round random 9, round random 9, round random 9, round random 9, round random 9];

			{
				_x#0 setMarkerPosLocal ([] call BIS_fnc_randomPos);
			} forEach afft_friendly_tracker_markers;
		};
	}];
}, []] call CBA_fnc_waitUntilAndExecute;

addMissionEventHandler ["Draw3D", {
  if !(isNull(findDisplay 312)) then {
    {
		if !(_x getVariable ["synixe_spectator_dead", false]) then {
			if (_x getVariable ["wack_fucked_in_the_head", false]) then {
				drawIcon3D ["",[0,0,0,1],ASLToAGL getPosASL _x,1,2.5,0,"fucked",2,0.05,"PuristaMedium","center"];
			};
			if (_x getVariable ["wack_drugged", false]) then {
				drawIcon3D ["",[0,0,0,1],ASLToAGL getPosASL _x,1,4,0,"drugged",2,0.05,"PuristaMedium","center"];
			};
			if (_x getVariable ["wack_blind", false]) then {
				drawIcon3D ["",[0,0,0,1],ASLToAGL getPosASL _x,1,5.5,0,"blind",2,0.05,"PuristaMedium","center"];
			};
			if (_x getVariable ["wack_cursed", false]) then {
				drawIcon3D ["",[0.8,0,0,1],ASLToAGL getPosASL _x,1,7,0,"cursed",2,0.05,"PuristaMedium","center"];
			};
			if (_x getVariable ["acre_sys_core_isDisabled", false]) then {
				drawIcon3D ["",[0.8,0,0,1],ASLToAGL getPosASL _x,1,8.5,0,"no talk",2,0.05,"PuristaMedium","center"];
			};
			if (_x getVariable ["wack_scramble", false]) then {
				drawIcon3D ["",[0.8,0,0,1],ASLToAGL getPosASL _x,1,8.5,0,"scramble",2,0.05,"PuristaMedium","center"];
			};
		};
	} forEach allPlayers;
	{
		if !(isDamageAllowed _x) then {
			drawIcon3D ["",[0,0,0,1],ASLToAGL getPosASL _x,1,-2.5,0,"invincible",2,0.05,"PuristaMedium","center"];
		};
		if (_x getVariable ["wack_marked", false]) then {
			drawIcon3D ["",[0,0,0,1],ASLToAGL getPosASL _x,1,-4,0,"marked",2,0.05,"PuristaMedium","center"];
		};
	} forEach allUnits;
  };
}];
