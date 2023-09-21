// enable simulation for crate 
["FARE_enableSimulation", [crate], crate] call CBA_fnc_targetEvent;

crate setPosASL (getPosASL crate);

// play crate sound 
playSound3D [
    getMissionPath "sounds\crateFall.ogg", 
    crate, 
    false, 
    getPosASL crate, 
    5, 
    1, 
    0
];

// enable all simulation for dude
["FARE_enableSimulation", [crateDude], crateDude] call CBA_fnc_targetEvent;

// enable all simulation for radio speaker
["FARE_enableSimulation", [crateWorker], crateWorker] call CBA_fnc_targetEvent;

// need to hurt the guy ourselves after crate falls and then play radio message
[
    {
        // enable damage for dude 
        ["FARE_allowDamage", [crateDude], crateDude] call CBA_fnc_targetEvent;

        // hurt him a lot!
        [crateDude, 1, "Body", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.4, "RightLeg", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 1, "LeftLeg", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.4, "RightArm", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 1, "LeftArm", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.4, "Head", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.5] call ace_medical_fnc_adjustPainLevel;

        // play radio message
        ["FARE_radioMessage", [crateWorker, "radioCrate"]] call CBA_fnc_globalEvent;

        // add transcript for everyone
        _transcript = "Hello?! Does anybody read me?! We have a medical emergency down at the new silo and need immediate assistance! One of our crates just fucking fell on a guy. Shit! He's... he's not looking good. We're at the construction site of the new silo, on the east side of the port. If you have any medical training at all, come immediately!";
        ["FARE_transcript", [_transcript]] call CBA_fnc_globalEvent;
    },
    [crateDude, crateWorker],
    5
] call CBA_fnc_waitAndExecute;
true