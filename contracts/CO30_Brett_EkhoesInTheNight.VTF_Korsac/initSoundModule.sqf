morse_sounds = [
    "wearehere",
    "iguide"
];

[
    "Ekho",
    "Morse",
    {
        [
            "Morse",
            [
                ["COMBO", "Sound", [morse_sounds, morse_sounds, 0]]
            ],
            {
                params ["_values", "_args"];
                private _sound = _values select 0;
                playSound3D [getMissionPath format ["audio\%1.ogg", _sound], radio, false, getPosASL radio, 0.7, 0.85, 20];
            },
            {},
            _this
        ] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;
