mission_fnc_victoryHandler = compile preprocessFileLineNumbers "victory_handler.sqf";

[{ CBA_missionTime > 5 }, {
    mission_victoryHandlerPFH = [{
        call mission_fnc_victoryHandler;
    }, 3] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
