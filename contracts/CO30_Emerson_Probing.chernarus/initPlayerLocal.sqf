#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

// -----------------------------------------------------------------

// init chemical detector and chemical damage for mission
// yes, I know it's execVM but it runs once at beginning of mission
[
  {time > 1},
  {
    execVM "scripts\chemicalDetector.sqf";
    execVM "scripts\chemicalDamage.sqf";
  }
] call CBA_fnc_waitUntilAndExecute;
