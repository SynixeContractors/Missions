#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[abad_laptop, 2, false, 1, "Read IRC", [], 5, "Old Laptop IRC", loadFile "data\intel\IRC.txt"] call zen_modules_fnc_addIntelAction;
[abad_phone, 2, false, 1, "Read text message", [], 2, "Old phone text message", loadFile "data\intel\Text_message.txt"] call zen_modules_fnc_addIntelAction;
[Katal_phone, 2, false, 1, "Read text message", [], 2, "New phone text message", loadFile "data\intel\Katal_message.txt"] call zen_modules_fnc_addIntelAction;
[hacker_file, 2, false, 1, "Read file", [], 30, "Hacker's file", loadFile "data\intel\hacker_info.txt"] call zen_modules_fnc_addIntelAction;
[hut_photo, 2, false, 1, "Read IRC", [], 2, "Hut photo", loadFile "data\images\hut.jpg"] call zen_modules_fnc_addIntelAction;