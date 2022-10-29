// Cleanup previous cameras

{
	camDestroy _x;
} forEach halloween_cameras;

// Control Room
private _cam_control = "camera" camCreate [0,0,0];
_cam_control cameraEffect ["Internal", "Back", "control"];
_cam_control camSetFov 1;
_cam_control setPosASL (getPosASL cam_control);
_cam_control setVectorDirAndUp [vectorDir cam_control, vectorUp cam_control];
halloween_cameras pushBackUnique _cam_control;

// Containment Room
private _cam_containment = "camera" camCreate [0,0,0];
_cam_containment cameraEffect ["Internal", "Back", "contain"];
_cam_containment camSetFov 1;
_cam_containment setPosASL (getPosASL cam_containment);
_cam_containment setVectorDirAndUp [vectorDir cam_containment, vectorUp cam_containment];
halloween_cameras pushBackUnique _cam_containment;

// Entry
private _cam_entry = "camera" camCreate [0,0,0];
_cam_entry cameraEffect ["Internal", "Back", "entry"];
_cam_entry camSetFov 1;
_cam_entry setPosASL (getPosASL cam_entry);
_cam_entry setVectorDirAndUp [vectorDir cam_entry, vectorUp cam_entry];
halloween_cameras pushBackUnique _cam_entry;
