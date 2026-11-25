// Hard Bargain - server side contract logic
// Syndikat hold three villages. Two hold hostages, three each, tied up by Syndikat.
// The third holds Solomone Mahe, the lieutenant running the kidnapping, who runs for his
// car when his village is attacked.
//
// Villages, houses and roads are picked at mission start from the map. Nothing hostile
// spawns until a player leaves base (see AGENTS.md). Players get no scripted information.

if (!isServer) exitWith {};

// ------------------------------------------------------------------
// Settings
// ------------------------------------------------------------------
mission_basePos = [5431,4305,0];    // Synixe staging area, where the player slots are
mission_departRadius = 700;        // The contract starts when a player gets this far from base
mission_deliverRadius = 30;         // Hostages this close to the checkpoint are handed over
mission_qrfMax = 2;                 // Reinforcement waves, one per alerted village

private _m = "synixe_factions_syndikat_militia_";      // Bandits, hold the villages
private _a = "synixe_factions_syndikat_army_combat_";  // Paramilitary, Mahe's people and reinforcements
mission_classes = createHashMapFromArray [
    ["team4",  [_m + "TeamLeader", _m + "Rifleman", _m + "Autorifleman", _m + "Rifleman"]],
    ["team6",  [_m + "TeamLeader", _m + "Rifleman", _m + "Rifleman", _m + "Autorifleman", _m + "Marksman", _m + "Medic"]],
    ["squad8", [_m + "SquadLeader", _m + "TeamLeader", _m + "Rifleman", _m + "Rifleman", _m + "Autorifleman", _m + "Machinegunner", _m + "RiflemanMAT", _m + "Medic"]],
    ["bodyguards", [_a + "TeamLeader", _a + "Rifleman", _a + "Rifleman", _a + "Autorifleman", _a + "Marksman", _a + "Medic"]],
    ["qrfTeam", [_a + "TeamLeader", _a + "Rifleman", _a + "Autorifleman", _a + "RiflemanMAT"]],
    ["boss", _a + "SquadLeader"],
    ["technical", _a + "Offroad_HMG"],
    ["technicalAT", _a + "Offroad_AT"],
    ["roamer", _m + "Jeep_LMG"],
    ["bossCar", _a + "Offroad_Covered"],
    ["transport", _a + "Offroad_Covered"],
    ["static", _a + "M2_High"],
    ["guard", [
        "synixe_factions_nghi_army_garrison_TeamLeader",
        "synixe_factions_nghi_army_garrison_Rifleman",
        "synixe_factions_nghi_army_garrison_Autorifleman",
        "synixe_factions_nghi_army_garrison_Rifleman",
        "synixe_factions_nghi_army_garrison_Medic"
    ]],
    ["guardCar", "synixe_factions_nghi_army_combat_Ram_Covered"]
];

// Hostages: [name, class], two groups of three. The first in each group leads it.
mission_hostageGroups = [
    [
        ["Doctor Hanna Weiss", "synixe_factions_civilians_Citizen_Polo_Pants_Altian"],
        ["Mele Tavita", "synixe_factions_civilians_Citizen_Summer_Tanoan"],
        ["Iosefa Kauhalo", "synixe_factions_civilians_Citizen_Sport_Tanoan"]
    ],
    [
        ["Doctor Samuel Okafor", "synixe_factions_civilians_Citizen_Polo_Pants_Altian"],
        ["Ana Lealofi", "synixe_factions_civilians_Citizen_Polo_Shorts_Tanoan"],
        ["Tevita Naufahu", "synixe_factions_civilians_Citizen_Polo_Pants_Tanoan"]
    ]
];

// ------------------------------------------------------------------
// State
// ------------------------------------------------------------------
mission_departTime = -1;
mission_hostileGroups = [];   // [group, village index, kind]
mission_hostages = [];
mission_alarms = [false, false, false];
mission_qrfCount = 0;
mission_boss = objNull;
mission_bossCar = objNull;
mission_bossFled = false;
mission_checkpointGroup = grpNull;

// ------------------------------------------------------------------
// Helpers
// ------------------------------------------------------------------
// Server RPT only, for debugging
mission_fnc_log = {
    params ["_text"];
    diag_log format ["[FirstLight] %1", _text];
};

