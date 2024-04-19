[
    officer,
    "Officer", // class from CfgSounds in description.ext
    {
        systemChat "Officer: I'm talking";
    },
    {
        systemChat "Officer: I'm done";
        params ["_unit", "", "_first"];
        if (_first) then {
            [_unit, "PutDown"] call ace_common_fnc_doGesture;
            systemChat "Intel Received!";
        };
    }
] call synixe_missions_fnc_speak;
