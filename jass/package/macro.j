// 添加jass函数空壳   
 
function StringFormat1 takes string str returns string
	call GetTriggeringTrigger()
	return ""
endfunction

function KillAttackBoss takes nothing returns nothing
	call GetTriggeringTrigger()
	return 
endfunction

// 游戏胜利
function GameWin takes nothing returns nothing
	call GetTriggeringTrigger()
	return 
endfunction

// 击杀存档Boss
function KillArchiveBoss takes integer bossID returns nothing 
	call GetTriggeringTrigger()
	return
endfunction

// Boss来袭
function BossComing takes integer playerID, integer bossID returns nothing 
	call GetTriggeringTrigger()
	return
endfunction


// 进行一次夺舍
function BeginSeizeBody takes integer playerID returns nothing
	call GetTriggeringTrigger()
	return 
endfunction


// 一段时间后减少单位属性
function ReduceAttrAfterTime takes unit hero, string attrStr, real val returns nothing
	call GetTriggeringTrigger()
	return
endfunction

// 获取某种商品的购买次数
function GetBMSalesBuyCount takes integer playerID, integer salesID returns integer 
	call GetTriggeringTrigger()
	return 0
endfunction

// 购买了某种商品 
function BuyBMSales takes integer playerID, integer salesID returns integer 
	call GetTriggeringTrigger()
	return 0
endfunction

// 获取黑市商品id
function GetBMSalesID takes integer playerID, integer index returns integer 
	call GetTriggeringTrigger()
	return 0
endfunction

//  返回黑市商品的提示
function SetBMSalesTip takes integer playerID, integer salesID returns string 
	call GetTriggeringTrigger()
	return ""
endfunction


// 设置天赋文本
function SetTalentTip takes integer playerID returns string
	call GetTriggeringTrigger()
	return ""
endfunction

// 根据属性字符串添加属性
function AddUnitAttrStr takes unit u, string attrStr returns nothing 
	call GetTriggeringTrigger() 
	return
endfunction

// 根据属性字符串减少属性
function ReduceUnitAttrStr takes unit u, string attrStr returns nothing 
	call GetTriggeringTrigger() 
	return
endfunction

// 根据属性字符串设置属性
function SetUnitAttrStr takes unit u, string attrStr returns nothing 
	call GetTriggeringTrigger() 
	return
endfunction


// 显示属性面板
function ShowAttr takes integer playerID returns nothing
	call GetTriggeringTrigger()
	return 
endfunction


// 将字符串根据sep分割成数组,返回第index个值
function Split takes string inputStr, string sep, integer index returns string 
	call GetTriggeringTrigger() 
	return "" 
endfunction 


// 消息队列        
function AddMessage takes integer playerID, string message returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// 伤害系统
function DamageSystem takes nothing returns nothing
	call GetTriggeringTrigger()
	return 
endfunction

// 在lua中打印消息   
function Print takes string message returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction 

// D跳特效处理
function AddEffect_D takes effect eff returns nothing
	call GetTriggeringTrigger()
	return 
endfunction

// 获得单位组
function GetGroup takes nothing returns group 
	call GetTriggeringTrigger() 
	return CreateGroup() 
endfunction 

// 回收单位组
function RecycleGroup takes group g returns nothing 
	call GetTriggeringTrigger() 
	return 
endfunction


