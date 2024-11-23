private _text = "
The following is a list of IDAP camps and their requested supplies.
<br/>
<br/>
";

// iterate over each delivery and create structured text
private _numOfDeliveries = count deliveryCamps;
for "_i" from 0 to (_numOfDeliveries - 1) do {
    // camp name
    _text = _text + (deliveryCamps select _i) + ": <br/>";

    // supplies for camp
    private _supplies = deliveries select _i;
    {
        // get display name of supply object
        private _supplyConfig = configOf _x;
        private _supplyName = [_supplyConfig] call BIS_fnc_displayName;

        _text = _text + _supplyName + "<br/>";
    } forEach _supplies;

    _text = _text + "<br/>";
};

player createDiaryRecord ["Diary", ["Deliveries", _text]];
