#include "..\..\script_component.hpp"

grenade_helper hideObject true;
{
    [_x, false] call FUNC(layerToggle);
} forEach [
    "Grenades - Target 1",
    "Grenades - Target 2"
];
