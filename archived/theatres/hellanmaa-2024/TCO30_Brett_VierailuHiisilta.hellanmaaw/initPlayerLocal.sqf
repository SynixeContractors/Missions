#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

[intel_phone, 2, false, 1, "Read Last Message", [], 2, "Cellphone by House", "Они бегут на юго-запад, вероятно, направляясь в тамошний домик. Я ранен, собираюсь слиться с толпой и уйти, удачи, не дайте ему уйти"] call zen_modules_fnc_addIntelAction;
[intel_notepad, 2, false, 1, "Read Notepad", [], 2, "Notepad from Container", "I shot one of them, but they are still coming after me, I'm going to try and lose them, I'm going to stop at M's house for supplies. If you read this, meet me by the abandond barracks in the mess. -R"] call zen_modules_fnc_addIntelAction;
[intel_truck, 2, false, 1, "Read Last Message", [], 2, "Cellphone in Truck", "Черт, он убегает, он сжег дом. Мы думаем, что он идет в казарму, чтобы встретиться с другим, 016008. У нас больше нет сил в этом районе, пришлите их с севера, быстро!"] call zen_modules_fnc_addIntelAction;

[{
    if !(alive emp) exitWith {};
    if (ace_player distance emp > 150) exitWith {};

    private _vehicle = vehicle ace_player;
    if (_vehicle != ace_player) then {
        _vehicle engineOn false;
    };
    if (isRemoteControlling ace_player) then {
        ace_player remoteControl objNull;
    };
}] call CBA_fnc_addPerFrameHandler;

[{
    if (ace_player distance emp < 250) exitWith {
        [0, 0]
    };
    private _coreSignal = _this call acre_sys_signal_fnc_getSignalCore;
    _coreSignal params ["_Px", "_maxSignal"];
    [_Px, _maxSignal]
}] call acre_api_fnc_setCustomSignalFunc;

["mission_stun", {
    params ["_objects"];
    {
        [getPosASL _x] call ace_grenades_fnc_flashbangExplosionEH
    } forEach _objects;
}] call CBA_fnc_addEventHandler;
