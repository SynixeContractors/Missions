_positions = ((getMissionLayerEntities "camplocations") select 0);

diag_log _positions;

_selected_position1 = selectRandom _positions;

{
  _pos = [_selectedPosition1, 1, 15, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "camp1") select 0);


_positions deleteAt (_positions find _selected_position1);

diag_log _positions;


//_selectedPosition1 = selectRandom ((getMissionLayerEntities "camplocations") select 0);





