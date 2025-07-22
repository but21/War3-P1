// ---------------------------------------------------------------------------------------------------------              
// ------------------------------------------------ 底层相关 ------------------------------------------------                
// ---------------------------------------------------------------------------------------------------------              



// ---------------------------------------------------------------------------------------------------------              
// ------------------------------------------------ 属性系统 ------------------------------------------------              
// ---------------------------------------------------------------------------------------------------------              

// 修改单位属性(拓展)              
function Unit_SetAttrBJ takes unit obj, integer attrType, integer opera, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 根据属性名称修改单位属性(拓展)              
function SetUnitAttr_Ex_Str takes unit obj, string attrName, integer opera, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 修改单位属性              
function Unit_SetAttr takes unit obj, integer attrType, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 根据属性名称修改单位属性              
function SetUnitAttr_Str takes unit obj, string attrName, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 修改物品属性(拓展)              
function SetItemAttrEx takes item obj, integer attrType, integer opera, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 根据属性名称修改物品属性(拓展)              
function SetItemAttrEx_Str takes item obj, string attrName, integer opera, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 修改物品属性              
function SetItemAttr takes item obj, integer attrType, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 根据属性名称修改物品属性              
function SetItemAttr_Str takes item obj, string attrName, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 修改物品类型属性(拓展)              
function SetItemTypeAttrEx takes integer obj, integer attrType, integer opera, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 根据属性吃满修改物品类型属性(拓展)              
function SetItemTypeAttrEx_Str takes integer obj, string attrName, integer opera, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 修改物品类型属性              
function Itemtype_SetAttr takes integer obj, integer attrType, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 根据属性名称修改物品类型属性              
function Itemtype_SetAttr_Str takes integer obj, string attrName, real value returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 获取单位属性              
function Unit_GetAttr takes unit obj, integer attrType returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 获取物品属性              
function Item_GetAttr takes item obj, integer attrType returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 获取物品类型属性              
function Itemtype_GetAttr takes integer obj, integer attrType returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 根据属性名称获取单位对应属性类型的数值              
function GetUnitAttrFromStr takes string attrType, unit obj returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 根据属性名称获取物品对应属性类型的数值              
function GetItemAttrFromStr takes string attrType, item obj returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 根据属性名称获取物品类型对应属性类型的数值              
function GetItemTypeAttrFromStr takes string attrType, integer obj returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 



// 获取属性类型名称              
function Attr_GetName takes integer attrType returns string 
	call GetTriggeringTrigger() 
	return "" 
endfunction 

// 根据属性名称得到属性类型              
function Str_GetAttr takes string name returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 转换整数为属性类型              
function Attr_I2A takes integer index returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 全部属性的循环, 根据索引获取对应属性              
function AllAttr_GetFor takes integer index returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 字符串转属性, 指定索引的属性类型              
function TipsToIndexAttrType takes string str, integer index returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 全部属性的数量              
function AllAttr_GetNum takes nothing returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 字符串中全部属性的数量              
function TipsToIndexAttrNum takes string str returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 字符串转属性, 指定索引的属性数值              
function TipsToIndexAttrVal takes string str, integer index returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 转换属性类型为整数              
function Attr_A2I takes integer index returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 单位 - 修改属性事件              
function Unit_AttrEvent takes trigger trig, integer attr returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 属性单位              
function Unit_AttrEvent_GetUnit takes nothing returns unit 
	call GetTriggeringTrigger() 
	return GetTriggerUnit() 
endfunction 

// 事件属性              
function Unit_AttrEvent_GetAttr takes nothing returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 判断属性是否为百分比数值              
function Attr_IsBaiFen takes integer attrType returns boolean 
	call GetTriggeringTrigger() 
	return false 
endfunction 


// ---------------------------------------------------------------------------------------------------------              
// ------------------------------------------------ 内置 ---------------------------------------------------              
// ---------------------------------------------------------------------------------------------------------              

// 绑定特效  
function BindEffect takes widget Handle, string socket, effect Effect returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 解除特效绑定  
function UnbindEffect takes effect Effect returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 设置特效颜色 [内置]                      
function Effect_SetColor takes effect ef, integer r, integer g, integer b, integer a returns nothing 
	call EXSetEffectColor(ef, DzGetColor(a, r, g, b)) 
endfunction 

// 设置特效播放速度 [内置]                                   
function Effect_SetSpeed takes effect eff, real speed returns nothing 
	call EXSetEffectSpeed(eff, speed) 
endfunction 

// 设置特效显示 [内置]                                   
function EXSetEffectVisible takes effect eff, boolean visible returns nothing 
	call GetTriggeringTrigger() 
endfunction 

function Effect_Show takes effect eff, boolean bool returns nothing 
	call EXSetEffectVisible(eff, bool) 
endfunction 

// 特效 播放特效动画(序号)                    
function Effect_SetAnimationIndex takes effect ef, integer anim_xh returns nothing 
	call EXSetEffectAnimation(ef, anim_xh) 
endfunction 

function EXPlayEffectAnimation takes effect Effect, string animation_name, string link_name returns nothing 
	call GetTriggeringTrigger() 
