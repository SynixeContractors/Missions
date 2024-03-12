#include "..\script_component.hpp"

{
    call compile preprocessFile format ["functions\%1\fnc_serverInit.sqf", _x];
} forEach [
    "ranges",
    "vr"
];
