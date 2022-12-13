private "_time";
_time = _this select 0;

while {_time > 0} do {
_time = _time - 1;  
hintSilent format["Time Left: \n %1", [(_time/60)+.01,"HH:MM"] call BIS_fnc_timetostring];	
sleep 1;
};
