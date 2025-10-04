mission_jackets = [
    "U_C_PilotJacket_black_RF",
    "U_C_PilotJacket_open_black_RF",
    "U_C_PilotJacket_brown_RF",
    "U_C_PilotJacket_open_brown_RF",
    "U_C_PilotJacket_lbrown_RF",
    "U_C_PilotJacket_open_lbrown_RF",
    "Atlas_U_C_CommonerJacket_01_marroon_F",
    "Atlas_U_C_CommonerJacket_01_grey_F",
    "Atlas_U_C_CommonerJacket_01_blue_F",
    "U_lxWS_Tak_02_A",
    "U_lxWS_Tak_02_C",
    "U_lxWS_Tak_02_B"
];

{
    {
        removeUniform _x;
        _x addUniform selectRandom mission_jackets;
    } forEach units _x;
} forEach [civ_1, civ_2, civ_3, civ_4, civ_5, civ_6, civ_7];
