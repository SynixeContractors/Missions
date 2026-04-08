["mission_empPulse", {
    params ["_centerPos"];
    if (!isServer) exitWith {};

    private _radius = 2000;

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

            [_uav, 0] remoteExec ["setFuel", owner _uav];

            [{
                params ["_uav", "_origFuel"];
                if (!isNull _uav && {alive _uav}) then {
                    [_uav, _origFuel] remoteExec ["setFuel", owner _uav];
                };
            }, [_uav, _origFuel], 120] call CBA_fnc_waitAndExecute;
        };
    } forEach _targets;

}] call CBA_fnc_addEventHandler;

[] spawn {
    while {true} do {
        ["mission_empPulse", [getPosASL jammer_1]] call CBA_fnc_globalEvent;
        sleep 30;
    };
};