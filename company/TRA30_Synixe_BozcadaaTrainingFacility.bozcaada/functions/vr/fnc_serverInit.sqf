missionNamespace setVariable ["VR_objects", [], true];

vr_fnc_addObject = {
    params ["_object"];
    missionNamespace setVariable ["VR_objects", (missionNamespace getVariable ["VR_objects", []]) + [_object], true];
};

["ace_medical_blood_bloodDropCreated", {
    params ["_drop", "_unit"];
    _drop setVariable ["VR_source", _unit, true];
    [_drop] call vr_fnc_addObject;
}] call CBA_fnc_addEventHandler;
