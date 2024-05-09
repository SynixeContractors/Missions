// Shuffle names among 3 targets
private _mainTarget = ["Saif Uallah", "Saif", "Uallah"];
private _secondaryTargetA = ["Abdul-Bari", "Abdul", "Bari"];
private _secondaryTargetB = ["Maryam Sayed", "Maryam", "Sayed"];
shuffledTargets = [_mainTarget, _secondaryTargetA, _secondaryTargetB] call BIS_fnc_arrayShuffle;
publicVariable "shuffledTargets";
