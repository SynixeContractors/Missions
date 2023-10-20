// EH running on player that checks surrender conditions every 1 second
[{
	private _target = cursorObject;
	private _player = call CBA_fnc_currentUnit;
    private _maxDistance = 50; // distance to target must be less than this value

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

    // at this point, the target COULD surrender
    // check state of target to see if they would feasibly surrender

    // convert the distance to our target to a 0 to 1 range
    // at the max distance, the value is 0 (min chance) and at min distance the value is 1 (max chance)
    private _distanceModifier = linearConversion [1, _maxDistance, _maxDistance - _distanceToTarget, 0, 1, true];

    // if target is careless, they will surrender
    private _carelessCondition = behaviour _target == "CARELESS";

    // if target is fleeing or has no weapon/ammo, they will surrender
    private _fleeingCondition = (fleeing _target) || {currentWeapon _target == ""} || {!someAmmo _target && {_target ammo (currentWeapon _target)}};

    // if target is hurt, there's a 75% chance they will surrender
    private _hurtCondition = damage _target > 0.75 && {(random 100) + (_distanceModifier * 25) >= 25};

    // if target is safe, there's a 75% chance they will surrender when player is close
    private _safeCondition = behaviour _target == "SAFE" && {(random 100) + (_distanceModifier * 25) >= 25};

    // if target is aware, there is a 50% chance they will surrender when player is close
    private _awareCondition = behaviour _target == "AWARE" && {(random 100) + (_distanceModifier * 25) >= 50};

    // if target is in combat, there is a 25% chance they will surrender when player is close
    private _combatCondition = behaviour _target == "COMBAT" && {(random 100) + (_distanceModifier * 25) >= 75};

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
			[[_target, currentWeapon _target], CBA_fnc_dropWeapon] remoteExec ["call", _target];
		};
        // make them surrender
        [[_target, true], ACE_captives_fnc_setSurrendered] remoteExec ["call", _target];
	};
}, 1, cursorObject] call CBA_fnc_addPerFrameHandler;
