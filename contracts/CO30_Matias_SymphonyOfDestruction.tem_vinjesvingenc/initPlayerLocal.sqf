#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

mission_fnc_detector = compile preprocessFileLineNumbers "scripts\detector.sqf";

[
  {time > 1},
  {
    call mission_fnc_detector;
  }
] call CBA_fnc_waitUntilAndExecute;
