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

["Emerald", "Intro Players", {
    if (missionNamespace getVariable ["intro", false]) exitWith {
        ["ERROR: Intro in progress"] call zen_common_fnc_showMessage;
    };
    ["Intro Players", [
        // ["LIST", "Players", [_players, _names]]
        ["OWNERS"]
    ], {
        params ["_values"];
        _values params ["_selection"];
        _selection params ["","","_players"];
        ["intro_setup", [_players]] call CBA_fnc_localEvent;
    }] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["intro_setup", {
    params ["_players"];
    missionNamespace setVariable ["intro", true, true];
    mission_plane = createVehicle ["C_Plane_Civil_01_racing_F", [6585.62,1612.67,335.354], [], 0, "FLY"];
    publicVariable "mission_plane";
    private _pilot = group player createUnit ["Aegis_C_Man_CargoPilot_tna_F", [0,0,0], [], 0, "NONE"];
    _pilot enableSimulationGlobal false;
    _pilot moveInAny mission_plane;
    _pilot disableAI "PATH";
    _pilot disableAI "MOVE";
    {
        _x moveInAny mission_plane;
        ["intro_music", [], _x] call CBA_fnc_targetEvent;
    } forEach _players;
    ["intro_start", [mission_plane], mission_plane] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

["intro_music", {
    playMusic "CactusIntro";
}] call CBA_fnc_addEventHandler;
