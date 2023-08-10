params ["_obj"];

_statement = {
    params ["_target", "_player", "_params"];

    [stavrou_1, "stavrouBriefing"] remoteExec ["say3D"]; // play voiceover for everyone
    [stavrou_1, true] remoteExec ["setRandomLip"];

    // check if we already added map markers and transcript
    // if not, add them 
    // this is here in case people repeat the briefing
    if (!stavrouBriefingAdded) then {
        ["Briefing Markers"] remoteExecCall ["FARE_fnc_mapMarkers", 2]; // run map marker update only on server 
        remoteExecCall ["FARE_fnc_transcript"]; // add transcript for everyone 

        // after adding transcript and map markers, prevent additional runs
        stavrouBriefingAdded = true;
        publicVariable "stavrouBriefingAdded";
    };
};

_action = [
    "BriefingAction", // name
    "Start the Briefing!", // name shown in menu
    "", // icon
    _statement, // statement
    {true}, // condition
    {}, // children code
    [_obj], // parameters
    [0,0,0], // position
    3 // distance
] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;