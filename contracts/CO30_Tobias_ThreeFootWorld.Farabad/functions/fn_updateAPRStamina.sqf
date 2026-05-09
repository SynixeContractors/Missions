params ["_unit", "_hasAPR"];

private _target = if (_hasAPR) then { 0.6 } else { 1 };

_unit setAnimSpeedCoef _target;
_unit setVariable ["APR_StaminaCoef", _target];
