#include "..\script_component.hpp"

{
    call compile preprocessFile format ["functions\%1\fnc_playerInit.sqf", _x];
} forEach [
    "ranges",
    "rolearea",
    "vr"
];
