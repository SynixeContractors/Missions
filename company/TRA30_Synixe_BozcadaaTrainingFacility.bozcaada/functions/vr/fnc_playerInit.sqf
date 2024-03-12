#define VR_OBJECTS (missionNamespace getVariable ["VR_objects", []])

["loadout", {
    params ["_unit", "_newUnitLoadout", "_oldUnitLoadout"];
    private _goggles = _newUnitLoadout select 7;
    private _isVr = _goggles == "G_Goggles_VR";
    {
        _x hideObject !_isVr;
    } forEach VR_OBJECTS;
    player setVariable ["VR_isVr", _isVr];
}, true] call CBA_fnc_addPlayerEventHandler;

["training_vr_unit", {
    params ["_unit"];
    private _goggles = (getUnitLoadout player) select 7;
    private _isVr = _goggles == "G_Goggles_VR";
    _unit hideObject !_isVr;
}] call CBA_fnc_addEventHandler;
