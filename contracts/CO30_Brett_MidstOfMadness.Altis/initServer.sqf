mission_sides = {
    west setFriend [resistance, 1 max (0.4 + round random 1)];
    east setFriend [resistance, round random 1];
    [{ call mission_sides }, [], 300 + random 300] call CBA_fnc_waitAndExecute;
};

call mission_sides;
