#include "script_component.hpp"

call MFUNC(certs,canStartEXT);
call MFUNC(certs,canStartPFH);

call compile preprocessFileLineNumbers "functions\fnc_serverInit.sqf";
