params ["_layer", "_state"];
{
    _x hideObject !_state;
} forEach ((getMissionLayerEntities _layer) select 0);
