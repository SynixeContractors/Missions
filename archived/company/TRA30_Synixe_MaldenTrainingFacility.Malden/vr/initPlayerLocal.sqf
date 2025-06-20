#include "script_component.hpp"

["loadout", {
    params ["_unit", "_newUnitLoadout", "_oldUnitLoadout"];
    private _goggles = _newUnitLoadout select 7;
    private _isVr = _goggles == "G_Goggles_VR";
    {
        if (typeOf _x in VR_ENTITIES) then {
            _x hideObject !_isVr;
        };
    } forEach allUnits;
    player setVariable ["VR_isVr", _isVr];
}] call CBA_fnc_addPlayerEventHandler;

["training_vr_unit", {
    params ["_unit"];
    private _goggles = (getUnitLoadout player) select 7;
    private _isVr = _goggles == "G_Goggles_VR";
    _unit hideObject !_isVr;
}] call CBA_fnc_addEventHandler;

private _goggles = (getUnitLoadout player) select 7;
private _isVr = _goggles == "G_Goggles_VR";
player setVariable ["VR_isVr", _isVr];
