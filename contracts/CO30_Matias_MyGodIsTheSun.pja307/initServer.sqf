//Gets random positions from the list of potential positions for target 1

_selectedPosition = selectRandom ((getMissionLayerEntities "T1 Positions") select 0);

//Sets position and direction of target 1
T1 setPosASL (getPosASL _selectedPosition);
T1 setDir (getDir _selectedPosition);

//Gets random positions from the list of potential positions for target 2

_selectedPosition = selectRandom ((getMissionLayerEntities "T2 Positions") select 0);

//Sets position and direction of target 2
T2 setPosASL (getPosASL _selectedPosition);
T2 setDir (getDir _selectedPosition);

//Gets random positions from the list of potential positions for target 3

_selectedPosition = selectRandom ((getMissionLayerEntities "T3 Positions") select 0);

//Sets position and direction of target 3
T3 setPosASL (getPosASL _selectedPosition);
T3 setDir (getDir _selectedPosition);