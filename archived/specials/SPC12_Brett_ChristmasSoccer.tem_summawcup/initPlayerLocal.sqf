["greengoal", {
    params ["_green", "_red"];
    systemChat format ["Red Scored! Green %1 - %2 Red", _green, _red];
}] call CBA_fnc_addEventHandler;

["redgoal", {
    params ["_green", "_red"];
    systemChat format ["Green Scored! Green %1 - %2 Red", _green, _red];
}] call CBA_fnc_addEventHandler;

player allowDamage false;
(vehicle player) allowDamage false;
