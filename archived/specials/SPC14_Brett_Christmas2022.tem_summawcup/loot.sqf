private _guns = [
    // Shotguns
    "CUP_sgun_slamfire",
    "sgun_HunterShotgun_01_sawedoff_F",
    "sgun_HunterShotgun_01_F",
    
    // No. 4 Mk 1
    "CUP_srifle_LeeEnfield",

    // CZ 550
    "CUP_srifle_CZ550",

    // M1891/30
    "CUP_srifle_Mosin_Nagant",

    // Remington 700
    "CUP_srifle_Remington700",

    // PMM-12
    "CUP_hgun_PMM"
];

private _ammo = [
    // Shotguns
    "CUP_2Rnd_12Gauge_Pellets_No00_Buck",
    "CUP_1Rnd_12Gauge_Pellets_No00_Buck",

    // No. 4 Mk 1
    "CUP_10x_303_M",

    // CZ 550
    "CUP_5x_22_LR_17_HMR_M",

    // M1891/30
    "CUP_5Rnd_762x54_Mosin_M",

    // Remington 700
    "CUP_6Rnd_762x51_R700",

    // PMM-12
    "CUP_12Rnd_9x18_PMM_M"
];

private _medical = [
    "ACE_packingBandage",
    "ACE_quikclot",
    "ACE_splint",
    "synixe_painkillers",
    "kat_guedel"
];

private _items = [
    // Smoke
    "SmokeShell",
    "SmokeShellGreen",
    "SmokeShellRed",

    // Chemlight
    "Chemlight_green",
    "Chemlight_red",
    "ACE_Chemlight_HiGreen",
    "ACE_Chemlight_HiRed",

    // Explosives
    "APERSTripMine_Wire_Mag",
    "APERSMine_Range_Mag",
    
    // Misc
    "ace_marker_flags_green",
    "ace_marker_flags_red",
    "ACRE_PRC343",
    "ItemCompass",
    "ItemWatch",
    "ItemMap"
];

private _containers = [
    // Backpacks
    "B_CivilianBackpack_01_Everyday_Astra_F",
    "B_CivilianBackpack_01_Everyday_Black_F",
    "B_CivilianBackpack_01_Sport_Blue_F",
    "B_CivilianBackpack_01_Sport_Green_F",
    "B_CivilianBackpack_01_Sport_Red_F",

    // Leg Strap
    "B_LegStrapBag_black_F",
    "B_LegStrapBag_coyote_F",
    "B_LegStrapBag_olive_F",

    // Messenger Bag
    "B_Messenger_Black_F",
    "B_Messenger_Coyote_F",
    "B_Messenger_Gray_F",
    "B_Messenger_Olive_F"
];

private _buildings = ((nearestTerrainObjects [mug, ["House"], 5000]) select {_x isKindOf "Building" && {
    _x distance2D getMarkerPos "fortress" > 200
}});

private _randomHolder = {
    params ["_buildings"];
    private _pos = call selectRandom [
        {(getPos selectRandom _buildings) findEmptyPosition [0,50]},
        {[] call BIS_fnc_randomPos}
    ];
    if (_pos isEqualTo []) then {
        _pos = [] call BIS_fnc_randomPos;
    };
    private _near = nearestObjects [_pos, ["WeaponHolder"], 5];
    private _weaponHolder = if (_near isEqualTo []) then {
        _pos set [2, 0.1];
        createVehicle ["Weapon_Empty", _pos, [], 0, "NONE"];
    } else {
        selectRandom _near;
    };
    _weaponHolder
};

// Spawn weapons
for "_i" from 0 to 60 do {
    private _weaponHolder = [_buildings] call _randomHolder;
    _weaponHolder addWeaponCargoGlobal [selectRandom _guns, 1];
};

// Spawn ammo
for "_i" from 0 to 200 do {
    private _weaponHolder = [_buildings] call _randomHolder;
    _weaponHolder addMagazineCargoGlobal [selectRandom _ammo, ceil random 3];
};

// Spawn medical supplies
for "_i" from 0 to 100 do {
    private _weaponHolder = [_buildings] call _randomHolder;
    _weaponHolder addWeaponCargoGlobal [selectRandom _medical, ceil random 5];
};

// Spawn items
for "_i" from 0 to 50 do {
    private _weaponHolder = [_buildings] call _randomHolder;
    _weaponHolder addItemCargoGlobal [selectRandom _items, 1];
};

// Spawn containers
for "_i" from 0 to 20 do {
    private _weaponHolder = [_buildings] call _randomHolder;
    _weaponHolder addBackpackCargoGlobal [selectRandom _containers, 1];
};
