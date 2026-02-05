mission_fnc_bombing = compile preprocessFile "hhour.sqf";
mission_hhour = 7;
mission_hminute = 20;

//hack for not killing people in destruction animation
radiomast setDamage 1;
[{radiomast setPosASL getPosASL buildingtarget; radiomast setVectorUp [0,0,1];}, [], 10] call CBA_fnc_waitAndExecute;
