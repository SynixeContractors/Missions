#define VR_OBJECTS (missionNamespace getVariable ["VR_objects", []])

["loadout", {
    params ["_unit", "_newUnitLoadout", "_oldUnitLoadout"];
    private _wasVR = if (count _oldUnitLoadout >= 7) then {
        (_oldUnitLoadout select 7) == "G_Goggles_VR"
    } else {
        false
    };
    private _isVr = (_newUnitLoadout select 7) == "G_Goggles_VR";
    if (_wasVR == _isVr) exitWith {};
    {
        _x hideObject !_isVr;
    } forEach VR_OBJECTS;
    player setVariable ["VR_isVr", _isVr];
    player setCaptive !_isVr;
    if (_isVR) then {
        playSound3D ["a3\missions_f\data\sounds\border_in.ogg", player];
    } else {
        playSound3D ["a3\missions_f\data\sounds\border_out.ogg", player];
    };
}, true] call CBA_fnc_addPlayerEventHandler;

["vr_unit", {
    params ["_unit"];
    private _isVr = ((getUnitLoadout player) select 7) == "G_Goggles_VR";
    _unit hideObject !_isVr;
}] call CBA_fnc_addEventHandler;

["vr_object", {
    params ["_obj"];
    private _isVr = ((getUnitLoadout player) select 7) == "G_Goggles_VR";
    _obj hideObject !_isVr;
}] call CBA_fnc_addEventHandler;

player addEventHandler ["HandleDamage", {
    private _isVR = (typeOf (_this select 3)) select [10,4] == "VR_F";
    player allowDamage !_isVR;
    if (_isVR) then {
        playSound3D ["a3\sounds_f\sfx\hint-3.wss", player];
    };
    nil
}];
