missionNamespace setVariable ["VR_objects", [], true];

vr_groups = createHashMap;

vr_fnc_addObject = {
    params ["_object"];
    missionNamespace setVariable ["VR_objects", (missionNamespace getVariable ["VR_objects", []]) + [_object], true];
};

["ace_medical_blood_bloodDropCreated", {
    params ["_drop", "_unit"];
    if !((typeOf _unit) select [10,4] == "VR_F") exitWith {};
    _drop setVariable ["VR_source", _unit, true];
    [_drop] call vr_fnc_addObject;
}] call CBA_fnc_addEventHandler;

[{
    {
        {
            {
                if !(alive _x) then {
                    vr_entities deleteAt _forEachIndex;
                    for "_i" from 0 to 6 do {
                        _x setObjectTextureGlobal [_i, "#(argb,8,8,3)color(1,0,0,1,ca)"];
                    };
                    [{
                        deleteVehicle _this;
                    }, _x, 10] call CBA_fnc_waitAndExecute;
                };
            } forEach units _x;
        } forEach _x;
    } forEach values vr_groups;
    {
        if (_x isKindOf "CAMan") then {
            systemChat "man should not be here";
            continue;
        };
        private _source = _x getVariable ["VR_source", objNull];
        if (isNull _source || {!(alive _source)}) then {
            deleteVehicle _x;
        };
    } forEach (missionNamespace getVariable ["VR_objects", []]);
}, 0.5] call CBA_fnc_addPerFrameHandler;

vr_fnc_get_unit = {
    params ["_side"];
    private _ret = switch (_side) do {
        case west: {
            "B_Soldier_VR_F"
        };
        case east: {
            "O_Soldier_VR_F"
        };
        case resistance: {
            "I_Soldier_VR_F"
        };
    };
    _ret
};

["vr_spawnObject", {
    params ["_class", "_posATL", "_source", ["_code", {}], ["_params", []]];
    private _veh = createVehicle [_class, _posATL, [], 0, "CAN_COLLIDE"];
    if (_source isNotEqualTo objNull) then {
        _veh setVariable ["VR_source", _source, true];
    };
    [_veh] call vr_fnc_addObject;
    [_veh, _params] call _code;
    ["vr_object", [_veh]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

["vr_spawnUnit", {
    params ["_tag", "_side", "_posATL", ["_code", {}], ["_params", []]];
    private _tagGroup = vr_groups getOrDefault [_tag, []];
    if (_tagGroup isEqualTo []) then {
        _tagGroup = createGroup _side;
        vr_groups set [_tag, [_tagGroup]];
        _tagGroup = vr_groups getOrDefault [_tag, []];
    };
    private _tagGroup = _tagGroup select 0;
    private _unit = _tagGroup createUnit [[_side] call vr_fnc_get_unit, _posATL, [], 0, "NONE"];
    [_unit, _params] call _code;
    ["vr_unit", [_unit]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

["vr_spawnGroup", {
    params ["_tag", "_side", "_posATL", "_count", ["_code", {}], ["_params", []]];
    _tagGroup = createGroup _side;
    private _existing = vr_groups getOrDefault [_tag, []];
    vr_groups set [_tag, [_tagGroup] + _existing];
    for "_i" from 1 to _count do {
        private _unit = _tagGroup createUnit [[_side] call vr_fnc_get_unit, _posATL, [], 0, "NONE"];
        ["vr_unit", [_unit]] call CBA_fnc_globalEvent;
    };
    [_tagGroup, _params] call _code;
}] call CBA_fnc_addEventHandler;

["vr_resetGroup", {
    params ["_tag"];
    private _tagGroup = vr_groups getOrDefault [_tag, []];
    {
        {
            deleteVehicle _x;
        } forEach units _x;
    } forEach _tagGroup;
    vr_groups set [_tag, []];
}] call CBA_fnc_addEventHandler;
