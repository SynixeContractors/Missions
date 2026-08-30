params [
    ["_unit", objNull, [objNull]]
];

if (isNil "CBRN_Zones") exitWith { false };

CBRN_Zones findIf {
    _x params ["_marker", "", "", "_active"];

    _active && { _unit inArea _marker }
} != -1
