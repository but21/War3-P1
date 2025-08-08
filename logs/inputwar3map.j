//===========================================================================
//*
//*  Global variables
//*
//===========================================================================
library YDTriggerSaveLoadSystem initializer Init
//#  define YDTRIGGER_handle(SG)                          YDTRIGGER_HT##SG##(HashtableHandle)
globals
        hashtable YDHT
    hashtable YDLOC
endglobals
    private function Init takes nothing returns nothing
            set YDHT = InitHashtable()
        set YDLOC = InitHashtable()
    endfunction
endlibrary
globals
	rect gg_rct_AttackArea1 = null
	rect gg_rct_AttackArea2 = null
	rect gg_rct_AttackArea3 = null
	rect gg_rct_AttackArea4 = null
	rect gg_rct_BYJArea = null
	rect gg_rct_BYJChallenge = null
	rect gg_rct_BYJChallengeArea1 = null
	rect gg_rct_BYJChallengeArea2 = null
	rect gg_rct_BYJChallengeArea3 = null
	rect gg_rct_BYJChallengeArea4 = null
	rect gg_rct_BYJChallengeArea5 = null
	rect gg_rct_EnemySpawnPoint1 = null
	rect gg_rct_EnemySpawnPoint2 = null
	rect gg_rct_EnemySpawnPoint3 = null
	rect gg_rct_EnemySpawnPoint4 = null
	rect gg_rct_ExploitRoomArea1 = null
	rect gg_rct_ExploitRoomArea2 = null
	rect gg_rct_ExploitRoomArea3 = null
	rect gg_rct_ExploitRoomArea4 = null
	rect gg_rct_FinalBossArea = null
	rect gg_rct_Habitus1_1 = null
	rect gg_rct_Habitus1_2 = null
	rect gg_rct_Habitus1_3 = null
	rect gg_rct_Habitus2_1 = null
	rect gg_rct_Habitus2_2 = null
	rect gg_rct_Habitus2_3 = null
	rect gg_rct_Habitus2_4 = null
	rect gg_rct_Habitus3_1 = null
	rect gg_rct_Habitus3_2 = null
	rect gg_rct_Habitus3_3 = null
	rect gg_rct_Habitus3_4 = null
	rect gg_rct_Habitus3_5 = null
	rect gg_rct_Habitus4_1 = null
	rect gg_rct_Habitus4_2 = null
	rect gg_rct_Habitus4_3 = null
	rect gg_rct_Habitus4_4 = null
	rect gg_rct_Habitus4_5 = null
	rect gg_rct_Habitus4_6 = null
	rect gg_rct_Habitus5_1 = null
	rect gg_rct_Habitus5_2 = null
	rect gg_rct_Habitus5_3 = null
	rect gg_rct_Habitus5_4 = null
	rect gg_rct_Habitus5_5 = null
	rect gg_rct_Habitus5_6 = null
	rect gg_rct_Habitus5_7 = null
	rect gg_rct_HabitusArea1 = null
	rect gg_rct_HabitusArea2 = null
	rect gg_rct_HabitusArea3 = null
	rect gg_rct_HabitusArea4 = null
	rect gg_rct_HabitusArea5 = null
	rect gg_rct_HeroSelectArea = null
	rect gg_rct_HeroSpwanPoint1 = null
	rect gg_rct_HeroSpwanPoint2 = null
	rect gg_rct_HeroSpwanPoint3 = null
	rect gg_rct_HeroSpwanPoint4 = null
	rect gg_rct_MainCity1 = null
	rect gg_rct_MainCity2 = null
	rect gg_rct_MainCity3 = null
	rect gg_rct_MainCity4 = null
	rect gg_rct_PracticeRoom1 = null
	rect gg_rct_PracticeRoom2 = null
	rect gg_rct_PracticeRoom3 = null
	rect gg_rct_PracticeRoom4 = null
	rect gg_rct_SkillChallenge1 = null
	rect gg_rct_SkillChallenge2 = null
	rect gg_rct_SkillChallenge3 = null
	rect gg_rct_SkillChallenge4 = null
	rect gg_rct_SuitChallengeArea1 = null
	rect gg_rct_SuitChallengeArea2 = null
	rect gg_rct_SuitChallengeArea3 = null
	rect gg_rct_SuitChallengeArea4 = null
	rect gg_rct_DestinyTranscriptArea1 = null
	rect gg_rct_DestinyTranscriptArea2 = null
	rect gg_rct_DestinyTranscriptArea3 = null
	rect gg_rct_DestinyTranscriptArea4 = null
	rect gg_rct_DestinyTranscriptArea5 = null
	rect gg_rct_DestinyTranscriptArea6 = null
	rect gg_rct_DestinyTranscriptArea7 = null
	rect gg_rct_DestinyTranscript1 = null
	rect gg_rct_DestinyTranscript2 = null
	rect gg_rct_DestinyTranscript3 = null
	rect gg_rct_DestinyTranscript4 = null
	rect gg_rct_DestinyTranscript5 = null
	rect gg_rct_DestinyTranscript6 = null
	rect gg_rct_DestinyTranscript7 = null
	rect gg_rct_UnexploredArea = null
	rect gg_rct_BabyFunctionArea1 = null
	rect gg_rct_BabyFunctionArea2 = null
	rect gg_rct_BabyFunctionArea3 = null
	rect gg_rct_BabyFunctionArea4 = null
	rect gg_rct_Suit_PlayerIn_1 = null
	rect gg_rct_Suit_PlayerIn_2 = null
	rect gg_rct_Suit_PlayerIn_3 = null
	rect gg_rct_Suit_PlayerIn_4 = null
	camerasetup gg_cam_Camera_001 = null
	integer udg_GameUI_DZ_UI = 0
	string array udg_HotkeyStr
	integer array udg_Hotkey
	unit array udg_Hero
	unit array udg_BABY
	integer udg_SLine_Stack_Top = 0
	effect array udg_SLine_Stack_Effect
	attacktype array udg_SLine_AttackType
	damagetype array udg_SLine_DamageType
	weapontype array udg_SLine_WeaponType
	damagetype udg_Args_DamageType = null
	attacktype udg_Args_AttackType = null
	weapontype udg_Args_WeaponType = null
	attacktype array udg_Bezier_AttackType
	damagetype array udg_Bezier_DamageType
	weapontype array udg_Bezier_EquipType
	effect array udg_Bezier_Stack_Effect
	integer udg_Bezier_Stack_Top = 0
	location udg_HeightPoint = null
	integer udg_CircleArc_Stack_Top = 0
	effect array udg_CircleArc_Stack_Effect
	player array udg_Player
	real array udg_PlayerGold
	attacktype array udg_RangeDD_AttackType
	damagetype array udg_RangeDD_DamageType
	effect array udg_RangeDD_Stack_Effect
	integer udg_RangeDD_Stack_Top = 0
	weapontype array udg_RangeDD_WeaponType
	unit array udg_DebuffVest
	integer udg_Follow_Stack_Top = 0
	effect array udg_Follow_Stack_Effect
	real array udg_PlayerKills
	real array udg_PlayerDiamond
	integer udg_Surrounds_Stack_Top = 0
	effect array udg_Surrounds_Stack_Effect
	weapontype array udg_Surrounds_EquipType
	damagetype array udg_Surrounds_DamageType
	attacktype array udg_Surrounds_AttackType
	location udg_BackHomeP = null
	real array udg_PositionAngle
	integer array udg_RemoteEnemyType
	boolean udg_IsGameStart = false
	unit array udg_BlackMarket
	integer array udg_BlackMarketSalesAmount
	real array udg_KillWoodDiamond
	real array udg_KillBossDiamond
	integer array udg_BMSalesFreePro
	integer array udg_BlackMarketSkill
	integer array udg_HeroImmediatelyRelive
	real udg_GameTime = 0
	integer udg_GameMode = 0
	integer udg_GameDifficulty = 0
	hashtable udg_HTSeizeBodyID = null
	integer array udg_SeizeBodyNeedLv
	integer array udg_CurrentSeizeBodyID
	integer udg_GameResult = 0
	integer array udg_CurrentHeroSkin
	integer array udg_BossSkillVest
	trigger array udg_BossSkillTrig
	location array udg_HomePoints
	location array udg_HomeEnemyPoints
	integer udg_CurrentMonsterWave = 0
	boolean udg_SpawnNormalMonsters = false
	integer udg_LgfMaxAmount = 0
	integer array udg_LgfExtraMaxAmount
	integer udg_SpawnNormalMonstersCount = 0
	integer array udg_CurrentQuestIndex
	group array udg_QuestMonsterGroup
	boolean array udg_IsInQuest
	group array udg_LgfMonsterGroup
	integer array udg_LgfWoodMonsterRemainingKills
	integer array udg_LgfWoodMonsterReduceKills
	unit array udg_SLine_Target
	unit array udg_Bezier_Target
	real array udg_DrawCardCostReduce
	integer udg_CurrentWoodMonsterValueID = 0
	integer udg_LgfWoodMonsterRequiredKills = 0
	trigger gg_trg_Weapon_1 = null
	trigger gg_trg_Weapon_1_EndAction = null
	trigger gg_trg_Weapon_1_EndAction2 = null
	trigger gg_trg_Weapon_1_CD = null
	trigger gg_trg_Weapon_2 = null
	trigger gg_trg_Weapon_2_DamageAction = null
	trigger gg_trg_Weapon_2_CD = null
	trigger gg_trg_Weapon_3 = null
	trigger gg_trg_Weapon_3_CD = null
	trigger gg_trg_Weapon_4_Get = null
	trigger gg_trg_Weapon_4 = null
	trigger gg_trg_Weapon_4_CD = null
	trigger gg_trg_Weapon_5 = null
	trigger gg_trg_Weapon_5_DamageAction = null
	trigger gg_trg_Weapon_5_CD = null
	trigger gg_trg_Weapon_5_EndAction = null
	trigger gg_trg_Weapon_6 = null
	trigger gg_trg_Weapon_6_DamageAction = null
	trigger gg_trg_Weapon_6_CD = null
	trigger gg_trg_Weapon_7 = null
	trigger gg_trg_Weapon_7_CD = null
	trigger gg_trg_Weapon_8_Get = null
	trigger gg_trg_Weapon_8 = null
	trigger gg_trg_Weapon_8_CD = null
	trigger gg_trg_Weapon_9 = null
	trigger gg_trg_Weapon_9_CD = null
	trigger gg_trg_Weapon_10 = null
	trigger gg_trg_Weapon_10_EndAction = null
	trigger gg_trg_Weapon_10_CD = null
	trigger gg_trg_Weapon_11 = null
	trigger gg_trg_Weapon_11_CD = null
	trigger gg_trg_Weapon_12 = null
	trigger gg_trg_Weapon_12_CD = null
	trigger gg_trg_Weapon_13 = null
	trigger gg_trg_Weapon_13_EndAction = null
	trigger gg_trg_Weapon_13_CD = null
	trigger gg_trg_Weapon_14 = null
	trigger gg_trg_Weapon_14_CD = null
	trigger gg_trg_Weapon_15 = null
	trigger gg_trg_Weapon_15_CD = null
	trigger gg_trg_Weapon_16 = null
	trigger gg_trg_Weapon_16_CD = null
	trigger gg_trg_Weapon_17 = null
	trigger gg_trg_Weapon_17_DamageAction = null
	trigger gg_trg_Weapon_17_CD = null
	trigger gg_trg_Weapon_18 = null
	trigger gg_trg_Weapon_18_EndAction = null
	trigger gg_trg_Weapon_18_CD = null
	trigger gg_trg_Weapon_19 = null
	trigger gg_trg_Weapon_19_CD = null
	trigger gg_trg_Weapon_20 = null
	trigger gg_trg_Weapon_20_DamageAction = null
	trigger gg_trg_Weapon_20_CD = null
	trigger gg_trg_Weapon_21 = null
	trigger gg_trg_Weapon_21_EndAction = null
	trigger gg_trg_Weapon_21_CD = null
	trigger gg_trg_WeaponRunInit = null
	trigger gg_trg_WeaponCDInit = null
	trigger gg_trg_WeaponGetInit = null
	trigger gg_trg____________________001 = null
	trigger gg_trg_TestInit = null
	trigger gg_trg_ToCode = null
	trigger gg_trg_SetWoodMonsterValueID = null
	trigger gg_trg_SpawnWoodMonster = null
	trigger gg_trg_SpawnLgfMonsters = null
	trigger gg_trg_LgfInit = null
	trigger gg_trg_F4 = null
	trigger gg_trg_PressKeyC = null
	trigger gg_trg_QuestInit = null
	trigger gg_trg_OpenArchiveChallenge = null
	trigger gg_trg_ArchiveChallengeInit = null
	trigger gg_trg_BossSkillTrig1_1 = null
	trigger gg_trg_BossSkillTrig2_1 = null
	trigger gg_trg_BossSkillTrig3_1 = null
	trigger gg_trg_BossSkillTrig3_2 = null
	trigger gg_trg_BossSkillTrig4_1 = null
	trigger gg_trg_BossSkillTrig4_2 = null
	trigger gg_trg_BossSkillTrig4_2_DamageAction = null
	trigger gg_trg_BossSkillTrig5_1 = null
	trigger gg_trg_BossSkillTrig5_2 = null
	trigger gg_trg_BossSkillTrig6_1 = null
	trigger gg_trg_BossSkillTrig6_2 = null
	trigger gg_trg_BossSkillTrig6_3 = null
	trigger gg_trg_BossSkillInit = null
	trigger gg_trg_SeizeBody_15 = null
	trigger gg_trg_SeizeBody_14 = null
	trigger gg_trg_SeizeBody_13 = null
	trigger gg_trg_SeizeBody_8 = null
	trigger gg_trg_SeizeBody_3 = null
	trigger gg_trg_SeizeBody_2 = null
	trigger gg_trg_SeizeBodyLua = null
	trigger gg_trg_SelectBMSync = null
	trigger gg_trg_BuyBMSales = null
	trigger gg_trg_SetBMSales = null
	trigger gg_trg_BlackMarketInit = null
	trigger gg_trg_CreateNormalEnemy = null
	trigger gg_trg_SpawnAttackMonsters = null
	trigger gg_trg_SpawnNormalMonsters = null
	trigger gg_trg_WBInit = null
	trigger gg_trg_UnitDead = null
	trigger gg_trg_PressKeyEsc = null
	trigger gg_trg_F3 = null
	trigger gg_trg_F2 = null
	trigger gg_trg_F1 = null
	trigger gg_trg_HeroLvUp = null
	trigger gg_trg_RecoverHp = null
	trigger gg_trg_BackHome = null
	trigger gg_trg_D___u = null
	trigger gg_trg_D_Func_Effect = null
	trigger gg_trg_ShowAttr = null
	trigger gg_trg_HeroRelive = null
	trigger gg_trg_HeroAttrInit = null
	trigger gg_trg_ChangeAttrEvent = null
	trigger gg_trg_DamageSystem = null
	trigger gg_trg_AttackSystem = null
	trigger gg_trg_001Timer = null
	trigger gg_trg_002Timer = null
	trigger gg_trg_01Timer = null
	trigger gg_trg_05Timer = null
	trigger gg_trg_1Timer = null
	trigger gg_trg_GiveItem = null
	trigger gg_trg_BabyFunction = null
	trigger gg_trg_BabyMove = null
	trigger gg_trg_BabyInit = null
	trigger gg_trg__u = null
	trigger gg_trg_C_________u = null
	trigger gg_trg_SLine_Type1 = null
	trigger gg_trg_SLine_Type2 = null
	trigger gg_trg_SLine_Type3 = null
	trigger gg_trg_SLine_Type4 = null
	trigger gg_trg_SLine_Type5 = null
	trigger gg_trg_StraightLineStack = null
	trigger gg_trg_Bezier_Type1 = null
	trigger gg_trg_Bezier_Type2 = null
	trigger gg_trg_BezierStack = null
	trigger gg_trg_CircleArc_Type1 = null
	trigger gg_trg_CircleArcStack = null
	trigger gg_trg_RDD_Type1 = null
	trigger gg_trg_RangeDuringDamageStack = null
	trigger gg_trg_FollowStack = null
	trigger gg_trg_SurroundsStack = null
	trigger gg_trg_SpinStack = null
	trigger gg_trg_Init = null
	trigger gg_trg_HTInit = null
	trigger gg_trg_GameStart = null
	trigger gg_trg_SetEnemyAttr = null
	trigger gg_trg_AddBlood = null
	trigger gg_trg_AddBlood_Init = null
	trigger gg_trg_Ui04_______LOGO = null
	trigger gg_trg_____________LG = null
	trigger gg_trg_Init________________u = null
	trigger gg_trg_Init_____________u = null
	trigger gg_trg_MpsScriptInit = null
	trigger gg_trg_WPDJ_____________u = null
	trigger gg_trg_______u = null
	unit gg_unit_h00H_0116 = null
	unit gg_unit_h00H_0115 = null
	unit gg_unit_h00K_0018 = null
	unit gg_unit_h00H_0108 = null
	unit gg_unit_h00H_0114 = null
	trigger gg_trg_SetRefreshTip = null
	real array udg_BMCurrentCost
	real array udg_BMRaiseCost
	integer array udg_BMFreeRefreshAmount
	integer array udg_CardRefreshAmount
endglobals
function InitGlobals takes nothing returns nothing
	local integer i = 0
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_HotkeyStr[i] = ""
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_Hotkey[i] = 0
		set i = i + 1
	endloop
	set udg_SLine_Stack_Top = 0
	set udg_Bezier_Stack_Top = 0
	set udg_CircleArc_Stack_Top = 0
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_PlayerGold[i] = 0
		set i = i + 1
	endloop
	set udg_RangeDD_Stack_Top = 0
	set udg_Follow_Stack_Top = 0
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_PlayerKills[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_PlayerDiamond[i] = 0
		set i = i + 1
	endloop
	set udg_Surrounds_Stack_Top = 0
	set udg_IsGameStart = false
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_BlackMarketSalesAmount[i] = 4
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_KillWoodDiamond[i] = 10.00
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_KillBossDiamond[i] = 500.00
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_BMSalesFreePro[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_HeroImmediatelyRelive[i] = 0
		set i = i + 1
	endloop
	set udg_GameTime = 0
	set udg_GameMode = 0
	set udg_GameDifficulty = 0
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_SeizeBodyNeedLv[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_CurrentSeizeBodyID[i] = 0
		set i = i + 1
	endloop
	set udg_GameResult = 0
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_CurrentHeroSkin[i] = 0
		set i = i + 1
	endloop
	set udg_CurrentMonsterWave = 0
	set udg_SpawnNormalMonsters = false
	set udg_LgfMaxAmount = 0
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_LgfExtraMaxAmount[i] = 0
		set i = i + 1
	endloop
	set udg_SpawnNormalMonstersCount = 0
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_CurrentQuestIndex[i] = 1
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_QuestMonsterGroup[i] = CreateGroup()
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_IsInQuest[i] = false
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_LgfMonsterGroup[i] = CreateGroup()
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_LgfWoodMonsterRemainingKills[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_LgfWoodMonsterReduceKills[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_DrawCardCostReduce[i] = 0
		set i = i + 1
	endloop
	set udg_CurrentWoodMonsterValueID = 151
	set udg_LgfWoodMonsterRequiredKills = 0
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_BMCurrentCost[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_BMRaiseCost[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 1)
		set udg_BMFreeRefreshAmount[i] = 0
		set i = i + 1
	endloop
	set i = 0
	loop
		exitwhen(i > 4)
		set udg_CardRefreshAmount[i] = 0
		set i = i + 1
	endloop
endfunction
function InitRandomGroups takes nothing returns nothing
	local integer curset
endfunction
function InitSounds takes nothing returns nothing
endfunction
function CreateDestructables takes nothing returns nothing
	local destructable d
	local trigger t
	local real life
endfunction
function CreateItems takes nothing returns nothing
	local integer itemID
endfunction
function CreateUnits takes nothing returns nothing
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(Player(2),'h00H',6745.5,-3494.3,115.9)
	set gg_unit_h00H_0116 = u
	set u = CreateUnit(Player(3),'h00H',6767.8,1540.5,200.4)
	set gg_unit_h00H_0115 = u
	set u = CreateUnit(Player(15),'h00K',1097.4,679.0,90.0)
	set gg_unit_h00K_0018 = u
	set u = CreateUnit(Player(1),'h00H',-5040.3,-3663.6,19.5)
	set gg_unit_h00H_0108 = u
	set u = CreateUnit(Player(4),'h04L',-1539.0,1850.3,232.4)
	set u = CreateUnit(Player(4),'h04L',-1671.6,2210.1,231.0)
	set u = CreateUnit(Player(4),'h04L',-1928.7,1943.3,249.7)
	set u = CreateUnit(Player(0),'h00H',-5041.2,1568.4,293.3)
	set gg_unit_h00H_0114 = u
	set u = CreateUnit(Player(4),'h04L',-2043.7,1637.4,348.2)
	set u = CreateUnit(Player(0),'h00J',2.0,3.1,37.3)
	set u = CreateUnit(Player(4),'h04L',-1731.0,1470.3,175.1)
endfunction
function CreateRegions takes nothing returns nothing
	local weathereffect we
	set gg_rct_AttackArea1= Rect(-8352,8256,-6336,9760)
	set gg_rct_AttackArea2= Rect(-5920,8256,-3808,9792)
	set gg_rct_AttackArea3= Rect(-3360,8256,-1216,9728)
	set gg_rct_AttackArea4= Rect(-768,8256,2080,9728)
	set gg_rct_BYJArea= Rect(-8960,4608,-8096,5344)
	set gg_rct_BYJChallenge= Rect(-11200,-3936,-10496,-3328)
	set gg_rct_BYJChallengeArea1= Rect(-11296,-2496,-10720,-1984)
	set gg_rct_BYJChallengeArea2= Rect(-10208,-2464,-9664,-1984)
	set gg_rct_BYJChallengeArea3= Rect(-9088,-2432,-8512,-1952)
	set gg_rct_BYJChallengeArea4= Rect(-7936,-2464,-7488,-1984)
	set gg_rct_BYJChallengeArea5= Rect(-7008,-2432,-6624,-2016)
	set gg_rct_EnemySpawnPoint1= Rect(-5312,992,-4800,1504)
	set gg_rct_EnemySpawnPoint2= Rect(5696,1056,6208,1568)
	set gg_rct_EnemySpawnPoint3= Rect(-5248,-1472,-4736,-960)
	set gg_rct_EnemySpawnPoint4= Rect(5696,-1376,6208,-864)
	set gg_rct_ExploitRoomArea1= Rect(9472,-7488,10080,-6880)
	set gg_rct_ExploitRoomArea2= Rect(11392,-7424,12000,-6848)
	set gg_rct_ExploitRoomArea3= Rect(9600,-9376,10080,-8896)
	set gg_rct_ExploitRoomArea4= Rect(11360,-9376,11936,-8864)
	set gg_rct_FinalBossArea= Rect(9344,7584,11648,9184)
	set gg_rct_Habitus1_1= Rect(-3072,-9792,-2240,-9408)
	set gg_rct_Habitus1_2= Rect(-1792,-9792,-960,-9440)
	set gg_rct_Habitus1_3= Rect(-544,-9760,160,-9472)
	set gg_rct_Habitus2_1= Rect(-3040,-6496,-2144,-6016)
	set gg_rct_Habitus2_2= Rect(-1696,-6528,-736,-6048)
	set gg_rct_Habitus2_3= Rect(-3072,-7808,-2112,-7328)
	set gg_rct_Habitus2_4= Rect(-1728,-7872,-704,-7456)
	set gg_rct_Habitus3_1= Rect(640,-8704,1312,-8352)
	set gg_rct_Habitus3_2= Rect(1760,-8640,2592,-8320)
	set gg_rct_Habitus3_3= Rect(640,-9696,1344,-9344)
	set gg_rct_Habitus3_4= Rect(1728,-9824,2624,-9408)
	set gg_rct_Habitus3_5= Rect(3040,-9856,4000,-9440)
	set gg_rct_Habitus4_1= Rect(4416,-8640,5280,-8352)
	set gg_rct_Habitus4_2= Rect(5792,-8640,6528,-8320)
	set gg_rct_Habitus4_3= Rect(7104,-8672,7680,-8320)
	set gg_rct_Habitus4_4= Rect(4480,-9728,5312,-9440)
	set gg_rct_Habitus4_5= Rect(5696,-9696,6592,-9504)
	set gg_rct_Habitus4_6= Rect(7008,-9696,7744,-9504)
	set gg_rct_Habitus5_1= Rect(128,-6400,928,-6016)
	set gg_rct_Habitus5_2= Rect(1376,-6432,2432,-6016)
	set gg_rct_Habitus5_3= Rect(2944,-6496,4000,-6048)
	set gg_rct_Habitus5_4= Rect(160,-7840,960,-7424)
	set gg_rct_Habitus5_5= Rect(1408,-7808,2496,-7392)
	set gg_rct_Habitus5_6= Rect(4416,-7840,5568,-7360)
	set gg_rct_Habitus5_7= Rect(2976,-7776,4032,-7392)
	set gg_rct_HabitusArea1= Rect(-1856,-8640,-992,-8320)
	set gg_rct_HabitusArea2= Rect(-608,-7328,-352,-6656)
	set gg_rct_HabitusArea3= Rect(3104,-8672,3904,-8352)
	set gg_rct_HabitusArea4= Rect(8032,-9248,8448,-8768)
	set gg_rct_HabitusArea5= Rect(4480,-6432,5472,-6048)
	set gg_rct_HeroSelectArea= Rect(-9760,8864,-9504,9120)
	set gg_rct_HeroSpwanPoint1= Rect(-10048,9088,-9792,9344)
	set gg_rct_HeroSpwanPoint2= Rect(-10048,8640,-9792,8896)
	set gg_rct_HeroSpwanPoint3= Rect(-9440,9088,-9184,9344)
	set gg_rct_HeroSpwanPoint4= Rect(-9440,8672,-9184,8928)
	set gg_rct_MainCity1= Rect(-2720,736,-2240,1760)
	set gg_rct_MainCity2= Rect(3264,1024,3648,1696)
	set gg_rct_MainCity3= Rect(-2656,-1696,-2208,-832)
	set gg_rct_MainCity4= Rect(3296,-1408,3680,-832)
	set gg_rct_PracticeRoom1= Rect(-1568,352,288,2304)
	set gg_rct_PracticeRoom2= Rect(736,352,2688,2304)
	set gg_rct_PracticeRoom3= Rect(-1504,-2144,320,-320)
	set gg_rct_PracticeRoom4= Rect(736,-2080,2688,-224)
	set gg_rct_SkillChallenge1= Rect(-128,800,256,1280)
	set gg_rct_SkillChallenge2= Rect(768,864,1184,1344)
	set gg_rct_SkillChallenge3= Rect(-192,-1184,256,-704)
	set gg_rct_SkillChallenge4= Rect(768,-1184,1248,-704)
	set gg_rct_SuitChallengeArea1= Rect(8960,-2560,10208,-1600)
	set gg_rct_SuitChallengeArea2= Rect(11040,-2528,12192,-1664)
	set gg_rct_SuitChallengeArea3= Rect(8896,-5760,10208,-4864)
	set gg_rct_SuitChallengeArea4= Rect(11008,-5760,12160,-4896)
	set gg_rct_DestinyTranscriptArea1= Rect(6080,8800,6880,9504)
	set gg_rct_DestinyTranscriptArea2= Rect(6144,7360,6848,8128)
	set gg_rct_DestinyTranscriptArea3= Rect(6176,6048,6880,6656)
	set gg_rct_DestinyTranscriptArea4= Rect(6112,4544,6880,5312)
	set gg_rct_DestinyTranscriptArea5= Rect(6144,3264,6912,3904)
	set gg_rct_DestinyTranscriptArea6= Rect(11296,4288,12224,5056)
	set gg_rct_DestinyTranscriptArea7= Rect(11296,2528,12160,3392)
	set gg_rct_DestinyTranscript1= Rect(3168,8704,7040,9568)
	set gg_rct_DestinyTranscript2= Rect(3136,7296,7072,8192)
	set gg_rct_DestinyTranscript3= Rect(3168,5920,7072,6752)
	set gg_rct_DestinyTranscript4= Rect(3168,4448,7040,5376)
	set gg_rct_DestinyTranscript5= Rect(3168,3168,7072,3968)
	set gg_rct_DestinyTranscript6= Rect(7552,4064,12288,5216)
	set gg_rct_DestinyTranscript7= Rect(7520,2304,12320,3520)
	set gg_rct_UnexploredArea= Rect(-11712,-416,-8384,1056)
	set gg_rct_BabyFunctionArea1= Rect(-1792,3200,-1184,3776)
	set gg_rct_BabyFunctionArea2= Rect(-1056,3104,-448,3680)
	set gg_rct_BabyFunctionArea3= Rect(-256,3072,352,3648)
	set gg_rct_BabyFunctionArea4= Rect(512,3072,1120,3648)
	set gg_rct_Suit_PlayerIn_1= Rect(8736,-2784,10496,64)
	set gg_rct_Suit_PlayerIn_2= Rect(10752,-2720,12512,128)
	set gg_rct_Suit_PlayerIn_3= Rect(8704,-5984,10464,-3136)
	set gg_rct_Suit_PlayerIn_4= Rect(10720,-5984,12480,-3136)
endfunction
function CreateCameras takes nothing returns nothing
	set gg_cam_Camera_001 = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ZOFFSET, 0.000000, 0.0)
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROTATION, 90.000000, 0.0)
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.000000, 0.0)
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_TARGET_DISTANCE, 3000.000000, 0.0)
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROLL, 0.000000, 0.0)
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FIELD_OF_VIEW, 70.000000, 0.0)
	call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FARZ, 10000.000000, 0.0)
	call CameraSetupSetDestPosition(gg_cam_Camera_001, 1.680000, -13.510000, 0.0)
endfunction
//TESH.scrollpos=0
//TESH.alwaysfold=0
library BzAPI
    //hardware
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    //plus
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzGetLocale takes nothing returns string
    native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
    //sync
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncPrefix takes nothing returns string
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzSyncBuffer takes string prefix, string data, integer dataLen returns nothing
    //native DzGetPushContext takes nothing returns string
    native DzSyncDataImmediately takes string prefix, string data returns nothing 
    //gui
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
    native DzFrameSetPriority takes integer frame, integer priority returns nothing
    native DzFrameSetParent takes integer frame, integer parent returns nothing
    native DzFrameGetHeight takes integer frame returns real
    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
    native DzFrameGetParent takes integer frame returns integer
    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
    native DzFrameGetName takes integer frame returns string
    native DzGetClientWidth takes nothing returns integer
    native DzGetClientHeight takes nothing returns integer
    native DzFrameIsVisible takes integer frame returns boolean
        //显示/隐藏SimpleFrame
    //native DzSimpleFrameShow takes integer frame, boolean enable returns nothing
    // 追加文字（支持TextArea）
    native DzFrameAddText takes integer frame, string text returns nothing
    // 沉默单位-禁用技能
    native DzUnitSilence takes unit whichUnit, boolean disable returns nothing
    // 禁用攻击
    native DzUnitDisableAttack takes unit whichUnit, boolean disable returns nothing
    // 禁用道具
    native DzUnitDisableInventory takes unit whichUnit, boolean disable returns nothing
    // 刷新小地图
    native DzUpdateMinimap takes nothing returns nothing
    // 修改单位alpha
    native DzUnitChangeAlpha takes unit whichUnit, integer alpha, boolean forceUpdate returns nothing
    // 设置单位是否可以选中
    native DzUnitSetCanSelect takes unit whichUnit, boolean state returns nothing
    // 修改单位是否可以被设置为目标
    native DzUnitSetTargetable takes unit whichUnit, boolean state returns nothing
    // 保存内存数据
    native DzSaveMemoryCache takes string cache returns nothing
    // 读取内存数据
    native DzGetMemoryCache takes nothing returns string
    // 设置加速倍率
    native DzSetSpeed takes real ratio returns nothing
    // 转换世界坐标为屏幕坐标-异步
    native DzConvertWorldPosition takes real x, real y, real z, code callback returns boolean
    // 转换世界坐标为屏幕坐标-获取转换后的X坐标
    native DzGetConvertWorldPositionX takes nothing returns real
    // 转换世界坐标为屏幕坐标-获取转换后的Y坐标
    native DzGetConvertWorldPositionY takes nothing returns real
    // 创建command button
    native DzCreateCommandButton takes integer parent, string icon, string name, string desc returns integer
    function DzTriggerRegisterMouseEventTrg takes trigger trg, integer status, integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg, integer status, integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction
    function DzTriggerRegisterMallItemSyncData takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZMIA", true)
    endfunction
    function DzGetTriggerMallItemPlayer takes nothing returns player
        return DzGetTriggerSyncPlayer()
    endfunction
    function DzGetTriggerMallItem takes nothing returns string
        return DzGetTriggerSyncData()
    endfunction
    
