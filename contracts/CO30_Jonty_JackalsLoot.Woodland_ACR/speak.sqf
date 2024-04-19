["mission_speak", {
    params ["_unit", "_sound"];
    _unit setVariable ["mission_speaking", true];
    private _duration = getNumber (missionConfigFile >> "CfgSounds" >> _sound >> "duration");
    [_unit, _duration] spawn {
        params ["_unit", "_duration"];
        sleep _duration;
        _unit setRandomLip false;
        _unit setVariable ["mission_speaking", false];
    };
    _unit setRandomLip true;
    _unit say3D _sound;
}] call CBA_fnc_addEventHandler;

mission_fnc_speak = {
    params ["_unit", "_sound"];
    private _action = [
        format ["Speak%1", _sound],
        "Speak",
        "",
        {
            _this#2 params ["_unit", "_sound"];
            ["mission_speak", [_unit, _sound]] call CBA_fnc_globalEvent;
        },
        {
            !(_target getVariable ["mission_speaking", false])
        },
        {},
        [_unit, _sound]
    ] call ace_interact_menu_fnc_createAction;
    [_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};