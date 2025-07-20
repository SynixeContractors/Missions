_selectedPosition1 = selectRandom ((getMissionLayerEntities "badguy_pos") select 0);
_selectedPosition2 = selectRandom ((getMissionLayerEntities "goodguy_pos") select 0);
_selectedPosition3 = selectRandom ((getMissionLayerEntities "wiesel_pos") select 0);

{
  _pos = [_selectedPosition1, 1, 15, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "badguy_group") select 0);

{
  _pos = [_selectedPosition2, 1, 5, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "goodguy_group") select 0);


{
  _pos = [_selectedPosition3, 1, 50, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "wiesel_group") select 0);

goodguy setPosASL (getPosASL _selectedPosition2);
badguy setPosASL (getPosASL _selectedPosition1);