endlibrary
library DzAPI
    native DzAPI_Map_HasMallItem takes player whichPlayer, string key returns boolean
    native DzAPI_Map_GetMapLevel takes player whichPlayer returns integer
    // native DzAPI_Map_GetGuildName takes player whichPlayer returns string
    native RequestExtraIntegerData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns integer
    native RequestExtraBooleanData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns boolean
    native RequestExtraStringData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns string
    native RequestExtraRealData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns real
    
    // SaveServerValue,               //保存服务器存档
    function DzAPI_Map_SaveServerValue takes player whichPlayer, string key, string value returns boolean
        return RequestExtraBooleanData(4, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // GetServerValue,                //读取服务器存档
    function DzAPI_Map_GetServerValue takes player whichPlayer, string key returns string
        return RequestExtraStringData(5, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetGameStartTime,              //取游戏开始时间
    function DzAPI_Map_GetGameStartTime takes nothing returns integer
        return RequestExtraIntegerData(11, null, null, null, false, 0, 0, 0)
    endfunction
    // IsRPGLadder,                   //判断当前是否rpg天梯
    function DzAPI_Map_IsRPGLadder takes nothing returns boolean
        return RequestExtraBooleanData(12, null, null, null, false, 0, 0, 0)
    endfunction
    // GetMatchType,                  //获取匹配类型
    function DzAPI_Map_GetMatchType takes nothing returns integer
        return RequestExtraIntegerData(13, null, null, null, false, 0, 0, 0)
    endfunction
        // SetStat,                       //统计-提交地图数据
    function DzAPI_Map_Stat_SetStat takes player whichPlayer, string key, string value returns nothing
        call RequestExtraIntegerData(7, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // SetLadderStat,                 //天梯-统计数据
    function DzAPI_Map_Ladder_SetStat takes player whichPlayer, string key, string value returns nothing
        call RequestExtraIntegerData(8, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // SetLadderPlayerStat,           //天梯-统计数据
    function DzAPI_Map_Ladder_SetPlayerStat takes player whichPlayer, string key, string value returns nothing
        call RequestExtraIntegerData(9, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
        // GetServerValueErrorCode,       //读取加载服务器存档时的错误码
    function DzAPI_Map_GetServerValueErrorCode takes player whichPlayer returns integer
        return RequestExtraIntegerData(6, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetLadderLevel,                //提供给地图的接口，用与取天梯等级
    function DzAPI_Map_GetLadderLevel takes player whichPlayer returns integer
        return RequestExtraIntegerData(14, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // PlayerIdentityType, // 获取玩家身份类型
    function KKApiPlayerIdentityType takes player whichPlayer, integer id returns boolean
        return RequestExtraBooleanData(92, whichPlayer, null, null, false, id, 0, 0)
    endfunction
    // IsRedVIP,                      //提供给地图的接口，用与判断是否红V
    function DzAPI_Map_IsRedVIP takes player whichPlayer returns boolean
        return KKApiPlayerIdentityType(whichPlayer, 4)
    endfunction
    // IsBlueVIP,                     //提供给地图的接口，用与判断是否蓝V
    function DzAPI_Map_IsBlueVIP takes player whichPlayer returns boolean
        return KKApiPlayerIdentityType(whichPlayer, 3)
    endfunction
    // GetLadderRank,                 //提供给地图的接口，用与取天梯排名
    function DzAPI_Map_GetLadderRank takes player whichPlayer returns integer
        return RequestExtraIntegerData(17, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetMapLevelRank,               //提供给地图的接口，用与取地图等级排名
    function DzAPI_Map_GetMapLevelRank takes player whichPlayer returns integer
        return RequestExtraIntegerData(18, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetGuildRole,                  //获取公会职责 Member=10 Admin=20 Leader=30
    function DzAPI_Map_GetGuildRole takes player whichPlayer returns integer
        return RequestExtraIntegerData(20, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // IsRPGLobby,                    //检查是否大厅地图
    function DzAPI_Map_IsRPGLobby takes nothing returns boolean
        return RequestExtraBooleanData(10, null, null, null, false, 0, 0, 0)
    endfunction
    
    // MissionComplete,               //用作完成某个任务，发奖励
    function DzAPI_Map_MissionComplete takes player whichPlayer, string key, string value returns nothing
        call RequestExtraIntegerData(1, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // GetActivityData,               //提供给地图的接口，用作取服务器上的活动数据
    function DzAPI_Map_GetActivityData takes nothing returns string
        return RequestExtraStringData(2, null, null, null, false, 0, 0, 0)
    endfunction
    // GetMapConfig,                  //获取地图配置
    function DzAPI_Map_GetMapConfig takes string key returns string
        return RequestExtraStringData(21, null, key, null, false, 0, 0, 0)
    endfunction
    // SavePublicArchive,             //保存服务器存档组
    function DzAPI_Map_SavePublicArchive takes player whichPlayer, string key, string value returns boolean
        return RequestExtraBooleanData(31, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // GetPublicArchive,              //读取服务器存档组
    function DzAPI_Map_GetPublicArchive takes player whichPlayer, string key returns string
        return RequestExtraStringData(32, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_UseConsumablesItem takes player whichPlayer, string key returns nothing
        call RequestExtraIntegerData(33, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // OrpgTrigger,                   //触发boss击杀
    function DzAPI_Map_OrpgTrigger takes player whichPlayer, string key returns nothing
        call RequestExtraIntegerData(28, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetServerArchiveDrop,          //读取服务器掉落数据
    function DzAPI_Map_GetServerArchiveDrop takes player whichPlayer, string key returns string
        return RequestExtraStringData(27, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetServerArchiveEquip,         //读取服务器装备数据
    function DzAPI_Map_GetServerArchiveEquip takes player whichPlayer, string key returns integer
        return RequestExtraIntegerData(26, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GetPlatformVIP takes player whichPlayer returns integer
        return RequestExtraIntegerData(30, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsPlatformVIP takes player whichPlayer returns boolean
        return DzAPI_Map_GetPlatformVIP(whichPlayer) > 0
    endfunction
    function DzAPI_Map_Global_GetStoreString takes string key returns string
        return RequestExtraStringData(36, GetLocalPlayer(), key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_Global_StoreString takes string key, string value returns nothing
        call RequestExtraBooleanData(37, GetLocalPlayer(), key, value, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_Global_ChangeMsg takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZGAU", true)
    endfunction
    function DzAPI_Map_ServerArchive takes player whichPlayer, string key returns string
        return RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_SaveServerArchive takes player whichPlayer, string key, string value returns nothing
        call RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsRPGQuickMatch takes nothing returns boolean
        return RequestExtraBooleanData(40, null, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GetMallItemCount takes player whichPlayer, string key returns integer
        return RequestExtraIntegerData(41, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_ConsumeMallItem takes player whichPlayer, string key, integer count returns boolean
        return RequestExtraBooleanData(42, whichPlayer, key, null, false, count, 0, 0)
    endfunction
    function DzAPI_Map_EnablePlatformSettings takes player whichPlayer, integer option, boolean enable returns boolean
        return RequestExtraBooleanData(43, whichPlayer, null, null, enable, option, 0, 0)
    endfunction
    function GetPlayerServerValueSuccess takes player whichPlayer returns boolean
        if(DzAPI_Map_GetServerValueErrorCode(whichPlayer)==0)then
            return true
        else
            return false
        endif
    endfunction
    function DzAPI_Map_StoreIntegerEX takes player whichPlayer, string key, integer value returns nothing
        set key="I"+key
        call RequestExtraBooleanData(39, whichPlayer, key, I2S(value), false, 0, 0, 0)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredIntegerEX takes player whichPlayer, string key returns integer
        local integer value
        set key="I"+key
        set value=S2I(RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreInteger takes player whichPlayer, string key, integer value returns nothing
        set key="I"+key
        call DzAPI_Map_SaveServerValue(whichPlayer,key,I2S(value))
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredInteger takes player whichPlayer, string key returns integer
        local integer value
        set key="I"+key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer,key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
        function DzAPI_Map_CommentTotalCount1 takes player whichPlayer, integer id returns integer
            return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0)
    endfunction
    function DzAPI_Map_StoreReal takes player whichPlayer, string key, real value returns nothing
        set key="R"+key
        call DzAPI_Map_SaveServerValue(whichPlayer,key,R2S(value))
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredReal takes player whichPlayer, string key returns real
        local real value
        set key="R"+key
        set value=S2R(DzAPI_Map_GetServerValue(whichPlayer,key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreBoolean takes player whichPlayer, string key, boolean value returns nothing
        set key="B"+key
        if(value)then
            call DzAPI_Map_SaveServerValue(whichPlayer,key,"1")
        else
            call DzAPI_Map_SaveServerValue(whichPlayer,key,"0")
        endif
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredBoolean takes player whichPlayer, string key returns boolean
        local boolean value
        set key="B"+key
        set key=DzAPI_Map_GetServerValue(whichPlayer,key)
        if(key=="1")then
            set value=true
        else
            set value=false
        endif
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreString takes player whichPlayer, string key, string value returns nothing
        set key="S"+key
        call DzAPI_Map_SaveServerValue(whichPlayer,key,value)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredString takes player whichPlayer, string key returns string
        return DzAPI_Map_GetServerValue(whichPlayer,"S"+key)
    endfunction
    function DzAPI_Map_StoreStringEX takes player whichPlayer, string key, string value returns nothing
        set key="S"+key
        call RequestExtraBooleanData(39, whichPlayer,key,value,false,0,0,0)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredStringEX takes player whichPlayer, string key returns string
        return RequestExtraStringData(38, whichPlayer,"S"+key,null,false,0,0,0)
    endfunction
    function DzAPI_Map_GetStoredUnitType takes player whichPlayer, string key returns integer
        local integer value
        set key="I"+key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer,key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_GetStoredAbilityId takes player whichPlayer, string key returns integer
        local integer value
        set key="I"+key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer,key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_FlushStoredMission takes player whichPlayer, string key returns nothing
        call DzAPI_Map_SaveServerValue(whichPlayer,key,null)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_Ladder_SubmitIntegerData takes player whichPlayer, string key, integer value returns nothing
        call DzAPI_Map_Ladder_SetStat(whichPlayer,key,I2S(value))
    endfunction
    function DzAPI_Map_Stat_SubmitUnitIdData takes player whichPlayer, string key,integer value returns nothing
        if(value==0)then
            //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            call DzAPI_Map_Ladder_SetStat(whichPlayer,key,I2S(value))
        endif
    endfunction
    function DzAPI_Map_Stat_SubmitUnitData takes player whichPlayer, string key,unit value returns nothing
        call DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer,key,GetUnitTypeId(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitAblityIdData takes player whichPlayer, string key, integer value returns nothing
        if(value==0)then
            //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            call DzAPI_Map_Ladder_SetStat(whichPlayer,key,I2S(value))
        endif
    endfunction
    function DzAPI_Map_Ladder_SubmitItemIdData takes player whichPlayer, string key, integer value returns nothing
        local string S
        if(value==0)then
            set S="0"
        else
            set S=I2S(value)
            call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
        endif
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
        set S=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_Ladder_SubmitItemData takes player whichPlayer, string key, item value returns nothing
        call DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer,key,GetItemTypeId(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitBooleanData takes player whichPlayer, string key,boolean value returns nothing
        if(value)then
            call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"1")
        else
            call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        endif
    endfunction
    function DzAPI_Map_Ladder_SubmitTitle takes player whichPlayer, string value returns nothing
        call DzAPI_Map_Ladder_SetStat(whichPlayer,value,"1")
    endfunction
    function DzAPI_Map_Ladder_SubmitPlayerRank takes player whichPlayer, integer value returns nothing
        call DzAPI_Map_Ladder_SetPlayerStat(whichPlayer,"RankIndex",I2S(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitPlayerExtraExp takes player whichPlayer, integer value returns nothing
        call DzAPI_Map_Ladder_SetStat(whichPlayer,"ExtraExp",I2S(value))
    endfunction
    function DzAPI_Map_PlayedGames takes player whichPlayer returns integer
        return RequestExtraIntegerData(45, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_CommentCount takes player whichPlayer returns integer
        return RequestExtraIntegerData(46, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_FriendCount takes player whichPlayer returns integer
        return RequestExtraIntegerData(47, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsConnoisseur takes player whichPlayer returns boolean
        return RequestExtraBooleanData(48, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsAuthor takes player whichPlayer returns boolean
        return RequestExtraBooleanData(50, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_CommentTotalCount takes nothing returns integer
        return RequestExtraIntegerData(51, null, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_Statistics takes player whichPlayer, string eventKey, string eventType, integer value returns nothing
        call RequestExtraBooleanData(34, whichPlayer, eventKey, "", false, value, 0, 0)
    endfunction
    function DzAPI_Map_Returns takes player whichPlayer, integer label returns boolean
        return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0)
    endfunction
    function DzAPI_Map_ContinuousCount takes player whichPlayer, integer id returns integer
        return RequestExtraIntegerData(54, whichPlayer, null, null, false, id, 0, 0)
    endfunction
    // IsPlayer,                      //是否为玩家
    function DzAPI_Map_IsPlayer takes player whichPlayer returns boolean
        return RequestExtraBooleanData(55, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // MapsTotalPlayed,               //所有地图的总游戏时长
    function DzAPI_Map_MapsTotalPlayed takes player whichPlayer returns integer
        return RequestExtraIntegerData(56, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // MapsLevel,                    //指定地图的地图等级
    function DzAPI_Map_MapsLevel takes player whichPlayer, integer mapId returns integer
        return RequestExtraIntegerData(57, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeGold,              //所有地图的金币消耗
    function DzAPI_Map_MapsConsumeGold takes player whichPlayer, integer mapId returns integer
        return RequestExtraIntegerData(58, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLumber,            //所有地图的木材消耗
    function DzAPI_Map_MapsConsumeLumber takes player whichPlayer, integer mapId returns integer
        return RequestExtraIntegerData(59, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv1,               //消费 1-199
    function DzAPI_Map_MapsConsumeLv1 takes player whichPlayer, integer mapId returns boolean
        return RequestExtraBooleanData(60, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv2,               //消费 200-499
    function DzAPI_Map_MapsConsumeLv2 takes player whichPlayer, integer mapId returns boolean
        return RequestExtraBooleanData(61, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv3,               //消费 500~999
    function DzAPI_Map_MapsConsumeLv3 takes player whichPlayer, integer mapId returns boolean
        return RequestExtraBooleanData(62, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv4,               //消费 1000+
    function DzAPI_Map_MapsConsumeLv4 takes player whichPlayer, integer mapId returns boolean
        return RequestExtraBooleanData(63, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // IsPlayerUsingSkin,            //检查是否装备着皮肤（skinType：头像=1、边框=2、称号=3、底纹=4）
    function DzAPI_Map_IsPlayerUsingSkin takes player whichPlayer, integer skinType, integer id returns boolean
        return RequestExtraBooleanData(64,whichPlayer, null, null, false, skinType, id, 0)
    endfunction
    //获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
    function DzAPI_Map_GetForumData takes player whichPlayer, integer whichData returns integer
        return RequestExtraIntegerData(65, whichPlayer, null, null, false, whichData, 0, 0)
    endfunction
    // PlayerFlags,                   //玩家标记 label（1=曾经是平台回流用户，2=当前是平台回流用户，4=曾经是地图回流用户，8=当前是地图回流用户，16=地图是否被玩家收藏）
    function DzAPI_Map_PlayerFlags takes player whichPlayer, integer label returns boolean
        return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0)
    endfunction
    // GetLotteryUsedCount, // 获取宝箱抽取次数
    function DzAPI_Map_GetLotteryUsedCountEx takes player whichPlayer,integer index returns integer
        return RequestExtraIntegerData(68, whichPlayer, null, null, false, index, 0, 0)
    endfunction
    function DzAPI_Map_GetLotteryUsedCount takes player whichPlayer returns integer
        return DzAPI_Map_GetLotteryUsedCountEx(whichPlayer,0)+DzAPI_Map_GetLotteryUsedCountEx(whichPlayer,1)+DzAPI_Map_GetLotteryUsedCountEx(whichPlayer,2)
    endfunction
    function DzAPI_Map_OpenMall takes player whichPlayer,string whichkey returns boolean
        return RequestExtraBooleanData(66, whichPlayer, whichkey, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GameResult_CommitData takes player whichPlayer, string key, string value returns nothing
        call RequestExtraIntegerData(69, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    //游戏结算
    function DzAPI_Map_GameResult_CommitTitle takes player whichPlayer, string value returns nothing
        call DzAPI_Map_GameResult_CommitData(whichPlayer,value,"1")
        set whichPlayer=null
        set value=null
    endfunction
    function DzAPI_Map_GameResult_CommitPlayerRank takes player whichPlayer, integer value returns nothing
        call DzAPI_Map_GameResult_CommitData(whichPlayer,"RankIndex",I2S(value))
        set whichPlayer=null
        set value=0
    endfunction
    function DzAPI_Map_GameResult_CommitGameMode takes string value returns nothing
        call DzAPI_Map_GameResult_CommitData(GetLocalPlayer(),"InnerGameMode",value)
        set value=null
    endfunction
    function DzAPI_Map_GameResult_CommitGameResult takes player whichPlayer, integer value returns nothing
        call DzAPI_Map_GameResult_CommitData(whichPlayer,"GameResult",I2S(value))
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GameResult_CommitGameResultNoEnd takes player whichPlayer, integer value returns nothing
        call DzAPI_Map_GameResult_CommitData(whichPlayer,"GameResultNoEnd",I2S(value))
        set whichPlayer=null
    endfunction
    // GetSinceLastPlayedSeconds, // 获取距最后一次游戏的秒数
    function DzAPI_Map_GetSinceLastPlayedSeconds takes player whichPlayer returns integer
        return RequestExtraIntegerData(70, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // QuickBuy, //游戏内快速购买
    function DzAPI_Map_QuickBuy takes player whichPlayer, string key, integer count, integer seconds returns boolean
        return RequestExtraBooleanData(72, whichPlayer, key, null, false, count, seconds, 0)
    endfunction
    // CancelQuickBuy, //取消快速购买
    function DzAPI_Map_CancelQuickBuy takes player whichPlayer returns boolean
        return RequestExtraBooleanData(73, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    //判断是加载成功某个玩家的道具
    function DzAPI_Map_PlayerLoadedItems takes player whichPlayer returns boolean
        return RequestExtraBooleanData(77, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_CustomRankCount takes integer id returns integer
        return RequestExtraIntegerData(78, null, null, null, false, id, 0, 0)
    endfunction
    // CustomRankPlayerName            // 获取排行榜上指定排名的用户名称
    function DzAPI_Map_CustomRankPlayerName takes integer id, integer ranking returns string
        return RequestExtraStringData(79, null, null, null, false, id, ranking, 0)
    endfunction
    // CustomRankPlayerValue           // 获取排行榜上指定排名的值
    function DzAPI_Map_CustomRankValue takes integer id, integer ranking returns integer
        return RequestExtraIntegerData(80, null, null, null, false, id, ranking, 0)
    endfunction
    //获取玩家在KK平台的完整昵称（基础昵称#编号）
    function DzAPI_Map_GetPlayerUserName takes player whichPlayer returns string 
        return RequestExtraStringData(81, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetServerValueLimitLeft,   // 获取服务器存档限制余额
    function KKApiGetServerValueLimitLeft takes player whichPlayer, string key returns integer
        return RequestExtraIntegerData(82, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // RequestBackendLogic,       //请求后端逻辑生成 
    function KKApiRequestBackendLogic takes player whichPlayer, string key, string groupkey returns boolean
        return RequestExtraBooleanData(83, whichPlayer, key, groupkey, false, 0, 0, 0)
    endfunction
    // CheckBackendLogicExists,   // 获取后端逻辑生成结果 是否存在
    function KKApiCheckBackendLogicExists takes player whichPlayer, string key returns boolean
        return RequestExtraBooleanData(84, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicIntResult,  // 获取后端逻辑生成结果 整型
    function KKApiGetBackendLogicIntResult takes player whichPlayer, string key returns integer
        return RequestExtraIntegerData(85, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicStrResult,  // 获取后端逻辑生成结果 字符串
    function KKApiGetBackendLogicStrResult takes player whichPlayer, string key returns string
        return RequestExtraStringData(86, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicUpdateTime, // 获取后端逻辑生成时间
    function KKApiGetBackendLogicUpdateTime takes player whichPlayer, string key returns integer
        return RequestExtraIntegerData(87, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicGroup,      // 获取后端逻辑生成组
    function KKApiGetBackendLogicGroup takes player whichPlayer, string key returns string
        return RequestExtraStringData(88, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // RemoveBackendLogicResult,  // 删除后端逻辑生成结果
    function KKApiRemoveBackendLogicResult takes player whichPlayer, string key returns boolean
        return RequestExtraBooleanData(89, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // 获取随机存档剩余次数
    function KKApiRandomSaveGameCount takes player whichPlayer, string groupkey returns integer
        return RequestExtraIntegerData(101, whichPlayer, groupkey, null, false, 0, 0, 0)
    endfunction
    function KKApiTriggerRegisterBackendLogicUpdata takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZBLU", true)
    endfunction
    function KKApiTriggerRegisterBackendLogicDelete takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZBLD", true)
    endfunction
    function KKApiGetSyncBackendLogic takes nothing returns string
        return DzGetTriggerSyncData()
    endfunction
    function KKApiIsGameMode takes nothing returns boolean
        return RequestExtraBooleanData(90, null, null, null, false, 0, 0, 0)
    endfunction
    function KKApiInitializeGameKey takes player whichPlayer,integer setIndex, string k,string data returns boolean
        return RequestExtraBooleanData(91, whichPlayer, "[{\"name\":\""+data+"\",\"key\":\""+k+"\"}]", null, false, setIndex, 0, 0)
    endfunction
    function KKApiPlayerGUID takes player whichPlayer returns string
        return RequestExtraStringData(93, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function KKApiIsTaskInProgress takes player whichPlayer,integer setIndex,integer taskstat returns boolean
        return RequestExtraIntegerData(94, whichPlayer, null, null, false, setIndex, 0, 0)==taskstat
    endfunction
    function KKApiQueryTaskCurrentProgress takes player whichPlayer, integer setIndex returns integer
        return RequestExtraIntegerData(95, whichPlayer, null, null, false, setIndex, 0, 0)
    endfunction
    function KKApiQueryTaskTotalProgress takes player whichPlayer, integer setIndex returns integer
        return RequestExtraIntegerData(96, whichPlayer, null, null, false, setIndex, 0, 0)
    endfunction
    // IsAchievementCompleted,  // 获取玩家成就是否完成
    function KKApiIsAchievementCompleted takes player whichPlayer, string id returns boolean
        return RequestExtraBooleanData(98, whichPlayer, id, null, false, 0, 0, 0)
    endfunction
    // AchievementPoints,  // 获取玩家地图成就点数
    function KKApiAchievementPoints takes player whichPlayer returns integer
        return RequestExtraIntegerData(99, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    
    // 判断游戏时长是否满足条件 minHours: 最小小时数，maxHours: 最大小时数，0表示不限制
    function KKApiPlayedTime takes player whichPlayer, integer minHours, integer maxHours returns boolean
        return RequestExtraBooleanData(100, whichPlayer, null, null, false, minHours, maxHours, 0)
    endfunction
    // BeginBatchSaveArchive,  // 开始批量保存存档
    function KKApiBeginBatchSaveArchive takes player whichPlayer returns boolean
        return RequestExtraBooleanData(102, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    
    // AddBatchSaveArchive,    // 添加批量保存存档条目
    function KKApiAddBatchSaveArchive takes player whichPlayer, string key, string value, boolean caseInsensitive returns boolean
        return RequestExtraBooleanData(103, whichPlayer, key, value, caseInsensitive, 0, 0, 0)
    endfunction
    
    // EndBatchSaveArchive,    // 结束批量保存存档
    function KKApiEndBatchSaveArchive takes player whichPlayer, boolean abandon returns boolean
        return RequestExtraBooleanData(104, whichPlayer, null, null, abandon, 0, 0, 0)
    endfunction
    //天梯投降
    function KKApiTriggerRegisterLadderSurrender takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZSR", true)
    endfunction
    function KKApiGetLadderSurrenderTeamId takes nothing returns integer
        return S2I(DzGetTriggerSyncData())
    endfunction
endlibrary
//将resource  跟 plugin 导入到地图中

//导入内置的jass载入脚本
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
function SetBMSales takes integer playerID returns nothing 
	call GetTriggeringTrigger()
	return 
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
function ReduceUnitAttrStr takes unit u, string attrStr returns nothing 
	call GetTriggeringTrigger() 
	return
endfunction
// 根据属性字符串添加属性
function AddUnitAttrStr takes unit u, string attrStr returns nothing 
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
endfunction/*

japi引用的常量库 由于wave宏定义 只对以下的代码有效

请将常量库里所有内容复制到  自定义脚本代码区
*/
    //魔兽版本 用GetGameVersion 来获取当前版本 来对比以下具体版本做出相应操作
    //-----------模拟聊天------------------
    
    //---------技能数据类型---------------
    
    //冷却时间
    //目标允许
    //施放时间
    //持续时间
    //持续时间
    //魔法消耗
    //施放间隔
    //影响区域
    //施法距离
    //数据A
    //数据B
    //数据C
    //数据D
    //数据E
    //数据F
    //数据G
    //数据H
    //数据I
    //单位类型
    //热键
    //关闭热键
    //学习热键
    //名字
    //图标
    //目标效果
    //施法者效果
    //目标点效果
    //区域效果
    //投射物
    //特殊效果
    //闪电效果
    //buff提示
    //buff提示
    //学习提示
    //提示
    //关闭提示
    //学习提示
    //提示
    //关闭提示
    
    //----------物品数据类型----------------------
    //物品图标
    //物品名字
    //物品扩展提示
    //物品提示
    //物品说明
    //------------单位数据类型--------------
    //攻击1 伤害骰子数量
    //攻击1 伤害骰子面数
    //攻击1 基础伤害
    //攻击1 升级奖励
    //攻击1 最小伤害
    //攻击1 最大伤害
    //攻击1 全伤害范围
    //装甲
    // attack 1 attribute adds
    //攻击1 伤害衰减参数
    //攻击1 武器声音
    //攻击1 攻击类型
    //攻击1 最大目标数
    //攻击1 攻击间隔
    //攻击1 攻击延迟/summary>
    //攻击1 弹射弧度
    //攻击1 攻击范围缓冲
    //攻击1 目标允许
    //攻击1 溅出区域
    //攻击1 溅出半径
    //攻击1 武器类型
    // attack 2 attributes (sorted in a sequencial order based on memory address)
    //攻击2 伤害骰子数量
    //攻击2 伤害骰子面数
    //攻击2 基础伤害
    //攻击2 升级奖励
    //攻击2 伤害衰减参数
    //攻击2 武器声音
    //攻击2 攻击类型
    //攻击2 最大目标数
    //攻击2 攻击间隔
    //攻击2 攻击延迟
    //攻击2 攻击范围
    //攻击2 攻击缓冲
    //攻击2 最小伤害
    //攻击2 最大伤害
    //攻击2 弹射弧度
    //攻击2 目标允许类型
    //攻击2 溅出区域
    //攻击2 溅出半径
    //攻击2 武器类型
    //装甲类型
    
    
library japi
    
    function FrameHideInterface takes nothing returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetEventDamageData takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetEventDamage takes real p1 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetUnitReal takes integer p1, integer p2, real p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function DestroyFrame takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetUnitCollisionType takes boolean p1, unit p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitReal takes integer p1, integer p2 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function VirtualMpqRegisterPath takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetModelSpeed takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXGetUnitString takes integer p1, integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetUnitString takes integer p1, integer p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetUnitInteger takes integer p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetEffectSpeed takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatReset takes effect p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlpRect takes string p1, string p2, integer p3, integer p4, integer p5, integer p6 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
	function EXSetUnitInteger takes integer p1, integer p2, integer p3 returns boolean
 	   call GetTriggeringTrigger()
  	   return false
    endfunction
    
    function EXSetEffectXY takes effect p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitArrayString takes integer p1, integer p2, integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function FrameSetModelColor takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlendButtonIcon takes string p1, string p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function FrameShowInterface takes nothing returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetItemDataString takes integer p1, integer p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetUnitArrayString takes integer p1, integer p2, integer p3, string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetEffectY takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXPauseUnit takes unit p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataString takes ability p1, integer p2, integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetUnitMoveType takes unit p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetUnitFacing takes unit p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTextColor takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXExecuteScript takes string p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXGetUnitAbility takes unit p1, integer p2 returns ability
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function EXGetUnitAbilityByIndex takes unit p1, integer p2 returns ability
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function EXGetAbilityId takes ability p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXGetAbilityState takes ability p1, integer p2 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetAbilityState takes ability p1, integer p2, real p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXEffectMatRotateX takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataReal takes ability p1, integer p2, integer p3 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function GetMouseX takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function GetFps takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetAbilityDataReal takes ability p1, integer p2, integer p3, real p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function ShowFpsText takes boolean p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataInteger takes ability p1, integer p2, integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetAbilityDataInteger takes ability p1, integer p2, integer p3, integer p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityString takes integer p1, integer p2, integer p3, string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityDataString takes ability p1, integer p2, integer p3, string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityAEmeDataA takes ability p1, integer p2 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetBuffDataString takes integer p1, integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetBuffDataString takes integer p1, integer p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetAbilityString takes integer p1, integer p2, integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function LocalPointOrder takes integer p1, real p2, real p3, integer p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetItemDataString takes integer p1, integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetEffectZ takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetEffectX takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function ExExecuteFunc takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetByte takes string p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXGetEffectZ takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetEffectSize takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXDisplayChat takes player p1, integer p2, string p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetEffectSize takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXEffectMatRotateY takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatRotateZ takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatScale takes effect p1, real p2, real p3, real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetEffectAnimation takes effect p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetEffectColor takes effect p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetChatState takes nothing returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function Hex takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXDclareButtonIcon takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlpSector takes string p1, string p2, integer p3, integer p4, integer p5, integer p6, integer p7 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXPolygon takes string p1, integer p2, integer p3, hashtable p4, integer p5, integer p6 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXClear takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function png2tga_file takes string p1 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function SaveFunc takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTexture takes integer p1, string p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMouseY takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function timer_start takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function timer_end takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function timer_destroy takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EnableWideScreen takes boolean p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetPlayerSelectedUnit takes integer p1 returns unit
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function LocalOrder takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function LocalTargetOrder takes integer p1, widget p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMapName takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetMapPath takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetWar3Path takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetGameVersion takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetPluginVersion takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function SetUnitAbilityButtonShow takes integer p1, integer p2, boolean p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetHeroLevels takes code p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function get_code_addr takes string p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function get_code_id takes string p1 returns code
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function get_code_name takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function FrameGetHeroManaBar takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function Box takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetOwner takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function get_copy_str takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetTargetObject takes nothing returns unit
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function GetRealSelectUnit takes nothing returns unit
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function FrameGetUnitMessage takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetUnitAddress takes unit p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SetUnitPosition2 takes unit p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitTexture takes unit p1, string p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitModel takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitPortrait takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitName takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetWindowHeight takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SetUnitProperName takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function DestroySimpleFrame takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitMissileModel takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTextFontSpacing takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitMissileArc takes unit p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SimpleFontStringFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SetUnitMissileSpeed takes unit p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAnimationByIndex takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitMissileHoming takes unit p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetGlueUI takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetModelScale takes integer p1, real p2, real p3, real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetGameUI takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetScale takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameEditBlackBorders takes real p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetMinimapButton takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetMinimap takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetPortrait takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetCommandBarButton takes integer p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetHeroBarButton takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetHeroHPBar takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetTooltip takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetChatMessage takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBarButton takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetTopMessage takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetButtonCooldownModel takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWindowX takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetButtonCooldownModelSize takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetMouseBorders takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBar takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWindowWidth takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBackground takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBackgroundTexture takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetSimpleConsole takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetSimpleConsole2 takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function LoadToc takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAllPoints takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetTextHeight takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function CreateFrame takes string p1, integer p2, integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function CreateSimpleFrame takes string p1, integer p2, integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function CreateFrameByTagName takes string p1, string p2, integer p3, string p4, integer p5 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetSize takes integer p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetKeyboard takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetWidth takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function RegisterMessageEvent takes trigger p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameClearAllPoints takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetHeight takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetPoint takes integer p1, integer p2, integer p3, integer p4, real p5, real p6 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAbsolutePoint takes integer p1, integer p2, real p3, real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameShow takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetEnable takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetFocus takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetModelSize takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetEditFocus takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAlpha takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetAlpha takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetWidth takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameGetHeight takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetModelRotateY takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetTextWidth takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetText takes integer p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetText takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function FrameGetTextColor takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetTextFont takes integer p1, string p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAnimate takes integer p1, integer p2, boolean p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAnimateOffset takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetModel takes integer p1, string p2, integer p3, integer p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetModelSize takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMouseVectorY takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetModelXY takes integer p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetModelX takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameGetModelY takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetModelSpeed takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetModelRotateX takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetModelRotateZ takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetWindowY takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetModelTexture takes integer p1, string p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameCageMouse takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetLevel takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetParent takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetSimpleFrameParent takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SimpleFrameFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SimpleTextureFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetMouseFocus takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetType takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function SetWar3MapMap takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetTriggerKey takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWheelDelta takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function IsWindowActive takes nothing returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function GetKeyState takes integer p1 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function RegisterFrameEvent takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMessagePlayer takes nothing returns player
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function GetTriggerMessage takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function SendCustomMessage takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SendMessage takes integer p1, integer p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMouseVectorX takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function SetMousePos takes real p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetWindowMouseX takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWindowMouseY takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function set_copy_str takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
        
    //单位添加眩晕
    function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u, true)
	endfunction
    
    //单位删除眩晕
	function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u, false)
	endfunction
    
    //判断是否是物理伤害
    function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(1)
	endfunction
    //判断是否是攻击伤害
	function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(2)
	endfunction
	
    //判断是否是范围伤害
	function YDWEIsEventRangedDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(3)
	endfunction
	
    //判断伤害类型
	function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(4))
	endfunction
    
    //判断武器类型
	function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(5))
	endfunction
	
    //判断攻击类型
	function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(6))
	endfunction
	//设置伤害
	function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
    //设置物品数据 (字符串) [JAPI]
    function YDWESetItemDataString takes integer ItemTypeId,integer Type,string Value returns nothing
        call EXSetItemDataString(ItemTypeId, Type, Value)
    endfunction
    //获取物品数据 (字符串) [JAPI]
    function YDWEGetItemDataString takes integer ItemTypeId,integer Type returns string
        return EXGetItemDataString(ItemTypeId, Type)
    endfunction
    function YDWEDisplayChat takes player p, integer chat_recipient, string message returns nothing
		call EXDisplayChat(p, chat_recipient, message)
	endfunction
     //技能属性 [JAPI]
	function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer data_type returns real
		return EXGetAbilityState(EXGetUnitAbility(u, abilcode), data_type)
	endfunction
	//技能数据 (整数) [JAPI]
	function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
		return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
	//技能数据 (实数) [JAPI]
	function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
		return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
	//技能数据 (字符串) [JAPI]
	function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
		return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
	//设置技能属性 [JAPI]
	function YDWESetUnitAbilityState takes unit u, integer abilcode, integer data_type, real value returns nothing
        call EXSetAbilityState(EXGetUnitAbility(u, abilcode), data_type, value)
    endfunction
	//设置技能数据 (整数) [JAPI]
	function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns nothing
        call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
	//设置技能数据 (实数) [JAPI]
	function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns nothing
        call EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
	//设置技能数据 (字符串) 
	function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns nothing
        call EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
	
 
    
    //单位变身
    function YDWEUnitTransform takes unit u, integer abilcode, integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call YDWESetUnitAbilityDataInteger(u, abilcode, 1, 117, GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction
    function initializePlugin takes nothing returns integer
        call ExecuteFunc("DoNothing")
        call StartCampaignAI( Player(PLAYER_NEUTRAL_AGGRESSIVE), "callback" )
        call ExecuteFunc("DoNothing")
        call AbilityId("exec-lua:plugin_main")
        return 0
    endfunction
endlibrary
//===========================================================================
// Trigger: 未命名触发器 001
//===========================================================================
function Trig____________________001Actions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig____________________001 takes nothing returns nothing
	set gg_trg____________________001 = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg____________________001, 1, 'Q')
	call TriggerAddAction(gg_trg____________________001, function Trig____________________001Actions)
endfunction
//===========================================================================
// Trigger: TestInit
//===========================================================================
function Trig_TestInitActions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig_TestInit takes nothing returns nothing
	set gg_trg_TestInit = CreateTrigger()
	call TriggerAddAction(gg_trg_TestInit, function Trig_TestInitActions)
endfunction
//===========================================================================
// Trigger: ToCode
//===========================================================================
function Trig_ToCodeActions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig_ToCode takes nothing returns nothing
	set gg_trg_ToCode = CreateTrigger()
	call TriggerAddAction(gg_trg_ToCode, function Trig_ToCodeActions)
endfunction
//===========================================================================
// Trigger: SetWoodMonsterValueID
//===========================================================================
function Trig_SetWoodMonsterValueIDActions takes nothing returns nothing
	if ((ModuloInteger( R2I( udg_GameTime), 60) == 0) and (udg_CurrentWoodMonsterValueID < 180)) then
		call SaveInteger(YDHT, 'h001', 0x200B34C8, udg_CurrentWoodMonsterValueID)
	else
	endif
endfunction
//===========================================================================
function InitTrig_SetWoodMonsterValueID takes nothing returns nothing
	set gg_trg_SetWoodMonsterValueID = CreateTrigger()
	call TriggerAddAction(gg_trg_SetWoodMonsterValueID, function Trig_SetWoodMonsterValueIDActions)
endfunction
//===========================================================================
// Trigger: SpawnWoodMonster
//===========================================================================
function Trig_SpawnWoodMonsterActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (GetLocationX( udg_HomeEnemyPoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) + 0.00))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (GetLocationY( udg_HomeEnemyPoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) + 0.00))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( ConvertedPlayer( (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965) + 4)), 'h001', LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382), 270.00))
	call IssuePointOrderLoc( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", udg_HomePoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SpawnWoodMonster takes nothing returns nothing
	set gg_trg_SpawnWoodMonster = CreateTrigger()
	call TriggerAddAction(gg_trg_SpawnWoodMonster, function Trig_SpawnWoodMonsterActions)
endfunction
//===========================================================================
// Trigger: SpawnLgfMonsters
//===========================================================================
function Trig_SpawnLgfMonstersActions takes nothing returns nothing
	local integer ydul_count
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x40AA7251, (( udg_LgfMaxAmount) +( udg_LgfExtraMaxAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) -( CountUnitsInGroup( udg_LgfMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]))))
	set ydul_count = 1
	loop
		exitwhen ydul_count > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x40AA7251)
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (GetLocationX( udg_HomeEnemyPoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) + (GetRandomReal( -7.50, 7.50) * 100.00)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (GetLocationY( udg_HomeEnemyPoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) + (GetRandomReal( -3.00, 3.00) * 100.00)))
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( ConvertedPlayer( (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965) + 4)), 'h00I', LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382), 270.00))
		call IssuePointOrderLoc( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", udg_HomePoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
		call GroupAddUnit( udg_LgfMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA))
		set ydul_count = ydul_count + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SpawnLgfMonsters takes nothing returns nothing
	set gg_trg_SpawnLgfMonsters = CreateTrigger()
	call TriggerAddAction(gg_trg_SpawnLgfMonsters, function Trig_SpawnLgfMonstersActions)
endfunction
//===========================================================================
// Trigger: LgfInit
//===========================================================================
function Trig_LgfInitActions takes nothing returns nothing
	set udg_LgfMaxAmount = GetIntegerFromExcel( "怪物数值", 41, "Value1")
	call SaveInteger(YDHT, 'h00I', 0x200B34C8, 41)
	call SaveInteger(YDHT, 'h001', 0x200B34C8, 151)
	set udg_LgfMonsterGroup[1] = GetGroup()
	set udg_LgfMonsterGroup[2] = GetGroup()
	set udg_LgfMonsterGroup[3] = GetGroup()
	set udg_LgfMonsterGroup[4] = GetGroup()
	set udg_LgfWoodMonsterRequiredKills = GetIntegerFromExcel( "怪物数值", 151, "Value1")
	set udg_LgfWoodMonsterRemainingKills[1] = udg_LgfWoodMonsterRequiredKills
	set udg_LgfWoodMonsterRemainingKills[2] = udg_LgfWoodMonsterRequiredKills
	set udg_LgfWoodMonsterRemainingKills[3] = udg_LgfWoodMonsterRequiredKills
	set udg_LgfWoodMonsterRemainingKills[4] = udg_LgfWoodMonsterRequiredKills
endfunction
//===========================================================================
function InitTrig_LgfInit takes nothing returns nothing
	set gg_trg_LgfInit = CreateTrigger()
	call TriggerAddAction(gg_trg_LgfInit, function Trig_LgfInitActions)
endfunction
//===========================================================================
// Trigger: F4
//===========================================================================
function Trig_F4Func003A takes nothing returns nothing
	call RemoveUnit( GetEnumUnit())
endfunction
function Trig_F4Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( DzGetTriggerKeyPlayer()))
	call ForGroupBJ( udg_QuestMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)],function Trig_F4Func003A)
	set udg_IsInQuest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = false
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_F4 takes nothing returns nothing
	set gg_trg_F4 = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_F4, 1, 115)
	call TriggerAddAction(gg_trg_F4, function Trig_F4Actions)
endfunction
//===========================================================================
// Trigger: PressKeyC
//===========================================================================
function Trig_PressKeyCActions takes nothing returns nothing
	local integer ydul_count
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6, DzGetTriggerKeyPlayer())
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6)))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	if ((udg_IsInQuest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] == false)) then
		if ((udg_CurrentQuestIndex[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] <= 40)) then
			call SaveInteger(YDHT, 'h000', 0x200B34C8, (udg_CurrentQuestIndex[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + 90))
			set ydul_count = 1
			loop
				exitwhen ydul_count > GetIntegerFromExcel( "怪物数值", (90 + udg_CurrentQuestIndex[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]), "Value1")
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (GetLocationX( udg_HomeEnemyPoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) + (GetRandomReal( -7.50, 7.50) * 100.00)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (GetLocationY( udg_HomeEnemyPoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) + (GetRandomReal( -3.00, 3.00) * 100.00)))
				call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( ConvertedPlayer( (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965) + 4)), 'h000', LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382), 270.00))
				call IssuePointOrderLoc( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", udg_HomePoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
				call GroupAddUnit( udg_QuestMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA))
				set ydul_count = ydul_count + 1
			endloop
			set udg_IsInQuest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = true
		else
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_PressKeyC takes nothing returns nothing
	set gg_trg_PressKeyC = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_PressKeyC, 1, 'C')
	call TriggerAddAction(gg_trg_PressKeyC, function Trig_PressKeyCActions)
endfunction
//===========================================================================
// Trigger: QuestInit
//===========================================================================
function Trig_QuestInitActions takes nothing returns nothing
	set udg_QuestMonsterGroup[1] = GetGroup()
	set udg_QuestMonsterGroup[2] = GetGroup()
	set udg_QuestMonsterGroup[3] = GetGroup()
	set udg_QuestMonsterGroup[4] = GetGroup()
endfunction
//===========================================================================
function InitTrig_QuestInit takes nothing returns nothing
	set gg_trg_QuestInit = CreateTrigger()
	call TriggerAddAction(gg_trg_QuestInit, function Trig_QuestInitActions)
endfunction
//===========================================================================
// Trigger: OpenArchiveChallenge
//===========================================================================
function Trig_OpenArchiveChallengeActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA4AD9, GetSpellAbilityId())
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA4AD9) == 'A022')) then
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( Player(4), 'h00M', 0.00, 1024.00, 0))
		call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", 0.00, 0.00)
	else
	endif
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA4AD9) == 'A021')) then
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( Player(4), 'h00L', 0.00, 1024.00, 0))
		call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", 0.00, 0.00)
	else
	endif
	call UnitRemoveAbility( GetTriggerUnit(), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA4AD9))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_OpenArchiveChallenge takes nothing returns nothing
	set gg_trg_OpenArchiveChallenge = CreateTrigger()
	call TriggerRegisterUnitEvent(gg_trg_OpenArchiveChallenge, gg_unit_h00K_0018, EVENT_UNIT_SPELL_EFFECT)
	call TriggerAddAction(gg_trg_OpenArchiveChallenge, function Trig_OpenArchiveChallengeActions)
endfunction
//===========================================================================
// Trigger: ArchiveChallengeInit
//===========================================================================
function Trig_ArchiveChallengeInitActions takes nothing returns nothing
	call SaveInteger(YDHT, 'h00L', 0x200B34C8, 180)
	call SaveInteger(YDHT, 'h00M', 0x200B34C8, 181)
	call ShowUnit( gg_unit_h00K_0018, false)
endfunction
//===========================================================================
function InitTrig_ArchiveChallengeInit takes nothing returns nothing
	set gg_trg_ArchiveChallengeInit = CreateTrigger()
	call TriggerAddAction(gg_trg_ArchiveChallengeInit, function Trig_ArchiveChallengeInitActions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig1_1
//===========================================================================
function Trig_BossSkillTrig1_1Func010T takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	set udg_Args_AttackType = ATTACK_TYPE_HERO
	set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
	set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
	set ydl_trigger = gg_trg_SLine_Type1
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
	call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
	call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
	call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
	call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
	call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 100.00)
	call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1500.00)
	call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
	call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\BossSkill\\1\\1\\1.mdx")
	call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 256.00)
	call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
	call SaveReal(YDLOC, ydl_triggerstep, 0xB54F5BCB, 1.50)
	call TriggerExecute(ydl_trigger)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_trigger = null
endfunction
function Trig_BossSkillTrig1_1Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_803")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\StraightLine\\1.mdx", GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)), GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))))
	call EXEffectMatScale( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 3.00, 1.00, 1.00)
	call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.50)
	call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig1_1Func010T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig1_1 takes nothing returns nothing
	set gg_trg_BossSkillTrig1_1 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig1_1, function Trig_BossSkillTrig1_1Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig2_1
//===========================================================================
function Trig_BossSkillTrig2_1Func010T takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x94B57B64, AddSpecialEffect( "Survival\\BossSkill\\2\\1\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70)))
	call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x94B57B64), 1.50)
	call YDWETimerDestroyEffect( 2.00, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x94B57B64))
	set ydl_group = CreateGroup()
	call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70), 384.00, null)
	loop
		set ydl_unit = FirstOfGroup(ydl_group)
		exitwhen ydl_unit == null
		call GroupRemoveUnit(ydl_group, ydl_unit)
		if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))))) == true)) then
			call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
		else
		endif
	endloop
	call DestroyGroup(ydl_group)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_group = null
	set ydl_unit = null
