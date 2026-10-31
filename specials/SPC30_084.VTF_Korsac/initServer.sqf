[
    "Overworld",
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
    "Foxtrot",
    "Golf",
    "Hotel",
    "India",
    "Juliet",
    "Kilo",
    "Lima",
    "Mike",
    "November",
    "Oscar",
    "Papa",
    "Quebec",
    "Romeo",
    "Sierra",
    "Tango"
] apply {
    private _layer = toLower _x;
    private _objects = (getMissionLayerEntities _x) select 0;
    {
        _x setVariable ["mission_layer", _layer, true];
        _x hideObjectGlobal true;
    } forEach _objects;
    missionNamespace setVariable [format ["mission_layer_%1", _layer], _objects, true];
};

missionNamespace setVariable ["mission_layer_check", true, true];

missionNamespace setVariable ["mission_fry_yelling", false];

["mission_final_speech", {
    missionNamespace setVariable ["mission_fry_yelling", true];
}] call CBA_fnc_addEventHandler;

[{
    if (missionNamespace getVariable ["mission_fry_yelling", false]) exitWith {};
    if !(alive russel_final) exitWith {};
    private _say = selectRandom ["russel_overworld_1", "russel_overworld_2", "russel_overworld_3", "russel_overworld_4"];
    ["mission_say", [russel_final, _say, "overworld"]] call CBA_fnc_globalEvent;
}, 9] call CBA_fnc_addPerFrameHandler;
