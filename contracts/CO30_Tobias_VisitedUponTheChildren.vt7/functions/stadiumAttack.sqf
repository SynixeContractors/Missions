ied_5 setDamage 1;

sleep 2 + (random 5);

{ _x playMoveNow "" } forEach (units crowd_1); 

ied_1 setDamage 1;

{ 
    clearWeaponCargo (backpackContainer _x); 
    _x playMoveNow ""; 
} forEach (units terrorist); 

{ _x addWeapon "hgun_PDW2000_F"; _x selectWeapon "hgun_PDW2000_F" }  
    forEach [terrorist_1, terrorist_2, terrorist_3, terrorist_4, terrorist_9]; 
 
{ _x addWeapon "SMG_02_F"; _x selectWeapon "SMG_02_F" }  
    forEach [terrorist_5, terrorist_6, terrorist_7, terrorist_8]; 

private _newGrp = createGroup east; 
 
{ 
    [_newGrp, _x] joinSilent _newGrp; 
    _x setCaptive false; 
} forEach units (group terrorist_1);

sleep 2 + (random 5);

ied_4 setDamage 1;

sleep 2 + (random 5);

ied_3 setDamage 1;

sleep 2 + (random 5);

ied_2 setDamage 1;
