#include "..\..\..\script_component.hpp"

PREP_RANGE(grenades,instructions);

grenade_helper hideObject true;
{
    [_x, false] call FUNC(layerToggle);
} forEach [
    "Grenades - Target 1",
    "Grenades - Target 2"
];
