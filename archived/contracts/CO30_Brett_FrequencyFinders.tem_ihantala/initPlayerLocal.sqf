#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

missionNamespace setVariable ["#EM_FMin", 140];
missionNamespace setVariable ["#EM_FMax", 143];

missionNamespace setVariable ["#EM_SMin", -60];
missionNamespace setVariable ["#EM_SMax", -10];

[{
    private _values = [];
    {
        _x params ["_mhz", "_tower"];
        if (alive _tower) then {
            private _dir = player getDir _tower;
            private _looking = getDir player;
            private _error = abs (_looking - _dir);
            private _distance = (getPosASL player) distance (getPosASL _tower);
            private _strength = -80 + (((60 - ((_distance/400) * (_distance/400))) max 0) min 60) - _error;
            _values pushBack _mhz;
            _values pushBack _strength;
        };
        missionnamespace setVariable ["#EM_Values", _values];
    } forEach [[141.8,tower_a], [140.85,tower_b], [141.12,tower_c]];
}] call CBA_fnc_addPerFrameHandler;
