ekho_fnc_spawnEffect = {
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

ekho_fnc_spawnSurgeUnit = {
    params ["_pos", "_source"];
    private _clone = (createGroup east) createUnit ["O_Survivor_F", ASLtoATL _pos, [], 0, "CAN_COLLIDE"];
    private _loadout = getUnitLoadout _source;
    _clone setUnitLoadout _loadout;
    _clone setName name _source;
    _clone setFace face _source;
    _clone setSpeaker speaker _source;
    _clone setVariable ["ACE_name", name _source, true];
    _clone setVariable ["ACE_nameraw", name _source, true];
    _clone addEventHandler ["Killed", {
        params ["_clone", "_killer"];
        ["ekho_spawnEffect", [getPosASL _clone]] call CBA_fnc_globalEvent;
        deleteVehicle _clone;
    }];
    _clone
};

["ekho_spawnEffect", ekho_fnc_spawnEffect] call CBA_fnc_addEventHandler;

[
    "Ekho",
    "Spawn Ekho",
    {
        ["ekho_spawnEffect", _this] call CBA_fnc_globalEvent;
        [{
            params ["_pos"];
            [_pos, selectRandom units ekho_group] call ekho_fnc_spawnSurgeUnit;
        }, _this, 0.25] call CBA_fnc_waitAndExecute;
    }
] call zen_custom_modules_fnc_register;

[
    "Ekho",
    "Spawn Terrorist",
    {
        ["ekho_spawnEffect", _this] call CBA_fnc_globalEvent;
        [{
            params ["_pos"];
            [_pos, selectRandom units terrorist_group] call ekho_fnc_spawnSurgeUnit;
        }, _this, 0.25] call CBA_fnc_waitAndExecute;
    }
] call zen_custom_modules_fnc_register;

[
    "Ekho",
    "Spawn Contractor",
    {
        private _contractors = allPlayers select {alive _x };
        [
            "Spawn Contractor",
            [
                ["COMBO", "Contractor", [_contractors, _contractors apply {name _x}, 0]]
            ],
            {
                params ["_values", "_args"];
                private _unit = _values select 0;
                private _pos = _args select 0;
                ["ekho_spawnEffect", [_pos]] call CBA_fnc_globalEvent;
                [{
                    params ["_pos", "_source"];
                    private _clone = [_pos, _source] call ekho_fnc_spawnSurgeUnit;
                }, [_pos, _unit], 0.25] call CBA_fnc_waitAndExecute;
            },
            {},
            _this
        ] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;
