// run this after mission has run for few seconds and display is not null

// EH running on player that constantly checks conditions
[{
	private _target = cursorObject;
	private _player = call CBA_fnc_currentUnit;
	private _players = call CBA_fnc_players;

    // ugly condition
    private _condition = (_target != objNull) // target can't be null
        && (alive _target) // target must be alive
        && {!(isPlayer _target)} // target can't be a player
        && {!(_target in _players)} // TODO is this necessary?
        && {_target call CBA_fnc_isPerson} // target must be a man
        && {isNull objectParent _target} // target can't be attached to anything
        && {!(_target getVariable ["ACE_captives_isSurrendering", false])} // target can't be surrending
        && {!(_target getVariable ["ACE_captives_isHandcuffed", false])} // target can't be handcuffed
        && {!(_target getVariable ["ACE_medical_isUnconscious", false])} // target can't be unconscious
        && {!(captive _target)} // target can't be vanilla captive
	    && {side _target != side group _player} // target can't be on same side as player
	    && {currentWeapon _player != ""} // player must have a weapon
	    && {!(weaponLowered _player)} // player weapon must be pointed
	    && {_target distance _player < 12} // target must be close by
	    && ((fleeing _target) ||
	(currentWeapon _target == "") ||
	(!(someAmmo _target) && ((_target ammo currentWeapon _target) < 5) && (random 100 > 25)) ||
	(((damage _target) > 0.7) && (random 100 > 15)) ||
	((_target distance _player < 6) && (random 100 > 40) && (someAmmo _target) && ((_target ammo currentWeapon _target) == 0) && (behaviour _target == "COMBAT")) ||
	((_target distance _player < 6) && (random 100 > 5) && (behaviour _target == "CARELESS")) ||
	((_target distance _player < 6) && (random 100 > 15) && (behaviour _target == "SAFE")) ||
	((_target distance _player < 6) && (random 100 > 40) && (behaviour _target == "AWARE")) ||
	((_target distance _player < 3) && (random 100 > 40) && (behaviour _target == "COMBAT")) ||
	((_target distance _player < 9) && (!(_target checkAIFeature "FSM") || ((_target skill "aimingAccuracy") == 0) || ((getFatigue _target) < 0.5))));

    // if we meet all the conditions, the target will surrender
	if (_condition) then {
        // drop weapon if target is armed
		if (!(currentWeapon _target == "")) then {
			[[_target, currentWeapon _target], CBA_fnc_dropWeapon] remoteExec ["call", _target];
		};
        [[_target, true], ACE_captives_fnc_setSurrendered] remoteExec ["call", _target];
	};
}, 1, cursorObject] call CBA_fnc_addPerFrameHandler;
