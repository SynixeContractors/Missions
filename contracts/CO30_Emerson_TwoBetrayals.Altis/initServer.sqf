FARE_fnc_assaultAction = compile preprocessFileLineNumbers "scripts\assaultAction.sqf";
FARE_fnc_briefingAction = compile preprocessFileLineNumbers "scripts\briefingAction.sqf";
FARE_fnc_transcript = compile preprocessFileLineNumbers "scripts\transcript.sqf";
FARE_fnc_mapMarkers = compile preprocessFileLineNumbers "scripts\mapMarkers.sqf";
FARE_fnc_reinforcements = compile preprocessFileLineNumbers "scripts\reinforcements.sqf";

// variable to track whether briefing has occurred
// used in briefingAction to ensure we don't add transcript and map markers more than once
stavrouBriefingAdded = false;
publicVariable "stavrouBriefingAdded";

// variable to track whether the FIA assault has started 
// used by a trigger set to skip FIA waypoints
assaultStarted = false;
publicVariable "assaultStarted";