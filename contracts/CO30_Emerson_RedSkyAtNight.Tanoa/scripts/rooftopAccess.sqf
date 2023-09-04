// define default buildings from Tanoa
private _defaultBuildings = [
	"multistorybuilding_03_f.p3d",
	"multistorybuilding_01_f.p3d",
	"multistorybuilding_04_f.p3d"
];

// default parameters
private _trigger = param [0, objNull];
private _whitelist = param [1, _defaultBuildings];
private _blacklist = param [2, [""]];

// need a trigger to be able to run this script
if (isNull _trigger) exitWith {};

// -- the arrays below are in format: [_relPos, [_relVectorDir, _relVectorUp]] -- 

// Land_MultistoryBuilding_03_F (red and white)
building03groundDoors = [[[-1.01807,4.96595,-25.7232],[[0.00866911,0.999963,1.3575e-005],[0.999963,-0.0086691,-0.000833525]]],[[-7.08496,13.1325,-25.7581],[[0.00866911,0.999963,1.3575e-005],[0.999963,-0.0086691,-0.000833525]]],[[-6.61377,-1.84802,-23.7708],[[0.00866911,0.999963,1.3575e-005],[0.999963,-0.0086691,-0.000833525]]],[[0.125977,-12.3583,-25.4509],[[-0.99998,0.00646512,1.70344e-005],[0.0064651,0.999979,-0.000824899]]],[[11.165,-0.282585,-25.7552],[[-0.00634891,-0.99998,2.29478e-006],[-0.99998,0.00634891,-0.000836722]]],[[11.1006,12.7887,-25.7075],[[-0.00634891,-0.99998,2.29478e-006],[-0.99998,0.00634891,-0.000836722]]],[[2.0752,16.6076,-25.7385],[[1,0.00053595,-1.2438e-005],[0.000535939,-1,-0.000837012]]]];
building03roofDoors = [[[-0.132813,10.8243,26.2408],[[8.74228e-008,-1,0],[1,8.74228e-008,-4.37114e-008]]]];
building03groundLights = [[[-6.78564,12.4401,-24.4165],[[-2.36587e-006,-1,-4.26369e-005],[-1,2.3298e-006,0.000845918]]],[[-0.678223,4.20374,-24.4164],[[-2.36587e-006,-1,-4.26369e-005],[-1,2.3298e-006,0.000845918]]],[[-6.29785,-0.571649,-22.617],[[-2.36587e-006,-1,-4.26369e-005],[-1,2.3298e-006,0.000845918]]],[[-1.10645,-12.0414,-24.5074],[[1,0.00105959,-5.90828e-005],[0.00105964,-1,0.000846342]]],[[10.8535,0.417611,-24.3734],[[-0.00301389,0.999996,-0.000188083],[0.999996,0.00301406,0.000900174]]],[[10.8394,11.6403,-24.8126],[[-0.00301389,0.999996,-0.000188083],[0.999996,0.00301406,0.000900174]]],[[1.4043,16.3224,-24.4171],[[-0.999997,-0.00248931,-0.000182558],[-0.00248948,0.999997,0.000911722]]]];
building03roofLights = [[[0.238281,10.1173,27.4311],[[0.00274266,-0.999997,-0.000196219],[-0.999996,-0.00274283,0.000906574]]]];
publicVariable "building03groundDoors";
publicVariable "building03roofDoors";
publicVariable "building03groundLights";
publicVariable "building03roofLights";

// Land_MultistoryBuilding_01_F (blue office building)
building01groundDoors = [[[-16.9321,-17.9134,-20.7814],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-16.8501,-12.2909,-20.5368],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-16.8501,6.79603,-20.5368],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[9.57422,-11.7411,-20.9288],[[-0.00706539,-0.999975,-2.95788e-006],[-0.999974,0.00706539,-0.00079078]]],[[18.1987,5.01966,-20.9288],[[-0.999987,0.00499017,-5.75803e-006],[0.00499017,0.999987,-0.000786759]]]];
building01roofDoors = [[[3.271,13.941,19.4708],[[-0.999962,0.00870901,1.03373e-005],[0.00870899,0.999961,-0.000820117]]]];
building01groundLights = [[[-16.46,-18.5643,-19.7456],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[-16.4497,-10.8968,-19.7446],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[-16.4497,8.16761,-19.7446],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[9.26196,-11.222,-20.0126],[[-0.000143066,1,-5.36144e-005],[0.999999,0.000143107,0.000758713]]],[[18.7207,5.29408,-20.0126],[[1,-0.00026825,-7.03802e-005],[-0.000268197,-0.999999,0.000758842]]]];
building01roofLights = [[[4.46973,14.3004,20.6233],[[1,-0.000203403,-7.37672e-005],[-0.000203347,-0.999999,0.000759319]]]];
publicVariable "building01groundDoors";
publicVariable "building01roofDoors";
publicVariable "building01groundLights";
publicVariable "building01roofLights";

