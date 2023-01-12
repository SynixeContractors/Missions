#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

call compile preprocessFileLineNumbers "initSystem.sqf";

private _channels = [];

for "_i" from 1 to 99 do {
    private _freq = ["ACRE_PRC152", "synixe", _i, "frequencyTX"] call acre_api_fnc_getPresetChannelField;
    _channels pushBack [_freq, 150000];
};

mission_sources set [netId tower1, _channels];
