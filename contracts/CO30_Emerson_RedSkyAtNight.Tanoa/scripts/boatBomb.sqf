// make sure radio speaker is enabled 
[bombWorker, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for objects
[group bombWorker, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for groups
[bombWorker, true] remoteExec ["enableSimulationGlobal", 2]; // server only

// play radio message
bombWorker globalRadio "radioBomb";

// add transcript for everyone
_transcript = "Hey! Guys? Hello? Can you hear me? Is this the right frequency for security? We've got a bit of a situation here. We were inspecting one the boats here that docked late last night and we found a suspicious looking pile next to some barrels. Buddy of mine is freaking out thinking its a bomb, but I'm not so sure. Can you guys come check it out? It's the trawler docked in the center of the port.";
[_transcript] remoteExecCall ["FARE_fnc_transcript"];

// reveal hidden planks that lead onto back of boat
_planks = (getMissionLayerEntities "Trawler Ramp") select 0;
{
    [_x, true] remoteExec ["enableSimulationGlobal", 2]; // server only
    [_x, false] remoteExec ["hideObjectGlobal", 2]; // server only
} forEach _planks;

// move IED into position
ied attachTo [iedReference, [0,0,0]];