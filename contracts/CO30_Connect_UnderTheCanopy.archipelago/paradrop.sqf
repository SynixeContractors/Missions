params ["_group", ["_spacing", 4]];

private _units = units _group;

{
  private _unit = _x;
  [{moveOut _this;}, _unit, (_forEachIndex/_spacing)] call CBA_fnc_waitAndExecute;
} forEach _units;