endfunction 


// 特效 播放特效动画(附加名)          
function Effect_SetAnimation takes effect ef, string anim_xh, string fjm returns nothing 
	call EXPlayEffectAnimation(ef, anim_xh, fjm) 
endfunction 


// 特效 移动到点 [内置]                                   
function YDWESetEffectLoc takes effect ef, location p returns nothing 
	call EXSetEffectXY(ef, GetLocationX(p), GetLocationY(p)) 
endfunction 

// 设置控件视口                  
function FrameSetViewPort takes integer frame, boolean enable returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 设置鼠标是否可以穿透UI                  
function FrameSetIgnoreTrackEvents takes integer frame, boolean enable returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 添加血条             
function add_blood takes unit u, string ty, real length, real weight, string unitName, boolean isShowBlood, string title returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 设置模型缩放             
function Frame_ModelScale takes integer ui, real scale_x, real scale_y, real scale_z returns nothing 
	call FrameSetModelScale(ui, scale_x, scale_y, scale_z) 
endfunction 


// 转化物体需求科技为字符            
function Obje_ToNeedUpgradeTips takes integer id returns string 
	call GetTriggeringTrigger() 
	return "" 
endfunction 

// 设置模型旋转x轴(叠加形)            
function Frame_SetModelRotateX takes integer ui, real value returns nothing 
	call FrameSetModelRotateX(ui, 0) 
	call FrameSetModelRotateX(ui, value) 
endfunction 

// 设置模型旋转y轴(叠加形)            
function Frame_SetModelRotateY takes integer ui, real value returns nothing 
	call FrameSetModelRotateY(ui, 0) 
	call FrameSetModelRotateY(ui, value) 
endfunction 

// 设置模型旋转z轴(叠加形)            
function Frame_SetModelRotateZ takes integer ui, real value returns nothing 
	call FrameSetModelRotateZ(ui, 0) 
	call FrameSetModelRotateZ(ui, value) 
endfunction 

// 设置模型旋转(叠加形)            
function Frame_SetModelRotate takes integer ui, integer ty, real value returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 限制视觉窗口          
function Frame_SetViewPort takes integer ui, boolean is_bo returns nothing 
	call FrameSetViewPort(ui, is_bo) 
endfunction 

// 隐藏原生血条       
function SetUnitPressUIVisible takes unit u, boolean bool returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 获取鼠标指向物体       
function Player_GetMouseItem takes nothing returns item 
	call GetTriggeringTrigger() 
	return null 
endfunction 

// 获取选中单位       
function GetSelectUnit takes nothing returns unit 
	call GetTriggeringTrigger() 
	return null 
endfunction 

//  返回格子技能类型       
function GetAbilityXY takes integer i returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 物品世界坐标       
function ConverItemWorldPosition takes item u returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function GetItemScreenX takes nothing returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

function GetItemScreenY takes nothing returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 从表格中读取实数      
function GetRealFromExcel takes string excelName, integer rowID, string columnName returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 从表格中读取整数      
function GetIntegerFromExcel takes string excelName, integer rowID, string columnName returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 从表格中读取字符串      
function GetStringFromExcel takes string excelName, integer rowID, string columnName returns string 
	call GetTriggeringTrigger() 
	return "0" 
endfunction 


// 新建控件[普通] (模型)   
function Frame_New takes string ty, integer fui returns integer 
	call GetTriggeringTrigger() 
	return 0 
endfunction 

// 控制UI 显示/隐藏   
function Frame_Show takes integer ui, boolean is_show returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 设置UI相对位置   
function Frame_SetPoint takes integer ui, integer po, integer gs_ui, integer gs_po, real x, real y returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 播放3d动画   
function Frame_PlayAnimation takes integer ui, string animation_name, string link_name returns real 
	call GetTriggeringTrigger() 
	return 0.0 
endfunction 

// 设置3d镜头位置   
function Frame_SetCameraSource takes integer ui, real x, real y, real z returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 设置3d镜头目标位置   
function Frame_SetCameraTarget takes integer ui, real x, real y, real z returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 设置3d模型   
function Frame_Set3dModel takes integer ui, string path, integer color_id returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 设置3d模型在场景内的坐标   
function Frame_SetModelPosition takes integer ui, real x, real y, real z returns nothing 
	call GetTriggeringTrigger() 
endfunction 

// 格式化字符串1   
function StringFormat_1 takes string message returns string
	call GetTriggeringTrigger() 
	return ""
endfunction 


// ---------------------------------------------------------------------------------------------------------              
// ------------------------------------------------ 分割线 ---------------------------------------------------              
// ---------------------------------------------------------------------------------------------------------        

function UnitLineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function UILineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function ItemLineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function EffectLineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function SkillLineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function DamageLineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

function KKLineStart takes nothing returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction


// ---------------------------------------------------------------------------------------------------------              
// ------------------------------------------------ 其他 ---------------------------------------------------              
// ---------------------------------------------------------------------------------------------------------        
function DistanceBetweenPoints_XY takes real x1, real y1, real x2, real y2 returns real
	call GetTriggeringTrigger()
	return 0.0
endfunction