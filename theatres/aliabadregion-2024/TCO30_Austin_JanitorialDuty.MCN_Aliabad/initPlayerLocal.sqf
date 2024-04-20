#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

// Shuffle names among 3 targets
private _mainTarget = ["Saif Uallah", "Saif", "Uallah"];
private _secondaryTargetA = ["Abdul-Bari", "Abdul", "Bari"];
private _secondaryTargetB = ["Maryam Sayed", "Maryam", "Sayed"];
private _shuffledTargets = [_mainTarget, _secondaryTargetA, _secondaryTargetB] call BIS_fnc_arrayShuffle;

target1 setName (_shuffledTargets select 0);
target2 setName (_shuffledTargets select 1);
target3 setName (_shuffledTargets select 2);

// Reveal hideout locations after collecting intel
[
    notepad,
    "Collect Intel",
    {
        [_player, "PutDown"] call ace_common_fnc_doGesture;
        "hideout1" setMarkerAlpha 1;
        "hideout2" setMarkerAlpha 1;
        "hideout3" setMarkerAlpha 1;
    },
	false,
	{true},
	"z\ace\addons\intelitems\ui\notepad_ca.paa"
] call synixe_missions_fnc_action;
