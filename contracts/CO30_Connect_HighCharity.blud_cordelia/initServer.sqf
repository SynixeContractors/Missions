mission_skull1 = 0;
mission_skull2 = 0;
mission_skull3 = 0;
mission_skull4 = 0;
mission_skull5 = 0;
mission_skull6 = 0;
mission_skull7 = 0;
mission_skull8 = 0;
mission_unlocked = false;
mission_fnc_unlocked = compile preProcessFile "unlocked.sqf";

mission_riddle1 = "In a room where gaze of ten eyes does not lie...";
mission_riddle2 = "...Chilled to the bone 8 warriors...";
mission_riddle3 = "...but only those with white eyes...";
mission_riddle4 = "...Starved of touch from where the sun...";
mission_riddle5 = "...rises up and then in the dusk bound...";
mission_riddle6 = "...ending where Polaris shines";


["DocumentsSecret", "Golden notes"] call CBA_fnc_renameInventoryItem;
