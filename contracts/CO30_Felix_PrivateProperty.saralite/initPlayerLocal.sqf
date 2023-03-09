#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

PPeffect_colorC = ppEffectCreate ["ColorCorrections",1500];
PPeffect_colorC ppEffectAdjust [1,0.9,0,[1,0,0,-0.07],[1,1,1,0.8],[1,0,0,1]];
PPeffect_colorC ppEffectEnable true;
PPeffect_colorC ppEffectCommit 0;