endfunction
function Trig_BossSkillTrig2_1Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_804")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\Circle\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.80)
	call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	set ydl_timer = CreateTimer()
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0x94B57B64, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x94B57B64))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig2_1Func010T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig2_1 takes nothing returns nothing
	set gg_trg_BossSkillTrig2_1 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig2_1, function Trig_BossSkillTrig2_1Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig3_1
//===========================================================================
function Trig_BossSkillTrig3_1Func010T takes nothing returns nothing
	local integer ydul_index
	local integer ydl_triggerstep
	local trigger ydl_trigger
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	if ((GetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), UNIT_STATE_LIFE) > 0.00)) then
		set ydul_index = 1
		loop
			exitwhen ydul_index > 3
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24)) +( 30.00) +( 0.00)))
			set udg_Args_AttackType = ATTACK_TYPE_HERO
			set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
			set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
			set ydl_trigger = gg_trg_SLine_Type1
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
			call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
			call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
			call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
			call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 100.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1500.00)
			call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
			call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\BossSkill\\3\\1\\1.mdx")
			call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 256.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
			call TriggerExecute(ydl_trigger)
			set ydul_index = ydul_index + 1
		endloop
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_trigger = null
endfunction
function Trig_BossSkillTrig3_1Actions takes nothing returns nothing
	local integer ydul_index
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_805")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	set ydul_index = 1
	loop
		exitwhen ydul_index > 3
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\StraightLine\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0)))
		call EXEffectMatScale( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 3.00, 1.00, 1.00)
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), ( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)) +( (I2R( ydul_index) - 2.00)) *( 30.00))))
		call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.50)
		call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		set ydul_index = ydul_index + 1
	endloop
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24) - 60.00))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig3_1Func010T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig3_1 takes nothing returns nothing
	set gg_trg_BossSkillTrig3_1 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig3_1, function Trig_BossSkillTrig3_1Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig3_2
//===========================================================================
function Trig_BossSkillTrig3_2Func012T takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\BossSkill\\3\\2\\2.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0)))
	call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 1.20)
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 0.80)
	call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\BossSkill\\3\\2\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 1.40)
	call YDWETimerDestroyEffect( 2.00, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	set ydl_group = CreateGroup()
	call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70), 512.00, null)
	loop
		set ydl_unit = FirstOfGroup(ydl_group)
		exitwhen ydl_unit == null
		call GroupRemoveUnit(ydl_group, ydl_unit)
		if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))))) == true)) then
			call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
		else
		endif
	endloop
	call DestroyGroup(ydl_group)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_group = null
	set ydl_unit = null
endfunction
function Trig_BossSkillTrig3_2Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_806")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\Circle\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 2.20)
	call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	set ydl_timer = CreateTimer()
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x4A8A0BFD, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xD33436B0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig3_2Func012T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig3_2 takes nothing returns nothing
	set gg_trg_BossSkillTrig3_2 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig3_2, function Trig_BossSkillTrig3_2Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig4_1
//===========================================================================
function Trig_BossSkillTrig4_1Func009Func009T takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\BossSkill\\4\\1\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 1.20)
	call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 2.00)
	call YDWETimerDestroyEffect( 1.00, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	set ydl_group = CreateGroup()
	call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382), 256.00, null)
	loop
		set ydl_unit = FirstOfGroup(ydl_group)
		exitwhen ydl_unit == null
		call GroupRemoveUnit(ydl_group, ydl_unit)
		if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))))) == true)) then
			call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
		else
		endif
	endloop
	call DestroyGroup(ydl_group)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_group = null
	set ydl_unit = null
endfunction
function Trig_BossSkillTrig4_1Func009T takes nothing returns nothing
	local timer ydl_timer
	call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243, (LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243) + 1))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xBFFBB2C5, GetRandomDirectionDeg())
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x5FCC4134, GetRandomReal( 0, 1024.00))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD)) +( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x5FCC4134)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xBFFBB2C5)))))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0)) +( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x5FCC4134)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xBFFBB2C5)))))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\Circle\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 0.80)
	call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xA99320FA, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xFDF65382, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig4_1Func009Func009T)
	if ((LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243) >= 10)) then
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
	else
	endif
	set ydl_timer = null
endfunction
function Trig_BossSkillTrig4_1Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_807")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	set ydl_timer = CreateTimer()
	call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0xB7279243, 0)
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x4A8A0BFD, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xD33436B0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x5FCC4134, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xBFFBB2C5, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBFFBB2C5))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xA99320FA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xFDF65382, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
	call TimerStart(ydl_timer, 0.15, true, function Trig_BossSkillTrig4_1Func009T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig4_1 takes nothing returns nothing
	set gg_trg_BossSkillTrig4_1 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig4_1, function Trig_BossSkillTrig4_1Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig4_2
//===========================================================================
function Trig_BossSkillTrig4_2Func014Func009T takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC, (LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC) + 0.02))
	call SetUnitPosition( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), EXGetEffectX( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA)), EXGetEffectY( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA)))
	if ((LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC) >= 1.00)) then
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
	else
	endif
endfunction
function Trig_BossSkillTrig4_2Func014T takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local timer ydl_timer
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	set udg_Args_AttackType = ATTACK_TYPE_HERO
	set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
	set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\BossSkill\\4\\2\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0)))
	call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
	set ydl_trigger = gg_trg_SLine_Type1
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
	call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
	call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD))
	call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0))
	call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
	call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 100.00)
	call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1500.00)
	call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
	call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\BossSkill\\4\\2\\1.mdx")
	call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 256.00)
	call SaveBoolean(YDLOC, ydl_triggerstep, 0xD7F63C43, true)
	call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	call SaveTriggerHandle(YDLOC, ydl_triggerstep, 0x4F719503, gg_trg_BossSkillTrig4_2_DamageAction)
	call SaveGroupHandle(YDLOC, ydl_triggerstep, 0x9E80183F, ( GetGroup()))
	call TriggerExecute(ydl_trigger)
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x1CA61CEC, 0.00)
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	call TimerStart(ydl_timer, 0.02, true, function Trig_BossSkillTrig4_2Func014Func009T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_trigger = null
	set ydl_timer = null
endfunction
function Trig_BossSkillTrig4_2Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_808")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\StraightLine\\1.mdx", GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)), GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))))
	call EXEffectMatScale( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 3.00, 1.00, 1.00)
	call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.50)
	call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x4A8A0BFD, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xD33436B0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig4_2Func014T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig4_2 takes nothing returns nothing
	set gg_trg_BossSkillTrig4_2 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig4_2, function Trig_BossSkillTrig4_2Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig4_2_DamageAction
//===========================================================================
function Trig_BossSkillTrig4_2_DamageActionActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	if ((GetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276), UNIT_STATE_LIFE) > 0.00)) then
		call SetUnitOwner( udg_DebuffVest[3], Player(4), false)
		call IssueTargetOrder( udg_DebuffVest[3], "thunderbolt", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
		call SetUnitOwner( udg_DebuffVest[3], Player(0), false)
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_BossSkillTrig4_2_DamageAction takes nothing returns nothing
	set gg_trg_BossSkillTrig4_2_DamageAction = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig4_2_DamageAction, function Trig_BossSkillTrig4_2_DamageActionActions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig5_1
//===========================================================================
function Trig_BossSkillTrig5_1Func010T takes nothing returns nothing
	local integer ydul_index
	local integer ydl_triggerstep
	local trigger ydl_trigger
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	if ((GetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), UNIT_STATE_LIFE) > 0.00)) then
		set ydul_index = 1
		loop
			exitwhen ydul_index > 6
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24)) +( 60.00) +( 0.00)))
			set udg_Args_AttackType = ATTACK_TYPE_HERO
			set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
			set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
			set ydl_trigger = gg_trg_SLine_Type1
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
			call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
			call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
			call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
			call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 100.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1500.00)
			call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
			call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\BossSkill\\5\\1\\1.mdx")
			call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 256.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
			call TriggerExecute(ydl_trigger)
			set ydul_index = ydul_index + 1
		endloop
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_trigger = null
endfunction
function Trig_BossSkillTrig5_1Actions takes nothing returns nothing
	local integer ydul_index
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_809")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	set ydul_index = 1
	loop
		exitwhen ydul_index > 6
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\StraightLine\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0)))
		call EXEffectMatScale( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 3.00, 1.00, 1.00)
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), ( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)) +( I2R( ydul_index)) *( 60.00))))
		call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.50)
		call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		set ydul_index = ydul_index + 1
	endloop
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig5_1Func010T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig5_1 takes nothing returns nothing
	set gg_trg_BossSkillTrig5_1 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig5_1, function Trig_BossSkillTrig5_1Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig5_2
//===========================================================================
function Trig_BossSkillTrig5_2Func009Func002Func001Func007T takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\BossSkill\\5\\2\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70)))
	call YDWETimerDestroyEffect( 2.00, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	set ydl_group = CreateGroup()
	call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70), 256.00, null)
	loop
		set ydl_unit = FirstOfGroup(ydl_group)
		exitwhen ydl_unit == null
		call GroupRemoveUnit(ydl_group, ydl_unit)
		if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))))) == true)) then
			call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
		else
		endif
	endloop
	call DestroyGroup(ydl_group)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_group = null
	set ydl_unit = null
endfunction
function Trig_BossSkillTrig5_2Func009T takes nothing returns nothing
	local integer ydul_playerID
	local timer ydl_timer
	call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243, (LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243) + 1))
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((udg_Hero[ydul_playerID] != null) and (GetUnitState( udg_Hero[ydul_playerID], UNIT_STATE_LIFE) > 0.00)) then
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B, GetUnitX( udg_Hero[ydul_playerID]))
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70, GetUnitY( udg_Hero[ydul_playerID]))
			call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\Circle\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70)))
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 0.80)
			call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
			call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6462B729, (LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6462B729) + 1))
			set ydl_timer = CreateTimer()
			call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
			call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
			call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
			call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xECF5506B))
			call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x024FDF70))
			call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig5_2Func009Func002Func001Func007T)
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	if (((LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243) >= 5) or (LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6462B729) >= 5))) then
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
	else
	endif
	set ydl_timer = null
endfunction
function Trig_BossSkillTrig5_2Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_810")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	set ydl_timer = CreateTimer()
	call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0xB7279243, 0)
	call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0x6462B729, 0)
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call TimerStart(ydl_timer, 0.30, true, function Trig_BossSkillTrig5_2Func009T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig5_2 takes nothing returns nothing
	set gg_trg_BossSkillTrig5_2 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig5_2, function Trig_BossSkillTrig5_2Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig6_1
//===========================================================================
function Trig_BossSkillTrig6_1Func010T takes nothing returns nothing
	local integer ydul_index
	local integer ydl_triggerstep
	local trigger ydl_trigger
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	set ydul_index = 1
	loop
		exitwhen ydul_index > 12
		call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24)) +( 30.00) +( 0.00)))
		set udg_Args_AttackType = ATTACK_TYPE_HERO
		set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
		set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
		set ydl_trigger = gg_trg_SLine_Type1
		set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
		call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
		call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
		call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
		call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)))
		call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
		call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 100.00)
		call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1500.00)
		call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
		call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\BossSkill\\6\\1\\1.mdx")
		call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 256.00)
		call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
		call TriggerExecute(ydl_trigger)
		set ydul_index = ydul_index + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_trigger = null
endfunction
function Trig_BossSkillTrig6_1Actions takes nothing returns nothing
	local integer ydul_index
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_811")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	set ydul_index = 1
	loop
		exitwhen ydul_index > 12
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\StraightLine\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0)))
		call EXEffectMatScale( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 3.00, 1.00, 1.00)
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), ( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)) +( I2R( ydul_index)) *( 30.00))))
		call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.50)
		call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		set ydul_index = ydul_index + 1
	endloop
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig6_1Func010T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig6_1 takes nothing returns nothing
	set gg_trg_BossSkillTrig6_1 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig6_1, function Trig_BossSkillTrig6_1Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig6_2
//===========================================================================
function Trig_BossSkillTrig6_2Func010T takes nothing returns nothing
	local integer ydul_index
	local integer ydl_triggerstep
	local trigger ydl_trigger
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	if ((GetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), UNIT_STATE_LIFE) > 0.00)) then
		set ydul_index = 1
		loop
			exitwhen ydul_index > 5
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD)) +( I2R( ((ydul_index - 3) * 512))) *( CosBJ( (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))+( 90.00))))))
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0)) +( I2R( ((ydul_index - 3) * 512))) *( SinBJ( (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))+( 90.00))))))
			set udg_Args_AttackType = ATTACK_TYPE_HERO
			set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
			set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
			set ydl_trigger = gg_trg_SLine_Type1
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
			call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
			call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA))
			call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382))
			call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 100.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1500.00)
			call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
			call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\BossSkill\\6\\2\\1.mdx")
			call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 256.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xB54F5BCB, 2.00)
			call TriggerExecute(ydl_trigger)
			set ydul_index = ydul_index + 1
		endloop
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_trigger = null
endfunction
function Trig_BossSkillTrig6_2Actions takes nothing returns nothing
	local integer ydul_index
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_812")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	set ydul_index = 1
	loop
		exitwhen ydul_index > 5
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD)) +( I2R( ((ydul_index - 3) * 512))) *( CosBJ( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))+( 90.00))))))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0)) +( I2R( ((ydul_index - 3) * 512))) *( SinBJ( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))+( 90.00))))))
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\StraightLine\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382)))
		call EXEffectMatScale( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 3.00, 1.50, 1.00)
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.50)
		call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		set ydul_index = ydul_index + 1
	endloop
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x4A8A0BFD, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xD33436B0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xA99320FA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xFDF65382, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig6_2Func010T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig6_2 takes nothing returns nothing
	set gg_trg_BossSkillTrig6_2 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig6_2, function Trig_BossSkillTrig6_2Actions)
endfunction
//===========================================================================
// Trigger: BossSkillTrig6_3
//===========================================================================
function Trig_BossSkillTrig6_3Func009Func009T takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A, (5.00 * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), 1)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\BossSkill\\6\\3\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 2.00)
	call EXSetEffectSpeed( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 1.50)
	call YDWETimerDestroyEffect( 1.00, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	set ydl_group = CreateGroup()
	call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382), 256.00, null)
	loop
		set ydl_unit = FirstOfGroup(ydl_group)
		exitwhen ydl_unit == null
		call GroupRemoveUnit(ydl_group, ydl_unit)
		if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))))) == true)) then
			call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
		else
		endif
	endloop
	call DestroyGroup(ydl_group)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set ydl_group = null
	set ydl_unit = null
endfunction
function Trig_BossSkillTrig6_3Func009T takes nothing returns nothing
	local timer ydl_timer
	call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243, (LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243) + 1))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xBFFBB2C5, GetRandomDirectionDeg())
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x5FCC4134, GetRandomReal( 0, 1024.00))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4A8A0BFD)) +( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x5FCC4134)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xBFFBB2C5)))))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xD33436B0)) +( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x5FCC4134)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xBFFBB2C5)))))
	call SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\Circle\\1.mdx", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382)))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA), 0.80)
	call YDWETimerDestroyEffect( 1.50, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	set ydl_timer = CreateTimer()
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xA99320FA, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA99320FA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xFDF65382, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFDF65382))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xC0ABED4A))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF8F856EA))
	call TimerStart(ydl_timer, 1.50, false, function Trig_BossSkillTrig6_3Func009Func009T)
	if ((LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xB7279243) >= 10)) then
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
	else
	endif
	set ydl_timer = null
endfunction
function Trig_BossSkillTrig6_3Actions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_813")
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
	set ydl_timer = CreateTimer()
	call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0xB7279243, 0)
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x4A8A0BFD, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4A8A0BFD))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xD33436B0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD33436B0))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x5FCC4134, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134))
	call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xBFFBB2C5, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBFFBB2C5))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xA99320FA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA))
	call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xFDF65382, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
	call TimerStart(ydl_timer, 0.15, true, function Trig_BossSkillTrig6_3Func009T)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_BossSkillTrig6_3 takes nothing returns nothing
	set gg_trg_BossSkillTrig6_3 = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillTrig6_3, function Trig_BossSkillTrig6_3Actions)
endfunction
//===========================================================================
// Trigger: BossSkillInit
//===========================================================================
function Trig_BossSkillInitActions takes nothing returns nothing
	set udg_BossSkillVest[1] = 'A01Q'
	set udg_BossSkillVest[6] = 'A01R'
	set udg_BossSkillVest[11] = 'A01S'
	set udg_BossSkillVest[12] = 'A01W'
	set udg_BossSkillVest[16] = 'A01T'
	set udg_BossSkillVest[17] = 'A01X'
	set udg_BossSkillVest[21] = 'A01U'
	set udg_BossSkillVest[22] = 'A01Y'
	set udg_BossSkillVest[26] = 'A01V'
	set udg_BossSkillVest[27] = 'A01Z'
	set udg_BossSkillVest[28] = 'A020'
	set udg_BossSkillTrig[1] = gg_trg_BossSkillTrig1_1
	set udg_BossSkillTrig[6] = gg_trg_BossSkillTrig2_1
	set udg_BossSkillTrig[11] = gg_trg_BossSkillTrig3_1
	set udg_BossSkillTrig[12] = gg_trg_BossSkillTrig3_2
	set udg_BossSkillTrig[16] = gg_trg_BossSkillTrig4_1
	set udg_BossSkillTrig[17] = gg_trg_BossSkillTrig4_2
	set udg_BossSkillTrig[21] = gg_trg_BossSkillTrig5_1
	set udg_BossSkillTrig[22] = gg_trg_BossSkillTrig5_2
	set udg_BossSkillTrig[26] = gg_trg_BossSkillTrig6_1
	set udg_BossSkillTrig[27] = gg_trg_BossSkillTrig6_2
	set udg_BossSkillTrig[28] = gg_trg_BossSkillTrig6_3
endfunction
//===========================================================================
function InitTrig_BossSkillInit takes nothing returns nothing
	set gg_trg_BossSkillInit = CreateTrigger()
	call TriggerAddAction(gg_trg_BossSkillInit, function Trig_BossSkillInitActions)
endfunction
//===========================================================================
// Trigger: SeizeBody_15
//===========================================================================
function Trig_SeizeBody_15Actions takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, 15)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x292EBC6E) <= 0)) then
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x292EBC6E, GetIntegerFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value1"))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\HeroSkill\\15\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
		call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 144)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 122)) *( GetRealFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value2"))))
		//判断是否暴击
		if ((GetRandomInt( 1, 100) <= R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 88)))) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 125)) +( 0.00)))
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B), 300.00, null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_METAL_LIGHT_CHOP)
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		else
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B), 300.00, null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
endfunction
//===========================================================================
function InitTrig_SeizeBody_15 takes nothing returns nothing
	set gg_trg_SeizeBody_15 = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBody_15, function Trig_SeizeBody_15Actions)
endfunction
//===========================================================================
// Trigger: SeizeBody_14
//===========================================================================
function Trig_SeizeBody_14Actions takes nothing returns nothing
	local integer ydul_count
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, 14)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xBD8ABB01) <= 0)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 143)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 121)) *( GetRealFromExcel( "夺舍", 14, "Value2"))))
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xBD8ABB01, GetIntegerFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value1"))
		//判断是否暴击
		if ((GetRandomInt( 1, 100) <= R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 87)))) then
			set udg_Args_WeaponType = WEAPON_TYPE_METAL_LIGHT_CHOP
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124)) +( 0.00)))
		else
			set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
		endif
		set udg_Args_AttackType = ATTACK_TYPE_HERO
		set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))-( 60.00)))
		set ydul_count = 1
		loop
			exitwhen ydul_count > 3
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))+( 30.00)))
			set ydl_trigger = gg_trg_SLine_Type1
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
			call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 250.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xB54F5BCB, 1.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F))
			call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2))
			call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 250.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1000.00)
			call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
			call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\HeroSkill\\14\\1.mdx")
			call TriggerExecute(ydl_trigger)
			set ydul_count = ydul_count + 1
		endloop
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_SeizeBody_14 takes nothing returns nothing
	set gg_trg_SeizeBody_14 = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBody_14, function Trig_SeizeBody_14Actions)
endfunction
//===========================================================================
// Trigger: SeizeBody_13
//===========================================================================
function Trig_SeizeBody_13Actions takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, 13)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xDE3EFEB8) <= 0)) then
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xDE3EFEB8, GetIntegerFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value1"))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\HeroSkill\\13\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 2.00)
		call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 142)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 121)) *( GetRealFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value2"))))
		//判断是否暴击
		if ((GetRandomInt( 1, 100) <= R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 87)))) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124)) +( 0.00)))
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B), 250.00, null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_METAL_LIGHT_CHOP)
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		else
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B), 250.00, null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
endfunction
//===========================================================================
function InitTrig_SeizeBody_13 takes nothing returns nothing
	set gg_trg_SeizeBody_13 = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBody_13, function Trig_SeizeBody_13Actions)
endfunction
//===========================================================================
// Trigger: SeizeBody_8
//===========================================================================
function Trig_SeizeBody_8Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, 8)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xE251D8F2) <= 0)) then
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\HeroSkill\\8\\1.mdx", 0.00, 0.00))
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 1.50)
		//加入堆栈
		call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x492546AF, GetRealFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value3"))
		call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
		set udg_Follow_Stack_Top = (udg_Follow_Stack_Top + 1)
		set udg_Follow_Stack_Effect[udg_Follow_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xD8358F0D, GetIntegerFromExcel( "夺舍", 8, "Value1"))
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xA96A6C3F, GetIntegerFromExcel( "夺舍", 8, "Value3"))
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SeizeBody_8 takes nothing returns nothing
	set gg_trg_SeizeBody_8 = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBody_8, function Trig_SeizeBody_8Actions)
