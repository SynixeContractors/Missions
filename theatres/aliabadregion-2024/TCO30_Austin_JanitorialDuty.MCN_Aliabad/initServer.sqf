// Shuffle names among 3 targets
private _mainTarget = ["Saif Uallah", "Saif", "Uallah"];
private _secondaryTargetA = ["Abdul-Bari", "Abdul", "Bari"];
private _secondaryTargetB = ["Maryam Sayed", "Maryam", "Sayed"];
private _shuffledTargets = [_mainTarget, _secondaryTargetA, _secondaryTargetB] call BIS_fnc_arrayShuffle;
{
  ["mission_setName", [_x, _shuffledTargets select _forEachIndex]] call CBA_fnc_globalEventJIP;
} forEach [target1, target2, target3];
