params ["_player", "_mortar"];
private _target = laserTarget _player;
if (_target isEqualTo objNull) exitWith {};
private _ammo = getArtilleryAmmo [_mortar] select 0;
_mortar doArtilleryFire [getPosATL _target, _ammo, 2];
_mortar setVehicleAmmo 1;