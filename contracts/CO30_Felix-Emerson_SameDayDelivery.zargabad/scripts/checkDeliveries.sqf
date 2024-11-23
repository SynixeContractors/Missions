params ["_player"];

private _text = "
IDAP reports that the following supplies have been delivered.
<br/>
<br/>
";

// get array of all objects with certain class names, these are our supply objects
private _allSupplies = ("Land_FoodSacks_01_cargo_white_idap_F" allObjects 1) ;
_allSupplies append ("Land_PaperBox_01_small_stacked_F" allObjects 1);

// iterate over each delivery and create structured text
private _numOfDeliveries = count deliveryCamps;
for "_i" from 0 to (_numOfDeliveries - 1) do {
    // camp name
    _text = _text + (deliveryCamps select _i) + ": <br/>";

    // supplies inside that camp's area marker
    {
        if (_x inArea (deliveryCamps select _i)) then {
            // get display name of supply object
            private _supplyConfig = configOf _x;
            private _supplyName = [_supplyConfig] call BIS_fnc_displayName;

            _text = _text + _supplyName + "<br/>";
        }
    } forEach _allSupplies;

    _text = _text + "<br/>";
};

// give a hint to the player who called the function
["FELIX_hintSilent", [_text], _player] call CBA_fnc_globalEvent;
