#include "do_not_edit\script_component.hpp"

// Calculate mission start

systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 2; // 0200 UTC
if (_hour > 12) then {
	_hour = _hour - 24;
};
GVAR(timeUntilStart) = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
GVAR(timeUntilStart) = GVAR(timeUntilStart) max 0;

[{
	[QGVAR(missionStartTime), []] call CBA_fnc_globalEvent;
}, [], GVAR(timeUntilStart) + 60] call CBA_fnc_waitAndExecute;

[{time > 1}, {
	(getMissionConfigValue ["synixe_start_time", [20,0]]) params ["_startHour", "_startMinute"];
	if (GVAR(timeUntilStart) > 0) then {
		_startHour = floor (((_startHour * 3600) - GVAR(timeUntilStart)) / 3600);
		_startMinute = (((_startHour * 3600) - GVAR(timeUntilStart)) mod 3600) / 60;
	};
	private _startDate = date;
	_startDate set [3, _startHour];
	_startDate set [4, _startMinute];

	[QGVAR(setDate), _startDate] call CBA_fnc_globalEvent;
}] call CBA_fnc_waitUntilAndExecute;

// Enemy group
halloween_security = createGroup east;
publicVariable "halloween_security";
