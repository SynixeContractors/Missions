medical_stretchers = [
    ["medical_a", "Left - 1", medical_stretcher_l1],
    ["medical_b", "Left - 2", medical_stretcher_l2],
    ["medical_c", "Right - 1", medical_stretcher_r1]
];

medical_patients = [];

{
    _x params ["_tag", "_label", "_stretcher"];
    private _main_action = [format ["%1-Main", _tag],_label,"",{},{true},{
        params ["_target", "_player", "_params"];
        private _actions = [];

        _params params ["_stretcher", "_tag"];

        private _create_patient_action = [format ["%1-CreatePatient", _tag], "Create Patient", "", {
            params ["_target", "_player", "_params"];
            _params params ["_stretcher"];
            ["training_vr_spawnUnit", ["medical", west, getPosATL _stretcher, {
                params ["_unit", "_params"];
                _params params ["_stretcher"];
                _stretcher setVariable ["medical_patient", _unit, true];
                medical_patients pushBack _unit;
                _unit setVariable ["medical_stretcher", _stretcher, true];
                _unit disableAI "all";
                _unit attachTo [_stretcher, [0,0,0.25]];
            }, [_stretcher]]] call CBA_fnc_serverEvent;
        }, {
            params ["_target", "_player", "_params"];
            _params params ["_stretcher"];
            player getVariable ["VR_isVR", false] && {isNull (_stretcher getVariable ["medical_patient", objNull])}
        }, {}, [_stretcher]] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_create_patient_action, [], _target];

        private _remove_patient_action = [format ["%1-RemovePatient", _tag], "Remove Patient", "", {
            params ["_target", "_player", "_params"];
            _params params ["_stretcher"];
            private _patient = _stretcher getVariable ["medical_patient", objNull];
            if (!isNull _patient) then {
                deleteVehicle _patient;
                medical_patients = medical_patients - [_patient];
            };
        }, {
            params ["_target", "_player", "_params"];
            _params params ["_stretcher"];
            player getVariable ["VR_isVR", false] && {!isNull (_stretcher getVariable ["medical_patient", objNull])}
        }, {}, [_stretcher]] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_remove_patient_action, [], _target];

        private _injure_patient_action = [format ["%1-InjurePatient", _tag], "Injure Patient", "", {
            params ["_target", "_player", "_params"];
            _params params ["_stretcher"];
            private _patient = _stretcher getVariable ["medical_patient", objNull];
            if (!isNull _patient) then {
                [
                    "Injure Patient",
                    [
                        [
                            "COMBO",
                            "Injury Type",
                            [
                                ["bullet", "grenade", "stab", "falling", "backblast", "shell", "explosive", "burn"],
                                ["Bullet", "Grenade", "Stab", "Falling", "Backblast", "Shell", "Explosive", "Burn"],
                                0
                            ]
                        ],
                        [
                            "COMBO",
                            "Injury Location",
                            [
                                ["head", "body", "hand_r", "hand_l", "leg_r", "leg_l"],
                                ["Head", "Body", "Right Arm", "Left Arm", "Right Leg", "Left Leg"],
                                0
                            ]
                        ],
                        [
                            "SLIDER:PERCENT",
                            "Injury Severity",
                            [0, 1, 0.5, 0]
                        ]
                    ],
                    {
                        params ["_values", "_params"];
                        _values params ["_type", "_location", "_severity"];
                        _params params ["_stretcher"];
                        private _patient = _stretcher getVariable ["medical_patient", objNull];
                        [_patient, _severity, _location, _type] call ace_medical_fnc_addDamageToUnit;
                        [_patient] call ace_medical_fnc_handleDamage_advancedSetDamage;
                    },
                    {},
                    [_stretcher]
                ] call zen_dialog_fnc_create;
            };
        }, {
            params ["_target", "_player", "_params"];
            _params params ["_stretcher"];
            player getVariable ["VR_isVR", false] && {!isNull (_stretcher getVariable ["medical_patient", objNull])}
        }, {}, [_stretcher]] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_injure_patient_action, [], _target];

        _actions
    }, [_stretcher, _tag]] call ace_interact_menu_fnc_createAction;
    [medical_control, 0, ["ACE_MainActions"], _main_action] call ace_interact_menu_fnc_addActionToObject;
} forEach medical_stretchers;

[{
    {
        [_x, "UnconsciousFaceUp", 2] call ace_common_fnc_doAnimation;
    } forEach medical_patients;
}, 0.25] call CBA_fnc_addPerFrameHandler;
