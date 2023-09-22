// event handlers
["FARE_enableSimulation", {
    call FARE_fnc_enableSimulation;
}] call CBA_fnc_addEventHandler;

["FARE_damageCrateDude", {
    params ["_unit"];
    _unit allowDamage true;

    // hurt him a lot!
    [_unit, 1, "Body", "falling"] call ace_medical_fnc_addDamageToUnit;

    [_unit, 0.4, "RightLeg", "falling"] call ace_medical_fnc_addDamageToUnit;

    [_unit, 1, "LeftLeg", "falling"] call ace_medical_fnc_addDamageToUnit;

    [_unit, 0.4, "RightArm", "falling"] call ace_medical_fnc_addDamageToUnit;

    [_unit, 1, "LeftArm", "falling"] call ace_medical_fnc_addDamageToUnit;

    [_unit, 0.4, "Head", "falling"] call ace_medical_fnc_addDamageToUnit;

    [_unit, 0.5] call ace_medical_fnc_adjustPainLevel;
}] call CBA_fnc_addEventHandler;

["FARE_radioMessage", {
    params ["_unit", "_sound"];
    _unit globalRadio _sound;
}] call CBA_fnc_addEventHandler;

["FARE_transcript", {
    call FARE_fnc_transcript;
}] call CBA_fnc_addEventHandler;
