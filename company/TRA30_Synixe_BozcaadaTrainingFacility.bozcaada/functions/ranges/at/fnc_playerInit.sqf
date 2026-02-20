private _M72A6action = ["LATQuickM72A6","Grab M72A7","",{
    _player addWeapon "JCA_launch_M72_black_F";
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

{
    [_x, 0, ["ACE_MainActions"], _M72A6action] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    lat_quick
];
