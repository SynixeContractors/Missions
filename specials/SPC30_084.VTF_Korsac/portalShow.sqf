params ["_object"];

private _effectSize = 1.5;
private _effectOffset = [0,0,0];

private _effects = [];

private _effect = createVehicle ["#particlesource",getPosATL _object,[],0,"can_collide"];
_effect setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1,0],
    "",
    "Billboard",
    1,
    0.2,
    [0,0,0],
    [0,0,0],
    1,
    1.275,
    1,
    0,
    [_effectSize],
    [[0,0,0,0.0],[0,0,0,0.5],[0,0,0,0.0]],
    [1],
    0.1,
    0.05,
    "",
    "",
    "",
    0,
    false,
    0,
    []
];
_effect setParticleRandom [
    0,
    [0,0,0],
    [0,0,0],
    1,
    0.1,
    [0,0,0,0],
    0,
    0,
    1,
    0
];
_effect setDropInterval 0.01;
_effects pushback [_effect,0.01];

private _light = createVehicle ["#lightpoint",getPosATL _object,[],0,"can_collide"];
_light setlightambient [0.05,0.05,0.05]; 
_light setlightcolor [0.2,0.2,0.2];
_light setlightbrightness 200;
_light setLightAttenuation [0,100,100,0,0.1,1];
_light setlightdaylight true;
_effects pushback [_light,200];

private _sound = createSoundSource ["Sound_MemoryFragment", getPosATL _object, [], 0];
_effects pushback [_sound,0];

_object setVariable ["mission_effects", _effects];
