
mission_christmas_uniforms = [
    "Christmas_Sweater_Mooses_Blue_Item",
    "Christmas_Sweater_Dinos_Item",
    "Christmas_Sweater_Jinger_Item",
    "Christmas_Sweater_Merry_Christmas_Item",
    "Christmas_Sweater_Mooses_Item",
    "Christmas_Sweater_Reindeer_Item",
    "Christmas_Sweater_Reindeers_Item",
    "Christmas_Sweater_Santa_Item",
    "Christmas_Sweater_Sleigh_Item",
    "Christmas_Sweater_Friend_Item",
    "Christmas_Sweater_Trees_Item"
];

mission_christmas_hats = [
    "Christmas_Hat_Plain_Wearable",
    "Christmas_Hat_Reindeer_Wearable",
    "Christmas_Hat_Side_Wearable",
    "Christmas_Hat_Stars_Wearable",
    "Snowman_Bucket_Wearable",
    "Snowman_Hat_Wearable",
    "Snowman_Enemy_Wearable",
    "Snowman_Bucket_Wearable_M",
    "Snowman_Enemy_Wearable_M",
    "Snowman_Hat_Wearable_M",
    "GreenHead_GE"
];

mission_christmas_primaries = [
    ["MK18_Christmas", ["20Rnd_762x51_Mag"]],
    ["MK20_black_plain_Christmas", ["30Rnd_556x45_Stanag"]],
    ["MK20_black_gl_Christmas", ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell"]],
    ["45KO_MX_SW_Christmas", ["100Rnd_65x39_caseless_black_mag"]],
    ["45KO_MXc_camo_Christmas", ["100Rnd_65x39_caseless_black_mag"]],
    ["MXM_Christmas", ["100Rnd_65x39_caseless_black_mag"]],
    ["TRG20_Christmas", ["30Rnd_556x45_Stanag"]],
    ["45KO_SMG_christmas", ["tacgt_25Rnd_45ACP_EPR"]]
];

mission_christmas_launcher = [
    ["launch_RPG32_ghex_F_Ammo_Christmas", ["Snowball_Missile_Weapon"]],
    ["launch_B_Titan_short_F_Ammo_Christmas", ["Snowball_Missile_Weapon"]]
];

mission_christmas_backpacks = [
    "tacs_Backpack_Carryall_White",
    "B_CivilianBackpack_01_Everyday_Black_F",
    "tacs_Backpack_Kitbag_White",
    "B_Messenger_Gray_F",
    "B_Messenger_Black_F",
    "B_CivilianBackpack_01_Sport_Green_F",
    "B_CivilianBackpack_01_Sport_Red_F"
];

{
    _x setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];

    _x addUniform (selectRandom mission_christmas_uniforms);

    if (random 100 > 50) then {
        _x addBackpack (selectRandom mission_christmas_backpacks);
    };

    if (random 100 > 20) then {
        _x addHeadgear (selectRandom mission_christmas_hats);
    };

    (selectRandom mission_christmas_primaries) params ["_primary", "_magazines"];
    for "_" from 6 to 11 do {
        _x addMagazine (selectRandom _magazines);
    };
    _x addWeapon _primary;

    if (random 100 > 70) then {
        (selectRandom mission_christmas_launcher) params ["_launcher", "_magazines"];
        for "_" from 3 to 6 do {
            _x addMagazine (selectRandom _magazines);
        };
        _x addWeapon _launcher;
    };
} forEach (allUnits select { side _x == opfor });
