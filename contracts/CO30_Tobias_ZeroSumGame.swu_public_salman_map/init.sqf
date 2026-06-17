private _red = "#lightpoint" createVehicleLocal [0,0,0];
_red setLightColor [1,0,0];
_red setLightBrightness 0;
_red setLightAttenuation [0.1, 0, 100, 0];
_red attachTo [heli_1, [0, 2, -2]];

_green = "#lightpoint" createVehicleLocal [0,0,0];
_green setLightColor [0,1,0];
_green setLightBrightness 0;
_green setLightAttenuation [0.1, 0, 100, 0];
_green attachTo [heli_1, [0, 2, -2]];
