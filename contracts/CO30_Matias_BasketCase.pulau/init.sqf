#include "do_not_edit\script_component.hpp"
#include "do_not_edit\init.sqf"

[intel_phone, 2, false, 1, "Read text message", [], 2, "Text mesage", 
"Les armes que le russe a apportées sont bonnes, n'aimaient pas ses gardes cependant"] call zen_modules_fnc_addIntelAction;

[intel_laptop, 2, false, 1, "Read emails", [], 10, "Email", 
"It's a pleasure doing bussines with you, deliver my payment to my current residence. It's the southernmost house, you'll see the guards by the door."] call zen_modules_fnc_addIntelAction;

[intel_map, 2, false, 1, "Look at map", [], 2, "Map info", 
"You see that the map has a circle drawn around the town of Bibung"] call zen_modules_fnc_addIntelAction;

[intel_sat, 2, false, 1, "Call company", [], 5, "Company answering machine", 
"Hello, you've reached Vanguard PMC. Sadly no one is around to answer your call, please call at a later time"] call zen_modules_fnc_addIntelAction;
