/*
    [_box, _plane] call nibs_fnc_airdrop;
*/

params ["_cargo", "_plane"];

if (!isServer) exitWith {};

private _offset = [-3, 0, -2];
private _dropPos = _plane modelToWorldWorld _offset;

_cargo setPosASL _dropPos;

private _openAlt = 300;

[
    {
        params ["_args", "_pfh"];
        _args params ["_cargo", "_openAlt"];

        if (isNull _cargo) exitWith { [_pfh] call CBA_fnc_removePerFrameHandler; };
        private _alt = (getPosASL _cargo) select 2;

        if (_alt <= _openAlt) then {

            private _parachute = createVehicle [
                "B_Parachute_02_F",
                getPosASL _cargo,
                [],
                0,
                "FLY"
            ];

            _parachute setPosASL [
                (getPosASL _cargo select 0),
                (getPosASL _cargo select 1),
                (getPosASL _cargo select 2) + 2
            ];

            _cargo attachTo [_parachute, [0,0,0]];

            [_pfh] call CBA_fnc_removePerFrameHandler;
        };
    },
    0.1,
    [_cargo, _openAlt]
] call CBA_fnc_addPerFrameHandler;
