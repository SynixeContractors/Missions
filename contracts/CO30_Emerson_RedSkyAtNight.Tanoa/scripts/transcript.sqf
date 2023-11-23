params ["_transcript"];

private _text = switch (_transcript) do {
    case "boatBomb": {
        "Hey! Guys? Hello? Can you hear me? Is this the right frequency for security? We've got a bit of a situation here. We were inspecting one the boats here that docked late last night and we found a suspicious looking pile next to some barrels. Buddy of mine is freaking out thinking its a bomb, but I'm not so sure. Can you guys come check it out? It's the trawler docked in the center of the port."
    };
    case "crateFall": {
        "Hello?! Does anybody read me?! We have a medical emergency down at the new silo and need immediate assistance! One of our crates just fucking fell on a guy. Shit! He's... he's not looking good. We're at the construction site of the new silo, on the east side of the port. If you have any medical training at all, come immediately!"
    };
    default { "" };
};

player createDiaryRecord ["Diary", [
    "Transmission from " + ([dayTime, "HH:MM"] call BIS_fnc_timeToString),
    _text
]];
