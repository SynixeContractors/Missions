#include "..\..\script_component.hpp"

if !(hasInterface) then {
    EGVAR(certs,canStartPFH) = [{
        EXT_CRATE callExtension ["ping", []];
    }, 10] call CBA_fnc_addPerFrameHandler;
};
