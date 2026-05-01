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
["mission_area_entered", {
  {
      _x params ["_bomb", "_random"];
      [{
          _this setDamage 1;
      }, _bomb, random _random] call CBA_fnc_waitAndExecute;
  } forEach [
      [carbiance_1,  [20, 60, 240]],
      [carbiance_2,  [20, 50, 240]],
      [carbiance_3,  [20, 30, 240]],
      [carbiance_4,  [20, 80, 240]],
      [carbiance_5,  [20, 100, 240]],
      [carbiance_6, [20, 120, 240]],
      [carbiance_7,  [20, 140, 240]],
      [carbiance_8,  [20, 160, 240]],
      [carbiance_9,  [20, 180, 240]],
      [carbiance_10,  [20, 200, 240]],
      [carbiance_11,  [20, 220, 240]],
      [carbiance_12,  [20, 240, 240]],
      [carbiance_13,  [20, 40, 240]],
  ];
}] call CBA_fnc_addEventHandler;