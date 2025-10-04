/*
 * Author: Mike, Brett
 */

#define RED "#(argb,8,8,3)color(1,0,0,0.05,ca)"
#define ORANGE "#(argb,8,8,3)color(0.7,0.5,0.25,0.05,ca)"
#define YELLOW "#(argb,8,8,3)color(1,1,0,0.05,ca)"
#define GREEN "#(argb,8,8,3)color(0,1,0,0.05,ca)"

params ["_object", ["_event", ""], ["_state", 0], ["_voltages", [1, 1]], ["_condition", {true}]];

// Initial switch setup
if (isServer) then {
    _object animateSource ["SwitchPosition", _state, true];
    _object animateSource ["SwitchLight", 1, 1];
    if (_state == 1) then {
        _object setObjectTextureGlobal [1, GREEN];
        _object animateSource ["Power_1", (_voltages select 0), true];
        _object animateSource ["Power_2", (_voltages select 1), true];
    } else {
        _object animateSource ["Power_1", 0, true];
        _object animateSource ["Power_2", 0, true];
        if (_state == 0) then {
            _object setObjectTextureGlobal [1, RED];
        } else {
            _object setObjectTextureGlobal [1, YELLOW];
        };
    };
};

if (hasInterface) then {
    private _switchRoot = [
        "switchRoot",
        "Lever",
        "",
        {},
        { true },
        {},
        [],
        "controlling_handle"
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, [], _switchRoot] call ace_interact_menu_fnc_addActionToObject;

    // Switch On
    private _switchAction = [
        "switchActionOn",
        "Move To ZAŁ",
        "",
        {
            (_this select 2) params ["_object", "_state", "_voltages", "", "_event"];
            private _handleState = _object animationSourcePhase "SwitchPosition";

            _object animateSource ["SwitchPosition", 1, 0.5];
            _object animateSource ["Power_1", (_voltages select 0), 0.25];
            _object animateSource ["Power_2", (_voltages select 1), 0.25];
            private _gen = _object getVariable ["switch_hasGen", false];
            _object setObjectTextureGlobal [1, if (_gen) then {
                GREEN
            } else {
                ORANGE
            }];
            if (_event != "") then {
                [_event, [_object, 1, _gen]] call CBA_fnc_globalEvent;
            };
        },
        {
            (_this select 2) params ["_object", "", "", "_condition"];
            private _handleState = _object animationSourcePhase "SwitchPosition";
            if (_handleState == 0) exitWith {
                call _condition
            };
            false
        },
        {},
        [_object, _state, _voltages, _condition, _event]
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, ["switchRoot"], _switchAction] call ace_interact_menu_fnc_addActionToObject;

    // Switch Off
    private _switchAction = [
        "switchActionOff",
        "Move To WYŁ",
        "",
        {
            (_this select 2) params ["_object", "_state", "_voltages", "", "_event"];
            private _handleState = _object animationSourcePhase "SwitchPosition";

            _object animateSource ["SwitchPosition", 0, 0.5];
            _object animateSource ["Power_1", 0, 0.25];
            _object animateSource ["Power_2", 0, 0.25];
            _object setObjectTextureGlobal [1, RED];
            if (_event != "") then {
                [_event, [_object, 0, false]] call CBA_fnc_globalEvent;
            };
        },
        {
            (_this select 2) params ["_object", "", "", "_condition"];
            private _handleState = _object animationSourcePhase "SwitchPosition";
            if (_handleState != 0) exitWith {
                call _condition
            };
            false
        },
        {},
        [_object, _state, _voltages, _condition, _event]
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, ["switchRoot"], _switchAction] call ace_interact_menu_fnc_addActionToObject;

    // Switch Reset
    private _switchAction = [
        "switchActionReset",
        "Move to GEN",
        "",
        {
            (_this select 2) params ["_object", "_state", "_voltages", "", "_event"];
            private _handleState = _object animationSourcePhase "SwitchPosition";

            _object animateSource ["SwitchPosition", -1, 0.5];
            _object animateSource ["Power_1", 0, 0.25];
            _object animateSource ["Power_2", 0, 0.25];
            _object setObjectTextureGlobal [1, YELLOW];
            if (_event != "") then {
                [_event, [_object, -1, false]] call CBA_fnc_globalEvent;
            };
            _object setVariable ["switch_hasGen", true, true];
        },
        {
            (_this select 2) params ["_object", "", "", "_condition"];
            private _handleState = _object animationSourcePhase "SwitchPosition";
            if (_handleState == 0) exitWith {
                call _condition
            };
            false
        },
        {},
        [_object, _state, _voltages, _condition, _event]
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, ["switchRoot"], _switchAction] call ace_interact_menu_fnc_addActionToObject;
};