endfunction
//===========================================================================
// Trigger: SeizeBody_3
//===========================================================================
function Trig_SeizeBody_3Actions takes nothing returns nothing
	local group ydl_group
	local unit ydl_unit
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, 3)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xE251D8F2) <= 0)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 144)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 122)) *( GetRealFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value2"))))
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xE251D8F2, GetIntegerFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value1"))
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\HeroSkill\\3\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 2.50)
		call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		//判断是否暴击
		if ((GetRandomInt( 1, 100) <= R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 88)))) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 125)) +( 0.00)))
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B), 400.00, null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_METAL_LIGHT_CHOP)
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		else
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B), 400.00, null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
endfunction
//===========================================================================
function InitTrig_SeizeBody_3 takes nothing returns nothing
	set gg_trg_SeizeBody_3 = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBody_3, function Trig_SeizeBody_3Actions)
endfunction
//===========================================================================
// Trigger: SeizeBody_2
//===========================================================================
function Trig_SeizeBody_2Actions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, 2)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x90F06913) <= 0)) then
		if ((GetRandomInt( 1, 100) <= GetIntegerFromExcel( "夺舍", 2, "Value2"))) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, YDWEAngleBetweenUnits( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 143)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 121)) *( GetRealFromExcel( "夺舍", 2, "Value3"))))
			call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x90F06913, GetIntegerFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Value1"))
			//判断是否暴击
			if ((GetRandomInt( 1, 100) <= R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 87)))) then
				set udg_Args_WeaponType = WEAPON_TYPE_METAL_LIGHT_CHOP
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124)) +( 0.00)))
			else
				set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
			endif
			set udg_Args_AttackType = ATTACK_TYPE_HERO
			set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
			set ydl_trigger = gg_trg_SLine_Type1
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
			call SaveReal(YDLOC, ydl_triggerstep, 0xE6BB3831, 250.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xB54F5BCB, 1.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F))
			call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2))
			call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0xC65482EE, 250.00)
			call SaveReal(YDLOC, ydl_triggerstep, 0x47527379, 1000.00)
			call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
			call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, "Survival\\HeroSkill\\2\\1.mdx")
			call TriggerExecute(ydl_trigger)
		else
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_SeizeBody_2 takes nothing returns nothing
	set gg_trg_SeizeBody_2 = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBody_2, function Trig_SeizeBody_2Actions)
endfunction
//===========================================================================
// Trigger: SeizeBodyLua
//===========================================================================
function Trig_SeizeBodyLuaActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDHT, GetHandleId( GetTriggeringTrigger()), 0xB79E5965))
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, udg_CurrentSeizeBodyID[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call AddUnitAttrStr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), GetStringFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Attr"))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D9039EC, GetStringFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Model"))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C181E3A, GetStringFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Name"))
	call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xEBD1A75F, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D9039EC))
	call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xAC6659BB, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C181E3A))
	if ((udg_CurrentHeroSkin[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] == 0)) then
		call SetUnitModel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D9039EC))
		call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x4D9039EC, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D9039EC))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, GetRealFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "ModelSize"))
		call SetUnitScale( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		call SetUnitName( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C181E3A))
	else
	endif
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB, GetStringFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Tips"))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB, (( (( "|cff00f5a4[")+( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C181E3A))+( "]|r|n")))+( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB))+( "|n|n|ca7848484每提升25级开启一次夺舍;|n每次夺舍会吞噬上次夺舍的技能")))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF4AF2106, GetStringFromExcel( "夺舍", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "Icon"))
	if ((udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] == GetLocalPlayer())) then
		call YDWESetUnitAbilityDataString( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 'A01G', 1, 218, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB))
		call YDWESetUnitAbilityDataString( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 'A01G', 1, 204, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF4AF2106))
	else
	endif
	call SelectUnitForPlayerSingle( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\SeizeBody\\1.mdx", GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 1.50)
	call YDWETimerDestroyEffect( 2, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call MoveLocation( udg_BackHomeP, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
	call PanCameraToTimedLocForPlayer( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BackHomeP, 0.00)
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2) == 1)) then
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\HeroSkill\\1\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 1.00)
		//加入堆栈
		call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x492546AF, 9999.00)
		call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
		set udg_Follow_Stack_Top = (udg_Follow_Stack_Top + 1)
		set udg_Follow_Stack_Effect[udg_Follow_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	else
	endif
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2) == 5)) then
		set udg_DrawCardCostReduce[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_DrawCardCostReduce[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + GetRealFromExcel( "夺舍", 5, "Value3"))
		set udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + I2R( GetRandomInt( GetIntegerFromExcel( "夺舍", 5, "Value1"), GetIntegerFromExcel( "夺舍", 5, "Value2"))))
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SeizeBodyLua takes nothing returns nothing
	set gg_trg_SeizeBodyLua = CreateTrigger()
	call TriggerAddAction(gg_trg_SeizeBodyLua, function Trig_SeizeBodyLuaActions)
endfunction
//===========================================================================
// Trigger: SetRefreshTip
//===========================================================================
function Trig_SetRefreshTipActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x019695F5, udg_BMCurrentCost[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB, (( "消耗：杀敌 ")+( I2S( R2I( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x019695F5))))+( "|n|n免费刷新次数：")))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB, (( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB))+( I2S( udg_BMFreeRefreshAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]))+( "")))
	if ((udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] == GetLocalPlayer())) then
		call YDWESetUnitAbilityDataString( udg_BlackMarket[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BlackMarketSkill[12], 1, 218, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB))
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SetRefreshTip takes nothing returns nothing
	set gg_trg_SetRefreshTip = CreateTrigger()
	call TriggerAddAction(gg_trg_SetRefreshTip, function Trig_SetRefreshTipActions)
endfunction
//===========================================================================
// Trigger: BuyBMSales
//===========================================================================
function Trig_BuyBMSalesConditions takes nothing returns boolean
	return ((GetTriggerUnit() == udg_BlackMarket[GetConvertedPlayerId( GetOwningPlayer( GetTriggerUnit()))]))
endfunction
function Trig_BuyBMSalesActions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA707D18B, LoadInteger(YDHT, GetSpellAbilityId(), 0xA707D18B))
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( GetTriggerUnit())))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA4AD9, GetSpellAbilityId())
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA707D18B) == 12)) then
		if ((udg_BMFreeRefreshAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] > 0)) then
			set udg_BMFreeRefreshAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_BMFreeRefreshAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] - 1)
		else
			if ((udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] >= udg_BMCurrentCost[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) then
				set udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] - udg_BMCurrentCost[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
				set udg_BMCurrentCost[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_BMRaiseCost[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + udg_BMCurrentCost[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
			else
				call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
				return
			endif
		endif
		set ydl_trigger = gg_trg_SetRefreshTip
		set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
		call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
		call TriggerExecute(ydl_trigger)
		call SetBMSales(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	else
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069, GetBMSalesID(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA707D18B)))
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x53BEBEFA, GetBMSalesBuyCount(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069)))
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x415FA677, GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Limit"))
		if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x53BEBEFA) < LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x415FA677))) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1A964D7F, GetRealFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "初始消耗"))
			if ((udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] >= LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1A964D7F))) then
				if ((GetRandomInt( 1, 100) <= udg_BMSalesFreePro[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) then
					call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F, (( "触发黑市免费购买!!!")+( "")+( "")))
					call AddMessage(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F))
				else
					set udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1A964D7F))
				endif
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x53BEBEFA, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x53BEBEFA) + 1))
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA7FB4EDA, GetStringFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Type"))
				call UnitRemoveAbility( GetTriggerUnit(), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA4AD9))
				call BuyBMSales(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069))
				if ((LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA7FB4EDA) == "随机属性")) then
					call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAAC4C797, GetStringFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value1"))
					call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A, GetRandomInt( GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2"), GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value3")))
					call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), Str_GetAttr( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAAC4C797)), 0, I2R( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A)))
					call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
					return
				else
				endif
				if ((LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA7FB4EDA) == "其它")) then
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 6)) then
						call AddUnitAttrStr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), GetStringFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value1"))
						call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A, GetRandomInt( GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2"), GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value3")))
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9DA51395, (( I2R( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A))) *( (( 1.00) +( 0.01) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 67)))) +( 0)))
						set udg_PlayerGold[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerGold[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9DA51395))
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 7)) then
						call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A, GetRandomInt( GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value1"), GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2")))
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF, (( I2R( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A))) *( (( 1.00) +( 0.01) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 69)))) +( 0)))
						set udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF))
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 15)) then
						set udg_CardRefreshAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_CardRefreshAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + 1)
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 16)) then
						call BeginSeizeBody(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 17)) then
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 18)) then
						if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389) > 0)) then
							call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389) + GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2")))
						else
							set udg_LgfExtraMaxAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_LgfExtraMaxAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value1"))
							call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389, GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2"))
						endif
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 19)) then
						if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9) > 0)) then
							call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9) + GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2")))
						else
							call AddUnitAttrStr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), GetStringFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value1"))
							call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9, GetIntegerFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Value2"))
						endif
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
					if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069) == 20)) then
						call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
						return
					else
					endif
				else
				endif
			else
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F, "杀敌不足，无法购买！！！")
				call AddMessage(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F))
			endif
		else
			call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F, "该商品已达到最大购买次数，无法购买！！！")
			call AddMessage(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F))
		endif
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_BuyBMSales takes nothing returns nothing
	set gg_trg_BuyBMSales = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_BuyBMSales, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_BuyBMSales, Condition(function Trig_BuyBMSalesConditions))
	call TriggerAddAction(gg_trg_BuyBMSales, function Trig_BuyBMSalesActions)
endfunction
//===========================================================================
// Trigger: SetBMSales
//===========================================================================
function Trig_SetBMSalesActions takes nothing returns nothing
	local integer ydul_playerID
	local integer ydul_index
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((GetPlayerSlotState( ConvertedPlayer( ydul_playerID)) == PLAYER_SLOT_STATE_PLAYING) and (GetPlayerController( ConvertedPlayer( ydul_playerID)) == MAP_CONTROL_USER)) then
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, ydul_playerID)
			set ydul_index = 1
			loop
				exitwhen ydul_index > udg_BlackMarketSalesAmount[ydul_playerID]
				call UnitAddAbility( udg_BlackMarket[ydul_playerID], udg_BlackMarketSkill[ydul_index])
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA707D18B, ydul_index)
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069, GetBMSalesID(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA707D18B)))
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C181E3A, (GetStringFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Name") + ""))
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB, ( SetBMSalesTip(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069))))
				if ((udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] == GetLocalPlayer())) then
					call YDWESetUnitAbilityDataString( udg_BlackMarket[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BlackMarketSkill[ydul_index], 1, 215, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C181E3A))
					call YDWESetUnitAbilityDataString( udg_BlackMarket[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BlackMarketSkill[ydul_index], 1, 218, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4B4BA3BB))
					call YDWESetUnitAbilityDataString( udg_BlackMarket[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BlackMarketSkill[ydul_index], 1, 204, GetStringFromExcel( "黑市", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA710A069), "Icon"))
				else
				endif
				set ydul_index = ydul_index + 1
			endloop
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SetBMSales takes nothing returns nothing
	set gg_trg_SetBMSales = CreateTrigger()
	call TriggerAddAction(gg_trg_SetBMSales, function Trig_SetBMSalesActions)
endfunction
//===========================================================================
// Trigger: BlackMarketInit
//===========================================================================
function Trig_BlackMarketInitActions takes nothing returns nothing
	local integer ydul_index
	local integer ydul_count
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set udg_BlackMarketSkill[1] = 'A00Y'
	set udg_BlackMarketSkill[2] = 'A00Z'
	set udg_BlackMarketSkill[3] = 'A010'
	set udg_BlackMarketSkill[4] = 'A011'
	set udg_BlackMarketSkill[5] = 'A012'
	set udg_BlackMarketSkill[6] = 'A013'
	set udg_BlackMarketSkill[7] = 'A014'
	set udg_BlackMarketSkill[8] = 'A015'
	set udg_BlackMarketSkill[8] = 'A015'
	set udg_BlackMarketSkill[12] = 'A019'
	set udg_BlackMarket[1] = gg_unit_h00H_0114
	set udg_BlackMarket[2] = gg_unit_h00H_0108
	set udg_BlackMarket[3] = gg_unit_h00H_0116
	set udg_BlackMarket[4] = gg_unit_h00H_0115
	set ydul_index = 1
	loop
		exitwhen ydul_index > 4
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\NpcName\\Hs.mdx", GetUnitX( udg_BlackMarket[ydul_index]), GetUnitY( udg_BlackMarket[ydul_index])))
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 80.00)
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 0.80)
		call SaveEffectHandle(YDHT, GetHandleId( udg_BlackMarket[ydul_index]), 0xF337C144, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		set udg_BMCurrentCost[ydul_index] = GetRealFromExcel( "其它", 1, "Value1")
		set udg_BMRaiseCost[ydul_index] = GetRealFromExcel( "其它", 1, "Value2")
		set ydul_index = ydul_index + 1
	endloop
	set ydul_count = 1
	loop
		exitwhen ydul_count > 8
		call SaveInteger(YDHT, udg_BlackMarketSkill[ydul_count], 0xA707D18B, ydul_count)
		set ydul_count = ydul_count + 1
	endloop
	call SaveInteger(YDHT, udg_BlackMarketSkill[12], 0xA707D18B, 12)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_BlackMarketInit takes nothing returns nothing
	set gg_trg_BlackMarketInit = CreateTrigger()
	call TriggerAddAction(gg_trg_BlackMarketInit, function Trig_BlackMarketInitActions)
endfunction
//===========================================================================
// Trigger: SpawnAttackMonsters
//===========================================================================
function Trig_SpawnAttackMonstersActions takes nothing returns nothing
	local integer ydul_index
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	if ((ModuloInteger( R2I( udg_GameTime), 120) == 0)) then
		set udg_CurrentMonsterWave = (udg_CurrentMonsterWave + 1)
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26, (( 20) +( udg_CurrentMonsterWave) +( 0)))
		call SaveInteger(YDHT, 'h00B', 0x200B34C8, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26) + 0))
		call SaveInteger(YDHT, 'h00I', 0x200B34C8, (udg_CurrentMonsterWave + 41))
		set udg_LgfMaxAmount = GetIntegerFromExcel( "怪物数值", (41 + udg_CurrentMonsterWave), "Value1")
		set udg_SpawnNormalMonstersCount = 15
		set udg_SpawnNormalMonsters = true
		if ((ModuloInteger( udg_CurrentMonsterWave, 3) == 0)) then
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB96A30C1, (( udg_CurrentMonsterWave) /( 3) +( 0)))
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26, (( 80) +( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB96A30C1)) +( 0)))
			call SaveInteger(YDHT, 'h00C', 0x200B34C8, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26) + 0))
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( Player(4), 'h00C', 0.00, 5900.00, 270.00))
			call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", 0.00, 0.00)
			call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x6F96F2D2, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26) + 0))
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6CFAA723, GetIntegerFromExcel( "怪物数值", (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26) + 0), "技能数量"))
			set ydul_index = 1
			loop
				exitwhen ydul_index > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6CFAA723)
				call UnitAddAbility( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), udg_BossSkillVest[(( (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB96A30C1) - 1)) *( 5) +( ydul_index))])
				set ydul_index = ydul_index + 1
			endloop
			call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F, "Boss来袭!!!")
			call AddMessage(0, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x486F849F))
			call BossComing(0, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x59831F26))
		else
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SpawnAttackMonsters takes nothing returns nothing
	set gg_trg_SpawnAttackMonsters = CreateTrigger()
	call TriggerAddAction(gg_trg_SpawnAttackMonsters, function Trig_SpawnAttackMonstersActions)
endfunction
//===========================================================================
// Trigger: SpawnNormalMonsters
//===========================================================================
function Trig_SpawnNormalMonstersActions takes nothing returns nothing
	local integer ydul_count
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	if ((udg_SpawnNormalMonsters == true)) then
		set ydul_count = 1
		loop
			exitwhen ydul_count > 3
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, CreateUnit( Player(4), 'h00B', (( I2R( (ydul_count - 2))) *( 300.00) +( 0)), 6150.00, 270.00))
			call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), "attack", 0.00, 0.00)
			set ydul_count = ydul_count + 1
		endloop
		set udg_SpawnNormalMonstersCount = (udg_SpawnNormalMonstersCount - 1)
		if ((udg_SpawnNormalMonstersCount <= 0)) then
			set udg_SpawnNormalMonsters = false
		else
		endif
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SpawnNormalMonsters takes nothing returns nothing
	set gg_trg_SpawnNormalMonsters = CreateTrigger()
	call TriggerAddAction(gg_trg_SpawnNormalMonsters, function Trig_SpawnNormalMonstersActions)
endfunction
//===========================================================================
// Trigger: WBInit
//===========================================================================
function Trig_WBInitActions takes nothing returns nothing
	set udg_HomeEnemyPoints[1] = Location( -5888.00, 3073.00)
	set udg_HomeEnemyPoints[2] = Location( -5888.00, -2043.00)
	set udg_HomeEnemyPoints[3] = Location( 5888.00, -2043.00)
	set udg_HomeEnemyPoints[4] = Location( 5888.00, 3073.00)
	set udg_HomePoints[1] = Location( -5888.00, 1022.00)
	set udg_HomePoints[2] = Location( -5888.00, -4092.00)
	set udg_HomePoints[3] = Location( 5888.00, -4091.00)
	set udg_HomePoints[4] = Location( 5888.00, 1022.00)
endfunction
//===========================================================================
function InitTrig_WBInit takes nothing returns nothing
	set gg_trg_WBInit = CreateTrigger()
	call TriggerAddAction(gg_trg_WBInit, function Trig_WBInitActions)
endfunction
//===========================================================================
// Trigger: UnitDead
//===========================================================================
function Trig_UnitDeadActions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydul_index
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	if ((IsUnitEnemy( GetDyingUnit(), Player(0)) == true)) then
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2E5BFC40, GetConvertedPlayerId( GetOwningPlayer( GetDyingUnit())))
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x54EB5B10, GetConvertedPlayerId( GetOwningPlayer( GetKillingUnitBJ())))
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2E5BFC40) - 4))
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E, GetKillingUnitBJ())
		if ((GetUnitTypeId( GetDyingUnit()) == 'h000')) then
			call GroupRemoveUnit( udg_QuestMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], GetDyingUnit())
			if ((CountUnitsInGroup( udg_QuestMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) == 0)) then
				set udg_IsInQuest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = false
				set udg_CurrentQuestIndex[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_CurrentQuestIndex[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + 1)
			else
			endif
		else
		endif
		if ((GetUnitTypeId( GetDyingUnit()) == 'h00I')) then
			call GroupRemoveUnit( udg_LgfMonsterGroup[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], GetDyingUnit())
			set udg_LgfWoodMonsterRemainingKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_LgfWoodMonsterRemainingKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] - 1)
			if ((udg_LgfWoodMonsterRemainingKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] <= 0)) then
				set udg_LgfWoodMonsterRemainingKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_LgfWoodMonsterRequiredKills - udg_LgfWoodMonsterReduceKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
				set ydl_trigger = gg_trg_SpawnWoodMonster
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call TriggerExecute(ydl_trigger)
			else
			endif
		else
		endif
		if ((GetUnitTypeId( GetDyingUnit()) == 'h001')) then
			if (true) then
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF, (( udg_KillWoodDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) *( (( 1.00) +( 0.01) *( Unit_GetAttr( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], 69)))) +( 0)))
				set udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, GetUnitX( GetDyingUnit()))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, GetUnitY( GetDyingUnit()))
				call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\FallDiamond\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382)))
				call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 2.00)
				call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			else
			endif
		else
		endif
		if ((LoadBoolean(YDHT, GetHandleId( GetTriggerUnit()), 0x24B6F8FF) == true)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF, (( udg_KillBossDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) *( (( 1.00) +( 0.01) *( Unit_GetAttr( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], 69)))) +( 0)))
			set udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_PlayerDiamond[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, GetUnitX( GetDyingUnit()))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, GetUnitY( GetDyingUnit()))
			call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\FallDiamond\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382)))
			call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			if ((LoadInteger(YDHT, GetHandleId( GetDyingUnit()), 0x6F96F2D2) == 85)) then
				call ShowUnit( gg_unit_h00K_0018, true)
				call GameWin()
			else
			endif
			call KillAttackBoss()
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19F17B30, LoadInteger(YDHT, GetUnitTypeId( GetDyingUnit()), 0x200B34C8))
			if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19F17B30) >= 180)) then
				call KillArchiveBoss(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19F17B30))
			else
			endif
		else
		endif
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x86E403D6, (( 1.00) *( (( 1.00) +( 0.01) *( Unit_GetAttr( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x54EB5B10)], 68)))) +( 0)))
		set udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x54EB5B10)] = (udg_PlayerKills[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x54EB5B10)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x86E403D6))
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 21) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 1, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 21))
		else
		endif
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 23) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 2, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 23))
		else
		endif
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 22) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 3, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 22))
		else
		endif
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 24) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 4, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 24))
		else
		endif
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 25) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 5, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 25))
		else
		endif
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 26) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 6, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 26))
		else
		endif
		if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 27) > 0.00)) then
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 7, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB10E728E), 27))
		else
		endif
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555, LoadReal(YDHT, GetHandleId( GetTriggerUnit()), 0x571B6555))
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555, R2I( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555)))
		set ydul_index = 1
		loop
			exitwhen ydul_index > 10
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x080306DC, GetUnitLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			if ((DzGetUnitNeededXP( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x080306DC) + 1)) < (GetHeroXP( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)) + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555)))) then
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x60CA04BC, (DzGetUnitNeededXP( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x080306DC) + 0)) - GetHeroXP( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555) - LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x60CA04BC)))
				call AddHeroXP( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x60CA04BC), true)
			else
				call AddHeroXP( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555), true)
				exitwhen true
			endif
			set ydul_index = ydul_index + 1
		endloop
		call FlushChildHashtable(YDHT, GetHandleId( GetDyingUnit()))
		call RemoveUnit( GetDyingUnit())
	else
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( GetDyingUnit())))
		if ((GetTriggerUnit() == udg_Hero[GetConvertedPlayerId( GetOwningPlayer( GetTriggerUnit()))])) then
			if ((udg_HeroImmediatelyRelive[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] > 0)) then
				set udg_HeroImmediatelyRelive[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_HeroImmediatelyRelive[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] - 1)
				call SaveReal(YDHT, GetHandleId( GetTriggerUnit()), 0x6FB310A4, 0.50)
			else
				call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDHT, GetHandleId( GetTriggerUnit()), 0x5A37D7E8))
				call Effect_Show( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), true)
				call SaveReal(YDHT, GetHandleId( GetTriggerUnit()), 0x6FB310A4, 5.00)
			endif
		else
		endif
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_UnitDead takes nothing returns nothing
	set gg_trg_UnitDead = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_UnitDead, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddAction(gg_trg_UnitDead, function Trig_UnitDeadActions)
endfunction
//===========================================================================
// Trigger: PressKeyEsc
//===========================================================================
function Trig_PressKeyEscActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6, DzGetTriggerKeyPlayer())
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6)))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x0C13397D))
	if ((LoadBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x684EA6F9) == true)) then
		call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x684EA6F9, false)
		call Effect_Show( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), false)
	else
		call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x684EA6F9, true)
		call Effect_Show( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), true)
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_PressKeyEsc takes nothing returns nothing
	set gg_trg_PressKeyEsc = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_PressKeyEsc, 1, 27)
	call TriggerAddAction(gg_trg_PressKeyEsc, function Trig_PressKeyEscActions)
endfunction
//===========================================================================
// Trigger: F3
//===========================================================================
function Trig_F3Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( DzGetTriggerKeyPlayer()))
	call SelectUnitForPlayerSingle( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call SetUnitPositionLoc( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_HomePoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	call PanCameraToTimedLocForPlayer( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_HomePoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], 0.00)
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffectLoc( "Survival\\OtherEffect\\BackHome\\1.mdx", udg_HomePoints[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]))
	call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_F3 takes nothing returns nothing
	set gg_trg_F3 = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_F3, 1, 114)
	call TriggerAddAction(gg_trg_F3, function Trig_F3Actions)
endfunction
//===========================================================================
// Trigger: F2
//===========================================================================
function Trig_F2Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( DzGetTriggerKeyPlayer()))
	call IssueNeutralImmediateOrderById( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], 852662)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_F2 takes nothing returns nothing
	set gg_trg_F2 = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_F2, 1, 113)
	call TriggerAddAction(gg_trg_F2, function Trig_F2Actions)
endfunction
//===========================================================================
// Trigger: F1
//===========================================================================
function Trig_F1Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( DzGetTriggerKeyPlayer()))
	if ((IsUnitSelected( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]) == true)) then
		call MoveLocation( udg_BackHomeP, GetUnitX( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]), GetUnitY( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)]))
		call PanCameraToTimedLocForPlayer( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BackHomeP, 0.00)
	else
		call SelectUnitForPlayerSingle( udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_F1 takes nothing returns nothing
	set gg_trg_F1 = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_F1, 1, 112)
	call TriggerAddAction(gg_trg_F1, function Trig_F1Actions)
endfunction
//===========================================================================
// Trigger: HeroLvUp
//===========================================================================
function Trig_HeroLvUpConditions takes nothing returns boolean
	return ((GetTriggerUnit() == udg_Hero[GetConvertedPlayerId( GetOwningPlayer( GetTriggerUnit()))]))
endfunction
function Trig_HeroLvUpActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( GetTriggerUnit())))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, GetTriggerUnit())
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1EB574BA, GetUnitLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
	call SetUnitLifePercentBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 100)
	call SetUnitManaPercentBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 100)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0AF12619, LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x9C8850EE))
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0AF12619, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0AF12619) + 1))
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0AF12619) == udg_SeizeBodyNeedLv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) then
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0AF12619, 0)
		//进行一次夺舍
		call BeginSeizeBody(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	else
	endif
	call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x9C8850EE, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0AF12619))
	if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xC63C4E29) < LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1EB574BA))) then
		call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xC63C4E29, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1EB574BA))
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_HeroLvUp takes nothing returns nothing
	set gg_trg_HeroLvUp = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_HeroLvUp, EVENT_PLAYER_HERO_LEVEL)
	call TriggerAddCondition(gg_trg_HeroLvUp, Condition(function Trig_HeroLvUpConditions))
	call TriggerAddAction(gg_trg_HeroLvUp, function Trig_HeroLvUpActions)
endfunction
//===========================================================================
// Trigger: RecoverHp
//===========================================================================
function Trig_RecoverHpConditions takes nothing returns boolean
	return ((GetSpellAbilityId() == 'A009'))
endfunction
function Trig_RecoverHpActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, GetSpellAbilityUnit())
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\RecoverHp\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382)))
	call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call SetUnitLifePercentBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), (GetUnitLifePercent( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)) + 40.00))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_RecoverHp takes nothing returns nothing
	set gg_trg_RecoverHp = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_RecoverHp, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_RecoverHp, Condition(function Trig_RecoverHpConditions))
	call TriggerAddAction(gg_trg_RecoverHp, function Trig_RecoverHpActions)
endfunction
//===========================================================================
// Trigger: BackHome
//===========================================================================
function Trig_BackHomeConditions takes nothing returns boolean
	return ((GetSpellAbilityId() == 'A008'))
endfunction
function Trig_BackHomeActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, GetSpellAbilityUnit())
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134, 600.00)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( CosBJ( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) +( 0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( SinBJ( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) +( 0)))
	call SetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA))
	call SetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\BackHome\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382)))
	call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call MoveLocation( udg_BackHomeP, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
	call PanCameraToTimedLocForPlayer( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BackHomeP, 0.00)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_BackHome takes nothing returns nothing
	set gg_trg_BackHome = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_BackHome, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_BackHome, Condition(function Trig_BackHomeConditions))
	call TriggerAddAction(gg_trg_BackHome, function Trig_BackHomeActions)
endfunction
//===========================================================================
// Trigger: D跳
//===========================================================================
function Trig_D___uFunc005Func018Func014A takes nothing returns nothing
	call SaveDestructableHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x25F62AE1, GetEnumDestructable())
	if ((GetDestructableTypeId( LoadDestructableHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x25F62AE1)) == 'YTfb')) then
		call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), "attack", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xF17A5750), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA9CA5988))
		call RemoveLocation( LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x556FCD24))
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
			return
	else
	endif
endfunction
function Trig_D___uFunc005Func018T takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x0E20876F, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x0E20876F)) +( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFB6E8B46)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24)))))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4FB814AA, (( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4FB814AA)) +( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFB6E8B46)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24)))))
	call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x556FCD24, Location( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4FB814AA)))
	call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x47527379, (LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x47527379) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xFB6E8B46)))
	call YDWEEnumDestructablesInCircleBJNull( 100.00, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x556FCD24),function Trig_D___uFunc005Func018Func014A)
	if ((IsTerrainPathableBJ( LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x30BEF8A1), PATHING_TYPE_WALKABILITY) == true)) then
		call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), "attack", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xF17A5750), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA9CA5988))
		call RemoveLocation( LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x556FCD24))
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
		set ydl_trigger = null
		return
	else
		call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC, (LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC) + 1.00))
		call SetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x0E20876F))
		call SetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x4FB814AA))
		if ((LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC) >= 3.00)) then
			call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC, 0.00)
			if ((LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x47527379) >= 100.00)) then
				set ydl_trigger = gg_trg_D_Func_Effect
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075))
				call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 0x2480578D))
				call SaveReal(YDLOC, ydl_triggerstep, 0x43095D9D, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x43095D9D))
				call SaveReal(YDLOC, ydl_triggerstep, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x9966AD24))
				call TriggerExecute(ydl_trigger)
			else
			endif
		else
		endif
	endif
	if ((LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x47527379) <= 100.00)) then
		call IssuePointOrder( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), "attack", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xF17A5750), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0xA9CA5988))
		call RemoveLocation( LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x556FCD24))
		call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
		set ydl_trigger = null
		return
	else
	endif
	set ydl_trigger = null
endfunction
function Trig_D___uActions takes nothing returns nothing
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6, DzGetTriggerKeyPlayer())
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA59BB4C6)))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
	if ((IsUnitSelected( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ConvertedPlayer( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))) == true) and (IssueNeutralImmediateOrderById( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 852529) == true)) then
		if (((UnitHasBuffBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 'BPSE') == true) or (UnitHasBuffBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 'Beng') == true) or (IsUnitType( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), UNIT_TYPE_DEAD) == true))) then
			call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
			return
		else
		endif
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF17A5750, DzGetMouseTerrainX())
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA5988, DzGetMouseTerrainY())
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, Atan2BJ( (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA5988) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)), (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF17A5750) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, RMinBJ( 1500.00, DistanceBetweenPoints_XY( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF17A5750), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA5988))))
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x4D9039EC))
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		call Effect_SetAnimation( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), "walk", "")
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		call Effect_SetColor( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 100, 100, 100, 255)
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x43095D9D, (S2R(EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) + "]." + "modelScale")) + 0.00))
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x43095D9D))
		call AddEffect_D(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		set ydl_timer = CreateTimer()
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x43095D9D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x43095D9D))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x1CA61CEC, 0.00)
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xF17A5750, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF17A5750))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xA9CA5988, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA9CA5988))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
		call SaveReal(YDLOC, GetHandleId(ydl_timer), 0xFB6E8B46, 45.00)
		call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x556FCD24, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x556FCD24))
		call SaveStr(YDLOC, GetHandleId(ydl_timer), 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
		call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
		call SaveDestructableHandle(YDLOC, GetHandleId(ydl_timer), 0x25F62AE1, LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x25F62AE1))
		call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x30BEF8A1, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x30BEF8A1))
		call TimerStart(ydl_timer, 0.01, true, function Trig_D___uFunc005Func018T)
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_D___u takes nothing returns nothing
	set gg_trg_D___u = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_D___u, 1, 'D')
	call TriggerAddAction(gg_trg_D___u, function Trig_D___uActions)
endfunction
//===========================================================================
// Trigger: D_Func_Effect
//===========================================================================
function Trig_D_Func_EffectActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
	call Effect_SetColor( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 100, 100, 100, 255)
	call Effect_SetAnimation( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), "walk", "")
	call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x43095D9D))
	call AddEffect_D(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_D_Func_Effect takes nothing returns nothing
	set gg_trg_D_Func_Effect = CreateTrigger()
	call TriggerAddAction(gg_trg_D_Func_Effect, function Trig_D_Func_EffectActions)
endfunction
//===========================================================================
// Trigger: ShowAttr
//===========================================================================
function Trig_ShowAttrActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( DzGetTriggerKeyPlayer()))
	call ShowAttr(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_ShowAttr takes nothing returns nothing
	set gg_trg_ShowAttr = CreateTrigger()
	call DzTriggerRegisterKeyEventTrg(gg_trg_ShowAttr, 1, 9)
	call TriggerAddAction(gg_trg_ShowAttr, function Trig_ShowAttrActions)
endfunction
//===========================================================================
// Trigger: HeroRelive
//===========================================================================
function Trig_HeroReliveActions takes nothing returns nothing
	local integer ydul_playerID
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((udg_Hero[ydul_playerID] != null)) then
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[ydul_playerID])
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6FB310A4, LoadReal(YDHT, GetHandleId( udg_Hero[ydul_playerID]), 0x6FB310A4))
			if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6FB310A4) > 0.00)) then
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6FB310A4, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6FB310A4) - 0.10))
				call SaveReal(YDHT, GetHandleId( udg_Hero[ydul_playerID]), 0x6FB310A4, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6FB310A4))
				if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6FB310A4) < 0.00)) then
					call Effect_Show( LoadEffectHandle(YDHT, GetHandleId( udg_Hero[ydul_playerID]), 0x5A37D7E8), false)
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134, 1200.00)
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( CosBJ( udg_PositionAngle[ydul_playerID])) +( 0)))
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( SinBJ( udg_PositionAngle[ydul_playerID])) +( 0)))
					call MoveLocation( udg_BackHomeP, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
					call PanCameraToTimedLocForPlayer( udg_Player[ydul_playerID], udg_BackHomeP, 0)
					call ReviveHero( udg_Hero[ydul_playerID], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382), true)
					call SelectUnitForPlayerSingle( udg_Hero[ydul_playerID], udg_Player[ydul_playerID])
				else
				endif
			else
			endif
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_HeroRelive takes nothing returns nothing
	set gg_trg_HeroRelive = CreateTrigger()
	call TriggerAddAction(gg_trg_HeroRelive, function Trig_HeroReliveActions)
