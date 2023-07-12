#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.1, 0.1, 0.1, -0.1], [1, 1, 0.8, 0.528],  [1, 0.2, 0, 0]];
"colorCorrections" ppEffectCommit 0;

waitUntil {time > 0};
setApertureNew [2, 5, 9, 0.8];