local BaseModule = require "my_base.base_module_manager"
local UIModule = {}


UIModule.BossBlood = require "my_ui.ui_boss_blood"
BaseModule.DamageSystem():Init(UIModule.BossBlood)


UIModule.ConsoleUI = require 'my_ui.ui_console'
UIModule.ResourceUI = require "my_ui.ui_resource"
UIModule.AttrPanel = require "my_ui.ui_attr_panel"



UIModule.BlackMarket = require "my_ui.ui_blackmarket"


UIModule.GameInformation = require "my_ui.ui_game_information"
UIModule.GameInformation:Init()


-- UIModule.SeizeBody = require "my_ui.ui_seize_body"

UIModule.ResultFeedback = require "my_ui.ui_feedback_result"
UIModule.ResultFeedback:Init()

UIModule.Card = require "my_ui.ui_card"
UIModule.Swallow = require "my_ui.ui_swallow"

UIModule.BossComing = require "my_ui.ui_boss_coming"

UIModule.ArchiveUI = require "my_ui.ui_archive"
UIModule.TalentTreeUI = require "my_ui.ui_talentTree"
UIModule.HeroExpUI = require "my_ui.ui_heroExp"
UIModule.TreasureHunt = require "my_ui.ui_treasure_hunt"
UIModule.ActivityUI = require "my_ui.ui_activity"
UIModule.QrqdUI = require "my_ui.ui_qrqd"
UIModule.Settings = require "my_ui.ui_settings"
UIModule.Decorate = require "my_ui.ui_decorate"

UIModule.ModeSelect = require "my_ui.ui_mode_select"

return UIModule
