if (isNil "CBRN_PFH_Processing") then {

    CBRN_PFH_Processing = [
        {
            {
                private _unit = _x;

                if (isNull _unit) then { continue };
                if (!alive _unit) then { continue };

                private _zone = [_unit] call Nibbles_fnc_getCBRNZoneData;
                if (_zone isEqualTo []) then { continue };

                private _intensity = _zone # 2;

                [_unit, _intensity] remoteExecCall [
                    "Nibbles_fnc_applyCBRNDamage",
                    _unit
                ];

            } forEach allUnits;
        },
        5
    ] call CBA_fnc_addPerFrameHandler;
};


if (hasInterface) then {
    [
        {
            private _unit = player;
            private _next = _unit getVariable ["ChemDetector_NextBeep", 0];

            if (time > _next) then {
                [_unit] call Nibbles_fnc_updateChemDetector;
            };
        },
        1
    ] call CBA_fnc_addPerFrameHandler;
};
