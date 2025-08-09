diag_log "start";
private _locations = ["location_coppermine", "location_hangar"];
private _intel_objectives = ["intel_coppermine", "intel_hangar"];
private _intel_places = "intel_places";


//fixme: implement other locations
private _index = 0;
diag_log _index;
private _location_layer = _locations select _index;
private _intel_layer = _intel_objectives select _index;

diag_log _location_layer;
diag_log _intel_layer;

private _hostagePosition = markerPos (selectRandom ((getMissionLayerEntities _location_layer) select 1));
//move guy and camera
diag_log format ["hostage position: %1", _hostagePosition];

hostage setPos _hostagePosition;
private _cameraPos = [_hostagePosition select 0, _hostagePosition select 1, _hostagePosition select 2];
camera setPosASL _cameraPos;


//move intel
private _intel_objects = ((getMissionLayerEntities _intel_layer) select 0);
private _intel_positions = ((getMissionLayerEntities _intel_places) select 1);
diag_log format ["move intel of layer %1 with objects: %2", _intel_layer, _intel_objects];
diag_log format ["to positions  layer %1 with objects: %2", _intel_places, _intel_positions];

{
 diag_log _x;
 private _marker = _intel_positions deleteAt (floor random (count _intel_positions));
 diag_log format ["intel: %1 at %2", _marker, markerPos _marker];
 _x setPos (markerPos _marker);
} forEach _intel_objects;
