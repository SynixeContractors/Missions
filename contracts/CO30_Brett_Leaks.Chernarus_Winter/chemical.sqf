mission_markers = [];

mission_fnc_refreshMarkers = {
    private _markers = [];
    {
        if !("trail" in _x) then {
            continue;
        };
        _markers pushBack _x;
    } forEach allMapMarkers;
    mission_markers = _markers;
};

call mission_fnc_refreshMarkers;

"ChemicalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 0, true];
private _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
private _obj = _ui displayCtrl 101;
_obj ctrlAnimateModel ["Threat_Level_Source", 0.00, true];

mission_fnc_chemEH = {
    private _threat = 0;
    {
        private _level = 40;
        if ("heavy" in _x) then {
            _level = 100;
        };
        private _new = linearConversion [20, 350, ace_player distance getMarkerPos _x, _level, 0, true];
        if (_new > _threat) then {
            _threat = _new;
        };
    } forEach mission_markers;
    if (_threat > 0) then {
        _threat = _threat + random 5;
    };
    if (_threat > 100) then {
        _threat = 100;
    };
    if !(isNull objectParent ace_player) then {
        if (speed ace_player > 20) then {
            _threat = _threat max 20;
        } else {
            _threat = _threat max 60;
        };
    };
    (_this select 0) select 0 ctrlAnimateModel ["Threat_Level_Source", _threat, true];
};

[{ call mission_fnc_chemEH; }, 0.5, [_obj]] call CBA_fnc_addPerFrameHandler;
