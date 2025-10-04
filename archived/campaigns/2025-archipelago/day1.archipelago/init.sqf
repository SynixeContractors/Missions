flight_intro = compile preprocessFileLineNumbers "flight_intro.sqf";
flight_outro = compile preprocessFileLineNumbers "flight_outro.sqf";

["intro_start", {
    0 spawn flight_intro;
}] call CBA_fnc_addEventHandler;

["outro_start", {
    0 spawn flight_outro;
}] call CBA_fnc_addEventHandler;
