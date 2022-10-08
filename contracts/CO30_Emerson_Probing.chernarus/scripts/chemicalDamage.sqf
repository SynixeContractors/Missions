// define all CBRN equipment
_masks = [
	"G_RegulatorMask_F", 
	"G_AirPurifyingRespirator_01_F",
	"G_AirPurifyingRespirator_01_nofilter_F", 
	"G_AirPurifyingRespirator_02_black_F", 
	"G_AirPurifyingRespirator_02_sand_F", 
	"G_AirPurifyingRespirator_02_olive_F"
];
_clothes = [
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
		_args = _this select 0;
		//hint str _args;

		// get distances to research sample objects in mission
		_distance1 = player distance open_obj_1;
		_distance2 = player distance open_obj_2;
		_distance3 = player distance open_obj_3;
		if (_distance1 < 5 || _distance2 < 20 || _distance3 < 20) then {
			// check if they have clothing necessary
			_playerMask = goggles player;
			_playerClothes = uniform player;
			if (_playerMask in (_args select 0) && _playerClothes in (_args select 1)) then {
				// no damage;
			} else {
				_damage = random [0.1, 0.15, 0.2];
				[player, _damage, "body", "unknown"] call ace_medical_fnc_addDamageToUnit;
			};
		};
	},
	10,
	[_masks, _clothes]
] call CBA_fnc_addPerFrameHandler;