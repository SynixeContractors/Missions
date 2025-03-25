#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

[
    // Add additional files here
    // if you create "edit_me/briefing/example.html, then add "Example" here
] call mission_fnc_briefing;

["emr_main_climbingEnd", { 
  [{ 
    params ["_unit"]; 
    if (getOxygenRemaining _unit < 1 && !underwater _unit) then { 
      private _pos = getPosASL _unit; 
      private _newPos = +_pos;
      _newPos set [2, -100];
      _unit setPosASL _newPos;
      [{ 
        params ["_unit", "_pos"]; 
        _unit setPosASL _pos; 
      }, [_unit, _pos]] call CBA_fnc_execNextFrame; 
    }; 
  }, _this, 1] call CBA_fnc_waitAndExecute; 
}] call CBA_fnc_addEventHandler;
