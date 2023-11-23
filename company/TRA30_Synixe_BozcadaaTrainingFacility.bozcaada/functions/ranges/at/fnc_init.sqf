[{
    {
        deleteVehicle _x;
    } forEach (
        (nearestObjects [at_cleanup, [], 20]) select {
            typeof _x == "WeaponHolderSimulated"
        } select {
            count ((weaponCargo _x) select {
                "used" in toLower _x
            }) > 0
        }
    )
}, 3] call CBA_fnc_addPerFrameHandler;
