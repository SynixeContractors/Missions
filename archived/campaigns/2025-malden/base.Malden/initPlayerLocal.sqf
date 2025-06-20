#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

mission_map_markers = [
    "map_hospital"
];

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
