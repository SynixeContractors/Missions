fnc_malfunction = {
    params ["_veh"];

    private _part = selectRandom mission_parts;
    _veh setHitPointDamage [_part, 1];
    playSound "EngineSFX_lxWS";
};
