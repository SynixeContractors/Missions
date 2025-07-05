[server1, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;
[server2, true, [0, 1, 1], 0, true] call ace_dragging_fnc_setCarryable;


_selectedPosition1 = selectRandom ((getMissionLayerEntities "Server_1_Positions") select 0);
_selectedPosition2 = selectRandom ((getMissionLayerEntities "Server_2_Positions") select 0);

server1 setPosASL (getPosASL _selectedPosition1);
server1 setDir (getDir _selectedPosition1);

server2 setPosASL (getPosASL _selectedPosition2);
server2 setDir (getDir _selectedPosition2);