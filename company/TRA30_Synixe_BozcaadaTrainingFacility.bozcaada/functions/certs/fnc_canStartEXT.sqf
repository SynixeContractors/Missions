#include "..\..\script_component.hpp"

addMissionEventHandler ["ExtensionCallback", {
    params ["_name", "_func"];
    if (_name != "crate") exitWith {};
    switch (_func) do {
        case "ping:ok": {
            missionNamespace setVariable [QEGVAR(certs,canStart), true, true];
        };
        case "ping:err": {
            missionNamespace setVariable [QEGVAR(certs,canStart), false, true];
        };
    };
}];
