params [
    ["_marker", "", [""]],
    ["_radius", -1, [0]],
    ["_intensity", 1, [0]],
    ["_active", true, [true]]
];

if (_marker isEqualTo "") exitWith {
    diag_log "CBRN ERROR: cbrnZone called with empty marker name.";
    objNull
};

if (isNil "CBRN_Zones") then {
    CBRN_Zones = [];
};

private _existing = CBRN_Zones select { _x#0 == _marker };
if (!(_existing isEqualTo [])) exitWith {
    _existing#0
};

if (_radius < 0) then {
    _radius = (getMarkerSize _marker)#0;
};

private _zone = [
    _marker,
    _radius,
    _intensity,
    _active
];

CBRN_Zones pushBack _zone;

_zone
