#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
    "Forward Operating Base"
] call mission_fnc_briefing;

["mission_intel", {
    player createDiaryRecord ["Diary", ["Data is Encrypted", "Encrypted Data Sent to CDF intelligence command for further analysis."]];
}] call CBA_fnc_addEventHandler;

[
    officer,    // variable name of the officer unit
    "Officer",  // class from CfgSounds in description.ext
    {},
    {
        params ["_unit", "", "_first"];
        if (_first) then {
            [_unit, "PutDown"] call ace_common_fnc_doGesture;
        };
    }
] call synixe_missions_fnc_speak;

[board, 2, false, 1, "Get Surveillance Intel", // Edit this if you want to change the intel ACE action name
[], 5,

"Movement Logs and Ground Intel", // Edit this for intel title

"Movement at GRID: 089078.
Movement at GRID: 090080.
Movement at Roadblock GRID: 085083.
Movement at Roadblock GRID: 095072.
Heavy Movement at GRID: 091075.
Stronghold NE Ground Report: All encampments at grids marked by UAV to be cleared.
Potential Minefield marked in red.
Possible AA Emplacements.
AO close to RSA's Gorka Stronghold stationed with HEAVY ARMOUR including TANKS AND APCs. Excercise Caution.
Search for any intel available.
IMPORTANT: AVOID CROSSING LINE OF CONTROL AT ANY COST." // Edit this for intel content

] call zen_modules_fnc_addIntelAction;


[
    laptop,
    1,  // texture source
    50, // size in GB
    60,  // time to upload in seconds
    {
    },
    {
        ["mission_intel"] call CBA_fnc_globalEventJIP;
        // Clear the screen after 2 seconds
        [
            {
                params ["_object"];
                _object setObjectTextureGlobal [1, ""];
            },
            _this,
            2] call CBA_fnc_waitAndExecute;
    }
] call synixe_missions_fnc_computerUpload;