diag_log "start";
private _locations = ["location_coppermine", "location_hangar", "location_ironmine"];
private _intel_objectives = ["intel_coppermine", "intel_hangar", "intel_ironmine"];
private _intel_places = "intel_places";


//fixme: implement other locations
private _index = floor random (count _locations);
diag_log format ["index = %1", _index];
private _location_layer = _locations select _index;
private _intel_layer = _intel_objectives select _index;

diag_log _location_layer;
diag_log _intel_layer;

private _hostagePosition = getPosASL (selectRandom ((getMissionLayerEntities _location_layer) select 0));
//move guy and camera
diag_log format ["hostage position: %1", _hostagePosition];

hostage setPosASL _hostagePosition;
private _cameraPos = [(_hostagePosition select 0)+2, _hostagePosition select 1, _hostagePosition select 2];
camera setPosASL _cameraPos;
private _execPos = [(_hostagePosition select 0)+2, (_hostagePosition select 1)+1, _hostagePosition select 2];
executioner setPosASL _execPos;



//move intel
private _intel_objects = ((getMissionLayerEntities _intel_layer) select 0);
private _intel_positions = ((getMissionLayerEntities _intel_places) select 0);
diag_log format ["move intel of layer %1 with objects: %2", _intel_layer, _intel_objects];
diag_log format ["to positions  layer %1 with objects: %2", _intel_places, _intel_positions];

{
 diag_log _x;
 private _marker = _intel_positions deleteAt (floor random (count _intel_positions));
 diag_log format ["intel: %1 at %2", _marker, getPosASL _marker];
 _x setPosASL (getPosASL _marker);
} forEach _intel_objects;