endfunction
//===========================================================================
// Trigger: HeroAttrInit
//===========================================================================
function Trig_HeroAttrInitActions takes nothing returns nothing
	local integer ydul_playerID
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((GetPlayerSlotState( ConvertedPlayer( ydul_playerID)) == PLAYER_SLOT_STATE_PLAYING) and (GetPlayerController( ConvertedPlayer( ydul_playerID)) == MAP_CONTROL_USER)) then
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, ydul_playerID)
			call SetPlayerAlliance( Player(PLAYER_NEUTRAL_PASSIVE), udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], ALLIANCE_SHARED_CONTROL, true)
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134, 600.00)
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( CosBJ( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) +( 0)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( SinBJ( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) +( 0)))
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, CreateUnit( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], 'E00Y', LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382), (( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])+( 0.00))))
			set udg_Hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)
			call MoveLocation( udg_BackHomeP, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
			call PanCameraToTimedLocForPlayer( udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)], udg_BackHomeP, 0.00)
			call SelectUnitForPlayerSingle( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 2, 2, 1000.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 1, 2, 5.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 3, 2, 5.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 8, 2, 10.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 9, 2, 100.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 4, 2, 5.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 5, 2, 5.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 6, 2, 5.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 10, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 11, 2, 800.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 12, 2, 4.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 13, 2, 20.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 121, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 122, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 123, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 128, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 125, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 126, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 126, 2, 1.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 14, 2, 0.50)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 91, 2, 150.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 90, 2, 150.00)
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 89, 2, 150.00)
			call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x4D9039EC, (EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) + "]." + "file")))
			call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xEBD1A75F, (EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) + "]." + "file")))
			call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xAC6659BB, GetUnitName( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			//创建死亡特效
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134, 1200.00)
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( CosBJ( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) +( 0)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FCC4134)) *( SinBJ( udg_PositionAngle[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)])) +( 0)))
			call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( "Survival\\OtherEffect\\HeroInDead\\1.mdx", LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382)))
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), 2.50)
			call SaveEffectHandle(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x5A37D7E8, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			call Effect_Show( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), false)
			//创建攻击范围特效
			call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, "\"\"")
			if ((udg_Player[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] == GetLocalPlayer())) then
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, "Survival\\OtherEffect\\AtkRange\\1.mdx")
			else
			endif
			call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), 0.00, 0.00))
			call SaveEffectHandle(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x0C13397D, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			call Effect_Show( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), false)
			call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), -320.00)
			//加入堆栈
			call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x492546AF, 9999.00)
			call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
			set udg_Follow_Stack_Top = (udg_Follow_Stack_Top + 1)
			set udg_Follow_Stack_Effect[udg_Follow_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
			set ydl_trigger = gg_trg_SetRefreshTip
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
			call TriggerExecute(ydl_trigger)
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_HeroAttrInit takes nothing returns nothing
	set gg_trg_HeroAttrInit = CreateTrigger()
	call TriggerAddAction(gg_trg_HeroAttrInit, function Trig_HeroAttrInitActions)
endfunction
//===========================================================================
// Trigger: ChangeAttrEvent
//===========================================================================
function Trig_ChangeAttrEventFunc002Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBBE80D5D, GetUnitLifePercent( Unit_AttrEvent_GetUnit()))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD89DD821, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 2)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 63)))) +( 0)))
	call SetUnitState( Unit_AttrEvent_GetUnit(), UNIT_STATE_MAX_LIFE, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD89DD821))
	call SetUnitState( Unit_AttrEvent_GetUnit(), UNIT_STATE_LIFE, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD89DD821)) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBBE80D5D)) *( 0.01)))
endfunction
function Trig_ChangeAttrEventFunc004Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7AE5C8FB, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 3)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 62)))) +( 0)))
	call SetUnitState( Unit_AttrEvent_GetUnit(), ConvertUnitState(0x20), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7AE5C8FB))
endfunction
function Trig_ChangeAttrEventFunc006Conditions takes nothing returns nothing
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 145, 2, Unit_GetAttr( Unit_AttrEvent_GetUnit(), 101))
endfunction
function Trig_ChangeAttrEventFunc008Conditions takes nothing returns nothing
	if ((Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 12) > 10)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB921ECF7, (( (Unit_GetAttr( Unit_AttrEvent_GetUnit(), 12) - 10.00)) *( 0.05) -( 0.00)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB921ECF7)) -( LoadReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0xB921ECF7)) -( 0.00)))
		call SaveReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0xB921ECF7, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB921ECF7))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 14, 0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062))
	else
	endif
endfunction
function Trig_ChangeAttrEventFunc010Conditions takes nothing returns nothing
	if ((Unit_GetAttr( Unit_AttrEvent_GetUnit(), 7) > 0.00)) then
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 4, 0, Unit_GetAttr( Unit_AttrEvent_GetUnit(), 7))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 5, 0, Unit_GetAttr( Unit_AttrEvent_GetUnit(), 7))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 6, 0, Unit_GetAttr( Unit_AttrEvent_GetUnit(), 7))
		call Unit_SetAttr( Unit_AttrEvent_GetUnit(), 7, 0)
	else
	endif
endfunction
function Trig_ChangeAttrEventFunc012Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x08001B1F, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 4)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 64)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 142, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x08001B1F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A, (( 5.00) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x08001B1F)) +( 0.00)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x79CDFF3A, (( 0.00) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A)) -( LoadReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0x0B487F9D))))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 2, 0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x79CDFF3A))
	call SaveReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0x0B487F9D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A, (( 0.00) +( I2R( R2I( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x08001B1F))/( 10.00))))) +( 0.00)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x79CDFF3A, (( 0.00) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A)) -( LoadReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0xCB6894FD))))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 8, 0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A))
	call SaveReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0xCB6894FD, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A))
endfunction
function Trig_ChangeAttrEventFunc014Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDB00F13B, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 5)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 65)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 143, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDB00F13B))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A, (( 0.00) +( I2R( R2I( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDB00F13B))/( 10000.00))))) +( 0.00)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x79CDFF3A, (( 0.00) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A)) -( LoadReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0x38B98463))))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 9, 0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 81, 0, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A) * 0.10))
	call SaveReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0x38B98463, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A))
endfunction
function Trig_ChangeAttrEventFunc016Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x51BF50B2, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 6)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 66)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 144, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x51BF50B2))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A, (( 0.00) +( I2R( R2I( (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x51BF50B2))/( 10000.00))))) +( 0.00)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x79CDFF3A, (( 0.00) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A)) -( LoadReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0x098771B6))))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 82, 0, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A) * 0.10))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 83, 0, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A) * 0.10))
	call SaveReal(YDHT, GetHandleId( Unit_AttrEvent_GetUnit()), 0x098771B6, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1703458A))
endfunction
function Trig_ChangeAttrEventFunc018Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x84C53A3B, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 1)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 61)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 141, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x84C53A3B))
endfunction
function Trig_ChangeAttrEventFunc020Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7E574853, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 11)) +( 0.00) +( 0)))
	call SetUnitAcquireRange( Unit_AttrEvent_GetUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7E574853))
	call SetUnitState( Unit_AttrEvent_GetUnit(), ConvertUnitState(0x16), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7E574853))
endfunction
function Trig_ChangeAttrEventFunc022Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xFE8EBF61, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 10)) +( 0.00) +( 0)))
	if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xFE8EBF61) <= 0.25)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xFE8EBF61, 0.25)
	else
	endif
	call SetUnitState( Unit_AttrEvent_GetUnit(), ConvertUnitState(0x25), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xFE8EBF61))
endfunction
function Trig_ChangeAttrEventFunc024Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD3B112CF, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 9)) /( 100.00) +( 0)))
	call SetUnitState( Unit_AttrEvent_GetUnit(), ConvertUnitState(0x51), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD3B112CF))
endfunction
function Trig_ChangeAttrEventFunc026Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4F49C30C, (( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 84)))) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 85)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 121, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4F49C30C)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 82)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 122, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4F49C30C)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 83)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 123, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4F49C30C)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 81)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 128, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4F49C30C)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 92)))) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 127, 2, (( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 123)) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 14)) +( 0)))
endfunction
function Trig_ChangeAttrEventFunc028Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xAB71752E, (( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 90)))) +( 0.00) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 124, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xAB71752E)) +( 0.00) +( 0)))
endfunction
function Trig_ChangeAttrEventFunc030Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xAB71752E, (( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 91)))) +( 0.00) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 125, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xAB71752E)) +( 0.00) +( 0)))
endfunction
function Trig_ChangeAttrEventFunc032Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xAB71752E, (( (( 1.00) +( 0.01) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 89)))) +( 0.00) +( 0)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 126, 2, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xAB71752E)) +( 0.00) +( 0)))
endfunction
function Trig_ChangeAttrEventFunc034Conditions takes nothing returns nothing
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062, (( 100.00) /( (( 100.00) +( 1.00) *( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 15)))) +( 0)))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062, RMinBJ( 0.20, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062)))
	call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 129, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062))
endfunction
function Trig_ChangeAttrEventFunc036Conditions takes nothing returns nothing
	if ((Unit_GetAttr( Unit_AttrEvent_GetUnit(), 161) > 0.00)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062, (( 1.00) +( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 161)) *( 0.01)))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 4, 3, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 161, 2, 0.00)
	else
	endif
endfunction
function Trig_ChangeAttrEventFunc038Conditions takes nothing returns nothing
	if ((Unit_GetAttr( Unit_AttrEvent_GetUnit(), 162) > 0.00)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062, (( 1.00) +( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 162)) *( 0.01)))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 5, 3, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 162, 2, 0.00)
	else
	endif
endfunction
function Trig_ChangeAttrEventFunc040Conditions takes nothing returns nothing
	if ((Unit_GetAttr( Unit_AttrEvent_GetUnit(), 163) > 0.00)) then
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062, (( 1.00) +( Unit_GetAttr( Unit_AttrEvent_GetUnit(), 163)) *( 0.01)))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 6, 3, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD4E08062))
		call Unit_SetAttrBJ( Unit_AttrEvent_GetUnit(), 163, 2, 0.00)
	else
	endif
endfunction
function Trig_ChangeAttrEventActions takes nothing returns nothing
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	//生命值, 生命加成%
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD89DD821, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD89DD821))
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xBBE80D5D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBBE80D5D))
	call Unit_AttrEvent(ydl_trigger, 2)
	call Unit_AttrEvent(ydl_trigger, 63)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc002Conditions))
	//护甲, 护甲加成%
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x7AE5C8FB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7AE5C8FB))
	call Unit_AttrEvent(ydl_trigger, 3)
	call Unit_AttrEvent(ydl_trigger, 62)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc004Conditions))
	//每秒回血
	set ydl_trigger = CreateTrigger()
	call Unit_AttrEvent(ydl_trigger, 101)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc006Conditions))
	//多重数量
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD4E08062, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD4E08062))
	call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xB921ECF7, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB921ECF7))
	call Unit_AttrEvent(ydl_trigger, 12)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc008Conditions))
	//全属
	set ydl_trigger = CreateTrigger()
	call Unit_AttrEvent(ydl_trigger, 7)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc010Conditions))
	//力量, 力量加成%
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x79CDFF3A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x79CDFF3A))
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x08001B1F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x08001B1F))
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x1703458A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A))
	call Unit_AttrEvent(ydl_trigger, 4)
	call Unit_AttrEvent(ydl_trigger, 64)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc012Conditions))
	//敏捷, 敏捷加成%
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xDB00F13B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDB00F13B))
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x1703458A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A))
	call Unit_AttrEvent(ydl_trigger, 5)
	call Unit_AttrEvent(ydl_trigger, 65)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc014Conditions))
	//智力, 智力加成%
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x51BF50B2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51BF50B2))
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x1703458A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1703458A))
	call Unit_AttrEvent(ydl_trigger, 6)
	call Unit_AttrEvent(ydl_trigger, 66)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc016Conditions))
	//攻击, 攻击加成%
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x84C53A3B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x84C53A3B))
	call Unit_AttrEvent(ydl_trigger, 1)
	call Unit_AttrEvent(ydl_trigger, 61)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc018Conditions))
	//攻击距离
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x7E574853, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7E574853))
	call Unit_AttrEvent(ydl_trigger, 11)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc020Conditions))
	//攻击间隔
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xFE8EBF61, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFE8EBF61))
	call Unit_AttrEvent(ydl_trigger, 10)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc022Conditions))
	//攻击速度
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD3B112CF, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD3B112CF))
	call Unit_AttrEvent(ydl_trigger, 9)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc024Conditions))
	//物理伤害, 法术伤害,  攻击伤害, 最终伤害, 绝对伤害
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x4F49C30C, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F49C30C))
	call Unit_AttrEvent(ydl_trigger, 81)
	call Unit_AttrEvent(ydl_trigger, 82)
	call Unit_AttrEvent(ydl_trigger, 83)
	call Unit_AttrEvent(ydl_trigger, 84)
	call Unit_AttrEvent(ydl_trigger, 85)
	call Unit_AttrEvent(ydl_trigger, 14)
	call Unit_AttrEvent(ydl_trigger, 92)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc026Conditions))
	//物理暴击伤害
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xAB71752E, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB71752E))
	call Unit_AttrEvent(ydl_trigger, 90)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc028Conditions))
	//法术暴伤
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xAB71752E, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB71752E))
	call Unit_AttrEvent(ydl_trigger, 91)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc030Conditions))
	//攻击暴伤
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xAB71752E, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB71752E))
	call Unit_AttrEvent(ydl_trigger, 89)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc032Conditions))
	//技能急速
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD4E08062, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD4E08062))
	call Unit_AttrEvent(ydl_trigger, 15)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc034Conditions))
	//当前力量
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD4E08062, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD4E08062))
	call Unit_AttrEvent(ydl_trigger, 161)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc036Conditions))
	//当前敏捷
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD4E08062, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD4E08062))
	call Unit_AttrEvent(ydl_trigger, 162)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc038Conditions))
	//当前智力
	set ydl_trigger = CreateTrigger()
	call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xD4E08062, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD4E08062))
	call Unit_AttrEvent(ydl_trigger, 163)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_ChangeAttrEventFunc040Conditions))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_ChangeAttrEvent takes nothing returns nothing
	set gg_trg_ChangeAttrEvent = CreateTrigger()
	call TriggerAddAction(gg_trg_ChangeAttrEvent, function Trig_ChangeAttrEventActions)
endfunction
//===========================================================================
// Trigger: DamageSystem
//===========================================================================
function Trig_DamageSystemActions takes nothing returns nothing
	call DamageSystem()
endfunction
//===========================================================================
function InitTrig_DamageSystem takes nothing returns nothing
	set gg_trg_DamageSystem = CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_DamageSystem)
	call TriggerAddAction(gg_trg_DamageSystem, function Trig_DamageSystemActions)
endfunction
//===========================================================================
// Trigger: AttackSystem
//===========================================================================
function Trig_AttackSystemFunc001Func003Func002Func005Func003T takes nothing returns nothing
	call SaveBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x944CCEB0)), 0x4472E961, false)
	call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_AttackSystemActions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local group ydl_group
	local unit ydl_unit
	local timer ydl_timer
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	if ((IsUnitAlly( GetAttacker(), Player(0)) == true)) then
		if ((GetAttacker() == udg_Hero[GetConvertedPlayerId( GetOwningPlayer( GetAttacker()))])) then
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, GetAttacker())
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, GetAttackedUnitBJ())
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			//多重攻击
			if ((GetRandomInt( 1, 100) <= R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 13)))) then
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF476C7E8, (EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) + "]." + "Missileart")))
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, 0)
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x83BA8BAB, IMinBJ( 10, R2I( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 12))))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 141)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 127)) +( 0.00)))
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2), Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 11), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)))) == true) and (ydl_unit != LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80)) and (IsUnitAliveBJ( ydl_unit) == true)) then
						set udg_Args_AttackType = ATTACK_TYPE_PIERCE
						set udg_Args_DamageType = DAMAGE_TYPE_UNIVERSAL
						set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
						set ydl_trigger = gg_trg_SLine_Type2
						set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
						call SaveReal(YDLOC, ydl_triggerstep, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
						call SaveReal(YDLOC, ydl_triggerstep, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F))
						call SaveReal(YDLOC, ydl_triggerstep, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2))
						call SaveReal(YDLOC, ydl_triggerstep, 0xFB6E8B46, 30.00)
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xFC4D8276, ydl_unit)
						call SaveStr(YDLOC, ydl_triggerstep, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF476C7E8))
						call SaveReal(YDLOC, ydl_triggerstep, 0xBEFD8BE8, 50.00)
						call TriggerExecute(ydl_trigger)
						call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243) + 1))
						if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x83BA8BAB))) then
							exitwhen true
						else
						endif
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 2) == 1)) then
				set ydl_trigger = gg_trg_SeizeBody_2
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
				call TriggerExecute(ydl_trigger)
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 3) == 1)) then
				set ydl_trigger = gg_trg_SeizeBody_3
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
				call TriggerExecute(ydl_trigger)
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 15) == 1)) then
				set ydl_trigger = gg_trg_SeizeBody_15
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
				call TriggerExecute(ydl_trigger)
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 14) == 1)) then
				set ydl_trigger = gg_trg_SeizeBody_14
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
				call TriggerExecute(ydl_trigger)
			else
			endif
		else
		endif
		if ((LoadBoolean(YDHT, GetHandleId( GetAttackedUnitBJ()), 0x24B6F8FF) == true)) then
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0, GetAttackedUnitBJ())
			if ((LoadBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)), 0x4472E961) == true)) then
				call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
	set ydl_group = null
	set ydl_unit = null
	set ydl_timer = null
				return
			else
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19F17B30, LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)), 0x6F96F2D2))
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6CFAA723, GetIntegerFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19F17B30), "技能数量"))
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x05C061EA, GetRandomInt( 1, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6CFAA723)))
				call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB8AC0FC1, (( (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19F17B30) - 81)) *( 5) +( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x05C061EA))))
				if ((YDWEGetUnitAbilityState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), udg_BossSkillVest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB8AC0FC1)], 1) <= 0.00) and (YDWEGetUnitAbilityDataReal( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), udg_BossSkillVest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB8AC0FC1)], 1, 105) > 0.00)) then
					call YDWESetUnitAbilityState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), udg_BossSkillVest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB8AC0FC1)], 1, YDWEGetUnitAbilityDataReal( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0), udg_BossSkillVest[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB8AC0FC1)], 1, 105))
					call SaveBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0)), 0x4472E961, true)
					set ydl_timer = CreateTimer()
					call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
					call TimerStart(ydl_timer, 4.00, false, function Trig_AttackSystemFunc001Func003Func002Func005Func003T)
					set ydl_trigger = udg_BossSkillTrig[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB8AC0FC1)]
					set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
					call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x944CCEB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x944CCEB0))
					call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xFC4D8276, GetAttacker())
					call TriggerExecute(ydl_trigger)
				else
				endif
			endif
		else
		endif
	else
		if ((GetAttackedUnitBJ() == udg_Hero[GetConvertedPlayerId( GetOwningPlayer( GetAttackedUnitBJ()))])) then
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, GetAttackedUnitBJ())
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80, GetAttacker())
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 13) == 1)) then
				set ydl_trigger = gg_trg_SeizeBody_13
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
				call SaveUnitHandle(YDLOC, ydl_triggerstep, 0x8867FB80, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8867FB80))
				call TriggerExecute(ydl_trigger)
			else
			endif
		else
		endif
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
	set ydl_group = null
	set ydl_unit = null
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_AttackSystem takes nothing returns nothing
	set gg_trg_AttackSystem = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_AttackSystem, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddAction(gg_trg_AttackSystem, function Trig_AttackSystemActions)
endfunction
//===========================================================================
// Trigger: 001Timer
//===========================================================================
function Trig_001TimerActions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig_001Timer takes nothing returns nothing
	set gg_trg_001Timer = CreateTrigger()
	call TriggerAddAction(gg_trg_001Timer, function Trig_001TimerActions)
endfunction
//===========================================================================
// Trigger: 002Timer
//===========================================================================
function Trig_002TimerActions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	set ydl_trigger = gg_trg_StraightLineStack
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_BezierStack
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_CircleArcStack
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_RangeDuringDamageStack
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_SurroundsStack
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_FollowStack
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_002Timer takes nothing returns nothing
	set gg_trg_002Timer = CreateTrigger()
	call TriggerAddAction(gg_trg_002Timer, function Trig_002TimerActions)
endfunction
//===========================================================================
// Trigger: 01Timer
//===========================================================================
function Trig_01TimerActions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	//英雄复活倒计时
	set ydl_trigger = gg_trg_HeroRelive
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	//刷小怪
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_01Timer takes nothing returns nothing
	set gg_trg_01Timer = CreateTrigger()
	call TriggerAddAction(gg_trg_01Timer, function Trig_01TimerActions)
endfunction
//===========================================================================
// Trigger: 05Timer
//===========================================================================
function Trig_05TimerActions takes nothing returns nothing
	local integer ydul_playerID
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((udg_Hero[ydul_playerID] != null)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F, GetUnitX( udg_Hero[ydul_playerID]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2, GetUnitY( udg_Hero[ydul_playerID]))
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_05Timer takes nothing returns nothing
	set gg_trg_05Timer = CreateTrigger()
	call TriggerAddAction(gg_trg_05Timer, function Trig_05TimerActions)
endfunction
//===========================================================================
// Trigger: 1Timer
//===========================================================================
function Trig_1TimerActions takes nothing returns nothing
	local integer ydul_playerID
	local group ydl_group
	local unit ydl_unit
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((GetPlayerSlotState( udg_Player[ydul_playerID]) == PLAYER_SLOT_STATE_PLAYING) and (udg_Hero[ydul_playerID] != null)) then
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, udg_Hero[ydul_playerID])
			call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965, ydul_playerID)
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 1, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 41))
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 3, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 42))
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 4, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 44))
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 5, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 45))
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 6, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 46))
			call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 7, 0, Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 47))
			call SetUnitLifeBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), (GetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), UNIT_STATE_LIFE) + Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 43)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9DA51395, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 48)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 67)))) +( 0)))
			set udg_PlayerGold[ydul_playerID] = (udg_PlayerGold[ydul_playerID] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9DA51395))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x86E403D6, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 49)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 68)))) +( 0)))
			set udg_PlayerKills[ydul_playerID] = (udg_PlayerKills[ydul_playerID] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x86E403D6))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 50)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 69)))) +( 0)))
			set udg_PlayerDiamond[ydul_playerID] = (udg_PlayerDiamond[ydul_playerID] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA813C8FF))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE13ED6E1, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 101)) *( (( 1.00) +( 0.01) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 102)))) +( 0)))
			call SetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), UNIT_STATE_LIFE, (GetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), UNIT_STATE_LIFE) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE13ED6E1)))
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 1) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x4AAC5F6E, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x4AAC5F6E) + 1))
				if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x4AAC5F6E) >= GetIntegerFromExcel( "夺舍", 1, "Value1"))) then
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 142)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 121)) *( GetRealFromExcel( "夺舍", 1, "Value2"))))
					if ((GetRandomReal( 0, 100.00) < Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 87))) then
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A)) *( Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124)) +( 0)))
						set ydl_group = CreateGroup()
						call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2), 250.00, null)
						loop
							set ydl_unit = FirstOfGroup(ydl_group)
							exitwhen ydl_unit == null
							call GroupRemoveUnit(ydl_group, ydl_unit)
							if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
								call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_METAL_LIGHT_CHOP)
							else
							endif
						endloop
						call DestroyGroup(ydl_group)
					else
						set ydl_group = CreateGroup()
						call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2), 250.00, null)
						loop
							set ydl_unit = FirstOfGroup(ydl_group)
							exitwhen ydl_unit == null
							call GroupRemoveUnit(ydl_group, ydl_unit)
							if ((IsUnitEnemy( ydl_unit, Player(0)) == true)) then
								call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
							else
							endif
						endloop
						call DestroyGroup(ydl_group)
					endif
					call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xA5A9234A, 0)
				else
				endif
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 2) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x90F06913, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x90F06913) - 1))
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 3) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xE251D8F2, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xE251D8F2) - 1))
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 13) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xDE3EFEB8, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xDE3EFEB8) - 1))
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 14) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xBD8ABB01, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xBD8ABB01) - 1))
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 15) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x292EBC6E, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x292EBC6E) - 1))
			else
			endif
			if ((LoadInteger( udg_HTSeizeBodyID, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965), 8) == 1)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xD8358F0D, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xD8358F0D) - 1))
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xA96A6C3F, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xBB2EAA30) - 1))
				if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0xD8358F0D) <= 0)) then
					set ydl_trigger = gg_trg_SeizeBody_8
					set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
					call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
					call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
					call TriggerExecute(ydl_trigger)
				else
				endif
			else
			endif
			if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389) > 0)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389) - 1))
				if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8509E389) == 0)) then
					set udg_LgfExtraMaxAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] = (udg_LgfExtraMaxAmount[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965)] - GetIntegerFromExcel( "黑市", 18, "Value1"))
				else
				endif
			else
			endif
			if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9) > 0)) then
				call SaveInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9, (LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9) - 1))
				if ((LoadInteger(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)), 0x8E7FD2A9) == 0)) then
					call ReduceUnitAttrStr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), GetStringFromExcel( "黑市", 19, "Value1"))
				else
				endif
			else
			endif
			if ((udg_IsGameStart == true)) then
				//练功房刷怪
				set ydl_trigger = gg_trg_SpawnLgfMonsters
				set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
				call SaveInteger(YDLOC, ydl_triggerstep, 0xB79E5965, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB79E5965))
				call TriggerExecute(ydl_trigger)
			else
			endif
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	//刷进攻怪和boss
	if ((udg_IsGameStart == true)) then
		set ydl_trigger = gg_trg_SpawnAttackMonsters
		set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
		call TriggerExecute(ydl_trigger)
		set ydl_trigger = gg_trg_SpawnNormalMonsters
		set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
		call TriggerExecute(ydl_trigger)
		set ydl_trigger = gg_trg_SetWoodMonsterValueID
		set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
		call TriggerExecute(ydl_trigger)
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_1Timer takes nothing returns nothing
	set gg_trg_1Timer = CreateTrigger()
	call TriggerAddAction(gg_trg_1Timer, function Trig_1TimerActions)
