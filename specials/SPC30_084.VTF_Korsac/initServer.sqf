[
    "Overworld",
    "Alpha"
] apply {
    private _layer = toLower _x;
    private _objects = (getMissionLayerEntities _x) select 0;
    {
        _x setVariable ["mission_layer", _layer, true];
        _x hideObjectGlobal true;
    } forEach _objects;
    missionNamespace setVariable [format ["mission_layer_%1", _layer], _objects, true];
};
