bombing = compile preprocessFile "hhour.sqf";
hhour = 7;
hminute = 20;

//hack for not killing people in destruction animation
radiomast setDamage 1;
[{radiomast setPosASl getPosASL buildingtarget; radiomast setVectorUp [0,0,1];}, [], 10] call CBA_fnc_waitAndExecute;
