mission_fnc_heli1_intro = compile preprocessFileLineNumbers "unitCapture\heli1_intro.sqf";
mission_fnc_heli2_intro = compile preprocessFileLineNumbers "unitCapture\heli2_intro.sqf";
mission_fnc_heli3_intro = compile preprocessFileLineNumbers "unitCapture\heli3_intro.sqf";

mission_intro_events = [
    [267, heli1, "PickupOne"],
    [316, heli2, "PickupTwo"],
    [344, heli3, "PickupThree"],
    [449, heli1, "LandingOne"],
    [491, heli2, "LandingTwo"],
    [518, heli3, "LandingThree"]
];

["mission_intro", {
    intro_start = CBA_missionTime;
    0 spawn mission_fnc_heli1_intro;
    0 spawn mission_fnc_heli2_intro;
    0 spawn mission_fnc_heli3_intro;
    {
        _x allowDamage false;
    } forEach allPlayers;
    {
        [{
            params ["", "_obj", "_sound"];
            ["mission_say3d", [driver _obj, _sound, 3]] call CBA_fnc_globalEvent;
        }, _x, _x select 0] call CBA_fnc_waitAndExecute;
    } forEach mission_intro_events;
}] call CBA_fnc_addEventHandler;
