private _selectedPosition1 = selectRandom ((getMissionLayerEntities "intel_locations") select 0);

laptop setPosASL getPosASL _selectedPosition1;

[laptop, [0,0,0]] call BIS_fnc_setObjectRotation;

