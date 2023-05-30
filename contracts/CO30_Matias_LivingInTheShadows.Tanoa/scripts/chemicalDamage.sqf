// define all CBRN equipment
private _masks = [
	"G_RegulatorMask_F", 
	"G_AirPurifyingRespirator_01_F",
	"G_AirPurifyingRespirator_01_nofilter_F", 
	"G_AirPurifyingRespirator_02_black_F", 
	"G_AirPurifyingRespirator_02_sand_F", 
	"G_AirPurifyingRespirator_02_olive_F"
];
private _clothes = [
	"U_C_CBRN_Suit_01_Blue_F", 
	"U_B_CBRN_Suit_01_MTP_F", 
	"U_B_CBRN_Suit_01_Tropic_F", 
	"U_C_CBRN_Suit_01_White_F", 
	"U_B_CBRN_Suit_01_Wdl_F", 
	"U_I_CBRN_Suit_01_AAF_F", 
	"U_I_E_CBRN_Suit_01_EAF_F"
];

// event handler that checks and applies chemical damage every 10 seconds
chemDamage_EH = [
	{
		params ["_args"];
		_args params ["_masks", "_clothes"];
		//hint str _args;

		// get distances to research sample objects in mission
		if ((player distance open_obj_1) < 5 || { (player distance open_obj_2) < 20 || { (player distance open_obj_3) < 20 } }) then {
			// check if they have clothing necessary
			_playerMask = goggles player;
			_playerClothes = uniform player;

			if (_playerMask in _masks && { _playerClothes in _clothes }) exitWith {};
			[player, random [0.1, 0.15, 0.2], "body", "unknown"] call ace_medical_fnc_addDamageToUnit;
		};
	},
	10,
	[_masks, _clothes]
] call CBA_fnc_addPerFrameHandler;