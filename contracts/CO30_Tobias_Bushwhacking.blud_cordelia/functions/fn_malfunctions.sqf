fnc_malfunction = {
    params ["_veh"];

    private _parts = [
        "HitLFWheel","HitRFWheel",
        "HitLF2Wheel","HitRF2Wheel",
        "HitLMWheel","HitRMWheel",
        "HitLBWheel","HitRBWheel",
        "HitFuel","HitEngine"
    ];

    private _part = selectRandom _parts;
    _veh setHitPointDamage [_part, 1];
    playSound "EngineSFX_lxWS";
};
