#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

["mission_applyDamage", {
    _this call ace_medical_fnc_addDamageToUnit;
}] call CBA_fnc_addEventHandler;

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

if (isNil "APR_Stamina_PFH") then {

    APR_Stamina_PFH = [
        {
            {
                private _unit = _x;

                private _hasAPR = [_unit] call Nibbles_fnc_hasAPR;
                private _last = _unit getVariable ["APR_LastState", false];

                if !(_hasAPR isEqualTo _last) then {
                    _unit setVariable ["APR_LastState", _hasAPR];
                };

                if (_hasAPR) then {
                    [_unit, -0.6] call ace_medical_status_fnc_adjustOxygenSaturation;
                };

                if (!_hasAPR) then {
                    [_unit, +0.01] call ace_medical_status_fnc_adjustOxygenSaturation;
                };

            } forEach allUnits;
        },
        2
    ] call CBA_fnc_addPerFrameHandler;
};

"cbrn_zone_0" setMarkerAlpha 0;
"cbrn_zone_1" setMarkerAlpha 0;
"cbrn_zone_2" setMarkerAlpha 0;
"cbrn_zone_3" setMarkerAlpha 0;
"cbrn_zone_4" setMarkerAlpha 0;
"cbrn_zone_5" setMarkerAlpha 0;
