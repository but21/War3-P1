#ifndef KKPREINCLUDE
#define KKPREINCLUDE


library LBKKPRE

// 启用/禁用技能
native DzAbilitySetEnable takes ability whichAbility, boolean enable, boolean hideUI returns nothing
// 设置单位移动类型
native DzUnitSetMoveType takes unit whichUnit, string moveType returns nothing
// 获取控件宽度
native DzFrameGetWidth takes integer frame returns real

endlibrary

#endif

