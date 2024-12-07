// global variables that track the camps to deliver to
// as well as the supplies to deliver to those camps (with the same index)
// TODO probably not make these global variables
deliveryCamps = [];
deliveries = [];

// get markers that denote IDAP camps
private _campMarkerAreas = (getMissionLayerEntities "Camp Marker Areas") select 1;
// get starting supply objects
private _supplies = (getMissionLayerEntities "Supplies") select 0;

// select random camps to deliver supplies to
private _numOfDeliveries = 3;
for "_i" from 1 to _numOfDeliveries do {
    private _randomCamp = selectRandom _campMarkerAreas;
    deliveryCamps pushBack _randomCamp;
    _campMarkerAreas deleteAt (_campMarkerAreas find _randomCamp);
};

// select (somewhat) random amount of supplies to deliver to each camp
{
    private _numOfSupplies = selectRandom [4, 5, 6, 7, 8];
    private _deliverySupplies = [];
    for "_i" from 1 to _numOfSupplies do {
        _randomSupply = selectRandom _supplies;
        _deliverySupplies pushBack _randomSupply;
        _supplies deleteAt (_supplies find _randomSupply);
    };

    deliveries pushBack _deliverySupplies;
} forEach deliveryCamps;

// construct briefing text
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
        private _supplyName = [configOf _x] call BIS_fnc_displayName;

        _text = _text + _supplyName + "<br/>";
    } forEach _supplies;

    _text = _text + "<br/>";
};

// add delivery briefing once deliveries have been determined
["FELIX_addBriefing", ["Deliveries", _text]] call CBA_fnc_globalEventJIP;
