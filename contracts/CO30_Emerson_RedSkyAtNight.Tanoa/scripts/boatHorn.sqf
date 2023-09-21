params ["_obj"];

if (isServer) then {
    playSound3D [
        getMissionPath "sounds\boatHorn.ogg", 
        vehicle _obj, 
        false, 
        getPosASL (vehicle _obj), 
        5, 
        1, 
        0
    ];
};
true