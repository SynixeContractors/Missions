#include "..\..\..\script_component.hpp"

[QEGVAR(eod,tablets), {
    params ["_tablets", "_range", "_rangeShort"];
    diag_log format ["EOD: Initializing range '%1' with %2 tablets.", _range, count _tablets];
    missionNamespace setVariable [format ["%1_%2", QEGVAR(eod,tablets), _rangeShort], _tablets];
    private _eodResetField = [format ["EngEODField_%1", _rangeShort], "Reset Field","",{
        diag_log format ["EOD Reset: Player %1 requested reset of range '%2'.", name _target, _target getVariable [QEGVAR(eod,range), ""]];
        [QEGVAR(eod,reset), [
            _target getVariable [QEGVAR(eod,range), ""]
        ]] call CBA_fnc_serverEvent;
    }, {true}] call ace_interact_menu_fnc_createAction;
    {
        _x setVariable [QEGVAR(eod,range), _range, true];
        [_x, 0, ["ACE_MainActions"], _eodResetField] call ace_interact_menu_fnc_addActionToObject;
    } forEach _tablets;
}] call CBA_fnc_addEventHandler;

EGVAR(eod,tabletEH) = [{
    {
        private _objects = missionNamespace getVariable [format ["%1_%2", QEGVAR(eod,objects), _x], []];
        private _count = { alive _x } count _objects;
        private _texture = format ["#(rgb,256,512,3)text(0.5,1,""PuristaLight"",0.3,""#000000"",""#ffffff"",""Remaining\n%1"")", _count];
        {
            _x setObjectTexture [0, _texture];
        } forEach (missionNamespace getVariable [format ["%1_%2", QEGVAR(eod,tablets), _x], []]);
    } forEach ["urban", "house"];
}, 1] call CBA_fnc_addPerFrameHandler;

diag_log "EOD: Player initialization complete.";
