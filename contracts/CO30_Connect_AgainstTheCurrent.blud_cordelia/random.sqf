//camps
diag_log "camps";
_positions = (getMissionLayerEntities "camplocations") select 0;

diag_log _positions;

_selectedPosition1 = selectRandom _positions;
_positions deleteAt (_positions find _selected_position1);
{
  _pos = [_selectedPosition1, 2, 15, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "camp1") select 0);

diag_log _positions;

_selectedPosition1 = selectRandom _positions;
_positions deleteAt (_positions find _selected_position1);
{
  _pos = [_selectedPosition1, 2, 15, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "camp2") select 0);

diag_log _positions;

diag_log "mortars";
//mortars


_positions = (getMissionLayerEntities "mortarlocations") select 0;

diag_log _positions;

_selectedPosition2 = selectRandom _positions;
_positions deleteAt (_positions find _selected_position2);
{
  _pos = [_selectedPosition2, 1, 25, 1, 0, 10, 0] call BIS_fnc_findSafePos;
  diag_log _pos;
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "mortar1") select 0);

diag_log _positions;

_selectedPosition2 = selectRandom _positions;
_positions deleteAt (_positions find _selected_position2);
{
  _pos = [_selectedPosition2, 1, 25, 1, 0, 10, 0] call BIS_fnc_findSafePos;
  diag_log _pos;
  _x setPos [_pos select 0, _pos select 1, 0];
} forEach ((getMissionLayerEntities "mortar2") select 0);

diag_log _positions;