endfunction
//===========================================================================
// Trigger: SLine_Type1
//===========================================================================
function Trig_SLine_Type1Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC65482EE, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC65482EE))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	if ((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD7F63C43) == false)) then
		//创建特效,
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		//控制特效的方向
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		else
		endif
		call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F, ( GetGroup()))
	else
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
		call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F))
	endif
	//设置特效1的值
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC65482EE, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC65482EE))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x67F82B06, 0.00)
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 1)
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x239B1D50, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x656046CB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2A54A5D1, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xDC7D926D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveGroupHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9E80183F, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F))
	call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x605B0368, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62924167, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6AA9CA2E))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x8E5658EA, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xEDE65310, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503))
	//并添加到栈中
	set udg_SLine_Stack_Top = (udg_SLine_Stack_Top + 1)
	set udg_SLine_AttackType[udg_SLine_Stack_Top] = udg_Args_AttackType
	set udg_SLine_DamageType[udg_SLine_Stack_Top] = udg_Args_DamageType
	set udg_SLine_WeaponType[udg_SLine_Stack_Top] = udg_Args_WeaponType
	set udg_SLine_Stack_Effect[udg_SLine_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SLine_Type1 takes nothing returns nothing
	set gg_trg_SLine_Type1 = CreateTrigger()
	call TriggerAddAction(gg_trg_SLine_Type1, function Trig_SLine_Type1Actions)
endfunction
//===========================================================================
// Trigger: SLine_Type2
//===========================================================================
function Trig_SLine_Type2Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	if ((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD7F63C43) == false)) then
		//创建特效,
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		//控制特效的方向
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		else
		endif
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
	else
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	endif
	//设置特效1的值
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 2)
	call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x605B0368, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x8E5658EA, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x239B1D50, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x656046CB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2A54A5D1, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xDC7D926D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	//添加到栈中
	set udg_SLine_Stack_Top = (udg_SLine_Stack_Top + 1)
	set udg_SLine_AttackType[udg_SLine_Stack_Top] = udg_Args_AttackType
	set udg_SLine_Target[udg_SLine_Stack_Top] = LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)
	set udg_SLine_DamageType[udg_SLine_Stack_Top] = udg_Args_DamageType
	set udg_SLine_WeaponType[udg_SLine_Stack_Top] = udg_Args_WeaponType
	set udg_SLine_Stack_Effect[udg_SLine_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SLine_Type2 takes nothing returns nothing
	set gg_trg_SLine_Type2 = CreateTrigger()
	call TriggerAddAction(gg_trg_SLine_Type2, function Trig_SLine_Type2Actions)
endfunction
//===========================================================================
// Trigger: SLine_Type3
//===========================================================================
function Trig_SLine_Type3Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	if ((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD7F63C43) == false)) then
		//创建特效,
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		//控制特效的方向
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		else
		endif
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
	else
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	endif
	//设置特效1的值
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 3)
	call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x605B0368, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x8E5658EA, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x239B1D50, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x656046CB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2A54A5D1, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xDC7D926D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xEDE65310, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503))
	//并添加到栈中
	set udg_SLine_Stack_Top = (udg_SLine_Stack_Top + 1)
	set udg_SLine_AttackType[udg_SLine_Stack_Top] = udg_Args_AttackType
	set udg_SLine_DamageType[udg_SLine_Stack_Top] = udg_Args_DamageType
	set udg_SLine_WeaponType[udg_SLine_Stack_Top] = udg_Args_WeaponType
	set udg_SLine_Stack_Effect[udg_SLine_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SLine_Type3 takes nothing returns nothing
	set gg_trg_SLine_Type3 = CreateTrigger()
	call TriggerAddAction(gg_trg_SLine_Type3, function Trig_SLine_Type3Actions)
endfunction
//===========================================================================
// Trigger: SLine_Type4
//===========================================================================
function Trig_SLine_Type4Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	if ((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD7F63C43) == false)) then
		//创建特效,
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		//控制特效的方向
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		else
		endif
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
	else
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	endif
	//设置特效1的值
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 4)
	call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x605B0368, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x8E5658EA, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x239B1D50, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x656046CB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2A54A5D1, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xDC7D926D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	//并添加到栈中
	set udg_SLine_Stack_Top = (udg_SLine_Stack_Top + 1)
	set udg_SLine_AttackType[udg_SLine_Stack_Top] = udg_Args_AttackType
	set udg_SLine_DamageType[udg_SLine_Stack_Top] = udg_Args_DamageType
	set udg_SLine_WeaponType[udg_SLine_Stack_Top] = udg_Args_WeaponType
	set udg_SLine_Stack_Effect[udg_SLine_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SLine_Type4 takes nothing returns nothing
	set gg_trg_SLine_Type4 = CreateTrigger()
	call TriggerAddAction(gg_trg_SLine_Type4, function Trig_SLine_Type4Actions)
endfunction
//===========================================================================
// Trigger: SLine_Type5
//===========================================================================
function Trig_SLine_Type5Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC8F77CB8, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC8F77CB8))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	if ((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD7F63C43) == false)) then
		//创建特效,
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		//控制特效的方向
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		else
		endif
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
	else
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	endif
	//设置特效1的值
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC8F77CB8, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC8F77CB8))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 5)
	call SaveBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x605B0368, LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2624EB23))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x8E5658EA, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7B5473E1))
	call SaveTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xEDE65310, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4F719503))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x239B1D50, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA4432F14))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x656046CB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x74C9281D))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2A54A5D1, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5FE51B0F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xDC7D926D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x51B46464))
	//并添加到栈中
	set udg_SLine_Stack_Top = (udg_SLine_Stack_Top + 1)
	set udg_SLine_AttackType[udg_SLine_Stack_Top] = udg_Args_AttackType
	set udg_SLine_DamageType[udg_SLine_Stack_Top] = udg_Args_DamageType
	set udg_SLine_WeaponType[udg_SLine_Stack_Top] = udg_Args_WeaponType
	set udg_SLine_Stack_Effect[udg_SLine_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SLine_Type5 takes nothing returns nothing
	set gg_trg_SLine_Type5 = CreateTrigger()
	call TriggerAddAction(gg_trg_SLine_Type5, function Trig_SLine_Type5Actions)
endfunction
//===========================================================================
// Trigger: StraightLineStack
//===========================================================================
function Trig_StraightLineStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local group ydl_group
	local unit ydl_unit
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, udg_SLine_Stack_Top)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, udg_SLine_Stack_Top)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		//造成伤害的单位
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x6EDB7E6F))
		//每次移动距离
		if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) < 0.00)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x62018695))
		else
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xFB6E8B46))
		endif
		//伤害值
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xC0ABED4A))
		//移动方向
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x9966AD24))
		if ((LoadInteger(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 1)) then
			call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F, LoadGroupHandle(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x9E80183F))
			if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) > 0.00)) then
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			else
			endif
			//造成伤害所需要的距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC65482EE, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x535EEE72))
			//伤害范围
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xE6BB3831))
			//特效距离上次伤害的距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x67F82B06, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x67F82B06) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			//移动特效
			call EXSetEffectXY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (( EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))), (( EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))))
			//离目标的距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
			//判断是否需要造成伤害
			if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x67F82B06) >= LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC65482EE))) then
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x67F82B06, 0.00)
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitInGroup( ydl_unit, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F)) == false) and (IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) == true)) then
						call GroupAddUnit( LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F), ydl_unit)
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( ydl_unit))
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( ydl_unit))
						call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x239B1D50), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
						call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x656046CB)))
						call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_SLine_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
						call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
						set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xEDE65310)
						set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
						call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xFC4D8276, ydl_unit)
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
						call TriggerExecute(ydl_trigger)
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			else
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x67F82B06, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x67F82B06))
			endif
		else
		endif
		if ((LoadInteger(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 2)) then
			if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) > 0.00)) then
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			else
			endif
			//攻击目标
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, udg_SLine_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x71A400F9, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC738EF47, EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			if (((IsUnitAliveBJ( udg_SLine_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]) != true) or (udg_SLine_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] == null))) then
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70))
			else
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70))
			endif
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, ( Atan2BJ( (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC738EF47)), (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x71A400F9)))))
			//更新角度
			call EXEffectMatReset( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call EXEffectMatRotateZ( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			//更新距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, DistanceBetweenPoints_XY( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x71A400F9), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC738EF47)))
			call EXSetEffectXY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (( EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))), (( EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379) <= 0.00)) then
				call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x239B1D50), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))
				call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
				call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_SLine_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
				call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			else
			endif
		else
		endif
		if ((LoadInteger(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 3)) then
			if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) > 0.00)) then
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			else
			endif
			//伤害范围
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xE6BB3831))
			//移动特效
			call EXSetEffectXY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (( EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))), (( EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))))
			//离目标的距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
			//判断是否需要造成伤害
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) == true)) then
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( ydl_unit))
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( ydl_unit))
					call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x239B1D50), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
					call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x656046CB)))
					call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
					call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_SLine_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
					set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xEDE65310)
					set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
					call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
					call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xFC4D8276, ydl_unit)
					call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
					call TriggerExecute(ydl_trigger)
					call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
					call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379, 0.00)
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, 0.00)
					exitwhen true
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
		else
		endif
		if ((LoadInteger(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 4)) then
			if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) > 0.00)) then
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			else
			endif
			//伤害范围
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xE6BB3831))
			//移动特效
			call EXSetEffectXY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (( EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))), (( EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))))
			//离目标的距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
			if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379) <= 0.00)) then
				//判断是否需要造成伤害
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) == true)) then
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( ydl_unit))
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( ydl_unit))
						call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x239B1D50), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
						call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x656046CB)))
						call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_SLine_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
						call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			else
			endif
		else
		endif
		if ((LoadInteger(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 5)) then
			if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) > 0.00)) then
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			else
			endif
			//伤害范围
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xE6BB3831))
			//碰撞范围
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC8F77CB8, LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xC8F77CB8))
			//移动特效
			call EXSetEffectXY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (( EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( CosBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))), (( EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)) *( SinBJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))))
			//离目标的距离
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, (LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
			call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379))
			call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF1691DCB, false)
			//判断是否需要造成伤害
			set ydl_group = CreateGroup()
			call GroupEnumUnitsInRange(ydl_group, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC8F77CB8), null)
			loop
				set ydl_unit = FirstOfGroup(ydl_group)
				exitwhen ydl_unit == null
				call GroupRemoveUnit(ydl_group, ydl_unit)
				if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) == true)) then
					call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF1691DCB, true)
					exitwhen true
				else
				endif
			endloop
			call DestroyGroup(ydl_group)
			if (((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF1691DCB) == true) or (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379) <= 0.00))) then
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitEnemy( ydl_unit, ConvertedPlayer( GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) == true)) then
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12, GetUnitX( ydl_unit))
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B, GetUnitY( ydl_unit))
						call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x239B1D50), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFCBFDC12), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE3CB2E3B)))
						call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x656046CB)))
						call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_SLine_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_SLine_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
						call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
						set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xEDE65310)
						set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
						call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xFC4D8276, ydl_unit)
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
						call TriggerExecute(ydl_trigger)
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
				call SaveReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x47527379, 0.00)
			else
			endif
		else
		endif
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379) <= 0.00)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x71A400F9, EXGetEffectX( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC738EF47, EXGetEffectY( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x2A54A5D1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x71A400F9), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC738EF47)))
			if ((LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xDC7D926D) > 0.00)) then
				call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (0.00 + LoadReal(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xDC7D926D)))
				call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			else
			endif
			call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x8E5658EA)
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call TriggerExecute(ydl_trigger)
			if ((LoadBoolean(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xF2154BFC) == true)) then
				call Effect_Show( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], false)
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x605B0368) == false)) then
				call RecycleGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F))
				call FlushChildHashtable(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
				call DestroyEffect( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x62924167) == false)) then
				set udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_SLine_Stack_Effect[udg_SLine_Stack_Top]
				call SaveBoolean(YDHT, GetHandleId( udg_SLine_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x21A54478, true)
				set udg_SLine_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_SLine_AttackType[udg_SLine_Stack_Top]
				set udg_SLine_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_SLine_Target[udg_SLine_Stack_Top]
				set udg_SLine_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_SLine_DamageType[udg_SLine_Stack_Top]
				set udg_SLine_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_SLine_WeaponType[udg_SLine_Stack_Top]
				set udg_SLine_Stack_Top = (udg_SLine_Stack_Top - 1)
			else
			endif
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_StraightLineStack takes nothing returns nothing
	set gg_trg_StraightLineStack = CreateTrigger()
	call TriggerAddAction(gg_trg_StraightLineStack, function Trig_StraightLineStackActions)
endfunction
//===========================================================================
// Trigger: Bezier_Type1
//===========================================================================
function Trig_Bezier_Type1Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	if ((LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD7F63C43) == false)) then
		//创建特效,
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
		//控制特效的方向
		call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
			call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
		else
		endif
	else
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
	endif
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x58B247EB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x536D1A67, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x312C4181, 0.00)
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xCCF9373D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x371E266B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xB3A05229, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 1)
	//加入栈
	set udg_Bezier_Stack_Top = (udg_Bezier_Stack_Top + 1)
	set udg_Bezier_EquipType[udg_Bezier_Stack_Top] = udg_Args_WeaponType
	set udg_Bezier_Target[udg_Bezier_Stack_Top] = LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)
	set udg_Bezier_AttackType[udg_Bezier_Stack_Top] = udg_Args_AttackType
	set udg_Bezier_DamageType[udg_Bezier_Stack_Top] = udg_Args_DamageType
	set udg_Bezier_Stack_Effect[udg_Bezier_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Bezier_Type1 takes nothing returns nothing
	set gg_trg_Bezier_Type1 = CreateTrigger()
	call TriggerAddAction(gg_trg_Bezier_Type1, function Trig_Bezier_Type1Actions)
endfunction
//===========================================================================
// Trigger: Bezier_Type2
//===========================================================================
function Trig_Bezier_Type2Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	//创建特效并初始化
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA)))
	if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB) > 0.00)) then
		call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	else
	endif
	call EXSetEffectZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBEFD8BE8)))
	call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x58B247EB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x536D1A67, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x0E20876F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x4FB814AA, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x312C4181, 0.00)
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xCCF9373D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x371E266B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xB3A05229, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x62018695, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x62018695))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x06CBF27D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x06CBF27D))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFC4D8276, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 2)
	//加入栈
	set udg_Bezier_Stack_Top = (udg_Bezier_Stack_Top + 1)
	set udg_Bezier_EquipType[udg_Bezier_Stack_Top] = udg_Args_WeaponType
	set udg_Bezier_AttackType[udg_Bezier_Stack_Top] = udg_Args_AttackType
	set udg_Bezier_DamageType[udg_Bezier_Stack_Top] = udg_Args_DamageType
	set udg_Bezier_Stack_Effect[udg_Bezier_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Bezier_Type2 takes nothing returns nothing
	set gg_trg_Bezier_Type2 = CreateTrigger()
	call TriggerAddAction(gg_trg_Bezier_Type2, function Trig_Bezier_Type2Actions)
endfunction
//===========================================================================
// Trigger: BezierStack
//===========================================================================
function Trig_BezierStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local group ydl_group
	local unit ydl_unit
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, udg_Bezier_Stack_Top)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, udg_Bezier_Stack_Top)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		//造成伤害的单位
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x6EDB7E6F))
		//每次更新时间, 判断是否变速
		if ((LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) < 0.00)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x62018695))
		else
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xFB6E8B46))
		endif
		//伤害值
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xC0ABED4A))
		//t
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x312C4181))
		//变速
		if ((LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) > 0.00)) then
			call SaveReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D, (LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x06CBF27D) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
		else
		endif
		//高度
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xCCF9373D))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x371E266B))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xB3A05229))
		//起始点
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x0E20876F))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x4FB814AA))
		//控制点
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x58B247EB))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x536D1A67))
		//目标点
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70))
		//更新时间
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))
		call SaveReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x312C4181, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))
		if ((LoadInteger(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 1)) then
			//攻击目标
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, udg_Bezier_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			if (((IsUnitAliveBJ( udg_Bezier_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]) == false) or (udg_Bezier_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] == null))) then
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70))
			else
				call SaveReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
				call SaveReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xECF5506B))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x024FDF70))
			endif
			//使用贝塞尔曲线移动特效位置
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( (Pow( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181)), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))) +( (( (2.00 * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB)))) +( (Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( (Pow( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181)), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))) +( (( (2.00 * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67)))) +( (Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4770A795, EXGetEffectX( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9696374D, EXGetEffectY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8E224FE1, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA) - EXGetEffectX( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x79EC3843, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382) - EXGetEffectY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])))
			call EXSetEffectXY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAD2B4C30, EXGetEffectX( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAA4ECC5A, EXGetEffectY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, Atan2BJ( (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAA4ECC5A) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9696374D)), (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAD2B4C30) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4770A795))))
			//使用贝塞尔曲线设置特效高度
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9F0C6E00, (( (Pow( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181)), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D))) +( (( (2.00 * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B)))) +( (Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1497F566, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9F0C6E00)) +( GetLocationZ( udg_HeightPoint)) -( EXGetEffectZ( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))))
			call EXSetEffectZ( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9F0C6E00)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D2E57BD, SquareRoot( (( Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8E224FE1), 2.00)) +( Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x79EC3843), 2.00)) +( 0.00))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9, Atan2BJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1497F566), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D2E57BD)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9))*( -1.00)))
			call EXEffectMatReset( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call EXEffectMatRotateY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9))
			call EXEffectMatRotateZ( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) >= 1.00)) then
				if ((IsUnitEnemy( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276), GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) == true)) then
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
					call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x239B1D50), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))
					call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
					call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x656046CB)))
					if ((LoadBoolean(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x52D0B7CF) == true)) then
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), true, false, udg_Bezier_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Bezier_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Bezier_EquipType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
					else
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_Bezier_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Bezier_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Bezier_EquipType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
					endif
					call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
				else
				endif
			else
			endif
		else
		endif
		if ((LoadInteger(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 2)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xE6BB3831))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4770A795, EXGetEffectX( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9696374D, EXGetEffectY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA, (( (Pow( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181)), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0E20876F))) +( (( (2.00 * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x58B247EB)))) +( (Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382, (( (Pow( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181)), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4FB814AA))) +( (( (2.00 * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x536D1A67)))) +( (Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8E224FE1, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA) - EXGetEffectX( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x79EC3843, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382) - EXGetEffectY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])))
			call EXSetEffectXY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA99320FA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFDF65382))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAD2B4C30, EXGetEffectX( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAA4ECC5A, EXGetEffectY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, Atan2BJ( (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAA4ECC5A) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9696374D)), (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAD2B4C30) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4770A795))))
			//更新角度
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9F0C6E00, (( (Pow( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181)), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xCCF9373D))) +( (( (2.00 * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( (1.00 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))) *( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x371E266B)))) +( (Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181), 2.00) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB3A05229)))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1497F566, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9F0C6E00)) +( GetLocationZ( udg_HeightPoint)) -( EXGetEffectZ( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))))
			call EXSetEffectZ( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], (GetLocationZ( udg_HeightPoint) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9F0C6E00)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D2E57BD, SquareRoot( (( Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8E224FE1), 2.00)) +( Pow( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x79EC3843), 2.00)) +( 0.00))))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9, Atan2BJ( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x1497F566), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4D2E57BD)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9))*( -1.00)))
			call EXEffectMatReset( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call EXEffectMatRotateY( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xED371EC9))
			call EXEffectMatRotateZ( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
			if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) >= 1.00)) then
				call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x2A54A5D1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))
				call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xDC7D926D)))
				call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
				call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitType( ydl_unit, UNIT_TYPE_DEAD) == false) and (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) > 0.00) and (IsUnitEnemy( ydl_unit, GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) == true)) then
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_Bezier_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Bezier_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Bezier_EquipType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
						call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xC8FBC455), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))
						call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), (1.00 + LoadReal(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x38A9911B)))
						call EXEffectMatRotateZ( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
						call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			else
			endif
		else
		endif
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) >= 1.00)) then
			set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x71E10FFF)
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call TriggerExecute(ydl_trigger)
			if ((LoadBoolean(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x69ABDB93) == true)) then
				call Effect_Show( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], false)
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xBF93EEE8) == false)) then
				call FlushChildHashtable(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
				call DestroyEffect( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x44BEC9D4) == false)) then
				set udg_Bezier_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Bezier_Stack_Effect[udg_Bezier_Stack_Top]
				set udg_Bezier_Target[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Bezier_Target[udg_Bezier_Stack_Top]
				set udg_Bezier_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Bezier_AttackType[udg_Bezier_Stack_Top]
				set udg_Bezier_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Bezier_DamageType[udg_Bezier_Stack_Top]
				set udg_Bezier_EquipType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Bezier_EquipType[udg_Bezier_Stack_Top]
				set udg_Bezier_Stack_Top = (udg_Bezier_Stack_Top - 1)
			else
			endif
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_BezierStack takes nothing returns nothing
	set gg_trg_BezierStack = CreateTrigger()
	call TriggerAddAction(gg_trg_BezierStack, function Trig_BezierStackActions)
endfunction
//===========================================================================
// Trigger: CircleArc_Type1
//===========================================================================
function Trig_CircleArc_Type1Actions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig_CircleArc_Type1 takes nothing returns nothing
	set gg_trg_CircleArc_Type1 = CreateTrigger()
	call TriggerAddAction(gg_trg_CircleArc_Type1, function Trig_CircleArc_Type1Actions)
endfunction
//===========================================================================
// Trigger: CircleArcStack
//===========================================================================
function Trig_CircleArcStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, udg_CircleArc_Stack_Top)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, udg_CircleArc_Stack_Top)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		//特效删除时间
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xF7CB8077))
		//环绕点
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6233440, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x279DE3F0))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBF87C949, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xC27AF500))
		//离环绕中心/单位的距离
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x32457EA2))
		//方向
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x70E3547F, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xAD29F6F2))
		//完成一次指定角度的旋转需要的时间
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xCD8D3D70))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF) - 0.02))
		call SaveReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xF7CB8077, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF))
		//每秒旋转角度
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x22DF4173, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xF7E8EEF1))
		//环绕旋转角度
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x95D6A763))
		//旋转方向
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x70E3547F) == -1.00)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24) - (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x22DF4173)) /( 50.00) /( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))))
		else
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24) + (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x22DF4173)) /( 50.00) /( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))))
		endif
		call SaveReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x95D6A763, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0189838F, Deg2Rad( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E59CBDB, EXGetEffectX( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x3B116F22, EXGetEffectY( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8AF59E01, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6233440)) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379)) *( Cos( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0189838F)))))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDE9711FD, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBF87C949)) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379)) *( Sin( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0189838F)))))
		call EXSetEffectXY( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8AF59E01), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDE9711FD))
		if ((LoadBoolean(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xC0042075) == false)) then
			call EXEffectMatReset( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			call EXEffectMatRotateZ( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], Atan2BJ( (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDE9711FD) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x3B116F22)), (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8AF59E01) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E59CBDB))))
		else
		endif
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF) <= 0.00)) then
			set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xCA12CCEB)
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)])
			call TriggerExecute(ydl_trigger)
			if ((LoadBoolean(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x4A7D0001) == false)) then
				call FlushChildHashtable(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
				call DestroyEffect( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xF82D0E4F) == false)) then
				set udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_CircleArc_Stack_Effect[udg_CircleArc_Stack_Top]
				set udg_CircleArc_Stack_Top = (udg_CircleArc_Stack_Top - 1)
			else
			endif
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_CircleArcStack takes nothing returns nothing
	set gg_trg_CircleArcStack = CreateTrigger()
	call TriggerAddAction(gg_trg_CircleArcStack, function Trig_CircleArcStackActions)
endfunction
//===========================================================================
// Trigger: RDD_Type1
//===========================================================================
function Trig_RDD_Type1Actions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, AddSpecialEffect( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2480578D), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70)))
	call SaveInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA, 1)
	call EXSetEffectSize( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB54F5BCB))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A))
	call SaveUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2966415C, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x17BB2B5F, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xECF5506B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B))
	call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x024FDF70, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70))
	call SaveStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x727826BB, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB))
	set udg_RangeDD_Stack_Top = (udg_RangeDD_Stack_Top + 1)
	set udg_RangeDD_Stack_Effect[udg_RangeDD_Stack_Top] = LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)
	set udg_RangeDD_DamageType[udg_RangeDD_Stack_Top] = udg_Args_DamageType
	set udg_RangeDD_AttackType[udg_RangeDD_Stack_Top] = udg_Args_AttackType
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_RDD_Type1 takes nothing returns nothing
	set gg_trg_RDD_Type1 = CreateTrigger()
	call TriggerAddAction(gg_trg_RDD_Type1, function Trig_RDD_Type1Actions)
endfunction
//===========================================================================
// Trigger: RangeDuringDamageStack
//===========================================================================
function Trig_RangeDuringDamageStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local group ydl_group
	local unit ydl_unit
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, udg_RangeDD_Stack_Top)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, udg_RangeDD_Stack_Top)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, udg_RangeDD_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
		//造成伤害的单位
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F))
		//伤害值
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A))
		//持续时间
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2966415C))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C) - 0.02))
		call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x2966415C, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C))
		//隔一定时间造成一次伤害
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x17BB2B5F))
		//记录, 当该值>=damageInterval时, 造成伤害
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFBDF048B))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B) + 0.02))
		//伤害范围
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831))
		//伤害类别
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB, LoadStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x727826BB))
		//类别
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA7FB4EDA, LoadInteger(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xA7FB4EDA))
		if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA7FB4EDA) == 1)) then
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xECF5506B))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x024FDF70))
			if (((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B) > LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F)) or (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B) == LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F)))) then
				if ((GetRandomInt( 1, 100) <= R2I( GetUnitAttrFromStr( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) then
					set udg_Args_WeaponType = WEAPON_TYPE_METAL_LIGHT_CHOP
					if (("法术暴率%" == LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB))) then
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 125)))
					else
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124)))
					endif
				else
					set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
				endif
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B, 0.00)
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitEnemy( ydl_unit, GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) == true)) then
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_RangeDD_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_RangeDD_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Args_WeaponType)
						set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xACE50C20)
						set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
						call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xFC4D8276, ydl_unit)
						call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))
						call TriggerExecute(ydl_trigger)
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			else
			endif
		else
		endif
		if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xA7FB4EDA) == 2)) then
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276, LoadUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFC4D8276))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
			call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFC4D8276)))
			if (((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B) > LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F)) or (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B) == LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x17BB2B5F)))) then
				if ((GetRandomInt( 1, 100) <= R2I( GetUnitAttrFromStr( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) then
					set udg_Args_WeaponType = WEAPON_TYPE_METAL_LIGHT_CHOP
					if (("法术暴率%" == LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB))) then
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 125)))
					else
						call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 124)))
					endif
				else
					set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
				endif
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B, 0.00)
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xECF5506B), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x024FDF70), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((IsUnitEnemy( ydl_unit, GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))) == true)) then
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_RangeDD_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_RangeDD_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Args_WeaponType)
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			else
			endif
		else
		endif
		call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFBDF048B, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFBDF048B))
		//结束
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2966415C) <= 0.00)) then
			set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC1628288)
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			call TriggerExecute(ydl_trigger)
			if ((LoadBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x09059D12) == false)) then
				call FlushChildHashtable(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)))
				call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			else
			endif
			set udg_RangeDD_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_RangeDD_Stack_Effect[udg_RangeDD_Stack_Top]
			set udg_RangeDD_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_RangeDD_AttackType[udg_RangeDD_Stack_Top]
			set udg_RangeDD_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_RangeDD_DamageType[udg_RangeDD_Stack_Top]
			set udg_RangeDD_WeaponType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_RangeDD_WeaponType[udg_RangeDD_Stack_Top]
			set udg_RangeDD_Stack_Top = (udg_RangeDD_Stack_Top - 1)
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_RangeDuringDamageStack takes nothing returns nothing
	set gg_trg_RangeDuringDamageStack = CreateTrigger()
	call TriggerAddAction(gg_trg_RangeDuringDamageStack, function Trig_RangeDuringDamageStackActions)
endfunction
//===========================================================================
// Trigger: FollowStack
//===========================================================================
function Trig_FollowStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, udg_Follow_Stack_Top)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, udg_Follow_Stack_Top)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		//特效跟随的单位
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDHT, GetHandleId( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x6EDB7E6F))
		//t
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181, LoadReal(YDHT, GetHandleId( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x312C4181))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) + 0.02))
		call SaveReal(YDHT, GetHandleId( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x312C4181, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181))
		//特效删除时间
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF, LoadReal(YDHT, GetHandleId( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x492546AF))
		//特效面向角度
		//移动特效
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075)))
		call EXSetEffectXY( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xAB08DC2F), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x03973DD2))
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) >= LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF))) then
			if ((LoadBoolean(YDHT, GetHandleId( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xF1063DF2) == true)) then
				call Effect_Show( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], false)
			else
			endif
			call FlushChildHashtable(YDHT, GetHandleId( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]))
			call DestroyEffect( udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
			set udg_Follow_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Follow_Stack_Effect[udg_Follow_Stack_Top]
			set udg_Follow_Stack_Top = (udg_Follow_Stack_Top - 1)
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_FollowStack takes nothing returns nothing
	set gg_trg_FollowStack = CreateTrigger()
	call TriggerAddAction(gg_trg_FollowStack, function Trig_FollowStackActions)
endfunction
//===========================================================================
// Trigger: SurroundsStack
//===========================================================================
function Trig_SurroundsStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local group ydl_group
	local unit ydl_unit
	local integer ydl_triggerstep
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, udg_Surrounds_Stack_Top)
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243, udg_Surrounds_Stack_Top)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA, udg_Surrounds_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)])
		//普通圆形环绕
		if ((LoadInteger(YDHT, GetHandleId( udg_Surrounds_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0xA7FB4EDA) == 1)) then
			//造成伤害的单位
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F, LoadUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x6EDB7E6F))
			//环绕的单位
			call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x580AD404, LoadUnitHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x580AD404))
			//判断环绕单位是否死亡
			if (((IsUnitDeadBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x580AD404)) == true) or (LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x580AD404) == null))) then
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF, 0.00)
			else
				//特效删除时间
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x492546AF))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF) - 0.02))
				call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x492546AF, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF))
				//环绕点
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6233440, GetUnitX( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x580AD404)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBF87C949, GetUnitY( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x580AD404)))
				//离环绕中心/单位的距离
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x47527379))
				//方向
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x34A57EBC, LoadReal(YDHT, GetHandleId( udg_CircleArc_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x34A57EBC))
				//完成一次指定角度的旋转需要的时间
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xFB6E8B46))
				//每秒旋转角度
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x22DF4173, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x22DF4173))
				//环绕旋转角度
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24))
				//旋转方向
				if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x34A57EBC) == -1.00)) then
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24) - (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x22DF4173)) /( 50.00) /( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))))
				else
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24) + (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x22DF4173)) /( 50.00) /( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))))
				endif
				call SaveReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9966AD24, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0189838F, Deg2Rad( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9966AD24)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E59CBDB, EXGetEffectX( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x3B116F22, EXGetEffectY( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8AF59E01, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6233440)) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379)) *( Cos( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0189838F)))))
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDE9711FD, (( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xBF87C949)) +( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x47527379)) *( Sin( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x0189838F)))))
				call EXSetEffectXY( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8AF59E01), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDE9711FD))
				//造成的伤害
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xC0ABED4A))
				//伤害类别
				call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB, LoadStr(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x727826BB))
				//选取自身范围
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE6BB3831))
				//已旋转过的角度 -  0~360, 到360清零
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5E251A90, LoadReal(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x5E251A90))
				//实现一圈只伤害同一个单位一次所需要的单位组
				call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F, LoadGroupHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x9E80183F))
				//已旋转的角度
				call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5E251A90, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5E251A90) + (( 360.00) /( 50.00) /( LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46)))))
				if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5E251A90) >= 360.00)) then
					call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5E251A90, 0.00)
					call GroupClear( LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F))
				else
				endif
				call SaveReal(YDHT, GetHandleId( udg_Surrounds_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)]), 0x5E251A90, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x5E251A90))
				set ydl_group = CreateGroup()
				call GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x8AF59E01), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDE9711FD), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6BB3831), null)
				loop
					set ydl_unit = FirstOfGroup(ydl_group)
					exitwhen ydl_unit == null
					call GroupRemoveUnit(ydl_group, ydl_unit)
					if ((GetUnitState( ydl_unit, UNIT_STATE_LIFE) > 0.00) and (IsUnitEnemy( ydl_unit, GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F))) == true) and (IsUnitInGroup( ydl_unit, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F)) == false) and (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) > 0.00)) then
						if ((GetRandomInt( 1, 100) <= R2I( GetUnitAttrFromStr( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075))))) then
							set udg_Args_WeaponType = WEAPON_TYPE_METAL_LIGHT_CHOP
							if (("法术暴率%" == LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x727826BB))) then
								call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 88)))
							else
								call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A) * Unit_GetAttr( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE6E64075), 87)))
							endif
						else
							set udg_Args_WeaponType = WEAPON_TYPE_WHOKNOWS
						endif
						call UnitDamageTarget( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6EDB7E6F), ydl_unit, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC0ABED4A), false, false, udg_Surrounds_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Surrounds_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)], udg_Args_WeaponType)
						call GroupAddUnit( LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F), ydl_unit)
					else
					endif
				endloop
				call DestroyGroup(ydl_group)
			endif
		else
		endif
		//判断特效是否到达
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF) <= 0.00)) then
			set ydl_trigger = LoadTriggerHandle(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x12155E5A)
			set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
			call SaveEffectHandle(YDLOC, ydl_triggerstep, 0xF8F856EA, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			call TriggerExecute(ydl_trigger)
			if ((LoadBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0xE7EA0E2C) == true)) then
				call Effect_Show( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA), false)
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x18B90447) == false)) then
				call FlushChildHashtable(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)))
				call DestroyEffect( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA))
			else
			endif
			if ((LoadBoolean(YDHT, GetHandleId( LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xF8F856EA)), 0x445EBA8D) == false)) then
				call RecycleGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F))
				set udg_Surrounds_Stack_Effect[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Surrounds_Stack_Effect[udg_Surrounds_Stack_Top]
				set udg_Surrounds_AttackType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Surrounds_AttackType[udg_Surrounds_Stack_Top]
				set udg_Surrounds_DamageType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Surrounds_DamageType[udg_Surrounds_Stack_Top]
				set udg_Surrounds_EquipType[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26)] = udg_Surrounds_EquipType[udg_Surrounds_Stack_Top]
				set udg_Surrounds_Stack_Top = (udg_Surrounds_Stack_Top - 1)
			else
			endif
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_group = null
	set ydl_unit = null
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_SurroundsStack takes nothing returns nothing
	set gg_trg_SurroundsStack = CreateTrigger()
	call TriggerAddAction(gg_trg_SurroundsStack, function Trig_SurroundsStackActions)
endfunction
//===========================================================================
// Trigger: SpinStack
//===========================================================================
function Trig_SpinStackActions takes nothing returns nothing
	local integer ydul_virtualIndex
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	set ydul_virtualIndex = 1
	loop
		exitwhen ydul_virtualIndex > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB7279243)
		//t
		call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181, (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) + 0.02))
		//特效删除时间
		//特效旋转
		if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x312C4181) >= LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x492546AF))) then
			if (true) then
			else
			endif
			if (true) then
			else
			endif
		else
		endif
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26, (LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xE92EFA26) - 1))
		set ydul_virtualIndex = ydul_virtualIndex + 1
	endloop
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SpinStack takes nothing returns nothing
	set gg_trg_SpinStack = CreateTrigger()
	call TriggerRegisterTimerEventPeriodic(gg_trg_SpinStack, 0.02)
	call TriggerAddAction(gg_trg_SpinStack, function Trig_SpinStackActions)
endfunction
//===========================================================================
// Trigger: Init
//===========================================================================
function Trig_InitActions takes nothing returns nothing
	local integer ydul_playerID
	local integer ydl_triggerstep
	local trigger ydl_trigger
	set udg_BackHomeP = Location( 0, 0)
	set udg_HeightPoint = Location( 0, 0)
	set udg_HotkeyStr[1] = "(|cffffcc00Q|r)"
	set udg_Hotkey[1] = 81
	set udg_HotkeyStr[2] = "(|cffffcc00W|r)"
	set udg_Hotkey[2] = 87
	set udg_HotkeyStr[3] = "(|cffffcc00E|r)"
	set udg_Hotkey[3] = 69
	set udg_HotkeyStr[4] = "(|cffffcc00R|r)"
	set udg_Hotkey[4] = 82
	set udg_HotkeyStr[5] = "(|cffffcc00A|r)"
	set udg_Hotkey[5] = 65
	set udg_HotkeyStr[6] = "(|cffffcc00S|r)"
	set udg_Hotkey[6] = 83
	set udg_HotkeyStr[7] = "(|cffffcc00D|r)"
	set udg_Hotkey[7] = 68
	set udg_HotkeyStr[8] = "(|cffffcc00F|r)"
	set udg_Hotkey[8] = 70
	set udg_HotkeyStr[9] = "(|cffffcc00Z|r)"
	set udg_Hotkey[9] = 90
	set udg_HotkeyStr[10] = "(|cffffcc00X|r)"
	set udg_Hotkey[10] = 88
	set udg_HotkeyStr[11] = "(|cffffcc00C|r)"
	set udg_Hotkey[11] = 67
	set udg_HotkeyStr[12] = "(|cffffcc00V|r)"
	set udg_Hotkey[12] = 86
	set ydul_playerID = 1
	loop
		exitwhen ydul_playerID > 4
		if ((GetPlayerSlotState( ConvertedPlayer( ydul_playerID)) == PLAYER_SLOT_STATE_PLAYING) and (GetPlayerController( ConvertedPlayer( ydul_playerID)) == MAP_CONTROL_USER)) then
			set udg_Player[ydul_playerID] = ConvertedPlayer( ydul_playerID)
			set udg_SeizeBodyNeedLv[ydul_playerID] = GetIntegerFromExcel( "其它", 8, "Value1")
		else
		endif
		set ydul_playerID = ydul_playerID + 1
	endloop
	set udg_PositionAngle[1] = 90.00
	set udg_PositionAngle[2] = 180.00
	set udg_PositionAngle[3] = 270.00
	set udg_PositionAngle[4] = 360.00
	set udg_DebuffVest[1] = CreateUnit( Player(0), 'e000', 0, 0, 0)
	set udg_DebuffVest[2] = CreateUnit( Player(0), 'e001', 0, 0, 0)
	set udg_DebuffVest[3] = CreateUnit( Player(0), 'e002', 0, 0, 0)
	set udg_DebuffVest[4] = CreateUnit( Player(0), 'e003', 0, 0, 0)
	set udg_DebuffVest[5] = CreateUnit( Player(0), 'e004', 0, 0, 0)
	set udg_DebuffVest[6] = CreateUnit( Player(0), 'e005', 0, 0, 0)
	set ydl_trigger = gg_trg_ChangeAttrEvent
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_HTInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_WBInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_QuestInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_LgfInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_BlackMarketInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_BossSkillInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_ArchiveChallengeInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_Init takes nothing returns nothing
	set gg_trg_Init = CreateTrigger()
	call TriggerAddAction(gg_trg_Init, function Trig_InitActions)
endfunction
//===========================================================================
// Trigger: HTInit
//===========================================================================
function Trig_HTInitActions takes nothing returns nothing
	set udg_HTSeizeBodyID = InitHashtable()
endfunction
//===========================================================================
function InitTrig_HTInit takes nothing returns nothing
	set gg_trg_HTInit = CreateTrigger()
	call TriggerAddAction(gg_trg_HTInit, function Trig_HTInitActions)
endfunction
//===========================================================================
// Trigger: GameStart
//===========================================================================
function Trig_GameStartActions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	set ydl_trigger = gg_trg_HeroAttrInit
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_GameStart takes nothing returns nothing
	set gg_trg_GameStart = CreateTrigger()
	call TriggerAddAction(gg_trg_GameStart, function Trig_GameStartActions)
endfunction
//===========================================================================
// Trigger: SetEnemyAttr
//===========================================================================
function Trig_SetEnemyAttrConditions takes nothing returns boolean
	return ((IsUnitAlly( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0xB6A6EBAA), Player(0)) == false))
