plane_pos = getPosASL spawn_plane;

[{
    spawn_plane setPosASL plane_pos;
}] call CBA_fnc_addPerFrameHandler;
