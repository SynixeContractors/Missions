#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[intel_laptop, 2, false, 1, "Download shipping data", [], 30, "Shipping Locations", loadFile "intel\shipping_data.txt"] call zen_modules_fnc_addIntelAction;
[intel_laptop2, 2, false, 1, "Read email", [], 10, "Security Memo", loadFile "intel\security_memo.txt"] call zen_modules_fnc_addIntelAction;
[intel_phone, 2, false, 1, "Read list", [], 5, "Shopping List", loadFile "intel\shopping_list.txt"] call zen_modules_fnc_addIntelAction;