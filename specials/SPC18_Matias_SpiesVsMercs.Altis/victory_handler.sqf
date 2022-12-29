//Spies win end
if (spies_extracted == true) then
{
	"end2" call BIS_fnc_endMissionServer;
	[mission_victoryHandlerPFH] call CBA_fnc_removePerFrameHandler;
};

//This will count the alive spies
_aliveSpies = {isPlayer _x && alive _x && side _x == west} count allUnits;

//Mercs win end
if (_aliveSpies == 0) then
{
	"end1" call BIS_fnc_endMissionServer;
	[mission_victoryHandlerPFH] call CBA_fnc_removePerFrameHandler;
};

//This will count the alive mercs 
_aliveMercs = {isPlayer _x && alive _x && side _x == east} count allUnits;

//Spies kill all mercs end
if (_aliveMercs == 0) then
{
	"end3" call BIS_fnc_endMissionServer;
	[mission_victoryHandlerPFH] call CBA_fnc_removePerFrameHandler;
};
