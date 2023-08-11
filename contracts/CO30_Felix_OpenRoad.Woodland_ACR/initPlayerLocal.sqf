#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[{
  {
    if !(local _x) then {
      continue;    
    };
    if (driver _x != ace_player) then {
      continue;    
    };
    private _speed = speed _x;
    private _max = 50; // Replace 5 with the m/s you want to limit to
    if (_speed > _max) then {
      _x setVelocity ((velocity _x) vectorMultiply ((_max / _speed) - 0.0001));
    };
  } forEach [truck1, truck2, truck3];
}] call CBA_fnc_addPerFrameHandler;