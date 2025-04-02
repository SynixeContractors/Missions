start_pos = getPosASL player;

spawn_plane enableSimulation false;
spawn_plane setPhysicsCollisionFlag true;

[{
    private _pos = getPosASL spawn_plane;
    _pos set [2, (_pos select 2) + 8];
    sound_plane setPosASL _pos;
}] call CBA_fnc_addPerFrameHandler;
