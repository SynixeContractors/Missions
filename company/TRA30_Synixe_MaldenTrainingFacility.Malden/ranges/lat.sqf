params ["_shop"];

_M136action = ["LATQuickM136","Grab M136","",{
	_player addWeapon "CUP_launch_M136";
	[{
		if (count weapons player > 0) then  { 
			private _type = ((weapons player) select 2); 
			private _muzzles = getArray (configFile >> "cfgWeapons" >> _type >> "muzzles"); 
			if (count _muzzles > 1) then { 
				player selectWeapon (_muzzles select 0); 
			} else { 
				player selectWeapon _type; 
			}; 
		};
	}, [], 0.5] call CBA_fnc_waitAndExecute;
},{true}] call ace_interact_menu_fnc_createAction;
[_shop, 0, ["ACE_MainActions"], _M136action] call ace_interact_menu_fnc_addActionToObject;

_M72A6action = ["LATQuickM72A6","Grab M72A6","",{
	_player addWeapon "CUP_launch_M72A6";
	[{
		if (count weapons player > 0) then  { 
			private _type = ((weapons player) select 2); 
			private _muzzles = getArray (configFile >> "cfgWeapons" >> _type >> "muzzles"); 
			if (count _muzzles > 1) then { 
				player selectWeapon (_muzzles select 0); 
			} else { 
				player selectWeapon _type; 
			}; 
		};
	}, [], 0.5] call CBA_fnc_waitAndExecute;
},{true}] call ace_interact_menu_fnc_createAction;
[_shop, 0, ["ACE_MainActions"], _M72A6action] call ace_interact_menu_fnc_addActionToObject;
