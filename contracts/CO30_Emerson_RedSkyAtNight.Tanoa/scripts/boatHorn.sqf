params ["_obj"];

if (isServer) then {
    playSound3D [
        getMissionPath "sounds\boatHorn.ogg", 
        vehicle this, 
        false, 
        getPosASL (vehicle this), 
        5, 
        1, 
        0
    ];
};