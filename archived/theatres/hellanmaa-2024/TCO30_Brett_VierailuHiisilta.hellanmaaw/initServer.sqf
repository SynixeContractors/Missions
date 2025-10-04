[{
    {
        _x params ["_area", "_objects"];
        if ({
            _x inArea _area
        } count allPlayers > 0) then {
            ["mission_stun", [_objects]] call CBA_fnc_globalEvent;
        }
    } forEach [
        [stun_area_1, [stun_1, stun_2, stun_3]],
        [stun_area_2, [stun_4, stun_5]]
    ];
}, 3] call CBA_fnc_addPerFrameHandler;
