// expect an object or group
params [
    ["_obj", objNull, [objNull, grpNull]]
];

// disable dynamic sim whether single obj or group 
_obj enableDynamicSimulation false;

// if object, disable dynamic sim on group and enable sim on obj
if (_obj isEqualType objNull) then {
    (group _obj) enableDynamicSimulation false; // disables dynamic sim for group
    _obj enableSimulationGlobal true; // enable normal sim
};

// if group, enable sim for each object in group
if (_obj isEqualType grpNull) then {
    {
        _x enableSimulationGlobal true;
    } forEach units _obj;
};