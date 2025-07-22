local jass = require "jass.common"
local japi = require "jass.japi"


local gljt = {}

--最大等级
gljt.level = 15
gljt.sfph = 0.1
gljt.jtjl = 250 * gljt.level
gljt.czjt = false

-- 是否在有滚轮的UI中
gljt.inUI = false

jass.SetCameraField(jass.CAMERA_FIELD_TARGET_DISTANCE, gljt.jtjl, gljt.sfph)

--初始镜头高度
gljt.wjjt = 15

--YDUserDataSet(player, GetLocalPlayer(), "镜头X角度", real, YDWEDeg2R(Rad2Deg(YDWER2Rad(GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK)))))

--执行动作
function gljt.func()
	if gljt.inUI then
		return
	end
	gljt.czjt = true
	if japi.DzGetWheelDelta() > 0 then
		if gljt.wjjt > 5 then
			gljt.wjjt = gljt.wjjt - 1
		end
	else
		if gljt.wjjt < 15 then
			gljt.wjjt = gljt.wjjt + 1
		end
	end
	gljt.jtjd = jass.Rad2Deg(jass.GetCameraField(jass.CAMERA_FIELD_ANGLE_OF_ATTACK))
	gljt.jtjl = 250 * gljt.wjjt
end

--刷新
function gljt.shuaxin()
	SetCameraFieldForPlayer(jass.GetLocalPlayer(), jass.CAMERA_FIELD_FARZ, 999999.00, 0)
	if gljt.czjt then
		jass.SetCameraField(jass.CAMERA_FIELD_ANGLE_OF_ATTACK, gljt.jtjd, 0.00)
		jass.SetCameraField(jass.CAMERA_FIELD_TARGET_DISTANCE, gljt.jtjl, gljt.sfph)
		gljt.czjt = false
	end
end

ac.time(0.5, 1, function()
	ac.mzhz(gljt.shuaxin)
end)

ns.gdjt = gljt.func

return gljt
