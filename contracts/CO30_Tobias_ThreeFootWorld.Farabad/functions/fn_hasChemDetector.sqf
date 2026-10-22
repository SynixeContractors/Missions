params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {false};

private _detectors = [
    "ChemicalDetector_01_black_F",
    "ChemicalDetector_01_olive_F",
    "ChemicalDetector_01_tan_F"
];

if ((assignedItems _unit) findIf { _x in _detectors } != -1) exitWith { true };
if ((uniformItems _unit) findIf { _x in _detectors } != -1) exitWith { true };
if ((vestItems _unit) findIf { _x in _detectors } != -1) exitWith { true };
if ((backpackItems _unit) findIf { _x in _detectors } != -1) exitWith { true };

if (
    isClass (configFile >> "CfgPatches" >> "ace_main")
    && { (_unit call ace_common_fnc_uniqueItems) findIf { _x in _detectors } != -1 }
) exitWith { true };

false
