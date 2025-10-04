// class names of road surfaces that shouldn't have penalty:
// "#ZRBeton"
// "#ZRDlazbaOld"

// per frame handler that limits speed when vehicle is offroad
[{
    private _vehicle = vehicle ace_player;
    if !(local _vehicle) then {
        continue;
    };
    if (driver _vehicle != ace_player) then {
        continue;
    };
    if (isOnRoad _vehicle) then {
        continue;
    };
    if (speed _vehicle < 60) then {
        continue;
    };
    if (surfaceType (getPos _vehicle) in ["#ZRBeton", "#ZRDlazbaOld"]) then {
        continue;
    };
    _vehicle setVelocity ((velocity _vehicle) vectorMultiply ((60 / speed _vehicle) - 0.0001));
}] call CBA_fnc_addPerFrameHandler;
