if (!hasInterface) exitWith {};

private _action = [
    "startMission",
    "Start Mission",
    "",
    {
        missionNamespace setVariable ["nibs_missionStart", true, true];

        [10, [], {
            [] remoteExec ["nibs_fnc_paradrop", 2];
        }, {
            missionNamespace setVariable ["nibs_missionStart", false, true];
        }, "Starting mission, completing final checks..."] call ace_common_fnc_progressBar;
    },
    {
        !(missionNamespace getVariable ["nibs_missionStart", false])
    }
] call ace_interact_menu_fnc_createAction;

[radio_1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
