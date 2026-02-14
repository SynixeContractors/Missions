#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

waitUntil {!isNull(findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call mission_fnc_keypressed"];

mission_textOpen = false;
mission_messages = [];
mission_phone_volume = 1;
mission_noSound = false;

["mission_text", {
    params ["_profile", "_text"];
    if (_profile == profileName) exitWith {};
    mission_messages pushBack [_profile, _text];
    if !("SmartPhone" in magazines player) exitWith {};
    hint format ["%1: %2", _profile, _text];
    if (!visibleMap && !mission_noSound) then {
        playSound3D [getMissionPath "phone.ogg", player, false, getPosASL player, mission_phone_volume];
    };
}] call CBA_fnc_addEventHandler;

mission_fnc_keypressed = {
    params ["_display", "_key"];

    if !("SmartPhone" in magazines player) exitWith {false};
    if !(visibleMap) exitWith {false};

    if (_key == 35 && !mission_textOpen) exitWith { // H
        mission_textOpen = false;
        [
            "Send Message",
            [[
                "EDIT:MULTI",
                "Text",
                [""],
                true
            ]],
            {
                mission_textOpen = false;
                private _text = _this select 0 select 0;
                ["mission_text", [profileName, _text]] call CBA_fnc_globalEvent;
                mission_messages pushBack [profileName, _text];
            },
            {
                mission_textOpen = false;
            }
        ] call zen_dialog_fnc_create;
        private _display = uiNamespace getVariable ["zen_common_display", displayNull];
        _display displayAddEventHandler ["KeyDown", "_this call mission_fnc_clack"];
        false
    };

    if (_key == 36 && !mission_textOpen) exitWith { // J
        private _messages = "";
        {
            _messages = format ["%1%2: %3%4", _messages, _x select 0, _x select 1, endl];
        } forEach mission_messages;
        [
            "Message History",
            [[
                "EDIT:MULTI",
                "History",
                [_messages],
                true
            ]]
        ] call zen_dialog_fnc_create;
        false
    };
    false
};

mission_fnc_clack = {
    if (mission_noSound) exitWith {false};
    private _clacks = [1,1,2,0.25];
    private _clack = selectRandomWeighted _clacks;
    playSound3D [getMissionPath format ["clack%1.ogg", _clack], player, false, getPosASL player, mission_phone_volume];
    false
};
