params ["_group", ["_spacing", 4]];

diag_log _group;

private _units = units _group;
diag_log format ["units = %1, spacing = %2", _units, _spacing];
private _counter = 0;  

{
  private _unit = _x;
  diag_log format ["counter = %1 with %2: scheduling %3 of type %4",_counter, (_counter/_spacing), _unit];
  [{moveout ((_x select 2) select 0);}, [_unit], (_counter/_spacing)] call CBA_fnc_waitAndExecute;
  _counter = _counter + 1;
} forEach _units;
