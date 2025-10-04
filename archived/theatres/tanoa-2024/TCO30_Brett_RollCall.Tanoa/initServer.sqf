mission_fnc_chase_capture = compile preprocessfile "data.sqf";

mission_is_chase = false;
mission_fnc_chase = {
    if (mission_is_chase) exitWith {};
    mission_is_chase = true;

    getaway engineOn true;
    call mission_fnc_chase_capture;

    mission_chase_pfh = [{
        if (scriptDone mission_chase) exitWith {
            {
                unassignVehicle _x;
                _x action ["eject", getaway];
            } forEach (crew getaway);
            getaway lock true;
            getaway setVehicleLock "LOCKED";
            vip doMove [8819,7329,73];
            [mission_chase_pfh] call CBA_fnc_removePerFrameHandler;
        };
    }] call CBA_fnc_addPerFrameHandler;
};
