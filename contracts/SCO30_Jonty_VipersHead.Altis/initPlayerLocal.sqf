#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[underling, 2, false, 1, "Read Last Text", [], 1, "Intel Found!", "Viper [04:56]: Wrap it up. Execute exfiltration protocols then bring the cargo to Magos. Squeeze every last bit of information from these fuckers. Load them up or eliminate if non cooperative."] call zen_modules_fnc_addIntelAction;
[tabledoc, 2, false, 1, "Read Document", [], 1, "Intel Found!", "Loyalists Captured: Arion Bouras, Sotridis Liosi, Sotiris Papadopoulos (KIA escape attempt). Held at: Radio Station"] call zen_modules_fnc_addIntelAction;