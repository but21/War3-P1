local japi       = require 'jass.japi'
local code       = require 'jass.code'
local jass       = require 'jass.common'
local message    = require 'jass.message'

local ns         = ns

local initheight = 0
ns.blood         = {}
ns.blood.__index = ns.blood

local ui         = ysui['底层控件']:builder "panel" { w = 1, h = 1, xy = { '中心', 920, 540 }, show = true }

--复用血条库
local bloodstack = {}
local function newstack(name)
	if not bloodstack[name] then
		bloodstack[name] = {}
	end
end

--素材
local bloodcolor  = {}

bloodcolor.black  = [[bloodbar\Bloodblack.tga]]
bloodcolor.red    = [[bloodbar\Bloodred.tga]]
bloodcolor.red2   = [[bloodbar\Bloodred2.tga]]
bloodcolor.green  = [[bloodbar\Bloodgreen.tga]]
bloodcolor.orange = [[bloodbar\Bloodorange.tga]]
bloodcolor.blue   = [[bloodbar\mafa.tga]]

--单位类型

function ns.blood.unit()
	local blood = setmetatable({}, ns.blood)
	blood._type = "unit"
	newstack(blood._type)
	local w, h, z    = 65, 5, -160
	blood.w          = w
	blood.h          = h
	blood.z          = z
	--控件
	blood.handle     = ui:builder "panel" { w = w, h = h, xy = { "中心", 0, 0 }, show = true }
	--背景
	blood.base       = blood.handle:builder 'image' { w = w + 5, h = h + 6, xy = { '中心', blood.handle, '中心', 0, 0, }, image = [[bloodbar\Bloodblack.tga]], alpha = 1 }
	--伤害进度
	blood.set_damage = [[bloodbar\Bloodorange.tga]]
	blood.damage     = blood.base:builder 'image' { w = w, h = h, xy = { '左侧', blood.base, '左侧', 3.5, 0, }, image = blood.set_damage, alpha = 1 }
	--血条进度-red
	blood.set_image  = [[bloodbar\Bloodred.tga]]
	blood.image      = blood.base:builder 'image' { w = w, h = h, xy = { '左侧', blood.base, '左侧', 3.5, 0, }, image = blood.set_image, alpha = 1 }
	--名字
	blood.name       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -2, 2 }, font = { [[fonts\LXWK_Bold.ttf]], 15, align = "居中" }, show = false }
	--称号
	blood.sign       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -2, 17 }, font = { [[fonts\LXWK_Bold.ttf]], 15, align = "居中" }, show = false }

	blood.handle:set_level(98)
	return blood
end

--英雄类型
function ns.blood.hero()
	local blood = setmetatable({}, ns.blood)
	blood._type = "hero"
	newstack(blood._type)
	local w, h, z    = 75, 12.5, -10
	blood.w          = w
	blood.h          = h
	blood.z          = z
	--控件
	blood.handle     = ui:builder "panel" { w = w, h = h, xy = { "中心", 0, 0 }, show = true }
	--背景
	blood.base       = blood.handle:builder 'image' { w = w + 5, h = h + 6, xy = { '中心', blood.handle, '中心', 0, 0, }, image = [[bloodbar\Bloodblack.tga]], alpha = 1 }
	--伤害进度
	blood.set_damage = [[bloodbar\Bloodorange.tga]]
	blood.damage     = blood.base:builder 'image' { w = w, h = (h / 3 * 2), xy = { '左侧', blood.base, '左侧', 1, (h / 4) - 1.5, }, image = blood.set_damage, alpha = 1 }
	--血条进度-red
	blood.set_image  = bloodcolor.green
	blood.image      = blood.base:builder 'image' { w = w, h = (h / 3 * 2), xy = { '左侧', blood.base, '左侧', 1, (h / 4) - 1.5, }, image = blood.set_image, alpha = 1 }

	--名字
	blood.name       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -2, 2 }, font = { [[fonts\LXWK_Bold.ttf]], 15, align = "居中" }, text = "jiba", show = false }
	--称号
	blood.sign       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -2, 17 }, font = { [[fonts\LXWK_Bold.ttf]], 15, align = "居中" }, text = "jibada", show = false }
	-----如果不要魔法条 把伤害和血条进度H后面公式改掉即可,位置H改成0
	--魔法条
	blood.set_mana   = bloodcolor.blue
	blood.mana       = blood.base:builder 'image' { w = w, h = h / 3, xy = { '左侧', blood.base, '左侧', 1, -1 * (h / 4) - 1.5, }, image = blood.set_mana, alpha = 1 }

	--等级背景
	blood.level_back = blood.base:builder 'image' { w = 30, h = 30, xy = { '左侧', blood.base, '左侧', -15, 0 }, image = [[bloodbar\levelbag.tga]], alpha = 1 }
	--等级
	blood.level      = blood.base:builder 'text' { w = 25, h = 0, xy = { '中心', blood.level_back, '中心', -0.5, 0 }, font = { [[fonts\LXWK_Bold.ttf]], 10, align = "居中" }, text = "1", alpha = 1 }
	blood.level_now  = 1
	blood.handle:set_level(99)
	return blood
