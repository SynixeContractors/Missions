{
    if !(isPlayer _x) then {
        _x enableSimulationGlobal false;
    };
} forEach allUnits;

mission_started = false;
mission_extracting = false;

[{
    if (daytime > 12.0 && !mission_started) then {
        mission_started = true;
        {
            _x enableSimulationGlobal true;
        } forEach allUnits;
    };
    if (daytime > 14.0 && !mission_extracting) then {
        mission_extracting = true;
        extract setFuel 1;
        escort_1 setFuel 1;
        escort_2 setFuel 1;
    };
}, 60] call CBA_fnc_addPerFrameHandler;
