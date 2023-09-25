// run this in initServer.sqf

// get random position from list of potential positions
_selectedPosition = selectRandom ((getMissionLayerEntities "G1 positions") select 0);

// set position (and direction) of dude
G1 setPos (getPos _selectedPosition);
G1 setDir (getDir _selectedPosition);

// get random position from list of potential positions
_selectedPosition = selectRandom ((getMissionLayerEntities "G2 positions") select 0);

// set position (and direction) of dude
G2 setPos (getPos _selectedPosition);
G2 setDir (getDir _selectedPosition);

// get random position from list of potential positions
_selectedPosition = selectRandom ((getMissionLayerEntities "G3 positions") select 0);

// set position (and direction) of dude
G3 setPos (getPos _selectedPosition);
G3 setDir (getDir _selectedPosition);