end

--建筑类型
function ns.blood.build()
	local blood = setmetatable({}, ns.blood)
	blood._type = "build"
	newstack(blood._type)
	local w, h, z    = 150, 10, 0
	blood.w          = w
	blood.h          = h
	blood.z          = z
	--控件
	blood.handle     = ui:builder "panel" { w = w, h = h, xy = { "中心", 0, 0 }, show = true }
	--背景
	blood.base       = blood.handle:builder 'image' { w = w + 5, h = h + 6, xy = { '中心', blood.handle, '中心', 0, 0, }, image = [[bloodbar\Bloodblack.tga]], alpha = 1 }
	--伤害进度
	blood.set_damage = [[bloodbar\Bloodorange.tga]]
	blood.damage     = blood.base:builder 'image' { w = w, h = h, xy = { '左侧', blood.base, '左侧', 1.5, 0, }, image = blood.set_damage, alpha = 1 }
	--血条进度-red
	blood.set_image  = bloodcolor.green
	blood.image      = blood.base:builder 'image' { w = w, h = h, xy = { '左侧', blood.base, '左侧', 1.5, 0, }, image = blood.set_image, alpha = 1 }
	--名字
	blood.name       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -3, 2 }, font = { [[fonts\LXWK_Bold.ttf]], 13, align = "居中" }, text = "jiba", show = false }
	--称号
	blood.sign       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -2, 17 }, font = { [[fonts\LXWK_Bold.ttf]], 13, align = "居中" }, text = "jibada", show = false }
	return blood
end

--泰坦类型
function ns.blood.big()
	local blood = setmetatable({}, ns.blood)
	blood._type = "big"
	newstack(blood._type)
	local w, h, z    = 120, 10, 0
	blood.w          = w
	blood.h          = h
	blood.z          = z
	--控件
	blood.handle     = ui:builder "panel" { w = w, h = h, xy = { "中心", 0, 0 }, show = true }
	--背景
	blood.base       = blood.handle:builder 'image' { w = w + 5, h = h + 6, xy = { '中心', blood.handle, '中心', 0, 0, }, image = [[bloodbar\Bloodblack.tga]], alpha = 1 }
	--伤害进度
	blood.set_damage = [[bloodbar\Bloodorange.tga]]
	blood.damage     = blood.base:builder 'image' { w = w, h = h, xy = { '左侧', blood.base, '左侧', 1.5, 0, }, image = blood.set_damage, alpha = 1 }
	--血条进度-red
	blood.set_image  = bloodcolor.red2
	blood.image      = blood.base:builder 'image' { w = w, h = h, xy = { '左侧', blood.base, '左侧', 1.5, 0, }, image = blood.set_image, alpha = 1 }
	--名字
	blood.name       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -3, 2 }, font = { [[fonts\LXWK_Bold.ttf]], 20, align = "居中" }, show = false }
	--称号
	blood.sign       = blood.handle:builder 'text' { w = 0, h = 0, xy = { '底部', blood.handle, '顶部', -2, 17 }, font = { [[fonts\LXWK_Bold.ttf]], 20, align = "居中" }, show = false }
	return blood
end

local blooding = {}
local bloodteam = {}

--来个血条
function ns.blood.comeblood(name)
	local newui
	--搜索有的
	if bloodstack[name] and #bloodstack[name] > 0 then
		local id = #bloodstack[name]
		newui = bloodstack[name][id]
		table.remove(bloodstack[name], id)
	else
		--搞个新的
		newui = ns.blood[name]()
	end
	return newui
end

--设置血条宽
function ns.blood:set_w(val)
	self.base:set_w(val)
	self.w = val
	return self
end

--设置血条高
function ns.blood:set_h(val)
	self.base:set_h(val)
	self.h = val
	return self
end

--设置血条贴图
function ns.blood:set_xttt(text)
	if text then
		self.set_image = text
		self.image:set_image(text)
	end
	return self
end

--设置受伤贴图
function ns.blood:set_sstt(text)
	if text then
		self.set_damage = text
		self.damage:set_image(text)
	end
	return self
end

--设置等级位置贴图
function ns.blood:set_lvtt(text)
	if text then
		self.set_damage = text
		self.damage:set_image(text)
	end
	return self
end

--设置血条上名字
function ns.blood:set_name(text)
	if text then
		self.name:set_text(text)
		self.name:set_show(true)
	end
	return self
end

--设置血条上称号
function ns.blood:set_sign(text)
	if text then
		self.sign:set_text(text)
		self.sign:set_show(true)
	end
	return self
end

--设置UI是否显示
function ns.blood:set_show(ok)
	self.handle:set_show(ok)
	return self
end

--是否显示血条(用于只显示名字)
function ns.blood:set_base_show(ok)
	self.base:set_show(ok)
	return self
