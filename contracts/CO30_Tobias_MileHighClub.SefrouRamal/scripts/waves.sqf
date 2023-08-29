if !(isNil "tobias_waves_started") exitWith {};
tobias_waves_started = true;
 
tobias_fnc_findSpawn = {
    private _spawns = [
        getMarkerPos "spawn_1",
        getMarkerPos "spawn_2",
        getMarkerPos "spawn_3",
        getMarkerPos "spawn_4",
        getMarkerPos "spawn_5",
        getMarkerPos "spawn_6",
        getMarkerPos "spawn_7",
        getMarkerPos "spawn_8",
        getMarkerPos "spawn_9"
    ];

    private _spawns = _spawns select {
        private _spawn = _x;
        allPlayers findIf {
            _x distance _spawn < 400
        } == -1
    };

    selectRandom _spawns
};

tobias_fnc_selectGroup = {
    private _group = selectRandom [
        "CUP_O_TK_MILITIA_Demosquad",
        "CUP_O_TK_MILITIA_Patrol",
        "CUP_O_TK_MILITIA_ATTeam",
        "CUP_O_TK_MILITIA_Group"
    ];
    configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> _group
};

tobias_fnc_selectAttackPoint = {
    getMarkerPos selectRandom [
        "marker_6",
        "marker_7",
        "marker_8",
        "marker_9",
        "marker_14"
    ]
};

tobias_fnc_spawnGroup = {
    private _spawn = call tobias_fnc_findSpawn;
    if (isNil "_spawn") exitWith {};

    private _group = [_spawn, EAST, call tobias_fnc_selectGroup] call BIS_fnc_spawnGroup;
    _group addWaypoint [call tobias_fnc_selectAttackPoint, 0];
};

tobias_fnc_wave = {
    private _top = 1 + round random 1;
    for "_i" from 0 to _top do { 
        call tobias_fnc_spawnGroup;
    };
    tobias_waves = tobias_waves + 1;
    if (tobias_waves < 8) then {
        [{
            east countSide allUnits <= 6
        }, {
            [tobias_fnc_wave, [], 60 + random 300] call CBA_fnc_waitAndExecute;
        }] call CBA_fnc_waitUntilAndExecute;
    };
};

tobias_waves = 0;

[tobias_fnc_wave, [], 300] call CBA_fnc_waitAndExecute;