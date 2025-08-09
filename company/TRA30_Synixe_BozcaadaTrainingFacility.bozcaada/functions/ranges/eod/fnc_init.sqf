#include "..\..\..\script_component.hpp"

if !(hasInterface) exitWith {};

EGVAR(eod,objects) = [];

[QEGVAR(eod,tablets), {
    params ["_tablets"];
    private _eodResetField = ["EngEODField","Reset Field","",{
        [QEGVAR(eod,reset), [
            _target getVariable [QEGVAR(eod,range), ""]
        ]] call CBA_fnc_serverEvent;
    }, {true}] call ace_interact_menu_fnc_createAction;
    {
        [_x, 0, ["ACE_MainActions"], _eodResetField] call ace_interact_menu_fnc_addActionToObject;
    } forEach _tablets;
    EGVAR(eod,tablets) = _tablets;
    if (isNil QEGVAR(eod,tabletEH)) then {
        EGVAR(eod,tabletEH) = [{
            private _count = { alive _x } count EGVAR(eod,objects);
            private _texture = format ["#(rgb,256,512,3)text(0.5,1,""PuristaLight"",0.3,""#000000"",""#ffffff"",""Remaining\n%1"")", _count];
            {
                _x setObjectTextureGlobal [0, _texture];
            } forEach EGVAR(eod,tablets);
        }, 1] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
