// make sure radio speaker is enabled 
["FARE_enableSimulation", [bombWorker], bombWorker] call CBA_fnc_targetEvent;

// play radio message
["FARE_radioMessage", [bombWorker, "radioBomb"]] call CBA_fnc_globalEvent;

// add transcript for everyone
["FARE_transcript", ["boatBomb"]] call CBA_fnc_globalEvent;

// reveal hidden planks that lead onto back of boat
{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
} forEach ((getMissionLayerEntities "Trawler Ramp") select 0);

// move IED into position
ied attachTo [iedReference, [0,0,0]];