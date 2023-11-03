["sam_say", {
    params ["_sound"];
    sam say _sound;
}] call CBA_fnc_addEventHandler;

cond_sam_entry = {
    ({ !(_x getVariable ["sam_entry", false]) } count _this) > 0 
};

cond_sam_instructions = {
    ({ 
        uniform _x == "U_C_Scientist"
        && { !(_x getVariable ["sam_instructions", false]) }
        && { _x getVariable ["sam_entry", false] }
        && { primaryWeapon _x == "" && secondaryWeapon _x == "" && handgunWeapon _x == ""}
    } count _this) > 0 
};

cond_sam_comeback = {
    ({
        (uniform _x != "U_C_Scientist"
            || { !(_x getVariable ["sam_did_shower", false]) })
        && { !(_x getVariable ["sam_comeback", false]) }
    }) count _this > 0
};

cond_sam_hardware = {
    ({
        uniform _x == "U_C_Scientist"
        && {
            primaryWeapon _x != ""
            || secondaryWeapon _x != ""
            || handgunWeapon _x != ""
            }
    } count _this) > 0
};
