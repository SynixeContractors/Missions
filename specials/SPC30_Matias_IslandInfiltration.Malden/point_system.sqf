//Set points at start

private _points_infiltrators = 0;

private _points_defenders = 18;

//Manage the points
if (!alive rbay_destroy_check) then
{
	_points_defenders - 2
	_points_infiltrators + 2
};

if (!alive fdepot_destroy_check) then
{
	_points_defenders - 1
	_points_infiltrators + 1
};

if (!alive astorage_destroy_check) then
{
	_points_defenders - 2
	_points_infiltrators + 2
};

if (!alive cuplink_destroy_check) then
{
	_points_defenders - 3
	_points_infiltrators + 3
};

if (!alive sstaffquarters_destroy_check) then
{
	_points_defenders - 1
	_points_infiltrators + 1
};

if (!alive wstorage_destroy_check) then
{
	_points_defenders - 2
	_points_infiltrators + 2
};

if (!alive hpad_destroy_check) then
{
	_points_defenders - 2
	_points_infiltrators + 2
};

if (!alive radar_destroy_check) then
{
	_points_defenders - 1
	_points_infiltrators + 1
};

if (!alive vstorage_destroy_check) then
{
	_points_defenders - 2
	_points_infiltrators + 2
};

if (!alive ctb_destroy_check) then
{
	_points_defenders - 1
	_points_infiltrators + 1
};

if (!alive ctb_destroy_check) then
{
	_points_defenders - 1
	_points_infiltrators + 1
};

//End in which all of the infrastructure is destroyed

if (_points_defenders == 0) then
{
	"end1" call BIS_fnc_endMission;
};

//Check infiltrator respawn tickets
private _infilTickets = [east] call BIS_fnc_respawnTickets;

//Check number of infiltrators that are alive
private _aliveInfil = east countSide playableUnits;

//End in which all of the infiltrators are wiped out, will show the points for each side on the chat
if (_infilTickets == 0 and _aliveInfil == 0) then
{
	"end2" call BIS_fnc_endMission;
	_unit globalChat (format ["Defender points:%1 and Infiltrator points:%2",_points_defenders,_points_infiltrators]);
};

//End in which op time end is reached