end

--设置血条对象
function ns.blood:set_obj(obj)
	if obj._type then
		obj = obj.handle
	end
	self.obj = obj
	return self
end

--设置血条不会消失(比如你要复活的单位)
function ns.blood:set_never(ok)
	self.never = ok
	return self
end

--给单位整根血条
function code.add_blood(unit, type, weight, height, unitName, isShowBlood, title)
	if not ns.blood[type] then
		return print("没有这个血条类型  " .. type)
	end
	local blood = ns.blood.comeblood(type)
	-- blood:set_base_show(true)
	blood.obj = unit
	blood.handle:set_show(true)
	if weight and weight > 0 then
		blood:set_w(weight)
	end
	if height and height > 0 then
		blood:set_h(height)
	end
	if unitName and unitName ~= "" then
		blood.name:set_show(true)
		blood:set_name(unitName)
	end
	if title and title ~= "" then
		blood:set_sign(title)
	end
	blood:set_base_show(isShowBlood)
	table.insert(blooding, blood)
	japi.SetUnitPressUIVisible(unit, false)
	return blood
end

local get_overhead = message.unit_overhead
local get_xyz = message.world_to_screen

local function get_world(x, y, z)
	local screen_x, screen_y, scale = get_xyz(x, y, z)
	if screen_x and screen_y then
		return screen_x * 1920 / 0.8, (0.6 - screen_y) * 1080 / 0.6, scale
	end
end

local get_x, get_y = jass.GetUnitX, jass.GetUnitY
local get_high = jass.GetUnitFlyHeight
local get_level = jass.GetHeroLevel
local get_trry = jass.GetUnitState

local show_unit = jass.IsUnitHidden

local hp1 = jass.UNIT_STATE_LIFE
local hp2 = jass.UNIT_STATE_MAX_LIFE

local get_player = jass.GetOwningPlayer
local get_playerid = code.GetConvertedPlayerId
--每帧刷新位置
function ns.blood.up()
	for i = #blooding, 1, -1 do
		local v = blooding[i]
		local u = v.obj
		if get_trry(u, hp1) > 0 then
			if show_unit(u) == false then
				local x, y       = get_x(u), get_y(u)
				local z          = initheight + get_high(u) + v.z --+ (get_overhead(u) or 0) --+ v.z
				-- if v._type == "hero" then
				--     z = z - 660
				-- end
				local newx, newy = get_world(x, y, z)
				if newy >= 245 and newy <= 1920 then
					if v.now_x ~= newx or v.now_y ~= newy then
						v.now_x = newx
						v.now_y = newy
						v.handle:reset_allpoint()
						newy = newy - 25
						if v._type == "hero" then
							newx = newx + 5
							v.handle:set_point2('底部', newx, newy)
						else
							v.handle:set_point2('底部', newx, newy)
						end
					end
					if v.level then
						local level = get_level(u)
						-- print(level, GetUnitName(u))
						-- local play = get_playerid(get_player(u))
						-- local level = jass.udg_Hero_Level[play]
						if v.level_now ~= level then
							v.level:set_text(level)
							v.level_now = level
						end
					end
					--生命值
					local newhp = get_trry(u, hp1) / get_trry(u, hp2)
					local w = v.w * newhp
					if v.now_hp ~= w then
						v.image:set_w(w)
						v.now_hp = w
					end
					--受伤处理
					local w1 = v.image:get_w()
					local w2 = v.damage:get_w()
					if w1 > w2 then
						v.damage:set_w(w1)
					end
					if w2 - w1 > 0.1 then
						local neww = w2 - (0.5 * (w2 / w1))
						v.damage:set_w(neww)
					end
					if v.handle._show == false then
						v.handle:set_show(true)
					end
					--魔法值
					--金用
					if v.mana then
						local mana1 = jass.GetUnitState(u, jass.UNIT_STATE_MANA)
						local mana2 = jass.GetUnitState(u, jass.UNIT_STATE_MAX_MANA)
						local x2 = mana1 /
							mana2
						local new2 = v.w * x2
						if v.now_ma ~= new2 then
							v.mana:set_w(new2)
							v.now_ma = new2
						end
					end
				else
					if v.handle._show then
						v.handle:set_show(false)
					end
				end
			else
				if v.handle._show then
					v.handle:set_show(false)
				end
			end
		else
			v.handle:set_show(false)
			if ((jass.IsUnitType(u, jass.UNIT_TYPE_HERO) == true) and (code.IsUnitIllusionBJ(u) == false) and (jass.GetPlayerController(jass.GetOwningPlayer(u)) == jass.MAP_CONTROL_USER)) or v.never == true then
				--不回收
			else
				bloodteam[u] = nil
				table.insert(bloodstack[v._type], v)
				table.remove(blooding, i)
			end
		end
	end
end

--初始化载入每帧绘制
ac.time(0.5, 1, function()
	ac.mzhz(ns.blood.up)
end)
