#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

// scripts
FARE_fnc_rooftopAccess = compile preprocessFileLineNumbers "scripts\rooftopAccess.sqf";
FARE_fnc_boatHorn = compile preprocessFileLineNumbers "scripts\boatHorn.sqf";
FARE_fnc_fakeShipment = compile preprocessFileLineNumbers "scripts\fakeShipment.sqf";
FARE_fnc_mainAttack = compile preprocessFileLineNumbers "scripts\mainAttack.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";
FARE_fnc_boatBomb = compile preprocessFileLineNumbers "scripts\boatBomb.sqf";
FARE_fnc_crateFall = compile preprocessFileLineNumbers "scripts\crateFall.sqf";
FARE_fnc_drugDeal = compile preprocessFileLineNumbers "scripts\drugDeal.sqf";

// rooftop access 
[rooftopTrigger] call FARE_fnc_rooftopAccess;