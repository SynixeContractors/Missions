[{
    {
        deleteVehicle _x;
    } forEach (
        (nearestObjects [at_cleanup, [], 20]) select {
            typeof _x == "WeaponHolderSimulated"
        } select {
            count ((weaponCargo _x) select {
                private _lower = toLower _x;
                "used" in _lower || "expended" in _lower
            }) > 0
        }
    )
}, 3] call CBA_fnc_addPerFrameHandler;
