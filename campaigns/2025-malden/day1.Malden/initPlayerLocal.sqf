#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

mission_map_markers = [
    "map_hospital"
];

player enableSimulationGlobal false;
player allowDamage false;

player setUnitFreefallHeight 10000;

waitUntil { time > 0 && { !isNull ( uiNamespace getVariable [ "RscDiary", displayNull ] ) } };
(findDisplay 12) displayAddEventHandler ["MouseZChanged", {
    [{
        params ["_display"];
        private _alpha = parseNumber ((ctrlMapScale (_display displayCtrl 51)) <= 0.17);
        {
            _x setMarkerAlphaLocal _alpha;
        } forEach mission_map_markers;
    }, _this] call CBA_fnc_execNextFrame;
}];

private _action = ["Jump", "Jump", "", {
    player setUnitFreefallHeight -1;
    player setPosASL getPosASL jump_point;
    player setDir getDir jump_point;
    setViewDistance 8000;
    [{ (getPosASL player) select 2 < 500 }, {
        setViewDistance -1;
        player allowDamage true;
    }] call CBA_fnc_waitUntilAndExecute;
}, {true}] call ace_interact_menu_fnc_createAction;
[jump, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

waitUntil { time > 3 };
player setPosASL start_pos;
player enableSimulationGlobal true;
