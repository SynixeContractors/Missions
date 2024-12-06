private _text = "
IDAP reports that the following\nsupplies have been delivered.
\n
\n
";

// get array of all objects with certain class names, these are our supply objects
private _allSupplies = ("Land_PaperBox_01_small_closed_white_med_F" allObjects 1) ;
_allSupplies append ("Land_PaperBox_01_small_closed_brown_food_F" allObjects 1);

// iterate over each delivery and create structured text
private _numOfDeliveries = count deliveryCamps;
for "_i" from 0 to (_numOfDeliveries - 1) do {
    // camp name
    _text = _text + (deliveryCamps select _i) + ":\n";

    // supplies inside that camp's area marker
    {
        if (_x inArea (deliveryCamps select _i)) then {
            // get display name of supply object
            private _supplyName = [configOf _x] call BIS_fnc_displayName;

            _text = _text + _supplyName + "\n";
        }
    } forEach _allSupplies;

    _text = _text + "\n";
};

// give a hint to the player who called the function
private _texture = format ["#(rgb,512,512,3)text(1,1,""TahomaB"",0.035,""#ffffff7f"",""#000000"",""%1"")", _text];
if (_texture == (getObjectTextures checkDeliveriesBoard select 0)) exitWith {};
checkDeliveriesBoard setObjectTextureGlobal [0, _texture];
