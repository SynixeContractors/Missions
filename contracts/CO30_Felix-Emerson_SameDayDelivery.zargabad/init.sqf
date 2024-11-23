// event handlers
["FELIX_addBriefing", {
    params ["_title", "_text"];
    player createDiaryRecord ["Diary", [_title, _text]];
}] call CBA_fnc_addEventHandler;

["FELIX_checkDeliveries", {
    params ["_player"];
    [_player] call FELIX_fnc_checkDeliveries;
}] call CBA_fnc_addEventHandler;

["FELIX_hintSilent", {
    params ["_text"];
    hintSilent parseText format [_text];
}] call CBA_fnc_addEventHandler;
