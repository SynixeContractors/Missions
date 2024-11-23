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
    private _numOfSupplies = selectRandom [1, 2, 3, 4];
    private _deliverySupplies = [];
    for "_i" from 1 to _numOfSupplies do {
        _randomSupply = selectRandom _supplies;
        _deliverySupplies pushBack _randomSupply;
        _supplies deleteAt (_supplies find _randomSupply);
    };

    deliveries pushBack _deliverySupplies;
} forEach deliveryCamps;
