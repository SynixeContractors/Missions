#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

waitUntil { time > 0 && { !isNull ( uiNamespace getVariable [ "RscDiary", displayNull ] ) } };

mission_markers = [
    "marker_head_offices",
    "marker_fob",
    "marker_presidential_palace"
];

(findDisplay 12) displayAddEventHandler ["MouseZChanged", {
    params ["_display", "_scroll"];
    private _scale = ctrlMapScale (_display displayCtrl 51);
    hintSilent format [":: %1", _scale];
    {
        _x setMarkerAlphaLocal linearConversion [0, 0.05, _scale, 1, 0, true];
    } forEach mission_markers;
}];
