// EH running on player that checks surrender conditions
[{
	private _target = cursorObject;
	private _player = call CBA_fnc_currentUnit;
    private _maxDistance = 50; // max distance we could theoretically get target to surrender from

    // player must have weapon and have it be raised
    if (currentWeapon _player == "" || {weaponLowered _player}) exitWith {};

    // need a target
    if (_target == objNull) exitWith {};

    // target must be human
    if (!(_target call CBA_fnc_isPerson)) exitWith {};

    // target must be relatively close
    private _distanceToTarget = _target distance _player;
    if (_distanceToTarget > _maxDistance) exitWith {};

    // target must not be another player
    private _players = call CBA_fnc_players;
    if (_target in players) exitWith {};

    // target must be a different side (and not civ because GRAD civ already handles civ surrender)
    if (side _target == side (group _player) || {side _target == civilian}) exitWith {};

    // target must be alive and conscious
    if (!alive _target || {_target getVariable ["ACE_medical_isUnconscious", false]}) exitWith {};

    // target can't already be captive or surrendered
    if (captive _target || {_target getVariable ["ACE_captives_isSurrendering", false]} || {_target getVariable ["ACE_captives_isHandcuffed", false]}) exitWith {};

    // target must know about player (how would you surrender to someone you don't know is there?)
    if (!((_target targetKnowledge _player) select 1)) exitWith {};

    // at this point, the target COULD surrender
    // we will start checking state of target to see if they would feasibly surrender

    // convert the distance to our target to a 0 to 1 range
    // at the max distance, the value is 0 (min chance) and at min distance the value is 1 (max chance)
    private _distanceModifier = linearConversion [1, _maxDistance, _maxDistance - _distanceToTarget, 0, 1, true];

    // calculate modifier based on number of nearby friendlies
    // find nearest humans within 15 meters
    private _nearestUnits = nearestObjects [player, ["Man"], 15];
    // count number of nearby humans that are on same side as player
    private _nearbyFriendlies = {alive _x && !(_x getVariable ["ACE_medical_isUnconscious", false]) && (side _x == side player)} count _nearestUnits;
    // cap out count up to 4 friendlies
    private _friendliesModifier = _nearbyFriendlies min 4;

    // add up modifier bonuses
    private _modifiers = (_distanceModifier * 25) + (_friendliesModifier * 15);

    // if target is careless, they will surrender
    private _carelessCondition = behaviour _target == "CARELESS";

    // if target is fleeing or has no weapon/ammo, they will surrender
    private _fleeingCondition = (fleeing _target)
        || {currentWeapon _target == ""}
        || {!someAmmo _target && {_target ammo (currentWeapon _target)}};

    // TODO if target is heavily suppressed, there's a 25% chance they will surrender

    // if target is hurt, there's a 75% chance they will surrender
    private _hurtCondition = damage _target > 0.75 && {(random 100) + _modifiers >= 25};

    // if target is safe, there's a 75% chance they will surrender when player is close
    private _safeCondition = behaviour _target == "SAFE" && {(random 100) + _modifiers >= 25};

    // if target is aware, there is a 50% chance they will surrender when player is close
    private _awareCondition = behaviour _target == "AWARE" && {(random 100) + _modifiers >= 50};

    // if target is in combat, there is a 10% chance they will surrender when player is close
    private _combatCondition = behaviour _target == "COMBAT" && {(random 100) + _modifiers >= 90};

    // combine all conditions
    private _finalCondition = _carelessCondition
        || {_fleeingCondition}
        || {_hurtCondition}
        || {_safeCondition}
        || {_awareCondition}
        || {_combatCondition};

    // if we meet all the conditions, the target will surrender
	if (_finalCondition) then {
        // drop weapon if target is armed
		if (!(currentWeapon _target == "")) then {
			["FARE_dropWeapon", [_target, currentWeapon _target], _target] call CBA_fnc_targetEvent;
		};
        // make them surrender
        ["FARE_surrender", [_target, true], _target] call CBA_fnc_targetEvent;
	};
}, 0.5, cursorObject] call CBA_fnc_addPerFrameHandler;
