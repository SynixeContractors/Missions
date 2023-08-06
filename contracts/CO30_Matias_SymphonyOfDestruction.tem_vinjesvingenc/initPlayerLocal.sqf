#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"


[
  {time > 1},
  {
    execVM "scripts\detector.sqf";
  }
] call CBA_fnc_waitUntilAndExecute;
