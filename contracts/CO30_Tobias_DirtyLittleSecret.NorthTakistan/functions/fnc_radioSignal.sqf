[{
    // ACRE signal processing
    private _coreSignal = _this call acre_sys_signal_fnc_getSignalCore;
    _coreSignal params ["_Px", "_maxSignal"];

    // Modify signal (eg. zero-out if in jam area)
    if (player getVariable ["is_emp", false]) then {
        _Px = 0;
    };

    // Return final signal
    [_Px, _maxSignal]
}] call acre_api_fnc_setCustomSignalFunc;
