/*
 * Author: Muta, Mike, Brett
 */

params ["_marker", "_on"];

private _targetTypes = [
    "Lamps_Base_F",
    "PowerLines_base_F",
    "House"
];

private _state = ["OFF", "ON"] select _on;
private _markerPos = getMarkerPos _marker;

private _radi = getMarkerSize _marker;
private _radius = (_radi select 0) max (_radi select 1);

{
    private _lights = _markerPos nearObjects [_x, _radius];

    {
        _x switchLight _state;
    } forEach _lights;
} forEach _targetTypes;
