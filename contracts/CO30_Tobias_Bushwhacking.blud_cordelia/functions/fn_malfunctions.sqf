fnc_malfunction = {
    params ["_veh"];

    for "_i" from 1 to 3 do {
        private _dmg  = 0.3 + random 0.4;
        private _part = selectRandom mission_parts;

        [_veh, _part, _dmg] remoteExec ["setHitPointDamage", _veh];
    };

    [_veh, "EngineSFX_lxWS"] remoteExec ["say3d", -2];
};
