private _selectedPosition1 = selectRandom ((getMissionLayerEntities "badguy_pos") select 0);
private _selectedPosition2 = selectRandom ((getMissionLayerEntities "goodguy_pos") select 0);
private _selectedPosition3 = selectRandom ((getMissionLayerEntities "wiesel_pos") select 0);

{
  private _pos = [_selectedPosition1, 1, 25, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "badguy_group") select 0);

{
  private _pos = [_selectedPosition2, 1, 25, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "goodguy_group") select 0);


{
  _pos = [_selectedPosition3, 3, 50, 1, 0, 20, 0] call BIS_fnc_findSafePos;
  _x setPos [_pos select 0, _pos select 1, 1];
} forEach ((getMissionLayerEntities "wiesel_group") select 0);

wiesel setPosASL (getPosASL _selectedPosition3);
goodguy setPosASL (getPosASL _selectedPosition2);
badguy setPosASL (getPosASL _selectedPosition1);
vip doMove (getPosASL wiesel);
