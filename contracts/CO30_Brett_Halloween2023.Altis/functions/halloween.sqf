halloween_loadouts = [
  [[[],[],["CUP_hgun_Glock17_blk","","","",["tacgt_17Rnd_9x19_Glock_Ball",17],[],""],["U_C_Scientist",[]],["milgp_v_marciras_light_blk_blk",[["tacgt_17Rnd_9x19_Glock_Ball",10,17]]],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]],
  [[[],[],["CUP_hgun_Glock17_blk","","","",["tacgt_17Rnd_9x19_Glock_Ball",17],[],""],["sepsigp_u_fleece_grey_g3_field_pants_blk",[]],["milgp_v_marciras_light_blk_blk",[["tacgt_17Rnd_9x19_Glock_Ball",10,17]]],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]],[]]
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
  params ["_pos", "_loadout", ["_tent", false]];
  private _unit = if (_tent) then {
    createGroup EAST
  } else {
    halloween_security
  } createUnit ["I_Survivor_F", ASLtoATL _pos, [], 0, "NONE"];
  _unit setUnitLoadout _loadout;
  _unit setPitch 0.7;
  _unit addEventHandler ["Killed", {
    params ["_unit", "_killer"];
    ["halloween_spawnEffect", [getPosASL _unit]] call CBA_fnc_globalEvent;
    deleteVehicle _unit;
  }];
  if (_tent) then {
    _unit disableAI "PATH";
  };
};

halloween_security = createGroup EAST;

["halloween_spawnEffect", halloween_fnc_spawnEffect] call CBA_fnc_addEventHandler;

[
  "Halloween",
  "Spawn Security",
  {
    ["halloween_spawnEffect", _this] call CBA_fnc_globalEvent;
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
      private _source = selectRandom (allPlayers select { alive _x });
      [_pos, getUnitLoadout _source] call halloween_fnc_spawnSurgeUnit;
    }, _this, 0.25] call CBA_fnc_waitAndExecute;
  }
] call zen_custom_modules_fnc_register;

[
  "Halloween",
  "Spawn Contractor (Tents)",
  {
    ["halloween_spawnEffect", _this] call CBA_fnc_globalEvent;
    [{
      params ["_pos"];
      private _source = selectRandom (allPlayers select { alive _x });
      [_pos, getUnitLoadout _source, true] call halloween_fnc_spawnSurgeUnit;
    }, _this, 0.25] call CBA_fnc_waitAndExecute;
  }
] call zen_custom_modules_fnc_register;

[
  "Halloween",
  "Spawn Security (Tents)",
  {
    ["halloween_spawnEffect", _this] call CBA_fnc_globalEvent;
    [{
      params ["_pos"];
      [_pos, selectRandom halloween_loadouts, true] call halloween_fnc_spawnSurgeUnit;
    }, _this, 0.25] call CBA_fnc_waitAndExecute;
  }
] call zen_custom_modules_fnc_register;

halloween_sounds = [
    "01_first_contact",
    "01_from_behind",
    "01_front",
    "01_front_approaching",
    "01_left",
    "01_right",
    "01_turn_back",
    "02_oblivious_reveal",
    "02_i_have_been_your_puppeteer",
    "02_my_entertainment",
    "02_watching_on_the_brink",
    "03_alone_and_forsaken",
    "03_chilling_quiet_behind_you_normal",
    "03_chilling_quiet_behind_you_whisper",
    "03_do_not_remain_in_their_world",
    "03_embrace_the_void",
    "03_flicker_in_your_eye_normal",
    "03_fumble_in_the_dark",
    "03_hungers_for_your_every_breath",
    "03_immobilized",
    "03_never_alone",
    "03_no_gods_only_me",
    "03_relinquesh_earth",
    "03_run_if_you_still_can",
    "03_silence_is_your_terror",
    "03_the_hunt_is_on",
    "03_welcome_to_the_end",
    "03_you_cling",
    "04_approaching",
    "04_arriving",
    "04_first_seen_facility",
    "04_i_am_angry",
    "04_last_message",
    "04_third_message",
    "05_cursed_walls",
    "05_locked_doors_sins_of_science",
    "alone_never_hear_you_normal",
    "alone_never_hear_you_whisper"
];

halloween_sounds_available = +halloween_sounds;

[
  "Halloween",
  "playSound3D",
  {
    [
      "playSound3D",
      [
        ["COMBO", "Sound", [halloween_sounds_available, halloween_sounds_available, 0]]
      ],
      {
        params ["_values", "_args"];
        private _sound = _values select 0;
        private _unit = _args select 1;
        playSound3D [getMissionPath format ["audio\voice\%1.ogg", _sound], _unit, false, eyePos _unit, 5, 0.85, 80];
        halloween_sounds_available = halloween_sounds_available - [_sound];
      },
      {},
      _this
    ] call zen_dialog_fnc_create;
  }
] call zen_custom_modules_fnc_register;
