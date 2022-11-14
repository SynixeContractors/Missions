// Calculate mission start

systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 3; // 0300 UTC
if (_hour > 12) then {
    _hour = _hour - 24;
};
GVAR(timeUntilStart) = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
GVAR(timeUntilStart) = GVAR(timeUntilStart) max 0;

[{
    [QGVAR(missionStartTime), []] call CBA_fnc_globalEvent;
}, [], GVAR(timeUntilStart) + 60] call CBA_fnc_waitAndExecute;

[{time > 1}, {
    private _startHour = getMissionConfigValue ["synixe_start_time", [20]];
    if (GVAR(timeUntilStart) > 0) then {
        _startHour = floor (((_startHour * 3600) - GVAR(timeUntilStart)) / 3600);
    };
    private _startDate = date;
    _startDate set [3, _startHour];
    _startDate set [4, 0];

    [QGVAR(setDate), _startDate] call CBA_fnc_globalEvent;
}] call CBA_fnc_waitUntilAndExecute;
