#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

["ace_medicalMenuOpened", {
    params ["", "_other", "_display"];
    if (group ace_player == group _other) exitWith {};
    (_display displayCtrl (1210)) ctrlSetText "";
}] call cba_fnc_addEventHandler;
