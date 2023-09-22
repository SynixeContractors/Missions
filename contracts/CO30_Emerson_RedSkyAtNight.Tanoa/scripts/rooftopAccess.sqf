// define default buildings from Tanoa
private _defaultBuildings = [
    "multistorybuilding_01_f.p3d"
];

params [
    ["_trigger", objNull, [objNull]],
    ["_allowlist", _defaultBuildings, [_defaultBuildings]]
];

// need a trigger to be able to run this script
if (isNull _trigger) exitWith {};

// -- the arrays below are in format: [_relPos, [_relVectorDir, _relVectorUp]] --

// Land_MultistoryBuilding_01_F (blue office building)
private _building01groundDoors = [[[-16.9321,-17.9134,-20.7814],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-16.8501,-12.2909,-20.5368],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[-16.8501,6.79603,-20.5368],[[0.0086691,0.999962,1.3575e-005],[0.999962,-0.00866909,-0.000833524]]],[[9.57422,-11.7411,-20.9288],[[-0.00706539,-0.999975,-2.95788e-006],[-0.999974,0.00706539,-0.00079078]]],[[18.1987,5.01966,-20.9288],[[-0.999987,0.00499017,-5.75803e-006],[0.00499017,0.999987,-0.000786759]]]];
private _building01roofDoors = [[[3.271,13.941,19.4708],[[-0.999962,0.00870901,1.03373e-005],[0.00870899,0.999961,-0.000820117]]]];
private _building01groundLights = [[[-16.46,-18.5643,-19.7456],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[-16.4497,-10.8968,-19.7446],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[-16.4497,8.16761,-19.7446],[[-2.36587e-006,-1,-4.26369e-005],[-0.999999,2.3298e-006,0.000845917]]],[[9.26196,-11.222,-20.0126],[[-0.000143066,1,-5.36144e-005],[0.999999,0.000143107,0.000758713]]],[[18.7207,5.29408,-20.0126],[[1,-0.00026825,-7.03802e-005],[-0.000268197,-0.999999,0.000758842]]]];
private _building01roofLights = [[[4.46973,14.3004,20.6233],[[1,-0.000203403,-7.37672e-005],[-0.000203347,-0.999999,0.000759319]]]];

// get buildings inside trigger
private _triggerArea = triggerArea _trigger; // format [a, b, angle, isRectangle, c]
private _triggerSize =  ((_triggerArea select 0) max (_triggerArea select 1)); // get max size of trigger
private _buildings = nearestTerrainObjects [getPos _trigger, [], _triggerSize, false, true] // get all buildings in radius
                        select {
                            (getModelInfo _x) select 0 in _allowlist &&
                            { _x inArea _trigger }
                        }; // filter to relevant buildings

// iterate through buildings, adding doors and lights based on p3d name
{
    switch ((getModelInfo _x) select 0) do
    {
        case "multistorybuilding_01_f.p3d": {
            private _curBuilding = _x;

            // ground lights
            {
                private _relPos = _x#0;
                private _relDir = _x#1#0;
                private _relUp = _x#1#1;
                private _light = createVehicleLocal ["PortableHelipadLight_01_green_F", [0,0,0]];
                _light enableSimulation false;
                _light setPosWorld (_curBuilding modelToWorldWorld _relPos);
                _light setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

                // ace action
                private _statement = {
                    params ["_target", "_player", "_params"];
                    _params params ["_curBuilding", "_roofDoor"];
                    player setPosWorld (_curBuilding modelToWorldWorld _roofDoor);
                };
                private _action = [
                    "RoofAction", // action name
                    "Go to the Roof", // menu name
                    "", // icon
                    _statement, // statement
                    {true}, // condition
                    {}, // children code
                    [_curBuilding, _building01roofDoors#0#0] // arguments
                ] call ace_interact_menu_fnc_createAction;

                // add ace action for everyone
                [_light, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

            } forEach _building01groundLights;

            // roof lights
            {
                private _relPos = _x#0;
                private _relDir = _x#1#0;
                private _relUp = _x#1#1;
                private _light = createVehicleLocal ["PortableHelipadLight_01_green_F", [0,0,0]];
                _light enableSimulation false;
                _light setPosWorld (_curBuilding modelToWorldWorld _relPos);
                _light setVectorDirAndUp [_curBuilding vectorModelToWorld _relDir, _curBuilding vectorModelToWorld _relUp];

                // ace action
                _condition = {
                    params ["_target", "_player", "_params"];
                    true
                };
                _statement = {
                    params ["_target", "_player", "_params"];
                    _params params ["_curBuilding", "_groundDoor"];
                    player setPosWorld (_curBuilding modelToWorldWorld _groundDoor);
                };
                _action = [
                    "GroundAction", // action name
                    "Go to the Ground", // menu name
                    "", // icon
                    _statement, // statement
                    _condition, // condition
                    {}, // children code
                    [_curBuilding, _building01groundDoors#0#0] // arguments
                ] call ace_interact_menu_fnc_createAction;

                // add ace action for everyone
                [_light, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

            } forEach _building01roofLights;
        };

        default {systemChat "No building found for rooftop access!"};
    };
} forEach _buildings;
