["mission_empPulse", {
    params ["_centerPos"];
    if (!isServer) exitWith {};

    private _radius = 150;

    private _targets = nearestObjects [_centerPos, ["Air"], _radius];
    {
        if (
            _x isKindOf "UAV" ||
            _x isKindOf "UAV_01_base_F" ||
            _x isKindOf "UAV_02_base_F" ||
            _x isKindOf "UAV_06_base_F" ||
            _x isKindOf "UAV_RC40_Base_RF" ||
            _x isKindOf "UAV_02_Base_lxWS"
        ) then {
            private _uav = _x;
            private _origFuel = fuel _uav;
            [_uav, 0] remoteExec ["setFuel", _uav];

            [{
                params ["_uav", "_origFuel"];
                if (!isNull _uav && {alive _uav}) then { [_uav, _origFuel] remoteExec ["setFuel", _uav]; };
            }, [_uav, _origFuel], 120] call CBA_fnc_waitAndExecute;
        };
    } forEach _targets;
}] call CBA_fnc_addEventHandler;

["mission_switchSides", {

    if (!isServer) exitWith {};
    BLUFOR setFriend [INDEPENDENT, 0];
    INDEPENDENT setFriend [BLUFOR, 0];
    missionNameSpace setVariable ["switchSides", true, true];
    
}] call CBA_fnc_addEventHandler;

["mission_iedAttack", {
    
    if (!isServer) exitWith {};
    nibs_moveNow = true;
    [{ params ["_ied"]; _ied setDamage 1; }, [ied_1], 10] call CBA_fnc_waitAndExecute;
    [{ params ["_ied"]; _ied setDamage 1; }, [ied_2], 20] call CBA_fnc_waitAndExecute;

}] call CBA_fnc_addEventHandler;



{
  _x addEventHandler ["Killed", {
    params ["_unit"];
    private _pos = getPosATL _unit;
    "Bo_GBU12_LGB" createVehicle _pos;
  }];
} forEach (allMissionObjects "IEDUrbanBig_F");
