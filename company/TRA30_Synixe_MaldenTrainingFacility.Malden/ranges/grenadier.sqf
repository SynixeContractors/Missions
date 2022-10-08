// Control laptop

private _clearAll = ["GrenClearAll","Clear All Units","",{
	["training_vr_resetGroup", ["grenadier"]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[grenadier_control, 0, ["ACE_MainActions"], _clearAll] call ace_interact_menu_fnc_addActionToObject;

private _step1 = ["GrenStep1","Step 1","",{
	["training_vr_spawnUnit", ["grenadier", independent, getMarkerPos "grenadier_step_1", {
		params ["_unit"];
		_unit disableAI "all";
	}]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[grenadier_control, 0, ["ACE_MainActions"], _step1] call ace_interact_menu_fnc_addActionToObject;

private _step2 = ["GrenStep2","Step 2","",{
	["training_vr_spawnUnit", ["grenadier", independent, getMarkerPos "grenadier_step_2", {
		params ["_unit"];
		_unit disableAI "all";
	}]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[grenadier_control, 0, ["ACE_MainActions"], _step2] call ace_interact_menu_fnc_addActionToObject;

private _step3 = ["GrenStep3","Step 3","",{
	["training_vr_spawnUnit", ["grenadier", independent, getMarkerPos "grenadier_step_3", {
		params ["_unit"];
		_unit disableAI "all";
	}]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[grenadier_control, 0, ["ACE_MainActions"], _step3] call ace_interact_menu_fnc_addActionToObject;

private _step4 = ["GrenStep4","Step 4","",{
	["training_vr_spawnUnit", ["grenadier", independent, getMarkerPos "grenadier_step_4", {
		params ["_unit"];
		_unit disableAI "all";
	}]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[grenadier_control, 0, ["ACE_MainActions"], _step4] call ace_interact_menu_fnc_addActionToObject;

private _step5 = ["GrenStep5","Step 5","",{
	["training_vr_spawnUnit", ["grenadier", independent, getMarkerPos "grenadier_step_5", {
		params ["_unit"];
		_unit disableAI "all";
	}]] call CBA_fnc_serverEvent;
},{player getVariable ["VR_isVR", false]}] call ace_interact_menu_fnc_createAction;
[grenadier_control, 0, ["ACE_MainActions"], _step5] call ace_interact_menu_fnc_addActionToObject;