mission_fnc_players = {
    allPlayers - entities "HeadlessClient_F"
};

mission_fnc_zeus = {
    params ["_objects"];
    {
        _x addCuratorEditableObjects [_objects, true];
    } forEach allCurators;
};

// True if a straight line between two positions stays on land
mission_fnc_landLink = {
    params ["_a", "_b"];
    private _dist = _a distance2D _b;
    private _dir = _a getDir _b;
    private _ok = true;
    for "_i" from 1 to (floor (_dist / 50)) do {
        if (surfaceIsWater (_a getPos [_i * 50, _dir])) exitWith { _ok = false };
    };
    _ok
};

// Road position between _min and _max metres from _center, not near players
mission_fnc_roadInRing = {
    params ["_center", "_min", "_max", ["_playerGap", 700]];
    private _result = [];
    private _tries = 0;
    private _players = call mission_fnc_players;
    while {_result isEqualTo [] && {_tries < 60}} do {
        _tries = _tries + 1;
        private _probe = _center getPos [_min + random (_max - _min), random 360];
        private _roads = _probe nearRoads 150;
        if (_roads isNotEqualTo []) then {
            private _road = selectRandom _roads;
            private _dist = _road distance2D _center;
            if (_dist > _min && {_dist < _max} && {(_players findIf {_x distance2D _road < _playerGap}) == -1}) then {
                _result = [getPosATL _road, _road];
            };
        };
    };
    if (_result isEqualTo []) then {
        _result = [_center getPos [_min, random 360], objNull];
    };
    _result
};

