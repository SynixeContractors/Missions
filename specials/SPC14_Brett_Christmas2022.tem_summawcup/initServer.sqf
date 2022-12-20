#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initServer.sqf"

[{
    CBA_missionTime > 5
},{
    call compile preprocessFileLineNumbers "loot.sqf";
}] call CBA_fnc_waitUntilAndExecute;
