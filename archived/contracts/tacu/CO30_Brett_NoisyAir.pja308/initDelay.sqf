if !(hasInterface) exitWith {};

[{
    params ["_args", "_idPFH"];
    _args params ["_object", "_delay", "_signal"];
    if !(alive _object) exitWith {[_idPFH] call CBA_fnc_removePerFrameHandler};
    private _active = _object getVariable ["mission_active", false];
    if (_active) then {
        mission_sources deleteAt netId _object;
    } else {
        mission_sources set [netId _object, _signal];
    };
    _object setVariable ["mission_active", !_active, true];
}, _this#1, _this] call CBA_fnc_addPerFrameHandler;
