sleep 300;

//////////////////////////////////////////////////// WAVE 1 ////////////////////////////////////////////////////////////////////

private ["_group1","_group2","_attackPos"];
 
DEAD_VAR_GROUP1 = 0;
DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
//DEAD_VAR_GROUP4 = 0;
 
_group1 = [getMarkerPos "spawn_2", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
_group2 = [getMarkerPos "spawn_7", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
//_group4 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_9";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group1 + units _group2);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP1 = 1;
	};
}];
} forEach units _group1;
 
{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP2 = 1;
	};
}];
} forEach units _group2;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP1 == 1 && DEAD_VAR_GROUP2 == 1)};

sleep (60 + random 300);
 
//////////////////////////////////////////////////// WAVE 2 ////////////////////////////////////////////////////////////////////

private ["_group1","_group2","_attackPos"];
 
//DEAD_VAR_GROUP1 = 0;
//DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
DEAD_VAR_GROUP4 = 0;
 
//_group1 = [getMarkerPos "spawn_2", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
//_group2 = [getMarkerPos "spawn_7", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
_group4 = [getMarkerPos "spawn_5", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_14";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group4);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP4 = 1;
	};
}];
} forEach units _group4;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP4 == 1)};

sleep (60 + random 300);

//////////////////////////////////////////////////// WAVE 3 ////////////////////////////////////////////////////////////////////

private ["_group1","_group2","_attackPos"];
 
DEAD_VAR_GROUP1 = 0;
DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
//DEAD_VAR_GROUP4 = 0;
 
_group1 = [getMarkerPos "spawn_5", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
_group2 = [getMarkerPos "spawn_3", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
//_group4 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_9";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group1 + units _group2);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP1 = 1;
	};
}];
} forEach units _group1;
 
{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP2 = 1;
	};
}];
} forEach units _group2;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP1 == 1 && DEAD_VAR_GROUP2 == 1)};

sleep (60 + random 300);

//////////////////////////////////////////////////// WAVE 4 ////////////////////////////////////////////////////////////////////


private ["_group1","_group2","_attackPos"];
 
DEAD_VAR_GROUP1 = 0;
DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
//DEAD_VAR_GROUP4 = 0;
 
_group1 = [getMarkerPos "spawn_2", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
_group2 = [getMarkerPos "spawn_6", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
//_group4 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_8";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group1 + units _group2);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP1 = 1;
	};
}];
} forEach units _group1;
 
{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP2 = 1;
	};
}];
} forEach units _group2;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP1 == 1 && DEAD_VAR_GROUP2 == 1)};

sleep (60 + random 300);

//////////////////////////////////////////////////// WAVE 5 ////////////////////////////////////////////////////////////////////

private ["_group1","_group2","_attackPos"];
 
//DEAD_VAR_GROUP1 = 0;
//DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
DEAD_VAR_GROUP4 = 0;
 
//_group1 = [getMarkerPos "spawn_5", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
//_group2 = [getMarkerPos "spawn_3", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "spawn_1", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
_group4 = [getMarkerPos "spawn_1", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_6";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group4);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP4 = 1;
	};
}];
} forEach units _group4;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP4 == 1)};

sleep (60 + random 300);

//////////////////////////////////////////////////// WAVE 6 ////////////////////////////////////////////////////////////////////


private ["_group1","_group2","_attackPos"];
 
DEAD_VAR_GROUP1 = 0;
DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
//DEAD_VAR_GROUP4 = 0;
 
_group1 = [getMarkerPos "spawn_4", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
_group2 = [getMarkerPos "spawn_5", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
//_group4 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_8";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group1 + units _group2);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP1 = 1;
	};
}];
} forEach units _group1;
 
{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP2 = 1;
	};
}];
} forEach units _group2;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP1 == 1 && DEAD_VAR_GROUP2 == 1)};

sleep (60 + random 300);

//////////////////////////////////////////////////// WAVE 7 ////////////////////////////////////////////////////////////////////

private ["_group1","_group2","_attackPos"];
 
//DEAD_VAR_GROUP1 = 0;
//DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
DEAD_VAR_GROUP4 = 0;
 
//_group1 = [getMarkerPos "spawn_5", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
//_group2 = [getMarkerPos "spawn_3", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "spawn_1", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
_group4 = [getMarkerPos "spawn_9", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_7";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group4);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP4 = 1;
	};
}];
} forEach units _group4;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP4 == 1)};

sleep (60 + random 300);

//////////////////////////////////////////////////// WAVE 8 ////////////////////////////////////////////////////////////////////

private ["_group1","_group2","_attackPos"];
 
DEAD_VAR_GROUP1 = 0;
DEAD_VAR_GROUP2 = 0;
//DEAD_VAR_GROUP3 = 0;
//DEAD_VAR_GROUP4 = 0;
 
_group1 = [getMarkerPos "spawn_2", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Demosquad")] call BIS_fnc_spawnGroup;
_group2 = [getMarkerPos "spawn_7", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Patrol")] call BIS_fnc_spawnGroup;
//_group3 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_ATTeam")] call BIS_fnc_spawnGroup;
//_group4 = [getMarkerPos "", EAST, (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry" >> "CUP_O_TK_MILITIA_Group")] call BIS_fnc_spawnGroup;
_attackPos = getMarkerPos "marker_9";
 
_SpawnWave = 
{
   {
       _x setSkill ["general",1];
       _x setSkill ["aimingAccuracy",0.1];
       _x setSkill ["aimingShake",1];
       _x setSkill ["aimingSpeed",0.1];
       _x setSkill ["endurance",0.3];
       _x setSkill ["spotDistance",0.2];
       _x setSkill ["spotTime",0.7];
       _x setSkill ["courage",1];
       _x setSkill ["reloadspeed",0.5];
       _x setSkill ["commanding",1];
       _x doMove _attackPos;
 
   } forEach (units _group1 + units _group2);
};

{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP1 = 1;
	};
}];
} forEach units _group1;
 
{_x addEventHandler ["killed", 
{
_grp = group (_this select 0);
	if ({ alive _x } count units _grp < 1) then
	{
	DEAD_VAR_GROUP2 = 1;
	};
}];
} forEach units _group2;

[] call _SpawnWave;
waituntil {(DEAD_VAR_GROUP1 == 1 && DEAD_VAR_GROUP2 == 1)};

sleep 20;

["All attackers have been defeated"] remoteExec ["hint", 0];
