fnc_malfunction = {
    params ["_veh"];

    private _part = selectRandom mission_parts;
    [_veh, _part] remoteExec ["setHitPointDamage", _veh];
    playSound3D ["EngineSFX_lxWS", _veh];
};
