#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

["mission_alarm", {
    playSound "Alarm";
}] call CBA_fnc_addEventHandler;

["mission_hackAbort", {
    playSound "ACE_Javelin_Locked";
}] call CBA_fnc_addEventHandler;

["mission_extract", {
    playSound "SN_Flare_Fired_4";
}] call CBA_fnc_addEventHandler;
