// get chemical detector, init value
"ChemicalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 0, true];
private _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
private _obj = _ui displayCtrl 101;
_obj ctrlAnimateModel ["Threat_Level_Source", 0.00, true];

// event handler that animates chemical detector value every 5 seconds
chemDetector_EH = [
	{
		// max distance detector can detect
		_detectorDistance = 100;

		// get closest research sample obj in mission
		_distance = selectMin [open_obj_1 distance player, open_obj_2 distance player, open_obj_3 distance player];

		// interpolate distance as 0 to 100 value
		if (_distance <= _detectorDistance) then {
			_threat = parseNumber (((_detectorDistance - _distance) / _detectorDistance) toFixed 2);
			(_this select 0) select 0 ctrlAnimateModel ["Threat_Level_Source", _threat, true];
		} else {
			(_this select 0) select 0 ctrlAnimateModel ["Threat_Level_Source", 0, true];
		};
	},
	5,
	[_obj]
] call CBA_fnc_addPerFrameHandler;