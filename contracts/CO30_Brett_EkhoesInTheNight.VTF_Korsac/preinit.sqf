diag_log "Mission Pre Init";

if !(hasInterface) exitWith {};

mission_sources = createHashMap;

mission_delay = compile preprocessFileLineNumbers "initDelay.sqf";

["mission_delay", {
    _this call mission_delay;
}] call CBA_fnc_addEventHandler;

mission_military_channels = [];
mission_cellphone_channels = [];
mission_wifi_channels = [];

for "_i" from 1 to 99 do {
    private _freq = ["ACRE_PRC152", "default", _i, "frequencyTX"] call acre_api_fnc_getPresetChannelField;
    mission_military_channels pushBack [_freq, 150000];
};

for "_i" from 650 to 850 do {
    mission_cellphone_channels pushBack [_i, 100000];
};

for "_i" from 2350 to 2450 do {
    mission_wifi_channels pushBack [_i, 100000];
};

for "_i" from 4950 to 5050 do {
    mission_wifi_channels pushBack [_i, 100000];
};
