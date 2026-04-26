params ["_markerName", "_blinks", "_interval"];

[_markerName, _blinks, _interval] spawn {
    params ["_markerName", "_blinks", "_interval"];

    for "_i" from 1 to _blinks do {
        _markerName setMarkerAlpha 1;
        sleep _interval;
        _markerName setMarkerAlpha 0;
        sleep _interval;
    };
};
