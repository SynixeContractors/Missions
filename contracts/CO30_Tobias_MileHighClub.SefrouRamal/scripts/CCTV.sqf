while {true} do {

cam = "camera" camCreate [0,0,0]; 
cam cameraEffect ["Internal", "Back", "uavrtt"]; 
cam attachTo [uav, [0,0,0], "PiP0_pos"];
uav lockCameraTo [tgt, [0]]; 
addMissionEventHandler ["Draw3D", { 
    _dir =  
        (uav selectionPosition "PiP0_pos")  
            vectorFromTo  
        (uav selectionPosition "PiP0_dir"); 
    cam setVectorDirAndUp [ 
        _dir,  
        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0] 
    ]; 
}];

cam1 = "camera" camCreate [0,0,0]; 
cam1 cameraEffect ["Internal", "Back", "Camera1"];
cam1 attachTo [FLIR1, [0,0,0]];

cam2 = "camera" camCreate [0,0,0]; 
cam2 cameraEffect ["Internal", "Back", "Camera2"];
cam2 attachTo [FLIR2, [0,0,0]];

cam3 = "camera" camCreate [0,0,0]; 
cam3 cameraEffect ["Internal", "Back", "Camera3"];
cam3 attachTo [FLIR3, [0,0,0]];

cam4 = "camera" camCreate [0,0,0]; 
cam4 cameraEffect ["Internal", "Back", "Camera4"];
cam4 attachTo [FLIR4, [0,0,0]];

cam5 = "camera" camCreate [0,0,0]; 
cam5 cameraEffect ["Internal", "Back", "Camera5"];
cam5 attachTo [FLIR5, [0,0,0]];

cam6 = "camera" camCreate [0,0,0]; 
cam6 cameraEffect ["Internal", "Back", "Camera6"];
cam6 attachTo [FLIR6, [0,0,0]];

sleep 0.5;

};