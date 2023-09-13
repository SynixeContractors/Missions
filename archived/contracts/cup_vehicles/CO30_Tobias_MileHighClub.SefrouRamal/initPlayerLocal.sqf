#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

cam = "camera" camCreate [0,0,0]; 
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
cam1 attachTo [FLIR1, [0,0,0]];

cam2 = "camera" camCreate [0,0,0]; 
cam2 attachTo [FLIR2, [0,0,0]];

cam3 = "camera" camCreate [0,0,0]; 
cam3 attachTo [FLIR3, [0,0,0]];

cam4 = "camera" camCreate [0,0,0]; 
cam4 attachTo [FLIR4, [0,0,0]];

cam5 = "camera" camCreate [0,0,0]; 
cam5 attachTo [FLIR5, [0,0,0]];

cam6 = "camera" camCreate [0,0,0];
cam6 attachTo [FLIR6, [0,0,0]];

tobias_fnc_cctv = compile preprocessFileLineNumbers "scripts\CCTV.sqf";

call tobias_fnc_cctv;

["zen_curatorDisplayUnloaded", {
  [{
    call tobias_fnc_cctv;
  }, [], 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

[{
	"marker_16" setMarkerPosLocal uav;
}, 0.5] call CBA_fnc_addPerFrameHandler;
