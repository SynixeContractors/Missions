#include "..\script_component.hpp"

player addItem "ItemMap";
player assignItem "ItemMap";

{
    call compile preprocessFile format ["functions\%1\fnc_playerInit.sqf", _x];
} forEach [
    "ranges",
    "rolearea",
    "vr"
];
