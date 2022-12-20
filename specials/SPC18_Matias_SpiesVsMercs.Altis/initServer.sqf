#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initServer.sqf"

// {tag}_fnc_{name}

mission_fnc_victoryHandler = compile preprocessFileLineNumbers "victory_handler.sqf";

mission_victoryHandlerPFH = [{
    call mission_fnc_victoryHandler;
}, 3] call CBA_fnc_addPerFrameHandler;
