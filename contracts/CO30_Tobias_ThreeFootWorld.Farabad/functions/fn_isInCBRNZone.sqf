params [
    ["_unit", objNull, [objNull]]
];

if (isNil "CBRN_Zones") exitWith { false };

{
    private _marker    = _x#0;
    private _radius    = _x#1;
    private _intensity = _x#2;
    private _active    = _x#3;

    if (_active) then {
        if (_unit inArea _marker) exitWith { true };
    };
} forEach CBRN_Zones;

false
