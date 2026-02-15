diag_log "unlocking";
private _targetpos = getPosASL stonebreak;

private _ps2 = "#particlesource" createVehicleLocal getPosATL stonebreak;
_ps2 setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 1, 1], "", "Billboard",
	1, 5, [0, 0, 1], [0, 0, 1.5], 0, 1, 1, 0.5, [1.75,2,3,4.5], // timerPeriod → size
	[[1,1,1,0], [1,1,1,0.5], [1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
	[0.5,0.5], 0, 0, "", "", _ps2];
_ps2 setParticleRandom [0.5, [1, 1, 0.4], [0, 0, 0.5], 0, 0.125, [0, 0, 0, 0], rad 30, 0];
_ps2 setDropInterval 0.1;


20 setOvercast 0.5;
20 setLightnings 0.2;

deleteVehicle stonebreak;

{
    private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", _targetpos];
    [_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
}
