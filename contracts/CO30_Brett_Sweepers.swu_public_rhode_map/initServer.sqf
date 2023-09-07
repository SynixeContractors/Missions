mission_base = false;
mission_fnc_base = {
    if (mission_base) exitWith {};
    mission_base = true;
    base setCombatMode "BLUE";
    sleep 0.5;
    private _request = selectRandom units base;
    _request say3D "CallRequest";
    sleep 4;
    base setCombatMode "YELLOW";
    sleep 6;
    private _call = if (alive guard) then {"CallSuccess"} else {"CallFailed"};
    (selectRandom (units base - [_request])) say3D _call;
    sleep 4;
    if (alive guard) then {
        [hostage1, hostage2] joinSilent (createGroup west);
        {
            _x setCaptive false;
        } forEach [hostage1, hostage2];
    };
};