endfunction
function Trig_SetEnemyAttrActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	if ((GetTriggerUnit() != null)) then
		call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA, GetTriggerUnit())
	else
	endif
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, LoadInteger(YDHT, GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x200B34C8))
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2) == 0)) then
		call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
		return
	else
	endif
	//设置单位类别, 小怪, 精英, BOSS
	call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD13206C9, GetIntegerFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "怪物分类"))
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD13206C9) == 1)) then
		call SaveBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x95522F36, true)
	else
	endif
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD13206C9) == 2)) then
		call SaveBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x6C446A7A, true)
	else
	endif
	if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xD13206C9) == 3)) then
		call SaveBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x24B6F8FF, true)
	else
	endif
	//设置单位数值
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "exp"))
	call SaveReal(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x571B6555, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x571B6555))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x90D0577E, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "攻击范围"))
	call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), 11, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x90D0577E))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x98284AB5, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "攻击速度"))
	call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), 9, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x98284AB5))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x3B0E1252, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "攻击间隔"))
	call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), 10, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x3B0E1252))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x301CC1D8, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "攻击"))
	call Unit_SetAttrBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), 1, 2, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x301CC1D8))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9890BA1B, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "生命"))
	call SetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), UNIT_STATE_MAX_LIFE, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9890BA1B))
	call SetUnitLifePercentBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), 100)
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9AB6824A, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "防御"))
	call SetUnitState( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), ConvertUnitState(0x20), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9AB6824A))
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "移速"))
	call SetUnitMoveSpeed( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xFB6E8B46))
	//设置单位数据
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDF73D176, GetStringFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "名字"))
	call SetUnitName( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDF73D176))
	call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x7C181E3A, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xDF73D176))
	call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7AB70EC9, GetStringFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "模型"))
	if ((LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7AB70EC9) != "")) then
		call SaveStr(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA)), 0x4D9039EC, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7AB70EC9))
		call SetUnitModel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7AB70EC9))
	else
	endif
	call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19CB87CF, GetRealFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "模型大小"))
	if ((LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19CB87CF) > 0.00)) then
		call SetUnitScale( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xB6A6EBAA), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19CB87CF), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19CB87CF), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x19CB87CF))
	else
	endif
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_SetEnemyAttr takes nothing returns nothing
	set gg_trg_SetEnemyAttr = CreateTrigger()
	call TriggerAddCondition(gg_trg_SetEnemyAttr, Condition(function Trig_SetEnemyAttrConditions))
	call TriggerAddAction(gg_trg_SetEnemyAttr, function Trig_SetEnemyAttrActions)
endfunction
//===========================================================================
// Trigger: AddBlood
//===========================================================================
function Trig_AddBloodActions takes nothing returns nothing
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	if ((IsUnitHiddenBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D)) == false) and (GetUnitAbilityLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Aloc') == 0) and ((UnitHasBuffBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Bvul') == true) or (GetUnitAbilityLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Avul') > 0))) then
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB, "unit")
		//设置名字(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, "")
		//是否显示血条(用于只显示名字)
		call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78, false)
		//设置称号(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492, "")
		call add_blood(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x73D746F1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4743963A), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492))
		call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
		return
	else
	endif
	if ((IsUnitType( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), UNIT_TYPE_HERO) == true) and (GetConvertedPlayerId( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D))) <= 4)) then
		//血条类型
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB, "hero")
		//长度
		//宽
		//设置名字(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, GetPlayerName( GetOwningPlayer( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D))))
		//是否显示血条(用于只显示名字)
		call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78, true)
		//设置称号(空字符串不显示)
		call add_blood(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x73D746F1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4743963A), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492))
		call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
		return
	else
	endif
	if ((IsUnitType( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), UNIT_TYPE_TOWNHALL) == true)) then
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB, "build")
		//设置名字(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, (EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D))) + "]." + "Name")))
		//是否显示血条(用于只显示名字)
		call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78, true)
		//设置称号(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492, "")
		call add_blood(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x73D746F1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4743963A), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492))
		call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
		return
	else
	endif
	if ((GetUnitAbilityLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Aloc') == 0) and (LoadBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D)), 0x95522F36) == false) and ((LoadBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D)), 0x6C446A7A) == true) or (LoadBoolean(YDHT, GetHandleId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D)), 0x24B6F8FF) == true))) then
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB, "big")
		//设置名字(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, (EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D))) + "]." + "Name")))
		call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2, LoadInteger(YDHT, GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D)), 0x200B34C8))
		if ((LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2) > 0)) then
			call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, GetStringFromExcel( "怪物数值", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6F96F2D2), "名字"))
		else
		endif
		//是否显示血条(用于只显示名字)
		call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78, true)
		//设置称号(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492, "")
		call add_blood(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x73D746F1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4743963A), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492))
		call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
		return
	else
	endif
	if ((IsUnitHiddenBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D)) != true) and (UnitHasBuffBJ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Bvul') != true) and (GetUnitAbilityLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Aloc') == 0) and (GetUnitAbilityLevel( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), 'Avul') == 0)) then
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB, "unit")
		//设置名字(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, (EXExecuteScript("(require'jass.slk').unit[" + I2S( GetUnitTypeId( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D))) + "]." + "Name")))
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322, "")
		//是否显示血条(用于只显示名字)
		call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78, true)
		//设置称号(空字符串不显示)
		call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492, "")
		call add_blood(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6C687EEB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x73D746F1), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x4743963A), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x6856D322), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x2C49DD78), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x7C9DB492))
		call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
		return
	else
	endif
	call SetUnitPressUIVisible(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0xC303079D), false)
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_AddBlood takes nothing returns nothing
	set gg_trg_AddBlood = CreateTrigger()
	call TriggerAddAction(gg_trg_AddBlood, function Trig_AddBloodActions)
endfunction
//===========================================================================
// Trigger: AddBlood_Init
//===========================================================================
function Trig_AddBlood_InitFunc003A takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	set ydl_trigger = gg_trg_SetEnemyAttr
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xB6A6EBAA, GetEnumUnit())
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = gg_trg_AddBlood
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xC303079D, GetEnumUnit())
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = null
endfunction
function Trig_AddBlood_InitFunc005Conditions takes nothing returns nothing
	local integer ydl_triggerstep
	local trigger ydl_trigger
	set ydl_trigger = gg_trg_SetEnemyAttr
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xB6A6EBAA, GetTriggerUnit())
	call DoNothing() 
 if TriggerEvaluate(ydl_trigger) then 
 call TriggerExecute(ydl_trigger) 
 endif
	set ydl_trigger = gg_trg_AddBlood
	set ydl_triggerstep = GetHandleId(ydl_trigger)*(LoadInteger(YDLOC, GetHandleId(ydl_trigger), 0xCFDE6C76) + 3)
	call SaveUnitHandle(YDLOC, ydl_triggerstep, 0xC303079D, GetTriggerUnit())
	call TriggerExecute(ydl_trigger)
	set ydl_trigger = null
endfunction
function Trig_AddBlood_InitActions takes nothing returns nothing
	local trigger ydl_trigger
	local integer ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76) 
 set ydl_localvar_step = ydl_localvar_step + 3 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step) 
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
	call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F, YDWEGetUnitsInRectAllNull( GetPlayableMapRect()))
	call ForGroupBJ( LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F),function Trig_AddBlood_InitFunc003A)
	call DestroyGroup( LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step, 0x9E80183F))
	set ydl_trigger = CreateTrigger()
	call YDWETriggerRegisterEnterRectSimpleNull(ydl_trigger, bj_mapInitialPlayableArea)
	call TriggerAddCondition( ydl_trigger, Condition(function Trig_AddBlood_InitFunc005Conditions))
	call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger())*ydl_localvar_step)
	set ydl_trigger = null
endfunction
//===========================================================================
function InitTrig_AddBlood_Init takes nothing returns nothing
	set gg_trg_AddBlood_Init = CreateTrigger()
	call TriggerRegisterTimerEventSingle(gg_trg_AddBlood_Init, 1.00)
	call TriggerAddAction(gg_trg_AddBlood_Init, function Trig_AddBlood_InitActions)
endfunction
//===========================================================================
// Trigger: Ui04-网易LOGO
//===========================================================================
function Trig_Ui04_______LOGOActions takes nothing returns nothing
	set udg_GameUI_DZ_UI = DzCreateFrameByTagName( "BACKDROP", "name", DzGetGameUI(), "template", 0)
	call DzFrameSetSize( udg_GameUI_DZ_UI, 0.06, 0.02)
	//素材
	call DzFrameSetTexture( udg_GameUI_DZ_UI, "war3mapImported\\dz_log.tga", 0)
	//默认
	call DzFrameSetPoint( udg_GameUI_DZ_UI, 5, DzGetGameUI(), 0, 0, 0.00)
endfunction
//===========================================================================
function InitTrig_Ui04_______LOGO takes nothing returns nothing
	set gg_trg_Ui04_______LOGO = CreateTrigger()
	call TriggerRegisterTimerEventSingle(gg_trg_Ui04_______LOGO, 1.00)
	call TriggerAddAction(gg_trg_Ui04_______LOGO, function Trig_Ui04_______LOGOActions)
endfunction
//===========================================================================
// Trigger: 系统消息LG
//===========================================================================
function Trig_____________LGActions takes nothing returns nothing
	call DzFrameClearAllPoints( DzFrameGetUnitMessage())
	call DzFrameSetPoint( DzFrameGetUnitMessage(), 6, DzGetGameUI(), 3, 0.065, -0.075)
endfunction
//===========================================================================
function InitTrig_____________LG takes nothing returns nothing
	set gg_trg_____________LG = CreateTrigger()
	call TriggerAddAction(gg_trg_____________LG, function Trig_____________LGActions)
endfunction
//===========================================================================
// Trigger: Init 字节码上限
//===========================================================================
function Trig_Init________________uActions takes nothing returns nothing
	call AbilityId("exec-lua:unlock")
endfunction
//===========================================================================
function InitTrig_Init________________u takes nothing returns nothing
	set gg_trg_Init________________u = CreateTrigger()
	call TriggerAddAction(gg_trg_Init________________u, function Trig_Init________________uActions)
endfunction
//===========================================================================
// Trigger: Init 原神启动
//===========================================================================
function Trig_Init_____________uActions takes nothing returns nothing
	call AbilityId("exec-lua:ysqd")
endfunction
//===========================================================================
function InitTrig_Init_____________u takes nothing returns nothing
	set gg_trg_Init_____________u = CreateTrigger()
	call TriggerAddAction(gg_trg_Init_____________u, function Trig_Init_____________uActions)
endfunction
//===========================================================================
// Trigger: MpsScriptInit
//===========================================================================
function Trig_MpsScriptInitActions takes nothing returns nothing
	call InitTrig_maps_init()
endfunction
//===========================================================================
function InitTrig_MpsScriptInit takes nothing returns nothing
	set gg_trg_MpsScriptInit = CreateTrigger()
	call TriggerAddAction(gg_trg_MpsScriptInit, function Trig_MpsScriptInitActions)
endfunction
//===========================================================================
// Trigger: WPDJ 物品叠加
//===========================================================================
function Trig_WPDJ_____________uConditions takes nothing returns boolean
	return (((GetItemType( GetManipulatedItem()) == ITEM_TYPE_CHARGED)))
endfunction
function Trig_WPDJ_____________uActions takes nothing returns nothing
	local integer ydul_a
	set ydul_a = 1
	loop
		exitwhen ydul_a > 6
		if ((GetItemTypeId( GetManipulatedItem()) == GetItemTypeId( UnitItemInSlotBJ( GetTriggerUnit(), ydul_a))) and (GetManipulatedItem() != UnitItemInSlotBJ( GetTriggerUnit(), ydul_a))) then
			call SetItemCharges( UnitItemInSlotBJ( GetTriggerUnit(), ydul_a), (GetItemCharges( UnitItemInSlotBJ( GetTriggerUnit(), ydul_a)) + GetItemCharges( GetManipulatedItem())))
			call RemoveItem( GetManipulatedItem())
		else
			call DoNothing()
		endif
		set ydul_a = ydul_a + 1
	endloop
endfunction
//===========================================================================
function InitTrig_WPDJ_____________u takes nothing returns nothing
	set gg_trg_WPDJ_____________u = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_WPDJ_____________u, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(gg_trg_WPDJ_____________u, Condition(function Trig_WPDJ_____________uConditions))
	call TriggerAddAction(gg_trg_WPDJ_____________u, function Trig_WPDJ_____________uActions)
endfunction
//===========================================================================
// Trigger: 初始
//===========================================================================
function Trig_______uFunc014T takes nothing returns nothing
	local integer ydul_a
	set ydul_a = 1
	loop
		exitwhen ydul_a > 4
		call CustomVictoryBJ( ConvertedPlayer( ydul_a), true, true)
		set ydul_a = ydul_a + 1
	endloop
endfunction
function Trig_______uActions takes nothing returns nothing
	local integer ydul_a
	local timer ydl_timer
	call DzLoadToc( "war3mapImported\\gameui.toc")
	call DzLoadToc( "war3mapImported\\myframedef.toc")
	call FogEnable( false)
	call FogMaskEnable( false)
	call SetTimeOfDay( 12.00)
	call UseTimeOfDayBJ( false)
	call EnableWorldFogBoundary( false)
	call CameraSetupApplyForceDuration( gg_cam_Camera_001, true, 0)
	call CameraSetSmoothingFactor( 10.00)
	set udg_HeightPoint = GetRectCenter( GetPlayableMapRect())
	set ydul_a = 1
	loop
		exitwhen ydul_a > 4
		call SetPlayerAlliance( ConvertedPlayer( ydul_a), Player(PLAYER_NEUTRAL_PASSIVE), ALLIANCE_PASSIVE, true)
		call SetPlayerAlliance( Player(PLAYER_NEUTRAL_PASSIVE), ConvertedPlayer( ydul_a), ALLIANCE_PASSIVE, true)
		set ydul_a = ydul_a + 1
	endloop
	set ydul_a = 5
	loop
		exitwhen ydul_a > 12
		call SetPlayerAlliance( Player(PLAYER_NEUTRAL_AGGRESSIVE), ConvertedPlayer( ydul_a), ALLIANCE_PASSIVE, true)
		call SetPlayerAlliance( ConvertedPlayer( ydul_a), Player(PLAYER_NEUTRAL_AGGRESSIVE), ALLIANCE_PASSIVE, true)
		set ydul_a = ydul_a + 1
	endloop
	set ydl_timer = CreateTimer()
	call TimerStart(ydl_timer, 25200.00, false, function Trig_______uFunc014T)
	set ydl_timer = null
endfunction
//===========================================================================
function InitTrig_______u takes nothing returns nothing
	set gg_trg_______u = CreateTrigger()
	call TriggerAddAction(gg_trg_______u, function Trig_______uActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
	call InitTrig____________________001()
	call InitTrig_TestInit()
	call InitTrig_ToCode()
	call InitTrig_SetWoodMonsterValueID()
	call InitTrig_SpawnWoodMonster()
	call InitTrig_SpawnLgfMonsters()
	call InitTrig_LgfInit()
	call InitTrig_F4()
	call InitTrig_PressKeyC()
	call InitTrig_QuestInit()
	call InitTrig_OpenArchiveChallenge()
	call InitTrig_ArchiveChallengeInit()
	call InitTrig_BossSkillTrig1_1()
	call InitTrig_BossSkillTrig2_1()
	call InitTrig_BossSkillTrig3_1()
	call InitTrig_BossSkillTrig3_2()
	call InitTrig_BossSkillTrig4_1()
	call InitTrig_BossSkillTrig4_2()
	call InitTrig_BossSkillTrig4_2_DamageAction()
	call InitTrig_BossSkillTrig5_1()
	call InitTrig_BossSkillTrig5_2()
	call InitTrig_BossSkillTrig6_1()
	call InitTrig_BossSkillTrig6_2()
	call InitTrig_BossSkillTrig6_3()
	call InitTrig_BossSkillInit()
	call InitTrig_SeizeBody_15()
	call InitTrig_SeizeBody_14()
	call InitTrig_SeizeBody_13()
	call InitTrig_SeizeBody_8()
	call InitTrig_SeizeBody_3()
	call InitTrig_SeizeBody_2()
	call InitTrig_SeizeBodyLua()
	call InitTrig_SetRefreshTip()
	call InitTrig_BuyBMSales()
	call InitTrig_SetBMSales()
	call InitTrig_BlackMarketInit()
	call InitTrig_SpawnAttackMonsters()
	call InitTrig_SpawnNormalMonsters()
	call InitTrig_WBInit()
	call InitTrig_UnitDead()
	call InitTrig_PressKeyEsc()
	call InitTrig_F3()
	call InitTrig_F2()
	call InitTrig_F1()
	call InitTrig_HeroLvUp()
	call InitTrig_RecoverHp()
	call InitTrig_BackHome()
	call InitTrig_D___u()
	call InitTrig_D_Func_Effect()
	call InitTrig_ShowAttr()
	call InitTrig_HeroRelive()
	call InitTrig_HeroAttrInit()
	call InitTrig_ChangeAttrEvent()
	call InitTrig_DamageSystem()
	call InitTrig_AttackSystem()
	call InitTrig_001Timer()
	call InitTrig_002Timer()
	call InitTrig_01Timer()
	call InitTrig_05Timer()
	call InitTrig_1Timer()
	call InitTrig_SLine_Type1()
	call InitTrig_SLine_Type2()
	call InitTrig_SLine_Type3()
	call InitTrig_SLine_Type4()
	call InitTrig_SLine_Type5()
	call InitTrig_StraightLineStack()
	call InitTrig_Bezier_Type1()
	call InitTrig_Bezier_Type2()
	call InitTrig_BezierStack()
	call InitTrig_CircleArc_Type1()
	call InitTrig_CircleArcStack()
	call InitTrig_RDD_Type1()
	call InitTrig_RangeDuringDamageStack()
	call InitTrig_FollowStack()
	call InitTrig_SurroundsStack()
	call InitTrig_SpinStack()
	call InitTrig_Init()
	call InitTrig_HTInit()
	call InitTrig_GameStart()
	call InitTrig_SetEnemyAttr()
	call InitTrig_AddBlood()
	call InitTrig_AddBlood_Init()
	call InitTrig_Ui04_______LOGO()
	call InitTrig_____________LG()
	call InitTrig_Init________________u()
	call InitTrig_Init_____________u()
	call InitTrig_MpsScriptInit()
	call InitTrig_WPDJ_____________u()
	call InitTrig_______u()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
	call ConditionalTriggerExecute(gg_trg_Init)
	call ConditionalTriggerExecute(gg_trg_____________LG)
	call ConditionalTriggerExecute(gg_trg_Init________________u)
	call ConditionalTriggerExecute(gg_trg_Init_____________u)
	call ConditionalTriggerExecute(gg_trg_MpsScriptInit)
	call ConditionalTriggerExecute(gg_trg_______u)
endfunction
function InitCustomPlayerSlots takes nothing returns nothing
	call SetPlayerStartLocation(Player(0), 0)
	call ForcePlayerStartLocation(Player(0), 0)
	call SetPlayerColor(Player(0), ConvertPlayerColor(0))
	call SetPlayerRacePreference(Player(0), RACE_PREF_RANDOM)
	call SetPlayerRaceSelectable(Player(0), true)
	call SetPlayerController(Player(0), MAP_CONTROL_USER)
	call SetPlayerStartLocation(Player(1), 1)
	call ForcePlayerStartLocation(Player(1), 1)
	call SetPlayerColor(Player(1), ConvertPlayerColor(1))
	call SetPlayerRacePreference(Player(1), RACE_PREF_RANDOM)
	call SetPlayerRaceSelectable(Player(1), true)
	call SetPlayerController(Player(1), MAP_CONTROL_USER)
	call SetPlayerStartLocation(Player(2), 2)
	call SetPlayerColor(Player(2), ConvertPlayerColor(2))
	call SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
	call SetPlayerRaceSelectable(Player(2), false)
	call SetPlayerController(Player(2), MAP_CONTROL_USER)
	call SetPlayerStartLocation(Player(3), 3)
	call SetPlayerColor(Player(3), ConvertPlayerColor(3))
	call SetPlayerRacePreference(Player(3), RACE_PREF_NIGHTELF)
	call SetPlayerRaceSelectable(Player(3), false)
	call SetPlayerController(Player(3), MAP_CONTROL_USER)
	call SetPlayerStartLocation(Player(4), 4)
	call SetPlayerColor(Player(4), ConvertPlayerColor(4))
	call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(4), false)
	call SetPlayerController(Player(4), MAP_CONTROL_COMPUTER)
	call SetPlayerStartLocation(Player(5), 5)
	call SetPlayerColor(Player(5), ConvertPlayerColor(5))
	call SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
	call SetPlayerRaceSelectable(Player(5), false)
	call SetPlayerController(Player(5), MAP_CONTROL_COMPUTER)
	call SetPlayerStartLocation(Player(6), 6)
	call SetPlayerColor(Player(6), ConvertPlayerColor(6))
	call SetPlayerRacePreference(Player(6), RACE_PREF_UNDEAD)
	call SetPlayerRaceSelectable(Player(6), false)
	call SetPlayerController(Player(6), MAP_CONTROL_COMPUTER)
	call SetPlayerStartLocation(Player(7), 7)
	call SetPlayerColor(Player(7), ConvertPlayerColor(7))
	call SetPlayerRacePreference(Player(7), RACE_PREF_NIGHTELF)
	call SetPlayerRaceSelectable(Player(7), false)
	call SetPlayerController(Player(7), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
	// Force: TRIGSTR_003
	call SetPlayerTeam(Player(0), 0)
	call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
	call SetPlayerTeam(Player(1), 0)
	call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
	call SetPlayerTeam(Player(2), 0)
	call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
	call SetPlayerTeam(Player(3), 0)
	call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
	call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
	call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
	call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
	call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
	call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
	call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
	call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
	call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
	call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
	call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
	call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
	call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
	call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
	call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
	call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
	call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
	call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
	call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
	call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
	call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
	call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
	call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
	call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
	call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
	// Force: TRIGSTR_004
	call SetPlayerTeam(Player(4), 1)
	call SetPlayerTeam(Player(5), 1)
	call SetPlayerTeam(Player(6), 1)
	call SetPlayerTeam(Player(7), 1)
	call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
	call SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
	call SetPlayerAllianceStateAllyBJ(Player(4), Player(7), true)
	call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
	call SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
	call SetPlayerAllianceStateAllyBJ(Player(5), Player(7), true)
	call SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
	call SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
	call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
	call SetPlayerAllianceStateAllyBJ(Player(7), Player(4), true)
	call SetPlayerAllianceStateAllyBJ(Player(7), Player(5), true)
	call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
	call SetStartLocPrioCount(0, 3)
	call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(1, 2)
	call SetStartLocPrio(1, 0, 2, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(1, 1, 3, MAP_LOC_PRIO_LOW)
	call SetStartLocPrioCount(2, 1)
	call SetStartLocPrio(2, 0, 3, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(3, 1)
	call SetStartLocPrio(3, 0, 2, MAP_LOC_PRIO_HIGH)
endfunction
//===========================================================================
//*
//*  Main Initialization
//*
//===========================================================================
function main takes nothing returns nothing
	call initializePlugin() 
 call SetCameraBounds(-29184.000000 + GetCameraMargin(CAMERA_MARGIN_LEFT), -18944.000000 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 32256.000000 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 22016.000000 - GetCameraMargin(CAMERA_MARGIN_TOP), -29184.000000 + GetCameraMargin(CAMERA_MARGIN_LEFT), 22016.000000 - GetCameraMargin(CAMERA_MARGIN_TOP), 32256.000000 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -18944.000000 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	call SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	call SetTerrainFogEx(0, 1.00, 100000.00, 0.500, 0.000, 0.000, 0.000)
	call NewSoundEnvironment("Default")
	call SetAmbientDaySound("AshenvaleDay")
	call SetAmbientNightSound("AshenvaleNight")
	call SetMapMusic("Music", true, 0)
	call InitSounds()
	call InitRandomGroups()
	call CreateRegions()
	call CreateCameras()
	call CreateDestructables()
	call CreateItems()
	call CreateUnits()
	call InitBlizzard()
	call InitGlobals()
	call InitCustomTriggers()
	call RunInitializationTriggers()
endfunction
//===========================================================================
//*
//*  Map Configuration
//*
//===========================================================================
function config takes nothing returns nothing
	call SetMapName("TRIGSTR_710")
	call SetMapDescription("TRIGSTR_712")
	call SetPlayers(8)
	call SetTeams(8)
	call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
	call DefineStartLocation(0, 3072.000000, 14272.000000)
	call DefineStartLocation(4, 7744.000000, -3392.000000)
	call DefineStartLocation(5, -704.000000, 3392.000000)
	call DefineStartLocation(3, -192.000000, 3776.000000)
	call DefineStartLocation(7, 2752.000000, 704.000000)
	call DefineStartLocation(2, 704.000000, 4096.000000)
	call DefineStartLocation(6, 7360.000000, -7104.000000)
	call DefineStartLocation(1, 2368.000000, 3584.000000)
	call InitCustomPlayerSlots()
	call InitCustomTeams()
	call InitAllyPriorities()
endfunction
library YDWEGetUnitsInRectMatchingNull
globals
    group yd_NullTempGroup
endglobals
function YDWEGetUnitsInRectMatchingNull takes rect r, boolexpr filter returns group
    local group g = CreateGroup()
    call GroupEnumUnitsInRect(g, r, filter)
    call DestroyBoolExpr(filter)
    set yd_NullTempGroup = g
    set g = null
    return yd_NullTempGroup
endfunction
endlibrary
library YDWEGetUnitsInRectAllNull requires YDWEGetUnitsInRectMatchingNull
function YDWEGetUnitsInRectAllNull takes rect r returns group
    return YDWEGetUnitsInRectMatchingNull(r, null)
endfunction
endlibrary
//===========================================================================  
//===========================================================================  
//自定义事件 
//===========================================================================
//===========================================================================   
library YDWETriggerEvent 
globals
    trigger yd_DamageEventTrigger = null
    private trigger array DamageEventQueue
    private integer DamageEventNumber = 0
	
    item bj_lastMovedItemInItemSlot = null
	
    private trigger MoveItemEventTrigger = null
    private trigger array MoveItemEventQueue
    private integer MoveItemEventNumber = 0
endglobals
	
//===========================================================================  
//任意单位伤害事件 
//===========================================================================
function YDWEAnyUnitDamagedTriggerAction takes nothing returns nothing
    local integer i = 0
    
    loop
        exitwhen i >= DamageEventNumber
        if DamageEventQueue[i] != null and IsTriggerEnabled(DamageEventQueue[i]) and TriggerEvaluate(DamageEventQueue[i]) then
            call TriggerExecute(DamageEventQueue[i])
        endif
        set i = i + 1 
    endloop 
endfunction
function YDWEAnyUnitDamagedFilter takes nothing returns boolean 
    if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then 
        call TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
    endif
    return false
endfunction
function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing 
    local trigger t = CreateTrigger()
    local region r = CreateRegion()
    local group g = CreateGroup()
    call RegionAddRect(r, GetWorldBounds())
    call TriggerRegisterEnterRegion(t, r, Condition(function YDWEAnyUnitDamagedFilter))
    call GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(function YDWEAnyUnitDamagedFilter))
    call DestroyGroup(g)
    set r = null
    set t = null
    set g = null
endfunction
	
function YDWESyStemAnyUnitDamagedRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if DamageEventNumber == 0 then
        set yd_DamageEventTrigger = CreateTrigger()
        call TriggerAddAction(yd_DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction) 
        call YDWEAnyUnitDamagedEnumUnit()
    endif 
    
    set DamageEventQueue[DamageEventNumber] = trg
    set DamageEventNumber = DamageEventNumber + 1
endfunction
//===========================================================================  
//移动物品事件 
//===========================================================================  
function YDWESyStemItemUnmovableTriggerAction takes nothing returns nothing
    local integer i = 0
    
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then 
		set bj_lastMovedItemInItemSlot = GetOrderTargetItem() 
    	loop
        	exitwhen i >= MoveItemEventNumber
        	if MoveItemEventQueue[i] != null and IsTriggerEnabled(MoveItemEventQueue[i]) and TriggerEvaluate(MoveItemEventQueue[i]) then
        	    call TriggerExecute(MoveItemEventQueue[i])
        	endif
        	set i = i + 1 
    	endloop 
	endif	
endfunction
function YDWESyStemItemUnmovableRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if MoveItemEventNumber == 0 then
        set MoveItemEventTrigger = CreateTrigger()
        call TriggerAddAction(MoveItemEventTrigger, function YDWESyStemItemUnmovableTriggerAction) 
        call TriggerRegisterAnyUnitEventBJ(MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    endif 
    
    set MoveItemEventQueue[MoveItemEventNumber] = trg
    set MoveItemEventNumber = MoveItemEventNumber + 1
endfunction
function GetLastMovedItemInItemSlot takes nothing returns item
    return bj_lastMovedItemInItemSlot
endfunction
endlibrary 
library YDWEBase initializer InitializeYD
//===========================================================================
//HashTable
//===========================================================================
globals
//ȫ�ֹ�ϣ�� 
endglobals
//===========================================================================
//Return bug
//===========================================================================
function YDWEH2I takes handle h returns integer
    return GetHandleId(h)
endfunction
//����
function YDWEFlushAllData takes nothing returns nothing
    call FlushParentHashtable(YDHT)
endfunction
function YDWEFlushMissionByInteger takes integer i returns nothing
    call FlushChildHashtable(YDHT,i)
endfunction
function YDWEFlushMissionByString takes string s returns nothing
    call FlushChildHashtable(YDHT,StringHash(s))
endfunction
function YDWEFlushStoredIntegerByInteger takes integer i,integer j returns nothing
    call RemoveSavedInteger(YDHT,i,j)
endfunction
function YDWEFlushStoredIntegerByString takes string s1,string s2 returns nothing
    call RemoveSavedInteger(YDHT,StringHash(s1),StringHash(s2))
endfunction
function YDWEHaveSavedIntegerByInteger takes integer i,integer j returns boolean
    return HaveSavedInteger(YDHT,i,j)
endfunction
function YDWEHaveSavedIntegerByString takes string s1,string s2 returns boolean
    return HaveSavedInteger(YDHT,StringHash(s1),StringHash(s2))
endfunction
//store and get integer
function YDWESaveIntegerByInteger takes integer pTable,integer pKey,integer i returns nothing
    call SaveInteger(YDHT,pTable,pKey,i)
endfunction
function YDWESaveIntegerByString takes string pTable,string pKey,integer i returns nothing
    call SaveInteger(YDHT,StringHash(pTable),StringHash(pKey),i)
endfunction
function YDWEGetIntegerByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT,pTable,pKey)
endfunction
function YDWEGetIntegerByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//store and get real
function YDWESaveRealByInteger takes integer pTable,integer pKey,real r returns nothing
    call SaveReal(YDHT,pTable,pKey,r)
endfunction
function YDWESaveRealByString takes string pTable,string pKey,real r returns nothing
    call SaveReal(YDHT,StringHash(pTable),StringHash(pKey),r)
endfunction
function YDWEGetRealByInteger takes integer pTable,integer pKey returns real
    return LoadReal(YDHT,pTable,pKey)
endfunction
function YDWEGetRealByString takes string pTable,string pKey returns real
    return LoadReal(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//store and get string
function YDWESaveStringByInteger takes integer pTable,integer pKey,string s returns nothing
    call SaveStr(YDHT,pTable,pKey,s)
endfunction
function YDWESaveStringByString takes string pTable,string pKey,string s returns nothing
    call SaveStr(YDHT,StringHash(pTable),StringHash(pKey),s)
endfunction
function YDWEGetStringByInteger takes integer pTable,integer pKey returns string
    return LoadStr(YDHT,pTable,pKey)
endfunction
function YDWEGetStringByString takes string pTable,string pKey returns string
    return LoadStr(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//store and get boolean
function YDWESaveBooleanByInteger takes integer pTable,integer pKey,boolean b returns nothing
    call SaveBoolean(YDHT,pTable,pKey,b)
endfunction
function YDWESaveBooleanByString takes string pTable,string pKey,boolean b returns nothing
    call SaveBoolean(YDHT,StringHash(pTable),StringHash(pKey),b)
endfunction
function YDWEGetBooleanByInteger takes integer pTable,integer pKey returns boolean
    return LoadBoolean(YDHT,pTable,pKey)
endfunction
function YDWEGetBooleanByString takes string pTable,string pKey returns boolean
    return LoadBoolean(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Unit
function YDWESaveUnitByInteger takes integer pTable,integer pKey,unit u returns nothing
    call SaveUnitHandle(YDHT,pTable,pKey,u)
endfunction
function YDWESaveUnitByString takes string pTable,string pKey,unit u returns nothing
    call SaveUnitHandle(YDHT,StringHash(pTable),StringHash(pKey),u)
endfunction
function YDWEGetUnitByInteger takes integer pTable,integer pKey returns unit
    return LoadUnitHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetUnitByString takes string pTable,string pKey returns unit
    return LoadUnitHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert UnitID
function YDWESaveUnitIDByInteger takes integer pTable,integer pKey,integer uid returns nothing
    call SaveInteger(YDHT,pTable,pKey,uid)
endfunction
function YDWESaveUnitIDByString takes string pTable,string pKey,integer uid returns nothing
    call SaveInteger(YDHT,StringHash(pTable),StringHash(pKey),uid)
endfunction
function YDWEGetUnitIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT,pTable,pKey)
endfunction
function YDWEGetUnitIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert AbilityID
function YDWESaveAbilityIDByInteger takes integer pTable,integer pKey,integer abid returns nothing
    call SaveInteger(YDHT,pTable,pKey,abid)
endfunction
function YDWESaveAbilityIDByString takes string pTable,string pKey,integer abid returns nothing
    call SaveInteger(YDHT,StringHash(pTable),StringHash(pKey),abid)
endfunction
function YDWEGetAbilityIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT,pTable,pKey)
endfunction
function YDWEGetAbilityIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Player
function YDWESavePlayerByInteger takes integer pTable,integer pKey,player p returns nothing
    call SavePlayerHandle(YDHT,pTable,pKey,p)
endfunction
function YDWESavePlayerByString takes string pTable,string pKey,player p returns nothing
    call SavePlayerHandle(YDHT,StringHash(pTable),StringHash(pKey),p)
endfunction
function YDWEGetPlayerByInteger takes integer pTable,integer pKey returns player
    return LoadPlayerHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetPlayerByString takes string pTable,string pKey returns player
    return LoadPlayerHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Item
function YDWESaveItemByInteger takes integer pTable,integer pKey,item it returns nothing
    call SaveItemHandle(YDHT,pTable,pKey,it)
endfunction
function YDWESaveItemByString takes string pTable,string pKey,item it returns nothing
    call SaveItemHandle(YDHT,StringHash(pTable),StringHash(pKey),it)
endfunction
function YDWEGetItemByInteger takes integer pTable,integer pKey returns item
    return LoadItemHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetItemByString takes string pTable,string pKey returns item
    return LoadItemHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert ItemID
function YDWESaveItemIDByInteger takes integer pTable,integer pKey,integer itid returns nothing
    call SaveInteger(YDHT,pTable,pKey,itid)
endfunction
function YDWESaveItemIDByString takes string pTable,string pKey,integer itid returns nothing
    call SaveInteger(YDHT,StringHash(pTable),StringHash(pKey),itid)
endfunction
function YDWEGetItemIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT,pTable,pKey)
endfunction
function YDWEGetItemIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Timer
function YDWESaveTimerByInteger takes integer pTable,integer pKey,timer t returns nothing
    call SaveTimerHandle(YDHT,pTable,pKey,t)
endfunction
function YDWESaveTimerByString takes string pTable,string pKey,timer t returns nothing
    call SaveTimerHandle(YDHT,StringHash(pTable),StringHash(pKey),t)
endfunction
function YDWEGetTimerByInteger takes integer pTable,integer pKey returns timer
    return LoadTimerHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTimerByString takes string pTable,string pKey returns timer
    return LoadTimerHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Trigger
function YDWESaveTriggerByInteger takes integer pTable,integer pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT,pTable,pKey,trg)
endfunction
function YDWESaveTriggerByString takes string pTable,string pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT,StringHash(pTable),StringHash(pKey),trg)
endfunction
function YDWEGetTriggerByInteger takes integer pTable,integer pKey returns trigger
    return LoadTriggerHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTriggerByString takes string pTable,string pKey returns trigger
    return LoadTriggerHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Location
function YDWESaveLocationByInteger takes integer pTable,integer pKey,location pt returns nothing
    call SaveLocationHandle(YDHT,pTable,pKey,pt)
endfunction
function YDWESaveLocationByString takes string pTable,string pKey,location pt returns nothing
    call SaveLocationHandle(YDHT,StringHash(pTable),StringHash(pKey),pt)
endfunction
function YDWEGetLocationByInteger takes integer pTable,integer pKey returns location
    return LoadLocationHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetLocationByString takes string pTable,string pKey returns location
    return LoadLocationHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Group
function YDWESaveGroupByInteger takes integer pTable,integer pKey,group g returns nothing
    call SaveGroupHandle(YDHT,pTable,pKey,g)
endfunction
function YDWESaveGroupByString takes string pTable,string pKey,group g returns nothing
    call SaveGroupHandle(YDHT,StringHash(pTable),StringHash(pKey),g)
endfunction
function YDWEGetGroupByInteger takes integer pTable,integer pKey returns group
    return LoadGroupHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetGroupByString takes string pTable,string pKey returns group
    return LoadGroupHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Multiboard
function YDWESaveMultiboardByInteger takes integer pTable,integer pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT,pTable,pKey,m)
endfunction
function YDWESaveMultiboardByString takes string pTable,string pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT,StringHash(pTable),StringHash(pKey),m)
endfunction
function YDWEGetMultiboardByInteger takes integer pTable,integer pKey returns multiboard
    return LoadMultiboardHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetMultiboardByString takes string pTable,string pKey returns multiboard
    return LoadMultiboardHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert MultiboardItem
