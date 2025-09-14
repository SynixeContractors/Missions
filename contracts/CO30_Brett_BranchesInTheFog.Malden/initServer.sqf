private _defense = [[independent, blufor]] call ace_missile_defense_fnc_createSystem;

[_defense, tracker_mobile_1] call ace_missile_defense_fnc_registerTracker;
[_defense, tracker_mobile_2] call ace_missile_defense_fnc_registerTracker;
[_defense, tracker_dome] call ace_missile_defense_fnc_registerTracker;

[_defense, launcher_1] call ace_missile_defense_fnc_registerLauncher;
[_defense, launcher_2] call ace_missile_defense_fnc_registerLauncher;
[_defense, launcher_3] call ace_missile_defense_fnc_registerLauncher;
[_defense, launcher_4] call ace_missile_defense_fnc_registerLauncher;

mission_uploads = 0;

["mission_cancel_upload", {
    params ["_handle"];
    [_handle] call CBA_fnc_removePerFrameHandler;
}] call CBA_fnc_addEventHandler;

["mission_briefing", {
    ["mission_start_anim", [officer, "BRIEFING_POINT_LEFT", "ASIS"]] call CBA_fnc_globalEvent;
    ["mission_toggleLip", [officer, true] ] call CBA_fnc_globalEvent;
    0 spawn {
        // Slide 1 - The Base
        ["mission_switchScreen", ["slide1.jpg"]] call CBA_fnc_globalEvent;
        sleep 40;
        // Slide 2 - Locals
        ["mission_switchScreen", ["slide2.jpg"]] call CBA_fnc_globalEvent;
        sleep 7;
        // Slide 3 - The Base, Night
        ["mission_switchScreen", ["slide3.jpg"]] call CBA_fnc_globalEvent;
        sleep 5;
        // Slide 4 - Annotated Map
        ["mission_switchScreen", ["slide4.jpg"]] call CBA_fnc_globalEvent;
        sleep 25;
        ["mission_switchScreen", ["\x\synixe\addons\spectator\ui\screen_disabled_co.paa"]] call CBA_fnc_globalEvent;
        ["mission_toggleLip", [officer, false] ] call CBA_fnc_globalEvent;
        ["mission_stop_anim", [officer]] call CBA_fnc_globalEvent;
    };
}] call CBA_fnc_addEventHandler;
