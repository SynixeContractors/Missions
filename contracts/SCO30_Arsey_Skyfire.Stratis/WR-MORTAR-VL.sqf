/*

***********************************************************************
*					   _____   ___       ___				___       *
* \        / |   |  |    |    |         |   |   /\  \    / |    |\  | *
*  \  /\  /  |---|  |    |    |--       |--\   /__\  \  /  |--  | \ | *
*   \/  \/   |   |  |    |    |___      |   \ /    \  \/   |___ |  \| *
*                                                                     *
***********************************************************************

1) Place player down and add a laser designator and battery to the player

2) Place a mortar with unit and give the mortar a name.

3) Place a trigger down and change/add the following:

	Activation = Radio Alpha
	
	Repeatable = Tick
	
	On Activation = WR_MVR = [mortarname] execVM "WR-MORTAR-VL.sqf";

*/

//-------------------------------------------------------------- Params

_mortar = _this select 0;

_ammo = getArtilleryAmmo [_mortar] select 0;

//---------------------------------------------------------------------

while {true} do {

//-------------------------------------------------------------- Target

_tgtPos = getPosATL laserTarget player; 

_isInRange = _tgtPos inRangeOfArtillery [[_mortar], _ammo ];

if (_isInRange) then {

_mortar commandArtilleryFire [_tgtPos, _ammo , 2 ]; // (number = amount of rounds sent at 1 target)

};

terminate WR_MVR;

};

//---------------------------------------------------------- Script end