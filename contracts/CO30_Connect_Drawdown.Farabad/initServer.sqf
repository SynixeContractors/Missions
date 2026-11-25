mission_function_mlrs_attack = compile preprocessFileLineNumbers "mlrs.sqf";

const mission_note1 = "Daddy, when are you going to be back? Me and mommy miss you so much";
const mission_note2 = "There is a new group comming this week, we moved the supplies south from Kaftar Kar";
const mission_note3 = "Sand is bones, bones is sand, the whales eat the bones into sand";



[leader1, "acex_intelitems_notepad", mission_note1, "Bloody Note"] call ace_intelitems_fnc_addIntel;
[leader2, "acex_intelitems_notepad", mission_note2, "Bloody Note"] call ace_intelitems_fnc_addIntel;
[leader3, "acex_intelitems_notepad", mission_note3, "Bloody Note"] call ace_intelitems_fnc_addIntel;
