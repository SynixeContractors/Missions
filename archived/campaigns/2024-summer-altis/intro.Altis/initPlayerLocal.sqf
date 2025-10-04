#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

["mission_say3d", {
    params ["_object", "_sound", "_duration"];
    _object setRandomLip true;
    _object say3D _sound;
    [{
        _this setRandomLip false;
    }, _object, _duration] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
