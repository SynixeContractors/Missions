#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

["mission_applyDamage", {
    _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

"cbrn_zone_0" setMarkerAlpha 0;
"cbrn_zone_1" setMarkerAlpha 0;
"cbrn_zone_2" setMarkerAlpha 0;
"cbrn_zone_3" setMarkerAlpha 0;
"cbrn_zone_4" setMarkerAlpha 0;
"cbrn_zone_5" setMarkerAlpha 0;
