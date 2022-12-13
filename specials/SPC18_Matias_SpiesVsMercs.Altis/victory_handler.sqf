//Spies win end
if (spies_extracted == true) then
{
	"end2" call BIS_fnc_endMission;
};

//This will count the alive players
_alivePlayers = {isPlayer _x && alive _x && side == west} count allUnits;

//Mercs win end
if (_alivePlayers == 0) then
{
	"end1" call BIS_fnc_endMission;
};

