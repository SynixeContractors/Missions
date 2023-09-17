// define default buildings from Tanoa
private _defaultBuildings = [
	"multistorybuilding_01_f.p3d"
];

// default parameters
private _trigger = param [0, objNull];
private _whitelist = param [1, _defaultBuildings];
private _blacklist = param [2, [""]];

// need a trigger to be able to run this script
if (isNull _trigger) exitWith {};

// -- the arrays below are in format: [_relPos, [_relVectorDir, _relVectorUp]] -- 

// Land_MultistoryBuilding_01_F (blue office building)
building01groundDoors = [[[-16.9321,-17.9134,-20.7814],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-16.8501,-12.2909,-20.5368],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-16.8501,6.79603,-20.5368],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[9.57422,-11.7411,-20.9288],[[-0.00706539,-0.999975,-2.95788e-006],[-0.999974,0.00706539,-0.00079078]]],[[18.1987,5.01966,-20.9288],[[-0.999987,0.00499017,-5.75803e-006],[0.00499017,0.999987,-0.000786759]]]];
building01roofDoors = [[[3.271,13.941,19.4708],[[-0.999962,0.00870901,1.03373e-005],[0.00870899,0.999961,-0.000820117]]]];
building01groundLights = [[[-16.46,-18.5643,-19.7456],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[-16.4497,-10.8968,-19.7446],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[-16.4497,8.16761,-19.7446],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[9.26196,-11.222,-20.0126],[[-0.000143066,1,-5.36144e-005],[0.999999,0.000143107,0.000758713]]],[[18.7207,5.29408,-20.0126],[[1,-0.00026825,-7.03802e-005],[-0.000268197,-0.999999,0.000758842]]]];
building01roofLights = [[[4.46973,14.3004,20.6233],[[1,-0.000203403,-7.37672e-005],[-0.000203347,-0.999999,0.000759319]]]];
// publicVariable "building01groundDoors";
// publicVariable "building01roofDoors";
// publicVariable "building01groundLights";
// publicVariable "building01roofLights";

// get buildings inside trigger
_triggerArea = triggerArea _trigger; // format [a, b, angle, isRectangle, c]
_triggerSize =  ((_triggerArea select 0) max (_triggerArea select 1)); // get max size of trigger
_buildings = nearestTerrainObjects [getPos _trigger, [], _triggerSize, false, true]; // get all buildings in radius 
_buildings = _buildings select {(getModelInfo _x) select 0 in _whitelist && !((getModelInfo _x) select 0 in _blacklist)}; // filter to relevant buildings 
_buildings = _buildings select {_x inArea _trigger}; // filter to buildings inside trigger area 
//hintSilent str _buildings;

// iterate through buildings, adding doors and lights based on p3d name 
{
	switch ((getModelInfo _x) select 0) do 
	{
		case "multistorybuilding_01_f.p3d": {
			_curBuilding = _x;

            /*
			// ground doors 
			{
				_relPos = _x#0;
				_relDir = _x#1#0;
				_relUp = _x#1#1;
				_door = createVehicle ["Land_InvisibleBarrier_F", [0,0,0]];
				_door setPosWorld (_curBuilding modelToWorldWorld _relPos);
				_door setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

				// ground door action 
				[
					_door, 
					"Go to the Roof", 
					"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_unloadVehicle_ca.paa", 
					"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_unloadVehicle_ca.paa", 
					"_this distance _target < 3", 
					"_caller distance _target < 3", 
					{}, 
					{}, 
					{
						params ["_target", "_caller", "_actionId", "_arguments"];
						_arguments params ["_curBuilding"];
						_roofDoor = building01roofDoors#0#0;
						player setPosWorld (_curBuilding modelToWorldWorld _roofDoor);
					}, 
					{}, 
					[_curBuilding], 
					15, 
					6, 
					false, 
					false
				] remoteExec ["BIS_fnc_holdActionAdd", 0, _door];
			} forEach building01groundDoors;
			
			// roof doors 
			{
				_relPos = _x#0;
				_relDir = _x#1#0;
				_relUp = _x#1#1;
				_door = createVehicle ["Land_InvisibleBarrier_F", [0,0,0]];
				_door setPosWorld (_curBuilding modelToWorldWorld _relPos);
				_door setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

				// roof door action 
				[
					_door, 
					"Go to the Ground", 
					"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa", 
					"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa", 
					"_this distance _target < 3", 
					"_caller distance _target < 3", 
					{}, 
					{}, 
					{
						params ["_target", "_caller", "_actionId", "_arguments"];
						_arguments params ["_curBuilding"];
						_groundDoor = building01groundDoors#0#0;
						player setPosWorld (_curBuilding modelToWorldWorld _groundDoor);
					}, 
					{}, 
					[_curBuilding], 
					15, 
					6, 
					false, 
					false
				] remoteExec ["BIS_fnc_holdActionAdd", 0, _door];
			} forEach building01roofDoors;
            */

			// ground lights
			{
				_relPos = _x#0;
				_relDir = _x#1#0;
				_relUp = _x#1#1;
				_light = createVehicle ["PortableHelipadLight_01_green_F", [0,0,0]];
				_light enableSimulationGlobal false;
				_light setPosWorld (_curBuilding modelToWorldWorld _relPos);
				_light setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

				// ace action 
                _condition = {
                    params ["_target", "_player", "_params"];
                    true
                };
                _statement = {
                    params ["_target", "_player", "_params"];
                    _curBuilding = _params select 0;
                    _roofDoor = building01roofDoors#0#0;
                    player setPosWorld (_curBuilding modelToWorldWorld _roofDoor);
                };
                _action = [
                    "RoofAction", // action name
                    "Go to the Roof", // menu name
                    "", // icon
                    _statement, // statement
                    _condition, // condition
                    {}, // children code
                    [_curBuilding] // arguments
                ] call ace_interact_menu_fnc_createAction;

                // add ace action for everyone
				[_light, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

			} forEach building01groundLights;

            // roof lights
			{
				_relPos = _x#0;
				_relDir = _x#1#0;
				_relUp = _x#1#1;
				_light = createVehicle ["PortableHelipadLight_01_green_F", [0,0,0]];
				_light enableSimulationGlobal false;
				_light setPosWorld (_curBuilding modelToWorldWorld _relPos);
				_light setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

				// ace action 
                _condition = {
                    params ["_target", "_player", "_params"];
                    true
                };
                _statement = {
                    params ["_target", "_player", "_params"];
                    _curBuilding = _params select 0;
                    _groundDoor = building01groundDoors#0#0;
                    player setPosWorld (_curBuilding modelToWorldWorld _groundDoor);
                };
                _action = [
                    "GroundAction", // action name
                    "Go to the Ground", // menu name
                    "", // icon
                    _statement, // statement
                    _condition, // condition
                    {}, // children code
                    [_curBuilding] // arguments
                ] call ace_interact_menu_fnc_createAction;

                // add ace action for everyone
				[_light, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

			} forEach building01roofLights;
		};

		default {systemChat "No building found for rooftop access!"};
	};
} forEach _buildings;