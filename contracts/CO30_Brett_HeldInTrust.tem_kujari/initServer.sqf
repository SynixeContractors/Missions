mission_tried_cheating = false;
mission_intro = false;
mission_voice_active = "";

["voice", {
    params ["_line"];
    if (mission_voice_active != "") exitWith {};
    switch (_line) do {
        case "intro": {
            mission_intro = true;
            mission_voice_active = "intro";
            playSound3D [getMissionPath "audio\intro.ogg", contact, true, getPosASL contact, 5];
            ["lip", 8] call CBA_fnc_serverEvent;
            0 spawn {
                sleep 8;
                mission_voice_active = "";
            };
        };
        case "cheat": {
            if (!mission_intro) exitWith {};
            private _cheating = ([money_case] call mission_fnc_countMoney) < 10000;
            if (_cheating) then {
                mission_voice_active = "cheat";
                mission_tried_cheating = true;
                playSound3D [getMissionPath "audio\cheat.ogg", contact, true, getPosASL contact, 5];
                ["lip", 8] call CBA_fnc_serverEvent;
                0 spawn {
                    sleep 8;
                    mission_voice_active = "";
                };
            } else {
                if (mission_tried_cheating) then {
                    mission_voice_active = "cheat_avoid";
                    mission_tried_cheating = false;
                    playSound3D [getMissionPath "audio\cheat_avoid.ogg", contact, true, getPosASL contact, 5];
                    ["lip", 4] call CBA_fnc_serverEvent;
                    0 spawn {
                        sleep 4;
                        mission_voice_active = "";
                    };
                };
            };
        };
        case "exit": {
            private _cheating = ([money_case] call mission_fnc_countMoney) < 10000;
            if (_cheating) then {
                mission_voice_active = "hostile";
                playSound3D [getMissionPath "audio\hostile.ogg", contact, true, getPosASL contact, 5];
                ["lip", 5] call CBA_fnc_serverEvent;
                0 spawn {
                    sleep 5;
                    mission_voice_active = "";
                };
                west setFriend [resistance, 0];
                resistance setFriend [west, 0];
            } else {
                mission_voice_active = "complete";
                playSound3D [getMissionPath "audio\complete.ogg", contact, true, getPosASL contact, 5];
                ["lip", 4] call CBA_fnc_serverEvent;
                0 spawn {
                    sleep 4;
                    mission_voice_active = "";
                };
            };
        };
    };
}] call CBA_fnc_addEventHandler;
