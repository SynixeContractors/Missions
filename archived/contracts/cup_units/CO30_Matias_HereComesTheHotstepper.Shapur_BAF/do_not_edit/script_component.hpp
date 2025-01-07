#define PREFIX synixecontractors
#define COMPONENT mission

// Version
#define MAJOR 3
#define MINOR 6
#define PATCHLVL 0

// Debug
#define DEBUG_SYNCHRONOUS
//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

// ACE3
#define ACE_PREFIX ace

#define ACEGVAR(module,var) TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var) QUOTE(ACEGVAR(module,var))

#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ACE_PREFIX,var1),fnc,var2)
#define QACEFUNC(var1,var2) QUOTE(ACEFUNC(var1,var2))

#define PATHTOACEF(var1,var2) PATHTOF_SYS(\z\ace\addons,var1,var2)
#define QPATHTOACEF(var1,var2) QUOTE(PATHTOACEF(var1,var2))