// Land_MultistoryBuilding_04_F (white and tan)
building04groundDoors = [[[-8.51929,-4.44371,-35.7541],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-8.19531,9.56655,-36.1919],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[7.25708,-8.79722,-35.7808],[[-0.999983,0.00570735,2.12739e-005],[0.00570733,0.999983,-0.000818227]]],[[12.884,3.29262,-36.2196],[[-0.00848776,-0.999964,7.45058e-007],[-0.999963,0.00848776,-0.000823095]]],[[4.08398,13.2897,-36.2002],[[0.999948,-0.0101648,-8.59141e-007],[-0.0101648,-0.999948,-0.000833869]]],[[0.876953,13.2897,-36.2002],[[0.999948,-0.0101648,-8.59141e-007],[-0.0101648,-0.999948,-0.000833869]]]];
building04roofDoors = [[[4.78076,2.38344,22.6853],[[-0.01084,-0.999941,-2.16886e-005],[-0.999941,0.01084,-0.000846856]]]];
building04groundLights = [[[3.41602,12.963,-34.9902],[[-0.999993,-0.00370856,-0.000206844],[-0.00370874,0.999992,0.000892645]]],[[0.213867,12.963,-34.9902],[[-0.999993,-0.00370856,-0.000206844],[-0.00370874,0.999992,0.000892645]]],[[12.5491,4.05971,-34.9909],[[-0.00311435,0.999995,-0.000209689],[0.999995,0.00311453,0.000889086]]],[[6.01953,-8.49302,-34.9694],[[0.999991,0.00411984,-0.000221137],[0.00412004,-0.999991,0.000894972]]],[[-8.16211,-3.21812,-34.9694],[[0.00437256,-0.99999,-0.000248164],[-0.99999,-0.00437278,0.000889457]]],[[-7.90552,8.87368,-34.9904],[[0.00437256,-0.99999,-0.000248164],[-0.99999,-0.00437278,0.000889457]]]];
building04roofLights = [[[4.41431,3.08461,23.8178],[[-0.00311435,0.999995,-0.000209689],[0.999995,0.00311453,0.000889086]]]];
publicVariable "building04groundDoors";
publicVariable "building04roofDoors";
publicVariable "building04groundLights";
publicVariable "building04roofLights";

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
		case "multistorybuilding_03_f.p3d": {
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
						_roofDoor = building03roofDoors#0#0;
						player setPosWorld (_curBuilding modelToWorldWorld _roofDoor);
					}, 
					{}, 
					[_curBuilding], 
					15, 
					6, 
					false, 
					false
				] remoteExec ["BIS_fnc_holdActionAdd", 0, _door];
			} forEach building03groundDoors;
			
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
						_groundDoor = building03groundDoors#0#0;
						player setPosWorld (_curBuilding modelToWorldWorld _groundDoor);
					}, 
					{}, 
					[_curBuilding], 
					15, 
					6, 
					false, 
					false
				] remoteExec ["BIS_fnc_holdActionAdd", 0, _door];
			} forEach building03roofDoors;
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

			} forEach building03groundLights;

            // roof lights
			{
				_relPos = _x#0;
				_relDir = _x#1#0;
				_relUp = _x#1#1;
				_light = createVehicle ["PortableHelipadLight_01_green_F", [0,0,0]];
				_light enableSimulationGlobal false;
				_light setPosWorld (_curBuilding modelToWorldWorld _relPos);
				_light setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

			} forEach building03roofLights;
		};

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
				[_light, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

			} forEach building01roofLights;
		};

		case "multistorybuilding_04_f.p3d": {
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
						_roofDoor = building04roofDoors#0#0;
						player setPosWorld (_curBuilding modelToWorldWorld _roofDoor);
					}, 
					{}, 
					[_curBuilding], 
					15, 
					6, 
					false, 
					false
				] remoteExec ["BIS_fnc_holdActionAdd", 0, _door];
			} forEach building04groundDoors;
			
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
						_groundDoor = building04groundDoors#0#0;
						player setPosWorld (_curBuilding modelToWorldWorld _groundDoor);
					}, 
					{}, 
					[_curBuilding], 
					15, 
					6, 
					false, 
					false
				] remoteExec ["BIS_fnc_holdActionAdd", 0, _door];
			} forEach building04roofDoors;
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

			} forEach building04groundLights;

            // roof lights
			{
				_relPos = _x#0;
				_relDir = _x#1#0;
				_relUp = _x#1#1;
				_light = createVehicle ["PortableHelipadLight_01_green_F", [0,0,0]];
				_light enableSimulationGlobal false;
				_light setPosWorld (_curBuilding modelToWorldWorld _relPos);
				_light setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

			} forEach building04roofLights;
		};
		default {systemChat "No building found for rooftop access!"};
	};
} forEach _buildings;