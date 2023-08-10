FARE_fnc_assaultAction = compile preprocessFileLineNumbers "scripts\assaultAction.sqf";
FARE_fnc_briefingAction = compile preprocessFileLineNumbers "scripts\briefingAction.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";
FARE_fnc_mapMarkers = compile preprocessFileLineNumbers "scripts\mapMarkers.sqf";
FARE_fnc_reinforcements = compile preprocessFileLineNumbers "scripts\reinforcements.sqf";

stavrouBriefingAdded = false;
publicVariable "stavrouBriefingAdded";

assaultStarted = false;
publicVariable "assaultStarted";