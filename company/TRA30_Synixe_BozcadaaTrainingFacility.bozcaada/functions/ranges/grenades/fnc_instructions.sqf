#include "..\..\..\script_component.hpp"

0 spawn {
    private _start = getPos grenade_helper;
    instructor_grenades say "Grenades_Instruction";
    sleep 1;
    grenade_helper hideObject false;
    sleep 6.5;
    [grenades_timeline] spawn BIS_fnc_timeline_play;
    sleep 1.5;
    ["Grenades - Target 1", true] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 1", false] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 1", true] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 1", false] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 1", true] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 1", false] call MGFUNC(layerToggle);
    sleep 7.5;
    ["Grenades - Target 2", true] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 2", false] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 2", true] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 2", false] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 2", true] call MGFUNC(layerToggle);
    sleep 0.5;
    ["Grenades - Target 2", false] call MGFUNC(layerToggle);
    sleep 4;
    [grenades_timeline] call BIS_fnc_timeline_stop;
    grenade_helper hideObject true;
    grenade_helper setPos _start;
};
