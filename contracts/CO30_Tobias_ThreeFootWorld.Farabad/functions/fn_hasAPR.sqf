params [
    ["_unit", objNull, [objNull]]
];

private _CBRN_Masks = [
    "G_RegulatorMask_F",
    "G_AirPurifyingRespirator_02_black_F",
    "G_AirPurifyingRespirator_02_black_nofilter_F",
    "G_AirPurifyingRespirator_02_olive_F",
    "G_AirPurifyingRespirator_02_olive_nofilter_F",
    "G_AirPurifyingRespirator_02_sand_F",
    "G_AirPurifyingRespirator_02_sand_nofilter_F",
    "G_AirPurifyingRespirator_01_F",
    "G_AirPurifyingRespirator_01_nofilter_F",
    "JCA_G_AirPurifyingRespirator_03_black_clear_F",
    "JCA_G_AirPurifyingRespirator_03_black_tinted_F",
    "JCA_G_AirPurifyingRespirator_03_olive_clear_F",
    "JCA_G_AirPurifyingRespirator_03_olive_tinted_F",
    "JCA_G_AirPurifyingRespirator_03_sand_clear_F",
    "JCA_G_AirPurifyingRespirator_03_sand_tinted_F",
    "JCA_G_AirPurifyingRespirator_04_black_clear_F",
    "JCA_G_AirPurifyingRespirator_04_black_tinted_F",
    "JCA_G_AirPurifyingRespirator_04_olive_clear_F",
    "JCA_G_AirPurifyingRespirator_04_olive_tinted_F",
    "JCA_G_AirPurifyingRespirator_04_sand_clear_F",
    "JCA_G_AirPurifyingRespirator_04_sand_tinted_F"
];

(goggles _unit) in _CBRN_Masks