function YDWESaveMultiboardItemByInteger takes integer pTable,integer pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT,pTable,pKey,mt)
endfunction
function YDWESaveMultiboardItemByString takes string pTable,string pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT,StringHash(pTable),StringHash(pKey),mt)
endfunction
function YDWEGetMultiboardItemByInteger takes integer pTable,integer pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetMultiboardItemByString takes string pTable,string pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert TextTag
function YDWESaveTextTagByInteger takes integer pTable,integer pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT,pTable,pKey,tt)
endfunction
function YDWESaveTextTagByString takes string pTable,string pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT,StringHash(pTable),StringHash(pKey),tt)
endfunction
function YDWEGetTextTagByInteger takes integer pTable,integer pKey returns texttag
    return LoadTextTagHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTextTagByString takes string pTable,string pKey returns texttag
    return LoadTextTagHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Lightning
function YDWESaveLightningByInteger takes integer pTable,integer pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT,pTable,pKey,ln)
endfunction
function YDWESaveLightningByString takes string pTable,string pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT,StringHash(pTable),StringHash(pKey),ln)
endfunction
function YDWEGetLightningByInteger takes integer pTable,integer pKey returns lightning
    return LoadLightningHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetLightningByString takes string pTable,string pKey returns lightning
    return LoadLightningHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Region
function YDWESaveRegionByInteger takes integer pTable,integer pKey,region rn returns nothing
    call SaveRegionHandle(YDHT,pTable,pKey,rn)
endfunction
function YDWESaveRegionByString takes string pTable,string pKey,region rt returns nothing
    call SaveRegionHandle(YDHT,StringHash(pTable),StringHash(pKey),rt)
endfunction
function YDWEGetRegionByInteger takes integer pTable,integer pKey returns region
    return LoadRegionHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetRegionByString takes string pTable,string pKey returns region
    return LoadRegionHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Rect
function YDWESaveRectByInteger takes integer pTable,integer pKey,rect rn returns nothing
    call SaveRectHandle(YDHT,pTable,pKey,rn)
endfunction
function YDWESaveRectByString takes string pTable,string pKey,rect rt returns nothing
    call SaveRectHandle(YDHT,StringHash(pTable),StringHash(pKey),rt)
endfunction
function YDWEGetRectByInteger takes integer pTable,integer pKey returns rect
    return LoadRectHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetRectByString takes string pTable,string pKey returns rect
    return LoadRectHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Leaderboard
function YDWESaveLeaderboardByInteger takes integer pTable,integer pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT,pTable,pKey,lb)
endfunction
function YDWESaveLeaderboardByString takes string pTable,string pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT,StringHash(pTable),StringHash(pKey),lb)
endfunction
function YDWEGetLeaderboardByInteger takes integer pTable,integer pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetLeaderboardByString takes string pTable,string pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Effect
function YDWESaveEffectByInteger takes integer pTable,integer pKey,effect e returns nothing
    call SaveEffectHandle(YDHT,pTable,pKey,e)
endfunction
function YDWESaveEffectByString takes string pTable,string pKey,effect e returns nothing
    call SaveEffectHandle(YDHT,StringHash(pTable),StringHash(pKey),e)
endfunction
function YDWEGetEffectByInteger takes integer pTable,integer pKey returns effect
    return LoadEffectHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetEffectByString takes string pTable,string pKey returns effect
    return LoadEffectHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert Destructable
function YDWESaveDestructableByInteger takes integer pTable,integer pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT,pTable,pKey,da)
endfunction
function YDWESaveDestructableByString takes string pTable,string pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT,StringHash(pTable),StringHash(pKey),da)
endfunction
function YDWEGetDestructableByInteger takes integer pTable,integer pKey returns destructable
    return LoadDestructableHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetDestructableByString takes string pTable,string pKey returns destructable
    return LoadDestructableHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert triggercondition
function YDWESaveTriggerConditionByInteger takes integer pTable,integer pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT,pTable,pKey,tc)
endfunction
function YDWESaveTriggerConditionByString takes string pTable,string pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT,StringHash(pTable),StringHash(pKey),tc)
endfunction
function YDWEGetTriggerConditionByInteger takes integer pTable,integer pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTriggerConditionByString takes string pTable,string pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert triggeraction
function YDWESaveTriggerActionByInteger takes integer pTable,integer pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT,pTable,pKey,ta)
endfunction
function YDWESaveTriggerActionByString takes string pTable,string pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT,StringHash(pTable),StringHash(pKey),ta)
endfunction
function YDWEGetTriggerActionByInteger takes integer pTable,integer pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTriggerActionByString takes string pTable,string pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert event
function YDWESaveTriggerEventByInteger takes integer pTable,integer pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT,pTable,pKey,et)
endfunction
function YDWESaveTriggerEventByString takes string pTable,string pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT,StringHash(pTable),StringHash(pKey),et)
endfunction
function YDWEGetTriggerEventByInteger takes integer pTable,integer pKey returns event
    return LoadTriggerEventHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTriggerEventByString takes string pTable,string pKey returns event
    return LoadTriggerEventHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert force
function YDWESaveForceByInteger takes integer pTable,integer pKey,force fc returns nothing
    call SaveForceHandle(YDHT,pTable,pKey,fc)
endfunction
function YDWESaveForceByString takes string pTable,string pKey,force fc returns nothing
    call SaveForceHandle(YDHT,StringHash(pTable),StringHash(pKey),fc)
endfunction
function YDWEGetForceByInteger takes integer pTable,integer pKey returns force
    return LoadForceHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetForceByString takes string pTable,string pKey returns force
    return LoadForceHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert boolexpr
function YDWESaveBoolexprByInteger takes integer pTable,integer pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT,pTable,pKey,be)
endfunction
function YDWESaveBoolexprByString takes string pTable,string pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT,StringHash(pTable),StringHash(pKey),be)
endfunction
function YDWEGetBoolexprByInteger takes integer pTable,integer pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetBoolexprByString takes string pTable,string pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert sound
function YDWESaveSoundByInteger takes integer pTable,integer pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT,pTable,pKey,sd)
endfunction
function YDWESaveSoundByString takes string pTable,string pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT,StringHash(pTable),StringHash(pKey),sd)
endfunction
function YDWEGetSoundByInteger takes integer pTable,integer pKey returns sound
    return LoadSoundHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetSoundByString takes string pTable,string pKey returns sound
    return LoadSoundHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert timerdialog
function YDWESaveTimerDialogByInteger takes integer pTable,integer pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT,pTable,pKey,td)
endfunction
function YDWESaveTimerDialogByString takes string pTable,string pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT,StringHash(pTable),StringHash(pKey),td)
endfunction
function YDWEGetTimerDialogByInteger takes integer pTable,integer pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTimerDialogByString takes string pTable,string pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert trackable
function YDWESaveTrackableByInteger takes integer pTable,integer pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT,pTable,pKey,ta)
endfunction
function YDWESaveTrackableByString takes string pTable,string pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT,StringHash(pTable),StringHash(pKey),ta)
endfunction
function YDWEGetTrackableByInteger takes integer pTable,integer pKey returns trackable
    return LoadTrackableHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetTrackableByString takes string pTable,string pKey returns trackable
    return LoadTrackableHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert dialog
function YDWESaveDialogByInteger takes integer pTable,integer pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT,pTable,pKey,d)
endfunction
function YDWESaveDialogByString takes string pTable,string pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT,StringHash(pTable),StringHash(pKey),d)
endfunction
function YDWEGetDialogByInteger takes integer pTable,integer pKey returns dialog
    return LoadDialogHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetDialogByString takes string pTable,string pKey returns dialog
    return LoadDialogHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert button
function YDWESaveButtonByInteger takes integer pTable,integer pKey,button bt returns nothing
    call SaveButtonHandle(YDHT,pTable,pKey,bt)
endfunction
function YDWESaveButtonByString takes string pTable,string pKey,button bt returns nothing
    call SaveButtonHandle(YDHT,StringHash(pTable),StringHash(pKey),bt)
endfunction
function YDWEGetButtonByInteger takes integer pTable,integer pKey returns button
    return LoadButtonHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetButtonByString takes string pTable,string pKey returns button
    return LoadButtonHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert quest
function YDWESaveQuestByInteger takes integer pTable,integer pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT,pTable,pKey,qt)
endfunction
function YDWESaveQuestByString takes string pTable,string pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT,StringHash(pTable),StringHash(pKey),qt)
endfunction
function YDWEGetQuestByInteger takes integer pTable,integer pKey returns quest
    return LoadQuestHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetQuestByString takes string pTable,string pKey returns quest
    return LoadQuestHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
//Covert questitem
function YDWESaveQuestItemByInteger takes integer pTable,integer pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT,pTable,pKey,qi)
endfunction
function YDWESaveQuestItemByString takes string pTable,string pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT,StringHash(pTable),StringHash(pKey),qi)
endfunction
function YDWEGetQuestItemByInteger takes integer pTable,integer pKey returns questitem
    return LoadQuestItemHandle(YDHT,pTable,pKey)
endfunction
function YDWEGetQuestItemByString takes string pTable,string pKey returns questitem
    return LoadQuestItemHandle(YDHT,StringHash(pTable),StringHash(pKey))
endfunction
function YDWES2I takes string s returns integer
    return StringHash(s)
endfunction
function YDWESaveAbilityHandleBJ takes integer AbilityID, integer key, integer missionKey, hashtable table returns nothing
    call SaveInteger(table,missionKey,key,AbilityID)
endfunction
function YDWESaveAbilityHandle takes hashtable table, integer parentKey, integer childKey, integer AbilityID returns nothing
    call SaveInteger(table,parentKey,childKey,AbilityID)
endfunction
function YDWELoadAbilityHandleBJ takes integer key, integer missionKey, hashtable table returns integer
    return LoadInteger(table,missionKey,key)
endfunction
function YDWELoadAbilityHandle takes hashtable table, integer parentKey, integer childKey returns integer
    return LoadInteger(table,parentKey,childKey)
endfunction
globals
	string bj_AllString=".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
//全局系统变量
    unit bj_lastAbilityCastingUnit=null
    unit bj_lastAbilityTargetUnit=null
    unit bj_lastPoolAbstractedUnit=null
    unitpool bj_lastCreatedUnitPool=null
    item bj_lastPoolAbstractedItem=null
    itempool bj_lastCreatedItemPool=null
    attacktype bj_lastSetAttackType = ATTACK_TYPE_NORMAL
    damagetype bj_lastSetDamageType = DAMAGE_TYPE_NORMAL
    weapontype bj_lastSetWeaponType = WEAPON_TYPE_WHOKNOWS
    real yd_MapMaxX = 0
    real yd_MapMinX = 0
    real yd_MapMaxY = 0
    real yd_MapMinY = 0
    private string array yd_PlayerColor
endglobals
//===========================================================================
//返回参数
//===========================================================================
//地图边界判断
function YDWECoordinateX takes real x returns real
    return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
endfunction
function YDWECoordinateY takes real y returns real
    return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
endfunction
//两个单位之间的距离
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    return SquareRoot((GetUnitX(a)-GetUnitX(b))*(GetUnitX(a)-GetUnitX(b))+(GetUnitY(a)-GetUnitY(b))*(GetUnitY(a)-GetUnitY(b)))
endfunction
//两个单位之间的角度
function YDWEAngleBetweenUnits takes unit fromUnit, unit toUnit returns real
    return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
endfunction
//生成区域
function YDWEGetRect takes real x,real y,real width, real height returns rect
    return Rect( x - width*0.5, y - height*0.5, x + width*0.5, y + height*0.5 )
endfunction
//===========================================================================
//设置单位可以飞行
//===========================================================================
function YDWEFlyEnable takes unit u returns nothing
    call UnitAddAbility(u,'Amrf')
    call UnitRemoveAbility(u,'Amrf')
endfunction
//===========================================================================
//字符窜与ID转换
//===========================================================================
function YDWEId2S takes integer value returns string
    local string charMap=bj_AllString
    local string result = ""
    local integer remainingValue = value
    local integer charValue
    local integer byteno
    set byteno = 0
    loop
        set charValue = ModuloInteger(remainingValue, 256)
        set remainingValue = remainingValue / 256
        set result = SubString(charMap, charValue, charValue + 1) + result
        set byteno = byteno + 1
        exitwhen byteno == 4
    endloop
    return result
endfunction
function YDWES2Id takes string targetstr returns integer
    local string originstr=bj_AllString
    local integer strlength=StringLength(targetstr)
    local integer a=0 //分部当前数字
local integer b=0 //当前处理字
local integer numx=1 //位权
local integer result=0
    loop
    exitwhen b>strlength-1
        set numx=R2I(Pow(256,strlength-1-b))
        set a=1
        loop
            exitwhen a>255
            if SubString(targetstr,b,b+1)==SubString(originstr,a,a+1) then
                set result=result+a*numx
                set a=256
            endif
            set a=a+1
        endloop
        set b=b+1
    endloop
    return result
endfunction
function YDWES2UnitId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function YDWES2ItemId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function GetLastAbilityCastingUnit takes nothing returns unit
    return bj_lastAbilityCastingUnit
endfunction
function GetLastAbilityTargetUnit takes nothing returns unit
    return bj_lastAbilityTargetUnit
endfunction
function YDWESetMapLimitCoordinate takes real MinX,real MaxX,real MinY,real MaxY returns nothing
    set yd_MapMaxX=MaxX
    set yd_MapMinX=MinX
    set yd_MapMaxY=MaxY
    set yd_MapMinY=MinY
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//YDWE特殊技能结束事件 
globals
    private trigger array AbilityCastingOverEventQueue
    private integer array AbilityCastingOverEventType
    private integer AbilityCastingOverEventNumber = 0
endglobals
function YDWESyStemAbilityCastingOverTriggerAction takes unit hero, integer index returns nothing
	local integer i = 0
    loop
        exitwhen i >= AbilityCastingOverEventNumber
        if AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit = hero 
			if AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(AbilityCastingOverEventQueue[i])
			endif
		endif
        set i = i + 1 
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing 
	set AbilityCastingOverEventQueue[AbilityCastingOverEventNumber] = trg
	set AbilityCastingOverEventType[AbilityCastingOverEventNumber] = index
	set AbilityCastingOverEventNumber = AbilityCastingOverEventNumber + 1 
endfunction 
//===========================================================================
//系统函数完善
//===========================================================================
function YDWECreateUnitPool takes nothing returns nothing
    set bj_lastCreatedUnitPool=CreateUnitPool()
endfunction
function YDWEPlaceRandomUnit takes unitpool up,player p,real x,real y,real face returns nothing //unitpool,player,real,real,real
set bj_lastPoolAbstractedUnit=PlaceRandomUnit(up,p,x,y,face)
endfunction
function YDWEGetLastUnitPool takes nothing returns unitpool
    return bj_lastCreatedUnitPool
endfunction
function YDWEGetLastPoolAbstractedUnit takes nothing returns unit
    return bj_lastPoolAbstractedUnit
endfunction
function YDWECreateItemPool takes nothing returns nothing
    set bj_lastCreatedItemPool=CreateItemPool()
endfunction
function YDWEPlaceRandomItem takes itempool ip,real x,real y returns nothing //unitpool,player,real,real,real
set bj_lastPoolAbstractedItem=PlaceRandomItem(ip,x,y)
endfunction
function YDWEGetLastItemPool takes nothing returns itempool
    return bj_lastCreatedItemPool
endfunction
function YDWEGetLastPoolAbstractedItem takes nothing returns item
    return bj_lastPoolAbstractedItem
endfunction
function YDWESetAttackDamageWeaponType takes attacktype at,damagetype dt,weapontype wt returns nothing
    set bj_lastSetAttackType=at
    set bj_lastSetDamageType=dt
    set bj_lastSetWeaponType=wt
endfunction
//unitpool bj_lastCreatedPool=null
//unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString takes player p, string s returns string
    return yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
endfunction
//===========================================================================
//===========================================================================
//系统函数补充
//===========================================================================
//===========================================================================
function YDWEGetUnitItemSoftId takes unit hero,item it returns integer
    local integer i = 0
    loop
         exitwhen i > 5
         if UnitItemInSlot(hero, i) == it then
            return i + 1
         endif
         set i = i + 1
    endloop
    return 0
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//===========================================================================
//显示版本
function YDWEVersion_Display takes nothing returns boolean
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30,"|cFF1E90FF当前编辑器版本为： |r|cFF00FF00KKWE " + "1.0.0.2069")
    return false
endfunction
function YDWEVersion_Init takes nothing returns nothing
    local trigger t = CreateTrigger()
    local integer i = 0
    loop
        exitwhen i == 12
        call TriggerRegisterPlayerChatEvent(t, Player(i), "KKWE Version", true)
        set i = i + 1
    endloop
    call TriggerAddCondition(t, Condition(function YDWEVersion_Display))
    set t = null
endfunction
function InitializeYD takes nothing returns nothing
     set YDHT=InitHashtable() 
	//=================设置变量=====================
	set yd_MapMinX = GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	set yd_MapMinY = GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	set yd_MapMaxX = GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	set yd_MapMaxY = GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	
    set yd_PlayerColor [0] = "|cFFFF0303"
    set yd_PlayerColor [1] = "|cFF0042FF"
    set yd_PlayerColor [2] = "|cFF1CE6B9"
    set yd_PlayerColor [3] = "|cFF540081"
    set yd_PlayerColor [4] = "|cFFFFFC01"
    set yd_PlayerColor [5] = "|cFFFE8A0E"
    set yd_PlayerColor [6] = "|cFF20C000"
    set yd_PlayerColor [7] = "|cFFE55BB0"
    set yd_PlayerColor [8] = "|cFF959697"
    set yd_PlayerColor [9] = "|cFF7EBFF1"
    set yd_PlayerColor[10] = "|cFF106246"
    set yd_PlayerColor[11] = "|cFF4E2A04"
    set yd_PlayerColor[12] = "|cFF282828"
    set yd_PlayerColor[13] = "|cFF282828"
    set yd_PlayerColor[14] = "|cFF282828"
    set yd_PlayerColor[15] = "|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction
endlibrary
library YDWEEnumDestructablesInCircleBJFilterNull
function YDWEEnumDestructablesInCircleBJFilterNull takes nothing returns boolean
    local real dx = GetDestructableX(GetFilterDestructable()) - GetLocationX(bj_enumDestructableCenter)
    local real dy = GetDestructableY(GetFilterDestructable()) - GetLocationY(bj_enumDestructableCenter)
    return dx * dx + dy * dy <= bj_enumDestructableRadius * bj_enumDestructableRadius
endfunction
endlibrary
library YDWEEnumDestructablesInCircleBJNull requires YDWEEnumDestructablesInCircleBJFilterNull
function YDWEEnumDestructablesInCircleBJNull takes real radius, location loc, code actionFunc returns nothing
    local rect r
    local real centerX = GetLocationX(loc)
    local real centerY = GetLocationY(loc)
    if radius >= 0 then
        set bj_enumDestructableCenter = loc
        set bj_enumDestructableRadius = radius
        set r = Rect(centerX - radius, centerY - radius, centerX + radius, centerY + radius)
        call EnumDestructablesInRect(r, Filter(function YDWEEnumDestructablesInCircleBJFilterNull), actionFunc)
        call RemoveRect(r)
    	set r = null
    endif
endfunction
endlibrary
library YDWETriggerRegisterEnterRectSimpleNull
globals
    region yd_NullTempRegion
endglobals
function YDWETriggerRegisterEnterRectSimpleNull takes trigger trig, rect r returns event
    local region rectRegion = CreateRegion()
    call RegionAddRect(rectRegion, r)
    set yd_NullTempRegion = rectRegion
    set rectRegion = null
    return TriggerRegisterEnterRegion(trig, yd_NullTempRegion, null)
endfunction
endlibrary
//===========================================================================
//系统-TimerSystem
//===========================================================================
library YDWETimerSystem initializer Init requires YDTriggerSaveLoadSystem
globals
	private integer CurrentTime
	private integer CurrentIndex
    private integer TaskListHead
    private integer TaskListIdleHead
    private integer TaskListIdleMax
    private integer array TaskListIdle
    private integer array TaskListNext
    private integer array TaskListTime
    private trigger array TaskListProc //函数组
private trigger fnRemoveUnit //移除单位函数
private trigger fnDestroyTimer //摧毁计时器
private trigger fnRemoveItem //移除物品
private trigger fnDestroyEffect //删除特效
private trigger fnDestroyLightning //删除删掉特效
private trigger fnRunTrigger //运行触发器
private timer Timer //最小时间计时器  系统计时器  用于一些需要精确计时的功能
private integer TimerHandle
	private integer TimerSystem_RunIndex = 0
endglobals
private function NewTaskIndex takes nothing returns integer
	local integer h = TaskListIdleHead
	if TaskListIdleHead < 0 then
		if TaskListIdleMax >= 8000 then
			debug call BJDebugMsg("中心计时器任务队列溢出！")
			return 8100
		else
			set TaskListIdleMax = TaskListIdleMax + 1
			return TaskListIdleMax
		endif
	endif
	set TaskListIdleHead = TaskListIdle[h]
	return h
endfunction
private function DeleteTaskIndex takes integer index returns nothing
	set TaskListIdle[index] = TaskListIdleHead
	set TaskListIdleHead = index
endfunction
//该函数序列处理
private function NewTask takes real time, trigger proc returns integer
	local integer index = NewTaskIndex()
	local integer h = TaskListHead
	local integer t = R2I(100.*time) + CurrentTime
	local integer p
	set TaskListProc[index] = proc
	set TaskListTime[index] = t
	loop
		set p = TaskListNext[h]
		if p < 0 or TaskListTime[p] >= t then
		//	call BJDebugMsg("NewTask:"+I2S(index))
			set TaskListNext[h] = index
			set TaskListNext[index] = p
			return index
		endif
		set h = p
	endloop
	return index
endfunction
function YDWETimerSystemNewTask takes real time, trigger proc returns integer
	return NewTask(time, proc)
endfunction
function YDWETimerSystemGetCurrentTask takes nothing returns integer
	return CurrentIndex
endfunction
//删除单位
private function RemoveUnit_CallBack takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDHT, TimerHandle, CurrentIndex))
    call RemoveSavedHandle(YDHT, TimerHandle, CurrentIndex)
endfunction
function YDWETimerRemoveUnit takes real time, unit u returns nothing
    call SaveUnitHandle(YDHT, TimerHandle, NewTask(time, fnRemoveUnit), u)
endfunction
//摧毁计时器
private function DestroyTimer_CallBack takes nothing returns nothing
    call DestroyTimer(LoadTimerHandle(YDHT, TimerHandle, CurrentIndex))
    call RemoveSavedHandle(YDHT, TimerHandle, CurrentIndex)
endfunction
function YDWETimerDestroyTimer takes real time, timer t returns nothing
    call SaveTimerHandle(YDHT, TimerHandle, NewTask(time, fnDestroyTimer), t)
endfunction
//删除物品
private function RemoveItem_CallBack takes nothing returns nothing
    call RemoveItem(LoadItemHandle(YDHT, TimerHandle, CurrentIndex))
    call RemoveSavedHandle(YDHT, TimerHandle, CurrentIndex)
endfunction
function YDWETimerRemoveItem takes real time, item it returns nothing
    call SaveItemHandle(YDHT, TimerHandle, NewTask(time, fnRemoveItem), it)
endfunction
//删除特效
private function DestroyEffect_CallBack takes nothing returns nothing
    call DestroyEffect(LoadEffectHandle(YDHT, TimerHandle, CurrentIndex))
    call RemoveSavedHandle(YDHT, TimerHandle, CurrentIndex)
endfunction
function YDWETimerDestroyEffect takes real time, effect e returns nothing
    call SaveEffectHandle(YDHT, TimerHandle, NewTask(time, fnDestroyEffect), e)
endfunction
//删除闪电特效
private function DestroyLightning_CallBack takes nothing returns nothing
    call DestroyLightning(LoadLightningHandle(YDHT, TimerHandle, CurrentIndex))
    call RemoveSavedHandle(YDHT, TimerHandle, CurrentIndex)
endfunction
function YDWETimerDestroyLightning takes real time, lightning lt returns nothing
	local integer i = NewTask(time, fnDestroyLightning)
    call SaveLightningHandle(YDHT, TimerHandle, i, lt)
endfunction
//运行触发器
private function RunTrigger_CallBack takes nothing returns nothing
    call TriggerExecute(LoadTriggerHandle(YDHT, TimerHandle, CurrentIndex))
    call RemoveSavedHandle(YDHT, TimerHandle, CurrentIndex)
endfunction
function YDWETimerRunTrigger takes real time, trigger trg returns nothing
    call SaveTriggerHandle(YDHT, TimerHandle, NewTask(time, fnRunTrigger), trg)
endfunction
//删除漂浮文字
function YDWETimerDestroyTextTag takes real time, texttag tt returns nothing
    local integer N=0
    local integer i=0
    if time <= 0 then
        set time = 0.01
    endif
    call SetTextTagPermanent(tt,false)
    call SetTextTagLifespan(tt,time)
    call SetTextTagFadepoint(tt,time)
endfunction
//中心计时器主函数
private function Main takes nothing returns nothing
	local integer h = TaskListHead
	local integer p
	loop
		set CurrentIndex = TaskListNext[h]
		exitwhen CurrentIndex < 0 or CurrentTime < TaskListTime[CurrentIndex]
		//call BJDebugMsg("Task:"+I2S(CurrentIndex))
		call TriggerEvaluate(TaskListProc[CurrentIndex])
		call DeleteTaskIndex(CurrentIndex)
		set TaskListNext[h] = TaskListNext[CurrentIndex]
	endloop
	set CurrentTime = CurrentTime + 1
endfunction
//初始化函数
private function Init takes nothing returns nothing
    set Timer = CreateTimer()
	set TimerHandle	= GetHandleId( Timer)
	set CurrentTime = 0
	set TaskListHead = 0
	set TaskListNext[0] = -1
	set TaskListIdleHead = 1
	set TaskListIdleMax = 1
	set TaskListIdle[1] = -1
	
	set fnRemoveUnit = CreateTrigger()
	set fnDestroyTimer = CreateTrigger()
	set fnRemoveItem = CreateTrigger()
	set fnDestroyEffect = CreateTrigger()
	set fnDestroyLightning = CreateTrigger()
	set fnRunTrigger = CreateTrigger()
	call TriggerAddCondition(fnRemoveUnit, Condition(function RemoveUnit_CallBack))
	call TriggerAddCondition(fnDestroyTimer, Condition(function DestroyTimer_CallBack))
	call TriggerAddCondition(fnRemoveItem, Condition(function RemoveItem_CallBack))
	call TriggerAddCondition(fnDestroyEffect, Condition(function DestroyEffect_CallBack))
	call TriggerAddCondition(fnDestroyLightning, Condition(function DestroyLightning_CallBack))
	call TriggerAddCondition(fnRunTrigger, Condition(function RunTrigger_CallBack))
	
    call TimerStart(Timer, 0.01, true, function Main)
endfunction
//循环类仍用独立计时器
function YDWETimerSystemGetRunIndex takes nothing returns integer
    return TimerSystem_RunIndex
endfunction
private function RunPeriodicTriggerFunction takes nothing returns nothing
    local integer tid = GetHandleId( GetExpiredTimer())
    local trigger trg = LoadTriggerHandle(YDHT, tid, $D0001)
	call SaveInteger(YDHT, StringHash( I2S(GetHandleId( trg))), StringHash( "RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set trg = null
endfunction
private function RunPeriodicTriggerFunctionByTimes takes nothing returns nothing
    local integer tid = GetHandleId( GetExpiredTimer())
    local trigger trg = LoadTriggerHandle(YDHT, tid, $D0001)
    local integer times = LoadInteger(YDHT, tid, $D0003)
	call SaveInteger(YDHT, StringHash( I2S(GetHandleId( trg))), StringHash( "RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set times = times - 1
    if times > 0 then
		call SaveInteger(YDHT, tid, $D0003, times)
      else
        call DestroyTimer(GetExpiredTimer())
        call FlushChildHashtable(YDHT, tid)
    endif
    set trg = null
endfunction
function YDWETimerRunPeriodicTrigger takes real timeout, trigger trg, boolean b, integer times, integer data returns nothing
    local timer t
    local integer tid
    local integer index = 0
    if timeout < 0 then
        return
      else
        set t = CreateTimer()
		set tid = GetHandleId( t)
    endif
    set TimerSystem_RunIndex = TimerSystem_RunIndex + 1
	call SaveTriggerHandle(YDHT, tid, $D0001, trg)
	call SaveInteger(YDHT, tid, $D0002, TimerSystem_RunIndex)
	set index = LoadInteger(YDHT, GetHandleId( trg), 'YDTS'+data)
    set index = index + 1
	call SaveInteger(YDHT, GetHandleId( trg), 'YDTS'+data, index)
	call SaveTimerHandle(YDHT, GetHandleId( trg), ('YDTS'+data)*index, t)
	
    if b == false then
		call SaveInteger(YDHT, tid, $D0003, times)
        call TimerStart(t, timeout, true, function RunPeriodicTriggerFunctionByTimes)
      else
        call TimerStart(t, timeout, true, function RunPeriodicTriggerFunction)
    endif
    set t = null
endfunction
function YDWETimerRunPeriodicTriggerOver takes trigger trg, integer data returns nothing
	local integer trgid = GetHandleId( trg)
    local integer index = LoadInteger(YDHT, trgid, 'YDTS'+data)
    local timer t
    loop
        exitwhen index <= 0
        set t = LoadTimerHandle(YDHT, trgid, ('YDTS'+data)*index)
        call DestroyTimer(t)
        call FlushChildHashtable(YDHT, GetHandleId( t))
		call RemoveSavedHandle(YDHT, trgid, ('YDTS'+data)*index)
        set index = index - 1
    endloop
	
    call RemoveSavedInteger(YDHT, trgid, 'YDTS'+data)
    set t = null
endfunction
endlibrary
/**/
