#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[atc_laptop, 2, false, 1, "Download flight logs", [], 10, "Flight logs",
"These are the flight logs which keep a record of everyone who arrived on the island by plane"] call zen_modules_fnc_addIntelAction;

[recording_laptop, 2, false, 1, "Download recordings", [], 15, "Recordings",
"These are recordings of several people doing illicit stuff on the nearby houses."] call zen_modules_fnc_addIntelAction;

[laptop_mansion, 2, false, 1, "Download server data", [], 60, "Server data",
"The data extracted from the servers in the mansion"] call zen_modules_fnc_addIntelAction;
