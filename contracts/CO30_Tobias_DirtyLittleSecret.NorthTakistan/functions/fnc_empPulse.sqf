["mission_empPulse", {
    params ["_centerPos"];
    private _radius = 150;
    private _dist = ACE_player distance2D _centerPos;
    private _rel = 1 - (_dist / _radius);
    private _pain = 0.3 * _rel;
    [ACE_player, _pain] call ace_medical_fnc_adjustPainLevel;
    ACE_player setVariable ["is_emp", true, true];
}] call CBA_fnc_addEventHandler;


mission_fnc_hasUAVBattery = {
    "synixe_uav_battery" in (itemsWithMagazines (_this#0));
};

mission_fnc_canCharge = {
    (((unitBackpack (_this#0)) getVariable ["emp_next_charge", 0]) - time < 0)
};

mission_fnc_canFire = {
    (((unitBackpack (_this#0)) getVariable ["emp_fire_by", 0]) - time > 0)
};

// ACE Interactions

private _chargePulse = [
    "chargeEMPPulse",
    "Charge EMP",
    "",
    {
        ["FD_Finish_F", _unit] remoteExec ["playSound3D", 0];
        [12 + random 5, [], {
            playSound3D ["FD_CP_Not_Clear_F", _unit];
            ACE_player removeItem "synixe_uav_battery";

            (unitBackpack ACE_player) setVariable ["emp_fire_by", time + 120, true];

        }, {}, "Charging EMP Pulse..."] call ace_common_fnc_progressBar;
    },
    { backpack ACE_player isEqualTo "I_GMG_01_A_weapon_F" &&
     ([ACE_player] call mission_fnc_hasUAVBattery) &&
     ([ACE_player] call mission_fnc_canCharge) &&
     !([ACE_player] call mission_fnc_canFire)
    }
] call ace_interact_menu_fnc_createAction;

[ACE_player, 1, ["ACE_SelfActions"], _chargePulse] call ace_interact_menu_fnc_addActionToObject;

private _empPulse = [
    "activateEMPPulse",
    "Fire EMP",
    "",
    {
        [5, [], {
            playSound3D ["FD_CP_Clear_F", _unit];
            ["mission_empPulse", [getPosASL ACE_player]] call CBA_fnc_globalEvent;

            ACE_player setVariable ["emp_ready", false, false];

            (unitBackpack ACE_player) setVariable ["emp_next_charge", time + 340 + random 40, true];
            (unitBackpack ACE_player) setVariable ["emp_fire_by", 0, true];

        }, {}, "Firing EMP Pulse..."] call ace_common_fnc_progressBar;
    },
    { backpack ACE_player isEqualTo "I_GMG_01_A_weapon_F" && 
    ([ACE_player] call mission_fnc_canFire) }
] call ace_interact_menu_fnc_createAction;

[ACE_player, 1, ["ACE_SelfActions"], _empPulse] call ace_interact_menu_fnc_addActionToObject;
