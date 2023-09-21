// make sure radio speaker is enabled 
["FARE_enableSimulation", [bombWorker], bombWorker] call CBA_fnc_targetEvent;

// play radio message
["FARE_radioMessage", [bombWorker, "radioBomb"]] call CBA_fnc_globalEvent;

// add transcript for everyone
_transcript = "Hey! Guys? Hello? Can you hear me? Is this the right frequency for security? We've got a bit of a situation here. We were inspecting one the boats here that docked late last night and we found a suspicious looking pile next to some barrels. Buddy of mine is freaking out thinking its a bomb, but I'm not so sure. Can you guys come check it out? It's the trawler docked in the center of the port.";
["FARE_transcript", [_transcript]] call CBA_fnc_globalEvent;

// reveal hidden planks that lead onto back of boat
_planks = (getMissionLayerEntities "Trawler Ramp") select 0;
{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
} forEach _planks;

// move IED into position
ied attachTo [iedReference, [0,0,0]];
true