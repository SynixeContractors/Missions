//Gets random positions from the list of potential positions for the hvt

_selectedPosition = selectRandom ((getMissionLayerEntities "HVT Positions") select 0);

//Sets position and direction of hvt
hvt setPosASL (getPosASL _selectedPosition);
hvt setDir (getDir _selectedPosition);

//Gets random positions from the list of potential positions for intel laptop

_selectedPosition = selectRandom ((getMissionLayerEntities "Laptop Positions") select 0);

//Sets position and direction of intel laptop
intel_laptop setPosASL (getPosASL _selectedPosition);
intel_laptop setDir (getDir _selectedPosition);