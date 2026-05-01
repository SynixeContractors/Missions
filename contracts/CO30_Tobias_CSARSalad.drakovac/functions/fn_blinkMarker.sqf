params ["_markerName", "_blinks", "_interval"];

for "_i" from 1 to _blinks do {
    _markerName setMarkerAlphaLocal 1;
    sleep _interval;
    _markerName setMarkerAlphaLocal 0;
    sleep _interval;
};
