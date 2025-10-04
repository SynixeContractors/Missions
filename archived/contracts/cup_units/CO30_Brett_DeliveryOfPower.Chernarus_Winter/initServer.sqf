mission_fnc_toggleLights = {
    ["lighttoggle", _this] call CBA_fnc_globalEvent;
};

["ppoutage", true] call mission_fnc_toggleLights;

["ppswitch", {
    params ["_unit", "_state", "_hasGen"];
    if (_state != 1) exitWith {
        ["ppoutage", false] call mission_fnc_toggleLights;
    };
    ["ppoutage", _hasGen] call mission_fnc_toggleLights;
}] call CBA_fnc_addEventHandler;

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
