#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

halloween_loadouts = [
  [["LMG_MK200_black_Holosight_lxWS","","","optic_Holosight_blk_F",["200Rnd_65x39_cased_Box",200],[],""],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_lxWS_ION_Casual6",[["FirstAidKit",1],["16Rnd_9x21_Mag",2,17],["HandGrenade",1,1],["SmokeShell",1,1],["SmokeShellGreen",1,1]]],["V_PlateCarrier2_blk",[["200Rnd_65x39_cased_Box",2,200],["Chemlight_green",2,1]]],[],"lxWS_H_CapB_rvs_blk_ION","G_Combat_lxWS",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]],
  [["arifle_XMS_Base_lxWS","","","",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_lxWS_ION_Casual5",[["FirstAidKit",1],["30Rnd_556x45_Stanag",3,30],["SmokeShell",1,1]]],["V_TacVest_khk",[["30Rnd_556x45_Stanag",2,30],["16Rnd_9x21_Mag",2,17],["SmokeShellGreen",1,1],["SmokeShellBlue",1,1],["SmokeShellOrange",1,1],["Chemlight_green",2,1]]],["B_AssaultPack_rgr_Medic",[["Medikit",1],["FirstAidKit",10]]],"H_Cap_blk_ION","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]],
  [["srifle_EBR_blk_holosight_bpd_lxWS","","","optic_Holosight_blk_F",["20Rnd_762x51_Mag_blk_lxWS",20],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_lxWS_ION_Casual6",[["FirstAidKit",1],["20Rnd_762x51_Mag_blk_lxWS",2,20]]],["V_TacVest_khk",[["20Rnd_762x51_Mag_blk_lxWS",3,20],["16Rnd_9x21_Mag",2,17],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1],["HandGrenade",2,1]]],[],"lxWS_H_Bandanna_blk_hs","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]],
  [["arifle_XMS_M_Holosight_lxWS","","","optic_Holosight_blk_F",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_lxWS_ION_Casual6",[["FirstAidKit",1],["30Rnd_556x45_Stanag",3,30],["SmokeShell",1,1]]],["V_PlateCarrier1_blk",[["30Rnd_556x45_Stanag",3,30],["16Rnd_9x21_Mag",2,17],["HandGrenade",2,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1]]],[],"lxWS_H_Headset","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
  [["sgun_aa40_Holosight_blk_lxWS","","","optic_Holosight_blk_F",["20Rnd_12Gauge_AA40_Pellets_lxWS",20],[],""],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_lxWS_ION_Casual6",[["FirstAidKit",1],["8Rnd_12Gauge_AA40_Pellets_lxWS",1,8],["8Rnd_12Gauge_AA40_Slug_lxWS",1,8],["16Rnd_9x21_Mag",1,17]]],["V_PlateCarrier1_blk",[["8Rnd_12Gauge_AA40_Slug_lxWS",2,8],["8Rnd_12Gauge_AA40_Smoke_lxWS",1,8],["20Rnd_12Gauge_AA40_HE_lxWS",1,20],["8Rnd_12Gauge_AA40_HE_lxWS",1,8],["Chemlight_green",2,1],["SmokeShellGreen",1,1],["SmokeShellOrange",1,1],["SmokeShellPurple",1,1]]],[],"H_Cap_headphones_ion_lxws","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]],
  [["arifle_XMS_ACO_lxWS","","","optic_Aco",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_lxWS_ION_Casual3",[["FirstAidKit",1],["30Rnd_556x45_Stanag",1,30]]],["V_PlateCarrier2_blk",[["75Rnd_556x45_Stanag_lxWS",2,75],["30Rnd_556x45_Stanag",3,30],["16Rnd_9x21_Mag",2,17],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1],["HandGrenade",2,1]]],[],"H_Cap_blk_ION","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
];

halloween_fnc_spawnEffect = {
  params ["_pos"];
  private _ps = "#particlesource" createVehicleLocal ASLtoATL _pos;
  _ps setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard",
	1, 1, [0, 0, 0], [0, 0, 0.5], 0, 1, 1, 3, [0.5,1.5],
	[[1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
	[0.25,1], 1, 1, "", "", _ps];
  _ps setParticleRandom [0.2, [0.5, 0.5, 0.25], [0.125, 0.125, 0.125], 0.2, 0.2, [0, 0, 0, 0], 0, 0];
  _ps setDropInterval 0.05;
  private _ls = "#lightpoint" createVehicleLocal ASLtoATL _pos;
  _ls setLightBrightness 1;
  _ls setLightColor [1, 0.65, 0.4];
  _ls setLightAmbient [0.15, 0.05, 0];
  _ls setLightIntensity (500);
  _ls setLightAttenuation [0, 0, 0, 1];
  _ls setLightDayLight false;
  [{
    params ["_ps", "_ls"];
    deleteVehicle _ps;
    deleteVehicle _ls;
  }, [_ps, _ls], 0.5] call CBA_fnc_waitAndExecute;
};

halloween_fnc_spawnSurgeUnit = {
  params ["_pos", "_loadout"];
  private _unit = halloween_security createUnit ["O_Survivor_F", ASLtoATL _pos, [], 0, "NONE"];
  _unit setUnitLoadout _loadout;
  _unit addEventHandler ["Killed", {
    params ["_unit", "_killer"];
    ["halloween_spawnEffect", [getPosASL _unit]] call CBA_fnc_globalEvent;
    deleteVehicle _unit;
  }];
};

["halloween_spawnEffect", halloween_fnc_spawnEffect] call CBA_fnc_addEventHandler;

[
  "Halloween",
  "Spawn Security",
  {
    ["halloween_spawnEffect", [getPosASL _unit]] call CBA_fnc_globalEvent;
    [{
      params ["_pos"];
      [_pos, selectRandom halloween_loadouts] call halloween_fnc_spawnSurgeUnit;
    }, _this, 0.25] call CBA_fnc_waitAndExecute;
  }
] call zen_custom_modules_fnc_register;

[
  "Halloween",
  "Spawn Contractor",
  {
    ["halloween_spawnEffect", _this] call CBA_fnc_globalEvent;
    [{
      params ["_pos"];
      private _sources = allPlayers select {alive _x};
      private _source = selectRandom _sources;
      [_pos, getUnitLoadout _source] call halloween_fnc_spawnSurgeUnit;
    }, _this, 0.25] call CBA_fnc_waitAndExecute;
  }
] call zen_custom_modules_fnc_register;

halloween_sounds = [
  "cant_stop_me_now_1",
  "cant_stop_me_now_2",
  "cant_stop_me_now_3",
  "cant_stop_me_now_4",
  "destroyed_my_family_1",
  "destroyed_my_family_2",
  "did_you_do_to_me_1",
  "did_you_do_to_me_2",
  "he_was_innocent_1",
  "he_was_innocent_2",
  "he_was_innocent_3",
  "helpless_1",
  "helpless_2",
  "helpless_3",
  "is_that_what_you_wanted_1",
  "is_that_what_you_wanted_2",
  "pay_for_what_youve_done_1",
  "pay_for_what_youve_done_2",
  "took_my_soul_1",
  "took_my_soul_2",
  "what_did_you_do_to_him_1",
  "what_did_you_do_to_him_2",
  "what_did_you_do_to_him_3",
  "what_have_you_done_to_me_1",
  "what_have_you_done_to_me_2"
];

[
  "Halloween",
  "playSound3D",
  {
    [
      "playSound3D",
      [
        ["COMBO", "Sound", [halloween_sounds, halloween_sounds, 0]]
      ],
      {
        params ["_values", "_args"];
        private _sound = _values select 0;
        private _unit = _args select 1;
        playSound3D [getMissionPath format ["assets\audio\%1.ogg", _sound], _unit, false, eyePos _unit, 5, 0.85, 80];
      },
      {},
      _this
    ] call zen_dialog_fnc_create;
  }
] call zen_custom_modules_fnc_register;

call compile preprocessFileLineNumbers "initModules.sqf";
call compile preprocessFileLineNumbers "initActions.sqf";

halloween_cameras = [];
halloween_fnc_cameras = compile preprocessFileLineNumbers "initCams.sqf";

call halloween_fnc_cameras;

[intel_entry_laptop, 2, false, 1, "Read Entry Log", [], 3, "Entry Log", loadFile "assets\intel\entry_log.txt"] call zen_modules_fnc_addIntelAction;
[intel_flight_laptop, 2, false, 1, "Read Flight Log", [], 3, "Flight Log", loadFile "assets\intel\flight_log.txt"] call zen_modules_fnc_addIntelAction;

[barracks_notes_1, 2, false, 1, "Read Notes", [], 3, "Notes - Joram Rufford", loadFile "assets\intel\notes_joram.txt"] call zen_modules_fnc_addIntelAction;
[barracks_notes_2, 2, false, 1, "Read Notes", [], 3, "Cellphone - Mick Harrison", loadFile "assets\intel\phone_mick.txt"] call zen_modules_fnc_addIntelAction;
[barracks_notes_3, 2, false, 1, "Read Notes", [], 3, "Notes - Unkown", loadFile "assets\intel\notes_unknown.txt"] call zen_modules_fnc_addIntelAction;

[doctor_notes_24, 2, false, 1, "Read Note", [], 3, "Doctor's Notes - October 24", loadFile "assets\intel\doctor_desk_24.txt"] call zen_modules_fnc_addIntelAction;
[doctor_notes_28, 2, false, 1, "Read Note", [], 3, "Doctor's Notes - October 28", loadFile "assets\intel\doctor_desk_28.txt"] call zen_modules_fnc_addIntelAction;
