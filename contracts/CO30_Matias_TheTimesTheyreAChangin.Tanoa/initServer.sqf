//Gets random positions from the list of potential positions for target 1

_selectedPosition = selectRandom ((getMissionLayerEntities "Target positions") select 0);

//Sets position and direction of target 1
target setPosASL (getPosASL _selectedPosition);
target setDir (getDir _selectedPosition);