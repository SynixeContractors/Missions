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
    [officer, "BRIEFING_POINT_LEFT", "ASIS"] call BIS_fnc_ambientAnim;
    ["mission_toggleLip", [officer, true] ] call CBA_fnc_globalEvent;
    0 spawn {
        // Slide 1 - The Base
        ["slide1.jpg"] call synixe_spectator_fnc_switchScreen;
        sleep 40;
        // Slide 2 - Locals
        ["slide2.jpg"] call synixe_spectator_fnc_switchScreen;
        sleep 7;
        // Slide 3 - The Base, Night
        ["slide3.jpg"] call synixe_spectator_fnc_switchScreen;
        sleep 5;
        // Slide 4 - Annotated Map
        ["slide4.jpg"] call synixe_spectator_fnc_switchScreen;
        sleep 25;
        ["\x\synixe\addons\spectator\ui\screen_disabled_co.paa"] call synixe_spectator_fnc_switchScreen;
        officer call BIS_fnc_ambientAnim__terminate;
        ["mission_toggleLip", [officer, false] ] call CBA_fnc_globalEvent;
    };
}] call CBA_fnc_addEventHandler;
