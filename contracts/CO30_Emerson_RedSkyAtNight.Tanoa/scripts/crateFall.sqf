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
        ["FARE_damageCrateDude", [crateDude], crateDude] call CBA_fnc_targetEvent;

        // play radio message
        ["FARE_radioMessage", [crateWorker, "radioCrate"]] call CBA_fnc_globalEvent;

        // add transcript for everyone
        ["FARE_transcript", ["crateFall"]] call CBA_fnc_globalEvent;
    },
    [crateDude, crateWorker],
    5
] call CBA_fnc_waitAndExecute;
