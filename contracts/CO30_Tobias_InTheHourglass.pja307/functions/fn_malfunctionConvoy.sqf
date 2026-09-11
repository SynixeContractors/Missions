fnc_malfunctionConvoy = {
    params ["_veh"];

    convoy_parts = [
        "HitFuel",
        "HitEngine",
        "HitBody"
    ];

    for "_i" from 1 to 3 do {
        private _dmg  = 0.5 + random 0.3;
        private _part = selectRandom convoy_parts;

        [_veh, _part, _dmg] remoteExec ["TAG_fnc_setHP", _veh];
    };

    [_veh, "EngineSFX_lxWS"] remoteExec ["say3D", 0, true];
    [_veh, 0] remoteExec ["setFuel", _veh];
};
