#define PREFIX synixe
#define COMPONENT training

// Version
#define MAJOR 1
#define MINOR 0
#define PATCH 0

// Map
#define MAP Bozcaada

#define DEBUG_SYNCHRONOUS
//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

#define EXT_CRATE "crate_server"

#define MGFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define MFUNC(var1,var2) TRIPLES(DOUBLES(ADDON,var1),fnc,var2)
#define PREP(var1,var2) MFUNC(var1,var2) = compile preprocessFileLineNumbers QUOTE(functions\var1\DOUBLES(fnc,var2).sqf)
#define PREP_RANGE(var1,var2) MFUNC(var1,var2) = compile preprocessFileLineNumbers QUOTE(functions\ranges\var1\DOUBLES(fnc,var2).sqf)
#define PREP_GLOBAL(var1) MGFUNC(var1) = compile preprocessFileLineNumbers QUOTE(functions\DOUBLES(fnc,var1).sqf)

// ACE3
#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)

