mission_fnc_toggleLights = compile preprocessFileLineNumbers "fnc_toggleLights.sqf";

{
    private _lights = _markerPos nearObjects [_x, 100000];

    {
        _x switchLight _state;
    } forEach _lights;
} forEach [
    "Lamps_Base_F",
    "PowerLines_base_F",
    "House"
];

["ppoutage", true] call mission_fnc_toggleLights;

["pd1switch", {
    params ["_unit", "_state", "_hasGen"];
    if (_state != 1) exitWith {
        ["pd1outage", false] call mission_fnc_toggleLights;
    };
    ["pd1outage", _hasGen] call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;

["pd2switch", {
    params ["_unit", "_state", "_hasGen"];
    if (_state != 1) exitWith {
        ["pd2outage", false] call mission_fnc_toggleLights;
    };
    ["pd2outage", _hasGen] call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;

["pt1switch", {
    params ["_unit", "_state", "_hasGen"];
    if (_state != 1) exitWith {
        ["pt1outage", false] call mission_fnc_toggleLights;
    };
    ["pt1outage", _hasGen] call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;

["pt3switch", {
    params ["_unit", "_state", "_hasGen"];
    if (_state != 1) exitWith {
        ["pt3outage", false] call mission_fnc_toggleLights;
    };
    ["pt3outage", _hasGen] call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;

["pt4switch", {
    params ["_unit", "_state", "_hasGen"];
    if (_state != 1) exitWith {
        ["pt4outage", false] call mission_fnc_toggleLights;
    };
    ["pt4outage", _hasGen] call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;
