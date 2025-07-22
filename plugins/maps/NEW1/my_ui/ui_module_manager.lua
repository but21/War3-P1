local BaseModule = require "my_base.base_module_manager"
local UIModule = {}


UIModule.BossBlood = require "my_ui.ui_boss_blood"
BaseModule.DamageSystem():Init(UIModule.BossBlood)


UIModule.ConsoleUI = require 'my_ui.ui_console'
UIModule.ResourceUI = require "my_ui.ui_resource"
UIModule.AttrPanel = require "my_ui.ui_attr_panel"
UIModule.Weapon = require "my_ui.ui_weapon"
UIModule.Accessory = require "my_ui.ui_accessory"

UIModule.SelectOne = require "my_ui.ui_select_one"
UIModule.SelectOne:Init(UIModule.Weapon, UIModule.Accessory)


UIModule.Heart = require 'my_ui.ui_heart'
UIModule.Artifact = require 'my_ui.ui_artifact_select'
UIModule.Talent = require 'my_ui.ui_talent'
UIModule.Challenge = require "my_ui.ui_challenge"


UIModule.Cbg = require "my_ui.ui_cbg"
UIModule.Cbg:Init(UIModule.Weapon, UIModule.Accessory, UIModule.SelectOne)


UIModule.BlackMarket = require "my_ui.ui_blackmarket"
UIModule.GamblingHouse = require "my_ui.ui_gambling_house"


UIModule.GameInformation = require "my_ui.ui_game_information"
UIModule.GameInformation:Init()


UIModule.SeizeBody = require "my_ui.ui_seize_body"

UIModule.ResultFeedback = require "my_ui.ui_feedback_result"
UIModule.ResultFeedback:Init()

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
