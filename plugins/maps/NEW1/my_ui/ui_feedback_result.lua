local jass = require "jass.common"
local japi = require "jass.japi"
local Module = require "my_base.base_module_manager"
local uiCreate = Module.UICreate
local common = Module.Common
local players = jass.udg_Player

local ResultFeedback = {}

function ResultFeedback:Init()
	local _ui         = {}
	ResultFeedback.ui = _ui
	_ui.panel         = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 0, 0, 1, 1)
	_ui.model         = uiCreate:CreateUIRelative("model", _ui.panel, "中心", _ui.panel, "中心", 0, 0, 500, 500)
end

---成功反馈
---@param playerID integer
function ResultFeedback:PlaySuccess(playerID)
	if common:IsLocalPlayer(players[playerID]) then
		ResultFeedback.ui.panel:set_point2("中心", 1600, 450)
		-- ResultFeedback.ui.model:set_model([[Survival\OtherEffect\test\1.mdx]])
		ResultFeedback.ui.model:set_model([[Survival\SeizeBody\1\1.mdl]])
		ResultFeedback.ui.model:set_camera_target(0, 0, 0):set_model_position(-30, 0, -25)
		:set_x(0):set_y(20):set_z(0)
		:set_camera_source(1, 0, 0)
		:set_moive_id(0)
		ResultFeedback.ui.model:set_Size(0.2)
		ResultFeedback.ui.model:set_moive_loop(1, false)
	end
end

---失败反馈
---@param playerID integer
function ResultFeedback:PlayFailed(playerID)
	if common:IsLocalPlayer(players[playerID]) then
		ResultFeedback.ui.model:set_point2("中心", 1600, 450)
		ResultFeedback.ui.model:set_model([[Survival\OtherEffect\ActionFailed\1.mdx]])
		ResultFeedback.ui.model:set_moive_loop(1, false)
	end
end

return ResultFeedback
