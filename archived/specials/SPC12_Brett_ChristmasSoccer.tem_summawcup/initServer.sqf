mission_green = 0;
mission_red = 0;

[{
    if !(ball inArea playarea) then {
        ball setPos (getPos playarea);
    };

    if (ball inArea greengoal) then {
        mission_red = mission_red + 1;
        ["greengoal", [mission_green, mission_red]] call CBA_fnc_globalEvent;
        ball setPos (getPos playarea);
    };

    if (ball inArea redgoal) then {
        mission_green = mission_green + 1;
        ["redgoal", [mission_green, mission_red]] call CBA_fnc_globalEvent;
        ball setPos (getPos playarea);
    };
}] call CBA_fnc_addPerFrameHandler;

{
    _x allowDamage false;
} forEach allMissionObjects "";
