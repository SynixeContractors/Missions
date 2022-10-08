private _vrStart = ["EngVRStart","Start VR Training","",{
	call compile preprocessFileLineNumbers "courses\engineer_vr.sqf";
},{!(missionNamespace getVariable ["training_engineer_vr_active", false])}] call ace_interact_menu_fnc_createAction;
[engineer_control, 0, ["ACE_MainActions"], _vrStart] call ace_interact_menu_fnc_addActionToObject;
