params [
    ["_unit", objNull, [objNull]]
];

if (isNil "CBRN_Zones") exitWith { [] };

private _result = [];

{
    private _marker    = _x#0;
    private _active    = _x#3;

    if (_active && { _unit inArea _marker }) exitWith {
        _result = _x;
    };
} forEach CBRN_Zones;

_result
