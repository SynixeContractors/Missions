#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"


[{ time > 1 }, { call compile preprocessFileLineNumbers "chemical.sqf"; }] call CBA_fnc_waitUntilAndExecute;

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

bar_start = [9112.872, 4111.553, 0.368];
bar_end = [9113.718, 4110.168, 0.370];

["bar_move", {
    // Move the `bar` from start to end of 2 seconds
    0 spawn {
        private _time = 2;
        private _timeStart = time;
        private _timeEnd = _timeStart + _time;
        private _timeElapsed = 0;
        private _timeProgress = 0;
        while {_timeElapsed < _time} do {
            _timeElapsed = time - _timeStart;
            _timeProgress = _timeElapsed / _time;
            _pos = vectorLinearConversion [0, 1, _timeProgress, bar_start, bar_end, true];
            bar setPos _pos;
            sleep 0.01;
        };
        bar setPos bar_end;
    };
}] call CBA_fnc_addEventHandler;

if (missionNamespace getVariable ["bar_moved", false]) then {
    bar setPos bar_end;
};

private _action = ["Move", "Move", "", {
    ["bar_move"] call CBA_fnc_globalEvent;
    missionNamespace setVariable ["bar_action", false, true];
    0 spawn {
        sleep 2;
        missionNamespace setVariable ["bar_moved", true, true];
    };
}, {
    missionNamespace getVariable ["bar_action", true]
}] call ace_interact_menu_fnc_createAction;
[mug, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
