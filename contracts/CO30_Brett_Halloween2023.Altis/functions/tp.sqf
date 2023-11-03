tent_maze_tp_corner_1 hideObject true;
action_tent_hide_connector = {
    tent_maze_tp_connector hideObjectGlobal true;
    tent_maze_tp_corner hideObjectGlobal true;
    tent_maze_tp_corner_1 hideObjectGlobal false;
};

internal_teleport = {
    params ["_trigger", "_src", "_dst"];
    {
        private _body = synixe_group createUnit ["C_man_1", _x, [], 0, "CAN_COLLIDE"];
        _x setPosASL (
            _dst modelToWorldWorld (
                _src worldToModel getPosATL _x
            )
        );
        _x allowDamage false;
        [{
            params ["_body", "_x"];
            _body disableAI "MOVE";
            _body setUnitLoadout (getUnitLoadout _x);
            _body setFace (face _x);
            _body setName (name _x);
            _body setSpeaker "ACE_NoVoice";
            _body allowDamage false;
            _body setVariable ["ace_medical_statemachine_AIUnconsciousness", true, true];
            [_body, true, 10e10] call ace_medical_fnc_setUnconscious;
            _body setVariable ["mission_other", _x, true];
            ["add_actions_teleport", [_body, _x]] call CBA_fnc_globalEventJIP;
        }, [_body, _x]] call CBA_fnc_execNextFrame;
    } forEach (allPlayers select {getPos _x inArea _trigger});
};

action_teleport = {
    [tent_group_src_trigger, tent_group_src, tent_group_dst] call internal_teleport;
    [cave_group_src_trigger, cave_group_src, cave_group_dst] call internal_teleport;
};

["add_actions_teleport", {
    params ["_body", "_x"];
    private _action = ["Join","Join","",{
        params ["_target", "_player", "_params"];
        _player enableSimulation false;
        _params params ["_x"];
        private _other = synixe_group createUnit ["C_man_1", _x, [], 0, "CAN_COLLIDE"];
        _other setPosASL (getPosASL _x);
        _other setUnitLoadout (getUnitLoadout _x);
        selectPlayer _other;
        [{
            params ["_player", "_target", "_other"];
            selectPlayer _player;
            _player enableSimulation true;
            deleteVehicle _other;
        }, [_player, _target, _other], 7] call CBA_fnc_waitAndExecute;
    },{!(missionNamespace getVariable ["woke", false])},{},[_x]] call ace_interact_menu_fnc_createAction;
    [_body, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
    private _action = ["WakeUp","Wake Up","",{
        params ["_target", "_player", "_params"];
        _params params ["_x"];
        _x setUnitLoadout (getUnitLoadout _target);
        _x setPosASL (getPosASL _target);
        _x allowDamage true;
        deleteVehicle _target;
    },{missionNamespace getVariable ["woke", false]},{},[_x]] call ace_interact_menu_fnc_createAction;
    [_body, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] call CBA_fnc_addEventHandler;
