params ["_unit"];

private _detectors = [
    "ChemicalDetector_01_black_F",
    "ChemicalDetector_01_olive_F",
    "ChemicalDetector_01_tan_F"
];

private _found = false;

// Assigned items
{
    if (_x in _detectors) exitWith { _found = true };
} forEach assignedItems _unit;

{
    private _items = _unit call _x;
    {
        if (_x in _detectors) exitWith { _found = true };
    } forEach _items;
} forEach [
    { uniformItems _this },
    { vestItems _this },
    { backpackItems _this }
];

if (!_found && { isClass (configFile >> "CfgPatches" >> "ace_main") }) then {
    private _aceItems = _unit call ace_common_fnc_uniqueItems;
    {
        if (_x in _detectors) exitWith { _found = true };
    } forEach _aceItems;
};

_found
