params ["_unit"];

if (vehicle _unit != _unit) exitWith {
    _unit setVariable ["ChemDetector_Active", false];
    _unit setVariable ["ChemDetector_NextBeep", -1];
    _unit setVariable ["ChemDetector_SoundEnd", 0];
};

private _active = _unit getVariable ["ChemDetector_Active", false];
private _nextBeep = _unit getVariable ["ChemDetector_NextBeep", -1];
private _soundEnd = _unit getVariable ["ChemDetector_SoundEnd", 0];

if !([_unit] call Nibbles_fnc_hasChemDetector) exitWith {
    _unit setVariable ["ChemDetector_Active", false];
    _unit setVariable ["ChemDetector_NextBeep", -1];
    _unit setVariable ["ChemDetector_SoundEnd", 0];
};

private _zoneData = [_unit] call Nibbles_fnc_getCBRNZoneData;

if (_zoneData isEqualTo []) exitWith {
    _unit setVariable ["ChemDetector_Active", false];
    _unit setVariable ["ChemDetector_NextBeep", -1];
    _unit setVariable ["ChemDetector_SoundEnd", 0];
};

if (!_active) exitWith {
    _unit setVariable ["ChemDetector_Active", true];
    _unit setVariable ["ChemDetector_NextBeep", time + 1];
    _unit setVariable ["ChemDetector_SoundEnd", 0];
};

if (time < _nextBeep) exitWith {};
if (time < _soundEnd) exitWith {};

_unit say3D "Geiger";

_unit setVariable ["ChemDetector_SoundEnd", time + 5];
_unit setVariable ["ChemDetector_NextBeep", time + 1];