mission_fnc_roadDir = {
    params ["_road"];
    if (isNull _road) exitWith { random 360 };
    private _connected = roadsConnectedTo _road;
    if (_connected isEqualTo []) exitWith { random 360 };
    _road getDir (_connected # 0)
};

mission_fnc_nearestRoad = {
    params ["_pos", ["_radius", 80]];
    private _roads = _pos nearRoads _radius;
    if (_roads isEqualTo []) exitWith { [_pos, objNull] };
    _roads = [_roads, [], { _x distance2D _pos }, "ASCEND"] call BIS_fnc_sortBy;
    [getPosATL (_roads # 0), _roads # 0]
};

mission_fnc_house = {
    params ["_center", "_radius", "_minPositions"];
    private _houses = (nearestObjects [_center, ["House"], _radius]) select { count (_x buildingPos -1) >= _minPositions };
    if (_houses isEqualTo []) exitWith { objNull };
    selectRandom _houses
};

mission_fnc_sideOf = {
    params ["_class"];
    [getNumber (configFile >> "CfgVehicles" >> _class >> "side")] call BIS_fnc_sideType
};

// Faction units must be created after CBA_missionTime > 1, see AGENTS.md
mission_fnc_spawnGroup = {
    params ["_pos", "_classes", ["_side", east]];
    private _group = createGroup [_side, true];
    {
        _group createUnit [_x, _pos, [], 8, "NONE"];
    } forEach _classes;
    _group setBehaviour "AWARE";
    _group setCombatMode "YELLOW";
    _group setVariable ["lambs_danger_enableGroupReinforce", true, true];
    [units _group] call mission_fnc_zeus;
    _group
};

mission_fnc_spawnVehicle = {
    params ["_class", "_pos", "_road", ["_crew", true]];
    private _veh = createVehicle [_class, _pos, [], 0, "NONE"];
    _veh setDir ([_road] call mission_fnc_roadDir);
    if (_crew) then {
        createVehicleCrew _veh;
        if (isNull driver _veh) exitWith {};
        private _group = group driver _veh;
        _group setVariable ["lambs_danger_enableGroupReinforce", true, true];
        [crew _veh] call mission_fnc_zeus;
    };
    [[_veh]] call mission_fnc_zeus;
    _veh
};

mission_fnc_addHostile = {
    params ["_group", "_village", "_kind"];
    mission_hostileGroups pushBack [_group, _village, _kind];
};

mission_fnc_ableUnits = {
    params ["_units"];
    _units select {
        alive _x
        && {lifeState _x in ["HEALTHY", "INJURED"]}
        && {!captive _x}
    }
};

// Cancel a group's LAMBS task, returns the new group
mission_fnc_resetGroup = {
    params ["_group"];
    _group enableDynamicSimulation false;
    private _new = [_group] call lambs_wp_fnc_taskReset;
    _new enableDynamicSimulation false;
    _new setVariable ["lambs_danger_enableGroupReinforce", true, true];
    _new
};

// ------------------------------------------------------------------
// Pick the villages: three held villages close together, on the same landmass,
// 3 to 9 km from base
// ------------------------------------------------------------------
private _locations = (nearestLocations [mission_basePos, ["NameVillage", "NameCity"], 15000]) select { text _x != "" };
private _candidates = _locations select {
    private _d = (locationPosition _x) distance2D mission_basePos;
    _d > 3000 && {_d < 9000}
};

private _fnc_cluster = {
    params ["_landCheck"];
    private _clusters = [];
    {
        private _anchor = _x;
        private _apos = locationPosition _anchor;
        private _near = (_locations select {
            private _d = (locationPosition _x) distance2D _apos;
            _x isNotEqualTo _anchor && {_d > 600} && {_d < 2500}
            && {!_landCheck || {[_apos, locationPosition _x] call mission_fnc_landLink}}
        }) call BIS_fnc_arrayShuffle;
        if (count _near >= 2) then {
            private _first = _near # 0;
            private _second = _near findIf {
                (locationPosition _x) distance2D (locationPosition _first) > 600
                && {!_landCheck || {[locationPosition _first, locationPosition _x] call mission_fnc_landLink}}
            };
            if (_second != -1) then {
                _clusters pushBack [_anchor, _first, _near # _second];
            };
        };
    } forEach _candidates;
    _clusters
};

private _clusters = [true] call _fnc_cluster;
if (_clusters isEqualTo []) then {
    diag_log "[FirstLight] No land-linked cluster found, ignoring water between villages";
    _clusters = [false] call _fnc_cluster;
};
if (_clusters isEqualTo []) then {
    diag_log "[FirstLight] No cluster found at all, using three random villages";
    _clusters = [(_candidates call BIS_fnc_arrayShuffle) select [0, 3]];
};

// Roles: 0 = Mahe, 1 = hostage group A, 2 = hostage group B
mission_villages = (selectRandom _clusters) call BIS_fnc_arrayShuffle;
mission_villagePos = mission_villages apply {
    private _p = locationPosition _x;
    _p set [2, 0];
    _p
};
private _centroid = [0, 0, 0];
{ _centroid = _centroid vectorAdd (_x vectorMultiply (1 / 3)) } forEach mission_villagePos;

// Volunteer Guard checkpoint: a road 2 to 3.5 km out, as close to base as possible,
// on the same landmass as the nearest village
private _best = [];
private _bestDist = 1e9;
for "_i" from 1 to 60 do {
    private _probe = _centroid getPos [2000 + random 1500, random 360];
    private _roads = _probe nearRoads 200;
    if (_roads isNotEqualTo []) then {
        private _road = _roads # 0;
        private _p = getPosATL _road;
        private _d = _p distance2D mission_basePos;
        private _nearest = [mission_villagePos, [], { _x distance2D _p }, "ASCEND"] call BIS_fnc_sortBy;
        if (
            _d < _bestDist
            && {(_nearest # 0) distance2D _p > 1500}
            && {[_p, _nearest # 0] call mission_fnc_landLink}
        ) then {
            _best = [_p, _road];
            _bestDist = _d;
        };
    };
};
if (_best isEqualTo []) then {
    _best = [_centroid getPos [2500, _centroid getDir mission_basePos], objNull];
};
mission_checkpoint = _best;

// ------------------------------------------------------------------
// Briefing markers (present from the start)
// ------------------------------------------------------------------
{
    private _area = createMarker [format ["mission_village_area_%1", _forEachIndex], _x];
    _area setMarkerShapeLocal "ELLIPSE";
    _area setMarkerSizeLocal [350, 350];
    _area setMarkerBrushLocal "Border";
    _area setMarkerColor "ColorOPFOR";
    private _icon = createMarker [format ["mission_village_%1", _forEachIndex], _x];
    _icon setMarkerTypeLocal "mil_warning";
    _icon setMarkerColorLocal "ColorOPFOR";
    _icon setMarkerText format ["Held: %1", text (mission_villages # _forEachIndex)];
} forEach mission_villagePos;

private _cp = createMarker ["mission_checkpoint", mission_checkpoint # 0];
_cp setMarkerTypeLocal "mil_flag";
_cp setMarkerColorLocal "ColorGUER";
_cp setMarkerText "Volunteer Guard checkpoint";

// ------------------------------------------------------------------
// Positions picked now, used when spawning
// ------------------------------------------------------------------
mission_hostageHouses = [1, 2] apply {
    private _house = [mission_villagePos # _x, 200, 5] call mission_fnc_house;
    if (isNull _house) then { _house = [mission_villagePos # _x, 300, 3] call mission_fnc_house };
    _house
};
mission_bossHouse = [mission_villagePos # 0, 200, 4] call mission_fnc_house;

[format [
    "Mahe in %1, hostages A in %2, hostages B in %3, checkpoint at %4",
    text (mission_villages # 0), text (mission_villages # 1), text (mission_villages # 2),
    mapGridPosition (mission_checkpoint # 0)
]] call mission_fnc_log;

// ------------------------------------------------------------------
// Spawning
// ------------------------------------------------------------------
mission_fnc_spawnHostages = {
    params ["_index"];
    private _village = _index + 1;
    private _house = mission_hostageHouses # _index;
    private _positions = if (isNull _house) then {
        [1, 2, 3] apply { (mission_villagePos # _village) getPos [3 * _x, random 360] }
    } else {
        ((_house buildingPos -1) call BIS_fnc_arrayShuffle) select [0, 3]
    };
    private _group = createGroup [civilian, true];
    {
        _x params ["_name", "_class"];
        private _pos = _positions select (_forEachIndex min (count _positions - 1));
        private _unit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
        _unit setPosASL (AGLToASL _pos);
        _unit allowFleeing 0;
        _unit disableAI "PATH";
        removeAllWeapons _unit;
        _unit setVariable ["mission_hostageName", _name, true];
        _unit setVariable ["mission_hostageGroup", _index, true];
        [{
            ["ace_captives_setHandcuffed", [_this, true], _this] call CBA_fnc_targetEvent;
        }, _unit, 1] call CBA_fnc_waitAndExecute;
        _unit addMPEventHandler ["MPKilled", {
            params ["_unit"];
            if (!isServer) exitWith {};
            [format ["Hostage %1 killed", _unit getVariable ["mission_hostageName", ""]]] call mission_fnc_log;
        }];
        mission_hostages pushBack _unit;
    } forEach (mission_hostageGroups # _index);
    [units _group] call mission_fnc_zeus;

    // Guards in the house itself
    private _guardPos = if (isNull _house) then { mission_villagePos # _village } else { getPosATL _house };
    private _guards = [_guardPos, mission_classes get "team4"] call mission_fnc_spawnGroup;
    [_guards, _guardPos, 20, [], true] call lambs_wp_fnc_taskGarrison;
    _guards enableDynamicSimulation true;
    [_guards, _village, "guard"] call mission_fnc_addHostile;
};

mission_fnc_spawnVillage = {
    params ["_village", "_garrisons", "_patrolClass", "_defendClass"];
    private _pos = mission_villagePos # _village;
    // Empty M2 near the centre, LAMBS garrison and defend tasks man nearby statics
    private _static = createVehicle [mission_classes get "static", _pos, [], 25, "NONE"];
    _static setDir random 360;
    [[_static]] call mission_fnc_zeus;
    for "_i" from 1 to _garrisons do {
        private _g = [_pos, mission_classes get "squad8"] call mission_fnc_spawnGroup;
        [_g, _pos, 150, [], true] call lambs_wp_fnc_taskGarrison;
        _g enableDynamicSimulation true;
        [_g, _village, "garrison"] call mission_fnc_addHostile;
    };
    private _patrol = [(([_pos] call mission_fnc_nearestRoad) # 0), mission_classes get _patrolClass] call mission_fnc_spawnGroup;
    [_patrol, _pos, 350, 6, [], true, true, false] call lambs_wp_fnc_taskPatrol;
    [_patrol, _village, "patrol"] call mission_fnc_addHostile;
    private _defend = [_pos, mission_classes get _defendClass] call mission_fnc_spawnGroup;
    [_defend, _pos, 100] call lambs_wp_fnc_taskDefend;
    [_defend, _village, "defend"] call mission_fnc_addHostile;
};

mission_fnc_spawnAll = {
    enableDynamicSimulationSystem true;
    "Group" setDynamicSimulationDistance 800;

    // Hostage villages
    { [_x] call mission_fnc_spawnHostages } forEach [0, 1];
    [1, 1, "team6", "team6"] call mission_fnc_spawnVillage;
    [2, 1, "team6", "team6"] call mission_fnc_spawnVillage;

    // Mahe's village
    private _ppos = if (isNull mission_bossHouse) then { mission_villagePos # 0 } else { getPosATL mission_bossHouse };
    private _body = [_ppos, mission_classes get "bodyguards"] call mission_fnc_spawnGroup;
    mission_boss = _body createUnit [mission_classes get "boss", _ppos, [], 3, "NONE"];
    _body selectLeader mission_boss;
    [[mission_boss]] call mission_fnc_zeus;
    [_body, _ppos, 20, [], true] call lambs_wp_fnc_taskGarrison;
    _body enableDynamicSimulation true;
    [_body, 0, "bodyguard"] call mission_fnc_addHostile;
    mission_boss addMPEventHandler ["MPKilled", {
        if (!isServer) exitWith {};
        ["Solomone Mahe was killed"] call mission_fnc_log;
    }];
    ([_ppos, 60] call mission_fnc_nearestRoad) params ["_carPos", "_carRoad"];
    mission_bossCar = [mission_classes get "bossCar", _carPos, _carRoad, false] call mission_fnc_spawnVehicle;
    [0, 2, "team6", "squad8"] call mission_fnc_spawnVillage;

    // Roadblocks on the way into two of the villages
    {
        private _village = _x;
        ([mission_villagePos # _village, 400, 650, 0] call mission_fnc_roadInRing) params ["_pos", "_road"];
        private _tech = [mission_classes get "technical", _pos, _road] call mission_fnc_spawnVehicle;
        if (!isNull driver _tech) then { [group driver _tech, _village, "roadblock"] call mission_fnc_addHostile };
        private _team = [_pos, mission_classes get "team4"] call mission_fnc_spawnGroup;
        [_team, _pos, 40] call lambs_wp_fnc_taskDefend;
        [_team, _village, "roadblock"] call mission_fnc_addHostile;
    } forEach (([0, 1, 2] call BIS_fnc_arrayShuffle) select [0, 2]);

    // Technicals driving between the villages
    for "_i" from 0 to 1 do {
        private _start = mission_villagePos # _i;
        ([_start, 150, 400, 0] call mission_fnc_roadInRing) params ["_pos", "_road"];
        private _tech = [mission_classes get "roamer", _pos, _road] call mission_fnc_spawnVehicle;
        if (!isNull driver _tech) then {
            private _group = group driver _tech;
            _group setBehaviour "SAFE";
            _group setSpeedMode "LIMITED";
            {
                private _wp = _group addWaypoint [(([_x] call mission_fnc_nearestRoad) # 0), 30];
                _wp setWaypointType "MOVE";
            } forEach (mission_villagePos call BIS_fnc_arrayShuffle);
            private _cycle = _group addWaypoint [_pos, 0];
            _cycle setWaypointType "CYCLE";
            [_group, _i, "roam"] call mission_fnc_addHostile;
        };
    };

    // Volunteer Guard checkpoint
    mission_checkpoint params ["_cpPos", "_cpRoad"];
    private _guardClasses = mission_classes get "guard";
    mission_checkpointGroup = [_cpPos, _guardClasses, [_guardClasses # 0] call mission_fnc_sideOf] call mission_fnc_spawnGroup;
    [mission_checkpointGroup, _cpPos, 30] call lambs_wp_fnc_taskDefend;
    [mission_classes get "guardCar", _cpPos getPos [12, ([_cpRoad] call mission_fnc_roadDir) + 90], _cpRoad, false] call mission_fnc_spawnVehicle;
    private _barrier = createVehicle ["RoadBarrier_F", _cpPos, [], 0, "CAN_COLLIDE"];
    _barrier setDir (([_cpRoad] call mission_fnc_roadDir) + 90);

    [format [
        "Spawned %1 Syndikat units in %2 groups",
        { side group _x == east } count allUnits,
        count mission_hostileGroups
    ]] call mission_fnc_log;

    call mission_fnc_startLoops;
};

// ------------------------------------------------------------------
// Reactions
// ------------------------------------------------------------------
mission_fnc_spawnQRF = {
    params ["_village"];
    if (mission_qrfCount >= mission_qrfMax) exitWith {};
    mission_qrfCount = mission_qrfCount + 1;
    private _target = mission_villagePos # _village;
    ([_target, 2500, 3500, 900] call mission_fnc_roadInRing) params ["_pos", "_road"];
    private _approach = _target getPos [350, _target getDir _pos];

    private _tech = [mission_classes get "technical", _pos, _road] call mission_fnc_spawnVehicle;
    if (!isNull driver _tech) then {
        private _group = group driver _tech;
        _group setSpeedMode "FULL";
        _group setCombatMode "RED";
        private _wp = _group addWaypoint [_approach, 50];
        _wp setWaypointType "MOVE";
        _wp setWaypointStatements ["true", "if (local this) then { [group this, 600, 15, [], [], true, true, 0] spawn lambs_wp_fnc_taskHunt; };"];
        [_group, _village, "qrf"] call mission_fnc_addHostile;
    };

    private _techAT = [mission_classes get "technicalAT", _pos getPos [25, ([_road] call mission_fnc_roadDir) + 180], _road] call mission_fnc_spawnVehicle;
    if (!isNull driver _techAT) then {
        private _group = group driver _techAT;
        _group setSpeedMode "FULL";
        _group setCombatMode "RED";
        private _wp = _group addWaypoint [_approach, 50];
        _wp setWaypointType "MOVE";
        _wp setWaypointStatements ["true", "if (local this) then { [group this, 600, 15, [], [], true, true, 0] spawn lambs_wp_fnc_taskHunt; };"];
        [_group, _village, "qrf"] call mission_fnc_addHostile;
    };

    for "_i" from 1 to 2 do {
        private _transport = [mission_classes get "transport", _pos getPos [25 + 25 * _i, ([_road] call mission_fnc_roadDir) + 180], _road] call mission_fnc_spawnVehicle;
        if (!isNull driver _transport) then {
            private _crew = group driver _transport;
            _crew setSpeedMode "FULL";
            private _unload = _crew addWaypoint [_approach, 50];
            _unload setWaypointType "TR UNLOAD";

            private _cargo = [getPosATL _transport, mission_classes get "qrfTeam"] call mission_fnc_spawnGroup;
            {
                _x moveInCargo _transport;
                if (isNull objectParent _x) then { deleteVehicle _x };
            } forEach units _cargo;
            private _getOut = _cargo addWaypoint [_approach, 50];
            _getOut setWaypointType "GETOUT";
            _getOut setWaypointStatements ["true", "if (local this) then { [group this, 600, 15, [], [], true, true, 0] spawn lambs_wp_fnc_taskHunt; };"];
            _unload synchronizeWaypoint [_getOut];
            [_crew, _village, "qrf"] call mission_fnc_addHostile;
            [_cargo, _village, "qrf"] call mission_fnc_addHostile;
        };
    };
    [format ["QRF %1 moving to %2 from %3", mission_qrfCount, text (mission_villages # _village), mapGridPosition _pos]] call mission_fnc_log;
};

mission_fnc_bossFlee = {
    if (mission_bossFled || {!alive mission_boss} || {([[mission_boss]] call mission_fnc_ableUnits) isEqualTo []}) exitWith {};
    if (!alive mission_bossCar || {!canMove mission_bossCar}) exitWith {
        ["Mahe's car is disabled, he stays put"] call mission_fnc_log;
    };
    mission_bossFled = true;

    private _old = group mission_boss;
    private _guards = ([units _old] call mission_fnc_ableUnits) select { _x != mission_boss };
    private _runners = [mission_boss] + (_guards select [0, 3]);
    private _tmp = createGroup [east, true];
    _runners joinSilent _tmp;
    private _group = [_tmp] call mission_fnc_resetGroup;
    _group selectLeader mission_boss;
    _group setVariable ["lambs_danger_disableGroupAI", true, true];
    _group setBehaviour "AWARE";
    _group setCombatMode "GREEN";
    _group setSpeedMode "FULL";

    private _getIn = _group addWaypoint [getPosATL mission_bossCar, 0];
    _getIn setWaypointType "GETIN";
    _getIn waypointAttachVehicle mission_bossCar;
    ([mission_villagePos # 0, 4000, 5500, 900] call mission_fnc_roadInRing) params ["_dest"];
    private _run = _group addWaypoint [_dest, 0];
    _run setWaypointType "MOVE";
    [format ["Mahe is running for his car, heading to %1", mapGridPosition _dest]] call mission_fnc_log;
};

// ------------------------------------------------------------------
// Loops
// ------------------------------------------------------------------
mission_fnc_startLoops = {
    [{
        // Alarm: a Syndikat group in a village fighting
        {
            private _village = _forEachIndex;
            if (!_x) then {
                private _alarmed = mission_hostileGroups findIf {
                    _x params ["_group", "_v"];
                    _v == _village
                    && {!isNull leader _group}
                    && {alive leader _group}
                    && {behaviour leader _group == "COMBAT"}
                } != -1;
                if (_alarmed) then {
                    mission_alarms set [_village, true];
                    [format ["Alarm in %1", text (mission_villages # _village)]] call mission_fnc_log;
                    [_village] call mission_fnc_spawnQRF;
                    if (_village == 0) then { call mission_fnc_bossFlee };
                };
            };
        } forEach mission_alarms;

        // Hostages handed over at the checkpoint
        private _cpPos = mission_checkpoint # 0;
        {
            if (
                alive _x
                && {!(_x getVariable ["mission_delivered", false])}
                && {_x distance2D _cpPos < mission_deliverRadius}
                && {isNull attachedTo _x}
                && {isNull objectParent _x}
            ) then {
                _x setVariable ["mission_delivered", true, true];
                ["ace_captives_setHandcuffed", [_x, false], _x] call CBA_fnc_targetEvent;
                _x disableAI "PATH";
                _x setUnitPos "MIDDLE";
                doStop _x;
                [format ["Hostage %1 handed over at the checkpoint", _x getVariable ["mission_hostageName", ""]]] call mission_fnc_log;
            };
        } forEach mission_hostages;

        // Mahe getting away
        if (mission_bossFled && {alive mission_boss} && {mission_boss distance2D (mission_villagePos # 0) > 3500}) then {
            if ((call mission_fnc_players) findIf { _x distance2D mission_boss < 1500 } == -1) then {
                ["Mahe got away"] call mission_fnc_log;
                { deleteVehicle _x } forEach (units group mission_boss);
                deleteVehicle mission_bossCar;
                mission_boss = objNull;
            };
        };
    }, 3] call CBA_fnc_addPerFrameHandler;
};

// Players can spend an hour at base gearing up before they leave, so nothing is
// spawned until the first player (not Zeus) leaves the staging area. This also keeps
// spawning after CBA_missionTime 1: the faction mod skips loadout randomization for
// units that exist before then (it assumes they were placed in Eden).
mission_fnc_departed = {
    private _zeus = allCurators apply { getAssignedCuratorUnit _x };
    ((call mission_fnc_players) - _zeus) findIf { _x distance2D mission_basePos > mission_departRadius } != -1
};

[{
    params ["", "_handle"];
    if (CBA_missionTime <= 1 || {!(call mission_fnc_departed)}) exitWith {};
    [_handle] call CBA_fnc_removePerFrameHandler;
    mission_departTime = CBA_missionTime;
    [format ["Contractors left base at mission time %1", round mission_departTime]] call mission_fnc_log;
    call mission_fnc_spawnAll;
}, 2] call CBA_fnc_addPerFrameHandler;
