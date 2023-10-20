private _lights = [ch1l1, ch1l2, ch1l3, ch1r1, ch1r2, ch1r3];
{
    _x switchLight "OFF";
} forEach _lights;

mission_func_barrage = {
    {
        if (alive _x) then {
            _x doArtilleryFire [[5709,5721,0], "12Rnd_230mm_rockets", 12]
        };
    } forEach [
        art1,
        art2,
        art3,
        art4,
        art5
    ];
};
