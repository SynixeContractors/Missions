params ["_object"];
private _effects = _object getVariable ["mission_effects", []];
{
    deleteVehicle _x;
} forEach _effects;
_object setVariable ["mission_effects", []];
