#include "do_not_edit\script_component.hpp"

[{
    CBA_missionTime > 5
},{
    call compile preprocessFileLineNumbers "loot.sqf";
}] call CBA_fnc_waitUntilAndExecute;
