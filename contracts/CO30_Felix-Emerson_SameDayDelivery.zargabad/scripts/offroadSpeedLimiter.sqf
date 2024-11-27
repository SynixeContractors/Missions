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
    if (surfaceType (getPos _vehicle) in ["#ZRBeton", "#ZRDlazbaOld"]) then {
        continue;
    };
    private _speed = speed _vehicle;
    private _max = 60; // Replace 6 with the m/s you want to limit to
    if (_speed > _max) then {
      _vehicle setVelocity ((velocity _vehicle) vectorMultiply ((_max / _speed) - 0.0001));
    };
}] call CBA_fnc_addPerFrameHandler;
