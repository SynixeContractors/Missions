// enable simulation for crate 
[crate, true] remoteExec ["enableSimulationGlobal", 2]; // server only
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
[crateDude, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for objects
[group crateDude, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for groups
[crateDude, true] remoteExec ["enableSimulationGlobal", 2]; // server only

// enable all simulation for radio speaker
[crateWorker, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for objects
[group crateWorker, false] remoteExec ["enableDynamicSimulation"]; // disables dynamic sim for groups
[crateWorker, true] remoteExec ["enableSimulationGlobal", 2]; // server only

// need to hurt the guy ourselves after crate falls and then play radio message
[
    {
        // enable damage for dude 
        [crateDude, true] remoteExec ["allowDamage", crateDude];

        // hurt him a lot!
        [crateDude, 1, "Body", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.4, "RightLeg", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 1, "LeftLeg", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.4, "RightArm", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 1, "LeftArm", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.4, "Head", "falling"] call ace_medical_fnc_addDamageToUnit;

        [crateDude, 0.5] call ace_medical_fnc_adjustPainLevel;

        // play radio message
        [crateWorker, "radioCrate"] remoteExec ["globalRadio"];

        // add transcript for everyone
        _transcript = "Hello?! Does anybody read me?! We have a medical emergency down at the new silo and need immediate assistance! One of our crates just fucking fell on a guy. Shit! He's... he's not looking good. We're at the construction site of the new silo, on the east side of the port. If you have any medical training at all, come immediately!";
        [_transcript] remoteExecCall ["FARE_fnc_transcript"];
    },
    [crateDude, crateWorker],
    5
] call CBA_fnc_waitAndExecute;