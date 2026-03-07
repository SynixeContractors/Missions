#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html", then add "Example" here
] call mission_fnc_briefing;

mission_fnc_countMoney = {
    params ["_box"];
    private _money = 0;
    {
        switch (_x) do {
            case "Money_bunch": {
                _money = _money + 250;
            };
            case "Money_roll": {
                _money = _money + 5000;
            };
            case "Money_stack": {
                _money = _money + 50000;
            };
        };
    } forEach magazineCargo _box;
    _money
};

["lip", {
    params ["_duration"];
    contact setRandomLip true;
    0 spawn {
        sleep _duration;
        contact setRandomLip false;
    };
}] call CBA_fnc_addEventHandler;
