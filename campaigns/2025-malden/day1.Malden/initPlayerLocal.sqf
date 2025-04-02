#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

mission_map_markers = [
    "map_hospital"
];

player setUnitFreefallHeight 10000;
player allowDamage false;

mission_tp_enable = false;

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
        removeUserActionEventHandler ["MoveDown", "Activate", mission_no_prone];
    }] call CBA_fnc_waitUntilAndExecute;
}, {true}] call ace_interact_menu_fnc_createAction;
[jump, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = ["TP", "Teleport to Plane", "", {
    player setPosASL getPosASL tp;
}, { mission_tp_enable }] call ace_interact_menu_fnc_createAction;
[tp_start, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

mission_no_prone = addUserActionEventHandler ["MoveDown", "Activate", {
    disableUserInput true;
    disableUserInput false;
}];
