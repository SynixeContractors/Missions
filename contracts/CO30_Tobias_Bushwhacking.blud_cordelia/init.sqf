private _parts = [
    "HitLFWheel","HitRFWheel",
    "HitLF2Wheel","HitRF2Wheel",
    "HitLMWheel","HitRMWheel",
    "HitLBWheel","HitRBWheel",
    "HitFuel","HitEngine"
];

{
    for "_i" from 1 to 3 do {
        private _dmg  = 0.3 + random 0.4;
        private _part = selectRandom _parts;

        _x setHitPointDamage [_part, _dmg];
    };
} forEach [vic_1, vic_2, vic_3, vic_4];
