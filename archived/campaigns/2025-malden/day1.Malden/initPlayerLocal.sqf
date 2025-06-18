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
        removeUserActionEventHandler ["showMap", "Activate", mission_no_map];
    }] call CBA_fnc_waitUntilAndExecute;
}, {true}, {}, [], [0, 0, 0], 6] call ace_interact_menu_fnc_createAction;
[jump, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = ["TP", "Teleport to Plane", "", {
    player setPosASL getPosASL tp;
    mission_no_prone = addUserActionEventHandler ["MoveDown", "Activate", {
        disableUserInput true;
        disableUserInput false;
    }];
    mission_no_map = addUserActionEventHandler ["showMap", "Activate", {
        disableUserInput true;
        disableUserInput false;
    }];
}, { mission_tp_enable && {
    private _virtualLoad = 0;
    {
        _virtualLoad = _virtualLoad + (_x getVariable ["ace_movement_vLoad", 0]);
    } forEach [
        player,
        uniformContainer player,
        vestContainer player,
        backpackContainer player
    ];
    private _weight = (loadAbs player + _virtualLoad) * 0.1;
    ((round (_weight * (1/2.2046) * 100)) / 100) < 40
} }] call ace_interact_menu_fnc_createAction;
[tp_start, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;
