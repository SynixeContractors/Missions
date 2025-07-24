//camps
diag_log "camps";
private _positions = nil;
private _selectedPosition1 = nil;
private _selectedPosition2 = nil;

_positions = (getMissionLayerEntities "camplocations") select 0;

diag_log _positions;

_selectedPosition1 = _positions deleteAt (floor random (count _positions));
diag_log getPos _selectedPosition1;
{
  private _pos = [_selectedPosition1, 2, 15, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setDir (floor random 359);
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "camp1") select 0);

diag_log _positions;

_selectedPosition1 = _positions deleteAt (floor random (count _positions));
diag_log getPos _selectedPosition1;
{
  private _pos = [_selectedPosition1, 2, 15, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setDir (floor random 359);
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "camp2") select 0);

diag_log _positions;

diag_log "mortars";
//mortars


_positions = (getMissionLayerEntities "mortarlocations") select 0;

diag_log _positions;

_selectedPosition2 = _positions deleteAt (floor random (count _positions));
diag_log getPos _selectedPosition2;
{
  private _pos = [_selectedPosition2, 1, 25, 1, 0, 10, 0] call BIS_fnc_findSafePos;
  _x setDir (floor random 359);
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "mortar1") select 0);

diag_log _positions;

_selectedPosition2 = _positions deleteAt (floor random (count _positions));
diag_log getPos _selectedPosition2;
{
  private _pos = [_selectedPosition2, 1, 25, 1, 0, 10, 0] call BIS_fnc_findSafePos;
  _x setDir (floor random 359);
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "mortar2") select 0);

diag_log _positions;
