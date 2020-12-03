globals
//globals from BJObjectId:
constant boolean LIBRARY_BJObjectId=true
//endglobals from BJObjectId
//globals from NokladrLib:
constant boolean LIBRARY_NokladrLib=true
constant string GOLD=      "|cffffcc00"
constant string WHITE=     "|cffffffff"
constant string RED=       "|cffff0202"
constant string BLUE=      "|cff0041ff"
constant string TEAL=      "|cff1be5b8"
constant string PURPLE=    "|cff530080"
constant string YELLOW=    "|cffffff00"
constant string ORANGE=    "|cfffe890D"
constant string GREEN=     "|cff1fbf00"
constant string PINK=      "|cffe45aaa"
constant string GRAY=      "|cff949596"
constant string LB=        "|cff7dbef1"
constant string DG=        "|cff0f6145"
constant string BROWN=     "|cff4d2903"
// processed:         integer array time[3] // time[0] - секунды, time[1] - минуты, time[2] - часы
//endglobals from NokladrLib
//globals from ReviveUnit:
constant boolean LIBRARY_ReviveUnit=true
constant integer ReviveUnit___DUMMY= 'eRez'
constant integer ReviveUnit___RESURRECT= 'URez'
unit ReviveUnit___reviver
real ReviveUnit___rx
real ReviveUnit___ry
//endglobals from ReviveUnit
//globals from Table:
constant boolean LIBRARY_Table=true
integer Table___less= 0
integer Table___more= 8190
        //Configure it if you use more than 8190 "key" variables in your map (this will never happen though).
    
hashtable Table___ht= InitHashtable()
constant integer Table___sizeK=4
constant integer Table___listK=5
//endglobals from Table
//globals from MIXLib:
constant boolean LIBRARY_MIXLib=true
integer pdb
// processed:         DB array MIXLib___dbarr[8]
//endglobals from MIXLib
//globals from RegisterNativeEvent:
constant boolean LIBRARY_RegisterNativeEvent=true
integer RegisterNativeEvent___eventIndex= 500
//endglobals from RegisterNativeEvent
//globals from RegisterPlayerUnitEvent:
constant boolean LIBRARY_RegisterPlayerUnitEvent=true
//endglobals from RegisterPlayerUnitEvent
//globals from UnitRecycler:
constant boolean LIBRARY_UnitRecycler=true
    
constant player UnitRecycler___OWNER= Player(15)
    
constant boolean UnitRecycler___AUTO_RECYCLE_DEAD= true
    
constant integer UnitRecycler___ANGLE_COUNT= 8

constant real UnitRecycler___ANGLE_INTERVAL= 360.00 / UnitRecycler___ANGLE_COUNT
constant real UnitRecycler___HALF_INTERVAL= UnitRecycler___ANGLE_INTERVAL / 2.00
real UnitRecycler___unitCampX
real UnitRecycler___unitCampY
//endglobals from UnitRecycler
//globals from ResourcePreloader:
constant boolean LIBRARY_ResourcePreloader=true
        
integer ResourcePreloader_PRELOAD_UNIT_TYPE_ID= 'uloc'
        
player ResourcePreloader_PRELOAD_UNIT_OWNER= Player(PLAYER_NEUTRAL_PASSIVE)
        
real ResourcePreloader_PRELOAD_UNIT_Y_BOUNDS_EXTENSION= 0.00
//endglobals from ResourcePreloader
boolean IsDevInGame= false
integer hash
constant string strVersion= "0.0.1"
constant string Version= "Test"
constant string strEmail= ( LB + "Nostaleal.ru|r" + GOLD + "@|r" + LB + "yandex.ru|r" )
constant string strBuild_Time= "8 November 2020"

leaderboard Leaderboard

constant integer finalWave= 15
constant integer numberOfMinigames= 8
constant integer base_gold= 100
constant integer base_gems= 0

constant integer incSpellrc_count= 14
constant integer count_research_for_t1= 12
constant integer count_research_for_t2= 20
constant integer max_players= 8

// processed:     integer array incSpellrc[incSpellrc_count]                                                   // Массив инкам способностей(заполнение в Main.j, function map_init)
// processed:     player array ticket_list[max_ticket_list]

    // Равкоды инкам улучшений и связанных с ними способностей
constant integer t1_research_rc= 'R018'
constant integer t2_research_rc= 'R019'
constant integer robbery_lvl3_rc= 'R023'
constant integer robbery_lvl5_rc= 'R024'
constant integer robbery_rc= 'R00J'
constant integer evforev_rc= 'R00R'
constant integer aggrgame_rc= 'R02K'
constant integer aggrgame_aura_rc= 'S000'
constant integer contr_to_pl_rc= 'R027'
constant integer goldmining_rc= 'R00F'
constant integer ticket_rc= 'R00G'
constant integer jewelry_rc= 'R00H'
constant integer deadmoney_rc= 'R00I'
constant integer contr_rc= 'R00Q'
constant integer stab_rc= 'R00S'
constant integer wait_five_minutes_rc= 'R028'
constant integer leadership_rc= 'R029'
constant integer cursed_mine_rc= 'R02I'

    // Равкоды
constant integer castle_rc= 'h01O'
constant integer most_point_kill_last_round= 'h023'
constant integer or_leadership_arena_last_round= 'h024'
constant integer big_mine_rc= 'n003'
constant integer small_mine_rc= 'n004'
constant integer flag_rc= 'n005'

    // Настройки улучшения Вклад в игрока
constant integer contr_to_pl_gold= 300
constant integer contr_to_pl_gold_mod= 100
constant integer contr_to_pl_lumber= 10
constant integer contr_to_pl_lumber_mod= 5
constant real contr_to_pl_time= 300
constant real contr_to_pl_multy= 2
    
    // Настройки улучшения Грабёж, заполнение массива в Main.j
constant integer robbery_pr_count= 7
// processed:     real array robbery_pr_f[robbery_pr_count]
// processed:     real array robbery_pr_s[robbery_pr_count]

    // Настройки улучшения Вклад
constant integer contr_gold= 200
constant integer contr_gold_mod= 100
constant integer contr_lumber= 8
constant integer contr_lumber_mod= 6
constant integer contr_percent= 150

    // Настройки улучшения Стабильность, заполнение массива в Main.j
constant integer stab_count= 7
// processed:     real array stab_time_gold[stab_count]
// processed:     real array stab_time_lumber[stab_count]
// processed:     integer array stab_gold[stab_count]
// processed:     integer array stab_lumber[stab_count]
// processed:     timer array stab_timer_gold[max_players]
// processed:     timer array stab_timer_lumber[max_players]

    // Настройки улучшения Лидерство
constant real leadership_bonus= 0.2

    // Настройки улучшения Проклятый рудник
constant integer cursed_mine_percent= 3
constant real cursed_mine_range_damage= 700
constant integer cursed_mine_count_wave= 8
constant real cursed_mine_cast_range= 468
constant real cursed_mine_damage_for_lvl= 100

    // Настройки улучшения Мёртвые деньги
constant integer deadmoney_money_for_lvl= 8

    // Настройки улучшения Драгоценные камни
constant integer jewelry_lumber_for_lvl= 1

    // Настройки улучшения Билет
constant integer max_ticket_list= 5

    // Настройки улучшения Золотодобыча, заполнение массива в Main.j
constant integer goldmining_count= 6
// processed:     integer array goldmining_main_mine[goldmining_count]
// processed:     integer array goldmining_extra_mine[goldmining_count]
// processed:     integer array goldmining_income[goldmining_count]

    // Настройки улучшения Развитие ради развития
constant real evforev_bonus_res= 0.01
constant real evforev_bonus_res_mod= 0.01

    // Настройки улучшения Агрессивная игра
    // Аура - aggrgame_aura_rc, внутри неё менять скорость боя и перемещения
boolean IsFaqActive= true
timerdialog faq_timerdialog
integer faq_vote_yes= 0
integer faq_vote_no= 0
real faq_voting_duration= 6.00
// processed:     texttag array faq_tts[4] // Плавающий текст для отображения голосования
// processed:     button array faq_buttons[2] // Кнопки в меню голосования
dialog faq_dialog= DialogCreate()
    // User-defined
real array udg_dmg_player_inflicted
real array udg_dmg_player_taken
string array udg_players_colour
real udg_dmg= 0
force udg_players_group= null
string array udg_players_name
integer udg_i= 0
integer array udg_time
group array udg_light
group udg_footrmans= null
unit array udg_footman_participant
group udg_buildings= null
integer udg_id= 0
string udg_id_save
timer udg_wave_timer= null
boolean array udg_region_status
integer udg_random= 0
boolean array udg_region_player_status
integer udg_j= 0
rect array udg_region_spawn
integer udg_k= 0
integer udg_goldmine_colour= 0
player udg_game_owner= null
integer udg_gameset_time= 0
timer udg_gameset_timer= null
timer udg_wave_end_timer= null
integer udg_wave_time= 0
group udg_wave_units= null
integer udg_wave= 0
boolean udg_wave_status= false
integer array udg_income_gold
integer array udg_income_wood
integer udg_r= 0
integer udg_g= 0
integer udg_sold_gold= 0
integer udg_sold_wood= 0
boolean udg_boss_wave= false
real udg_boss_time= 0
timer udg_boss_end_timer= null
unit udg_boss= null
group udg_id_group= null
real udg_boss_hp= 0
integer udg_boss_spell_integer= 0
boolean array udg_boss_phase
boolean udg_building_status= false
integer array udg_wave_mini
boolean udg_random_log= false
player array udg_horse_winners
boolean udg_miners_log= false
multiboard udg_scoreboard= null
integer array udg_income_goldmine_c
integer array udg_income_goldmine_l
player array udg_ticket_players
integer udg_ticket_resources= 0
real udg_ticket_gold= 0
real udg_ticket_lumber= 0
integer udg_pillage_resources= 0
player udg_pillage_player= null
real udg_pillage_lumber= 0
real udg_pillage_gold= 0
integer udg_scoreboard_limit= 0
integer udg_scoreboard_coloumns= 0
integer array udg_scoreboard_win
integer array udg_scoreboard_mini
integer array udg_scoreboard_upg
integer array udg_scoreboard_kills
real array udg_scoreboard_result
boolean udg_wave_winner= false
boolean udg_ticket= false
integer udg_p= 0
integer array udg_hide
player udg_hide_hunter= null
integer array udg_roulette_gold
integer array udg_roulette_gems
force udg_roulette_winners= null
integer udg_mini_game_max= 0
real array udg_end_result
group array udg_fastarena_group
integer array udg_fastarena_value
integer array udg_fastarena_player
integer udg_fastarena_time= 0
rect udg_FFF= null
integer udg_cycle_i= 0
integer udg_rot_P= 0
integer udg_cycle_j= 0
integer udg_rotation_value= 0
integer array udg_income_limit
force udg_income_group= null
integer udg_income_max= 0
group udg_castle_unit= null
real udg_point= 0
real array udg_fastarena_hp
real array udg_fastarena_hp_start
force udg_fastarena_players= null
player udg_vkad= null
integer array udg_vklad_timer
integer array udg_inc_max
integer array udg_inc_all
boolean udg_inc_status= false
integer udg_mode= 0
integer array udg_const_point
integer array udg_inc_ps
integer array udg_inc_pp
integer udg_gg= 0
real array udg_leader_kf
integer array udg_leader_point
integer array udg_leader_kills
player array udg_leader_player
boolean udg_leader_bool= false
integer udg_leader_num= 0
integer array udg_leader_wins
integer array udg_leader_owner
real udg_gameset_time_first= 0
unit array udg_faq_unit
boolean array udg_info
real udg_incometemp= 0
integer array udg_weather
effect udg_stormeff_eff= null
integer udg_parody_spell= 0
unit udg_parody_main= null
real udg_parody_time= 0
boolean array udg_is_casted
boolean udg_parody_game= false
player udg_mediv= null
integer array udg_changeSet

    // Generated
rect gg_rct_centreUP= null
rect gg_rct_centreDOWN= null
rect gg_rct_centreRIGHT= null
rect gg_rct_centreLEFT= null
rect gg_rct_centreCENTRE= null
rect gg_rct_player1= null
rect gg_rct_player2= null
rect gg_rct_player3= null
rect gg_rct_player4= null
rect gg_rct_player5= null
rect gg_rct_player6= null
rect gg_rct_player7= null
rect gg_rct_player8= null
rect gg_rct_start1= null
rect gg_rct_start2= null
rect gg_rct_start3= null
rect gg_rct_start4= null
rect gg_rct_start5= null
rect gg_rct_start6= null
rect gg_rct_start7= null
rect gg_rct_start8= null
rect gg_rct_upright= null
rect gg_rct_downright= null
rect gg_rct_downleft= null
rect gg_rct_upleft= null
rect gg_rct_waveunitsCENTRE= null
rect gg_rct_waveunitsRIGHT= null
rect gg_rct_waveunitsLEFT= null
rect gg_rct_waveunitsDOWN= null
rect gg_rct_waveunitsUP= null
rect gg_rct_teleport1= null
rect gg_rct_teleport2= null
rect gg_rct_finish= null
rect gg_rct_horse1= null
rect gg_rct_miner1= null
rect gg_rct_miner2= null
rect gg_rct_miner3= null
rect gg_rct_miner4= null
rect gg_rct_miner5= null
rect gg_rct_miner6= null
rect gg_rct_miner7= null
rect gg_rct_miner8= null
rect gg_rct_minersregion= null
rect gg_rct_horseregion= null
rect gg_rct_horse2= null
rect gg_rct_horse3= null
rect gg_rct_horse4= null
rect gg_rct_horse5= null
rect gg_rct_horse6= null
rect gg_rct_horse7= null
rect gg_rct_horse8= null
rect gg_rct_hideandseek= null
rect gg_rct_hideandseekcam= null
rect gg_rct_roulettespawn= null
rect gg_rct_roulette= null
rect gg_rct_circle= null
rect gg_rct_roulettegame= null
rect gg_rct_fastarena= null
rect gg_rct_fastarenaSPAWN1= null
rect gg_rct_fastarenaSPAWN2= null
rect gg_rct_fastarenaSPAWN3= null
rect gg_rct_fastarenaSPAWN4= null
rect gg_rct_fastarenaFIRE= null
rect gg_rct_guideyes= null
rect gg_rct_banshispawn= null
rect gg_rct_all= null
rect gg_rct_downmid= null
rect gg_rct_upmid= null
rect gg_rct_rightmid= null
rect gg_rct_leftmid= null
rect gg_rct_guideno= null
rect gg_rct_guideyesvote= null
rect gg_rct_guidenovote= null
rect gg_rct________________075= null
rect gg_rct________________075_____________________u= null
rect gg_rct________________075______________________2= null
rect gg_rct________________075______________________3= null
rect gg_rct________________075______________________4= null
rect gg_rct_stormeff= null
rect gg_rct________________081= null
rect gg_rct________________082= null
rect gg_rct_hideandseekall= null
rect gg_rct_inc= null
camerasetup gg_cam_hide_and_seek= null
camerasetup gg_cam_logic= null
camerasetup gg_cam_Camera_003= null
sound gg_snd_BattleNetTick= null
sound gg_snd_Warning= null
sound gg_snd_QuestNew= null
sound gg_snd_QuestCompleted= null
sound gg_snd_BloodElfMageYesAttack1= null
sound gg_snd_BloodElfMageYesAttack3= null
sound gg_snd_BloodElfMageWarcry1= null
sound gg_snd_BloodElfMageReady1= null
sound gg_snd_BloodElfMagePissed1= null
sound gg_snd_BattleNetTick01= null
sound gg_snd_ClanInvitation= null
trigger gg_trg_initialization= null
trigger gg_trg_ini_id= null
trigger gg_trg_game_end= null
trigger gg_trg_cmd_clear= null
trigger gg_trg_cmd_build= null
trigger gg_trg_cmd_time= null
trigger gg_trg_cmd_arena= null
trigger gg_trg_cmd_mode= null
trigger gg_trg_cmd_point= null
trigger gg_trg_cmd_gg= null
trigger gg_trg_cmd_info= null
trigger gg_trg_cmd_zoom= null
trigger gg_trg_damage_system_initialization= null
trigger gg_trg_damage_system= null
trigger gg_trg_scoreboard_ini= null
trigger gg_trg_scoreboard_update= null
trigger gg_trg_units_death= null
trigger gg_trg_unit_dammi= null
trigger gg_trg_units_leave= null
trigger gg_trg_unit_resources= null
trigger gg_trg_upgrade_def_and_dmg= null
trigger gg_trg_set_wave_start_main= null
trigger gg_trg_set_wave_timer= null
trigger gg_trg_set_wave_region_rotate= null
trigger gg_trg_set_wave_unit_spawn= null
trigger gg_trg_wave_units= null
trigger gg_trg_wave_waiting_timer= null
trigger gg_trg_wave_notification= null
trigger gg_trg_wave_end_timer= null
trigger gg_trg_wave_rotation= null
trigger gg_trg_wave_fast_arena_end= null
trigger gg_trg_wave_friends_on= null
trigger gg_trg_wave_friends_off= null
trigger gg_trg_wave_end_attack= null
trigger gg_trg_wave_end= null
trigger gg_trg_wave_result_rotation= null
trigger gg_trg_wave_castle_destr= null
trigger gg_trg_wave_leader_owner= null
trigger gg_trg_inc_ini= null
trigger gg_trg_inc_rotate= null
trigger gg_trg_inc_per_second= null
trigger gg_trg_inc_colour= null
trigger gg_trg_inc_upg= null
trigger gg_trg_income_upg= null
trigger gg_trg_income_upgQ= null
trigger gg_trg_income_upgW= null
trigger gg_trg_income_upgE= null
trigger gg_trg_income_upgR= null
trigger gg_trg_income_upgA= null
trigger gg_trg_income_upgS= null
trigger gg_trg_income_upgFa= null
trigger gg_trg_income_upgFb= null
trigger gg_trg_income_upgFc= null
trigger gg_trg_income_upgFd= null
trigger gg_trg_income_upgFe= null
trigger gg_trg_income_upgFf= null
trigger gg_trg_income_upgZ= null
trigger gg_trg_income_upgX= null
trigger gg_trg_Income_T_upgQ= null
trigger gg_trg_income_effects= null
trigger gg_trg_Weather= null
trigger gg_trg_Blizzard= null
trigger gg_trg_Storm= null
trigger gg_trg_Storm_effect= null
trigger gg_trg_Armageddon= null
trigger gg_trg_Armageddon_effect= null
trigger gg_trg_Armageddon_effect_2= null
trigger gg_trg_faq= null
trigger gg_trg_faq_death= null
trigger gg_trg_building_ini= null
trigger gg_trg_building_selling= null
trigger gg_trg_building_inf= null
trigger gg_trg_builder_select= null
trigger gg_trg_builder_left= null
trigger gg_trg_mediv_select= null
trigger gg_trg_change_set= null
trigger gg_trg_footman_activate= null
trigger gg_trg_foorman_delete= null
trigger gg_trg_footman_effect= null
trigger gg_trg_assassin= null
trigger gg_trg_banshi= null
trigger gg_trg_ghost= null
trigger gg_trg_ghost_active= null
trigger gg_trg_ghost_del_1= null
trigger gg_trg_rejuvenation= null
trigger gg_trg_tip= null
trigger gg_trg_gold_for_gems= null
trigger gg_trg_gems_for_gold= null
trigger gg_trg_sea_dragon= null
trigger gg_trg_boss_ini_start= null
trigger gg_trg_boss_ini_finish= null
trigger gg_trg_boss_end_timer= null
trigger gg_trg_boss_end= null
trigger gg_trg_spells_check= null
trigger gg_trg_spell_1= null
trigger gg_trg_spell_2= null
trigger gg_trg_spell_3= null
trigger gg_trg_spell_4= null
trigger gg_trg_hunter_death= null
trigger gg_trg_hunter_time= null
trigger gg_trg_hunter_end= null
trigger gg_trg_zombie_ini_start= null
trigger gg_trg_zombie_ini_finish= null
trigger gg_trg_zombie_death= null
trigger gg_trg_zombie_spawn= null
trigger gg_trg_gold_ini_start= null
trigger gg_trg_gold_bet= null
trigger gg_trg_gold_result= null
trigger gg_trg_horse_ini_start= null
trigger gg_trg_horse_speed= null
trigger gg_trg_horse_finish= null
trigger gg_trg_miners_ini_start= null
trigger gg_trg_miners_death= null
trigger gg_trg_miners_explosion= null
trigger gg_trg_miners_set= null
trigger gg_trg_miners_reward= null
trigger gg_trg_hide_ini= null
trigger gg_trg_hide_stop= null
trigger gg_trg_hide_kill= null
trigger gg_trg_banshi_ini= null
trigger gg_trg_banshi_cast= null
trigger gg_trg_banshi_end= null
trigger gg_trg_banshi_spawn= null
trigger gg_trg_banshi_attack= null
trigger gg_trg_parody_ini_start= null
trigger gg_trg_parodys_set_cast= null
trigger gg_trg_parodys_cast= null
trigger gg_trg_parody_dies= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__BJObjectId=1
integer array s__BJObjectId_first_unit_oid
integer array s__BJObjectId_first_cunit_oid
constant integer si__Revive=2
constant integer si__Table___dex=3
constant integer si__Table___handles=4
constant integer si__Table___agents=5
constant integer si__Table___reals=6
constant integer si__Table___booleans=7
constant integer si__Table___strings=8
constant integer si__Table___integers=9
constant integer si__Table___players=10
constant integer si__Table___widgets=11
constant integer si__Table___destructables=12
constant integer si__Table___items=13
constant integer si__Table___units=14
constant integer si__Table___abilitys=15
constant integer si__Table___timers=16
constant integer si__Table___triggers=17
constant integer si__Table___triggerconditions=18
constant integer si__Table___triggeractions=19
constant integer si__Table___events=20
constant integer si__Table___forces=21
constant integer si__Table___groups=22
constant integer si__Table___locations=23
constant integer si__Table___rects=24
constant integer si__Table___boolexprs=25
constant integer si__Table___sounds=26
constant integer si__Table___effects=27
constant integer si__Table___unitpools=28
constant integer si__Table___itempools=29
constant integer si__Table___quests=30
constant integer si__Table___questitems=31
constant integer si__Table___defeatconditions=32
constant integer si__Table___timerdialogs=33
constant integer si__Table___leaderboards=34
constant integer si__Table___multiboards=35
constant integer si__Table___multiboarditems=36
constant integer si__Table___trackables=37
constant integer si__Table___dialogs=38
constant integer si__Table___buttons=39
constant integer si__Table___texttags=40
constant integer si__Table___lightnings=41
constant integer si__Table___images=42
constant integer si__Table___ubersplats=43
constant integer si__Table___regions=44
constant integer si__Table___fogstates=45
constant integer si__Table___fogmodifiers=46
constant integer si__Table___hashtables=47
constant integer si__Table=48
constant integer si__TableArray=49
integer s__TableArray_tempTable
integer s__TableArray_tempEnd
constant integer si__HashTable=50
constant integer si__DB=51
integer si__DB_F=0
integer si__DB_I=0
integer array si__DB_V
player array s__DB_p
real array s__DB_scoreboard_result
integer array s__DB_income_gold
integer array s__DB_income_gems
real array s__DB_leader_coeff
integer array s__DB_leader_wins
integer array s__DB_arena_wins
integer array s__DB_change_set
boolean array s__DB_info
constant integer si__Playerdb=52
integer si__Playerdb_F=0
integer si__Playerdb_I=0
integer array si__Playerdb_V
constant integer si__RegisterNativeEvent___NativeEvent=53
integer s__RegisterNativeEvent___NativeEvent_table
constant integer si__UnitRecycler___List=54
unit array s__UnitRecycler___List_unit
integer array s__UnitRecycler___List_recycler
integer array s__UnitRecycler___List_prev
integer array s__UnitRecycler___List_next
integer s__UnitRecycler___List_stocked
constant integer si__UnitRecycler___UnitRecycler=55
integer s__UnitRecycler___UnitRecycler_rawCodeIdTable
integer s__UnitRecycler___UnitRecycler_timerTable
integer s__UnitRecycler___UnitRecycler_rawCodeCount= 0
integer array s__UnitRecycler___UnitRecycler_position
integer array s__UnitRecycler___UnitRecycler_stackSize
integer array s__UnitRecycler___UnitRecycler_indexStack
integer array s__UnitRecycler___UnitRecycler_head
constant integer si__UnitRecycler___Initializer=56
constant integer si__ResourcePreloader___S=57
integer s__ResourcePreloader___S_tb
unit s__ResourcePreloader___S_dummy
integer array s__time
integer array s__MIXLib___dbarr
integer array s__incSpellrc
player array s__ticket_list
real array s__robbery_pr_f
real array s__robbery_pr_s
real array s__stab_time_gold
real array s__stab_time_lumber
integer array s__stab_gold
integer array s__stab_lumber
timer array s__stab_timer_gold
timer array s__stab_timer_lumber
integer array s__goldmining_main_mine
integer array s__goldmining_extra_mine
integer array s__goldmining_income
texttag array s__faq_tts
button array s__faq_buttons

endglobals
    native UnitAlive takes unit u returns boolean


//Generated allocator of Playerdb
function s__Playerdb__allocate takes nothing returns integer
 local integer this=si__Playerdb_F
    if (this!=0) then
        set si__Playerdb_F=si__Playerdb_V[this]
    else
        set si__Playerdb_I=si__Playerdb_I+1
        set this=si__Playerdb_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Playerdb")
        return 0
    endif

    set si__Playerdb_V[this]=-1
 return this
endfunction

//Generated destructor of Playerdb
function s__Playerdb_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Playerdb")
        return
    elseif (si__Playerdb_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Playerdb")
        return
    endif
    set si__Playerdb_V[this]=si__Playerdb_F
    set si__Playerdb_F=this
endfunction

//Generated allocator of DB
function s__DB__allocate takes nothing returns integer
 local integer this=si__DB_F
    if (this!=0) then
        set si__DB_F=si__DB_V[this]
    else
        set si__DB_I=si__DB_I+1
        set this=si__DB_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: DB")
        return 0
    endif

   set s__DB_scoreboard_result[this]= 0
   set s__DB_income_gold[this]= 240
   set s__DB_income_gems[this]= 8
   set s__DB_leader_coeff[this]= 1.00
   set s__DB_leader_wins[this]= 0
   set s__DB_arena_wins[this]= 1
   set s__DB_change_set[this]= 3
   set s__DB_info[this]= true
    set si__DB_V[this]=-1
 return this
endfunction

//Generated destructor of DB
function s__DB_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: DB")
        return
    elseif (si__DB_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: DB")
        return
    endif
    set si__DB_V[this]=si__DB_F
    set si__DB_F=this
endfunction

//library BJObjectId:



        function s__BJObjectId_from_str takes string oid returns integer
            // '0' = 48 .. '9' = 57,
            // 'A' = 65 .. 'Z' = 90
            // 'a' = 97 .. 'z' = 122
            //
            // index(<chr>):
            // '0' = 0; chr(0 + 48) = '0' = 48
            // 'A' = 17; chr(17 + 48) = 'A' = 65
            // 'a' = 49; chr(49 + 48) = 'a' = 97
            //
            local string chars= "0123456789.......ABCDEFGHIJKLMNOPQRSTUVWXYZ......abcdefghijklmnopqrstuvwxyz"
            local integer this= 0
            local integer i
            local integer j
            local integer ordinal
            local string chr
            local integer pow_256= 1

            set i=3
            loop
                exitwhen i < 0
                set chr=SubString(oid, i, i + 1)

                set j=0
                loop
                    exitwhen j >= 75

                    if chr == SubString(chars, j, j + 1) then
                        set this=this + ( j + 48 ) * pow_256
                        set pow_256=pow_256 * 256
                        exitwhen true
                    endif

                    set j=j + 1
                endloop

                set i=i - 1
            endloop

            return this
        endfunction

        function s__BJObjectId_to_str takes integer this returns string
            local string chars= "0123456789.......ABCDEFGHIJKLMNOPQRSTUVWXYZ......abcdefghijklmnopqrstuvwxyz"
            local integer t= this
            local integer i
            local integer b
            local string result= ""

            set i=t
            set t=i / 0x100
            set b=i - t * 0x100 - 48
            set result=SubString(chars, b, b + 1) + result

            set i=t
            set t=i / 0x100
            set b=i - t * 0x100 - 48
            set result=SubString(chars, b, b + 1) + result

            set i=t
            set t=i / 0x100
            set b=i - t * 0x100 - 48
            set result=SubString(chars, b, b + 1) + result

            set t=t - 48
            set result=SubString(chars, t, t + 1) + result

            return result
        endfunction

        function s__BJObjectId_plus_1 takes integer this returns integer
            local integer t= this
            local integer i
            local integer b1
            local integer b2
            local integer b3
            local integer b4

            set i=t
            set t=i / 0x100
            set b4=i - t * 0x100

            if b4 < 'Z' then
                if b4 != '9' then
                    set i=i + 1
                else
                    set i=i + 8
                endif
            else

                set i=t
                set t=i / 0x100
                set b3=i - t * 0x100
                if b3 < 'Z' then
                    if b3 != '9' then
                        set i=i * 0x00000100 + 0x00000100 + '0'
                    else
                        set i=i * 0x00000100 + 0x00000800 + '0'
                    endif
                else

                    set i=t
                    set t=i / 0x100
                    set b2=i - t * 0x100
                    if b2 < 'Z' then
                        if b2 != '9' then
                            set i=i * 0x00010000 + 0x00010000 + '0' * 0x00000100 + '0'
                        else
                            set i=i * 0x00010000 + 0x00080000 + '0' * 0x00000100 + '0'
                        endif
                    else

                        set i=t
                        if i != '9' then
                            set i=i * 0x01000000 + 0x01000000 + '0' * 0x00010000 + '0' * 0x00000100 + '0'
                        else
                            set i=i * 0x01000000 + 0x08000000 + '0' * 0x00010000 + '0' * 0x00000100 + '0'
                        endif
                    endif
                endif
            endif

            return i
        endfunction

        function s__BJObjectId_minus_1 takes integer this returns integer
            local integer t= this
            local integer i
            local integer b1
            local integer b2
            local integer b3
            local integer b4

            set i=t
            set t=i / 0x100
            set b4=i - t * 0x100
            if b4 > '0' then
                if b4 != 'A' then
                    set i=i - 1
                else
                    set i=i - 8
                endif
            else

                set i=t
                set t=i / 0x100
                set b3=i - t * 0x100
                if b3 > '0' then
                    if b3 != 'A' then
                        set i=i * 0x00000100 - 0x00000100 + 'Z'
                    else
                        set i=i * 0x00000100 - 0x00000800 + 'Z'
                    endif
                else

                    set i=t
                    set t=i / 0x100
                    set b2=i - t * 0x100
                    if b2 > '0' then
                        if b2 != 'A' then
                            set i=i * 0x00010000 - 0x00010000 + 'Z' * 0x00000100 + 'Z'
                        else
                            set i=i * 0x00010000 - 0x00080000 + 'Z' * 0x00000100 + 'Z'
                        endif
                    else

                        set i=t
                        if i != 'A' then
                            set i=i * 0x01000000 - 0x01000000 + 'Z' * 0x00010000 + 'Z' * 0x00000100 + 'Z'
                        else
                            set i=i * 0x01000000 - 0x08000000 + 'Z' * 0x00010000 + 'Z' * 0x00000100 + 'Z'
                        endif
                    endif
                endif
            endif

            return i
        endfunction

        function s__BJObjectId__lessthan takes integer this,integer other returns boolean
            return (this) < (other)
        endfunction

        function s__BJObjectId_onInit takes nothing returns nothing
            set s__BJObjectId_first_unit_oid['H']='H000'
            set s__BJObjectId_first_unit_oid['h']='h000'
            set s__BJObjectId_first_unit_oid['O']='O000'
            set s__BJObjectId_first_unit_oid['o']='o000'
            set s__BJObjectId_first_unit_oid['E']='E000'
            set s__BJObjectId_first_unit_oid['e']='e000'
            set s__BJObjectId_first_unit_oid['U']='U000'
            set s__BJObjectId_first_unit_oid['u']='u000'
            set s__BJObjectId_first_unit_oid['N']='N000'
            set s__BJObjectId_first_unit_oid['n']='n000'

            set s__BJObjectId_first_cunit_oid['H']='H600'
            set s__BJObjectId_first_cunit_oid['h']='h600'
            set s__BJObjectId_first_cunit_oid['O']='O600'
            set s__BJObjectId_first_cunit_oid['o']='o600'
            set s__BJObjectId_first_cunit_oid['E']='E600'
            set s__BJObjectId_first_cunit_oid['e']='e600'
            set s__BJObjectId_first_cunit_oid['U']='U600'
            set s__BJObjectId_first_cunit_oid['u']='u600'
            set s__BJObjectId_first_cunit_oid['N']='N600'
            set s__BJObjectId_first_cunit_oid['n']='n600'
        endfunction

        function s__BJObjectId_to_unit_index takes integer this returns integer
            return this - s__BJObjectId_first_unit_oid[this / 0x01000000] + 1
        endfunction
        function s__BJObjectId_to_cunit_index takes integer this returns integer
            return this - s__BJObjectId_first_cunit_oid[this / 0x01000000] + 1
        endfunction

        function s__BJObjectId_to_item_index takes integer this returns integer
            return this - 'I000' + 1
        endfunction
        function s__BJObjectId_to_citem_index takes integer this returns integer
            return this - 'I600' + 1
        endfunction

        function s__BJObjectId_to_destructable_index takes integer this returns integer
            return this - 'B000' + 1
        endfunction
        function s__BJObjectId_to_cdestructable_index takes integer this returns integer
            return this - 'B600' + 1
        endfunction

        function s__BJObjectId_to_doodad_index takes integer this returns integer
            return this - 'D000' + 1
        endfunction
        function s__BJObjectId_to_cdoodad_index takes integer this returns integer
            return this - 'D600' + 1
        endfunction

        function s__BJObjectId_to_ability_index takes integer this returns integer
            return this - 'A000' + 1
        endfunction
        function s__BJObjectId_to_cability_index takes integer this returns integer
            return this - 'A600' + 1
        endfunction

        function s__BJObjectId_to_buff_index takes integer this returns integer
            return this - 'B000' + 1
        endfunction
        function s__BJObjectId_to_cbuff_index takes integer this returns integer
            return this - 'B600' + 1
        endfunction

        function s__BJObjectId_to_upgrade_index takes integer this returns integer
            return this - 'R000' + 1
        endfunction
        function s__BJObjectId_to_cupgrade_index takes integer this returns integer
            return this - 'R600' + 1
        endfunction



//library BJObjectId ends
//library NokladrLib:

    // Возвращает цвет игрока взависимости от его ID.
    function C_IntToColor takes integer i returns string
        if i == 0 then
            return RED
        elseif i == 1 then
            return BLUE
        elseif i == 2 then
            return TEAL
        elseif i == 3 then
            return PURPLE
        elseif i == 4 then
            return YELLOW
        elseif i == 5 then
            return ORANGE
        elseif i == 6 then
            return GREEN
        elseif i == 7 then
            return PINK
        elseif i == 8 then
            return GRAY
        elseif i == 9 then
            return LB
        elseif i == 10 then
            return DG
        elseif i == 11 then
            return BROWN
        endif
        return ""
    endfunction

    // Отображает сообщение об ошибке
    function C_ErrorMsg takes string s returns nothing
         call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, ( RED + "Ошибка: " + s + "|r" ))
    endfunction

    // Лог сообщений
    function Log takes string s returns nothing
         call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, ( GOLD + "Log:|r " + GREEN + s + "|r" ))
    endfunction

    // Устанавливает всем компьютерным игрокам соответствующее имя
    function C_SetComputers takes nothing returns nothing
        local integer i= 0
        loop
            exitwhen ( i > 14 )
            if ( GetPlayerController(Player(i)) == MAP_CONTROL_COMPUTER ) then
                call SetPlayerName(Player(i), "Компьютер")
                call SetPlayerOnScoreScreen(Player(i), false)
            endif
            set i=i + 1
        endloop
    endfunction

    // Пересобирает таблицу лидеров. Если есть пустые строки, то удаляет их.
    function C_ResizeTable takes leaderboard l returns nothing
        local integer size= LeaderboardGetItemCount(l)
        if ( LeaderboardGetLabelText(l) == "" ) then
            set size=size - 1
        endif
        call LeaderboardSetSizeByItemCount(l, size)
    endfunction

    // Удаляет i-ую строку из таблицы лидеров
    function C_RemoveTableRow takes leaderboard l,integer row returns nothing
        call LeaderboardRemoveItem(l, row)
        call C_ResizeTable(l)
    endfunction

    // Добавляет строку в таблицу лидеров
    function C_AddTableRow takes leaderboard l,string label,integer value,boolean flag returns nothing
        local integer i= 0
        local boolean complete= false
        loop
            exitwhen ( i > 14 )
            if ( not LeaderboardHasPlayerItem(l, Player(i)) ) then
                call LeaderboardAddItem(l, label, value, Player(i))
                if ( label == "" and value == 0 ) then
                    call LeaderboardSetItemStyle(l, i, false, false, false)
                elseif ( value == 0 and not flag ) then
                    call LeaderboardSetItemStyle(l, i, true, false, false)
                endif
                set complete=true
            endif
            if ( complete ) then
                call C_ResizeTable(l)
                exitwhen true
            endif
            set i=i + 1
        endloop
        if ( not complete ) then
            call C_ErrorMsg("невозможно создать строку в таблице. Освободите место.")
        endif
    endfunction

    // Счётчик времени
    function NokladrLib___C_StartCount takes nothing returns nothing
        set s__time[0]= s__time[0] + 1
        if ( s__time[0] > 59 ) then
            set s__time[0]= 0
            set s__time[1]= s__time[1] + 1
            if ( s__time[1] > 59 ) then
                set s__time[1]= 0
                set s__time[2]= s__time[2] + 1
                if ( s__time[2] > 24 ) then
                    set s__time[0]= 0 //Секунды
                    set s__time[1]= 0 //Минуты
                    set s__time[2]= 0 //Часы
                endif
            endif
        endif
    endfunction

    // Инициализация счётчика времени
    function StartInitTimer takes nothing returns nothing
        local timer t= CreateTimer()
        call TimerStart(t, 1., true, function NokladrLib___C_StartCount)
    endfunction

    // Возвращает состояние счётчика времени в секундах
    function GetTimeInSeconds takes nothing returns integer
        return s__time[0] + s__time[1] * 60 + s__time[2] * 3600
    endfunction

    // Создаёт и возвращает таблицу лидеров
    function C_CreateTable takes string label,boolean IsVisible returns leaderboard
        local leaderboard l= CreateLeaderboard()
        local integer i= 0
        loop
            exitwhen ( i > 14 )
            call PlayerSetLeaderboard(Player(i), l)
            set i=i + 1
        endloop
        call LeaderboardSetLabel(l, label)
        call LeaderboardDisplay(l, IsVisible)
        return l
    endfunction

    // Удаляет выделенных юнитов
    function C_RemoveEnumUnits takes nothing returns nothing
        call RemoveUnit(GetEnumUnit())
    endfunction

    // Добавляет золото игроку
    function AddGoldToPlayer takes integer value,player p returns nothing
        call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + value)
    endfunction

    // Добавляет дерево игроку
    function AddLumberToPlayer takes integer value,player p returns nothing
        call SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) + value)
    endfunction

    // Принимает rect, возвращает location
    function RectToLoc takes rect r returns location
        return Location(GetRectCenterX(r), GetRectCenterY(r))
    endfunction

    // Условие: юнит имеет предмет с itemId?
    function C_DoesUnitHasItemOfType takes unit u,integer itemId returns boolean
        local integer i= 0
        local item indexItem
        loop
            exitwhen ( i > 5 )
            set indexItem=UnitItemInSlot(u, i)
            if ( indexItem != null and GetItemTypeId(indexItem) == itemId ) then
                return true
            endif
            set i=i + 1
        endloop
        return false
    endfunction

    // Условие: юнит находится в rect?
    function C_IsUnitInRect takes unit u,rect r returns boolean
        local real x= GetUnitX(u)
        local real y= GetUnitY(u)
        return ( ( GetRectMinX(r) - 32 <= x ) and ( x <= GetRectMaxX(r) + 32 ) and ( GetRectMinY(r) - 32 <= y ) and ( y <= GetRectMaxY(r) + 32 ) )
    endfunction

    // Создаёт texttag, упрощённая и оптимизированная версия CreateTextTagLocBJ
    function NewTextTag takes string s,rect rct,real size returns texttag
        local texttag tt= CreateTextTag()
        // SetTextTagTextBJ
        call SetTextTagText(tt, s, TextTagSize2Height(size))
        // SetTextTagPosBJ
        call SetTextTagPos(tt, GetRectCenterX(rct), GetRectCenterY(rct), 0)
        // SetTextTagColorBJ
        call SetTextTagColor(tt, 255, 255, 255, 255)
        return tt
    endfunction

    // Makes map normal in opposite to FadeMap()
    function UnfadeMap takes nothing returns nothing
        call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    endfunction
    
    // Makes map absolute black
    function FadeMap takes nothing returns nothing
        call SetDayNightModels("", "")
    endfunction


//library NokladrLib ends
//library ReviveUnit:
    // external ObjectMerger w3a AHre URez anam "Dummy Resurrection" aher 0 acat "" atat "" Hre1 1 1 aare 1 0 aran 1 0 acdn 1 0 amcs 1 0 atar 1 "Air,Dead,Enemy,Friend,Ground,Neutral"
    // external ObjectMerger w3u ushd eRez unam "Dummy" uabi "Aloc,Avul" ucbs 0 ucpt 0 umdl ".mdl" usca "0.01" ushu "None" umvh 0 umvs 0 ufoo 0 umpi 100000 umpm 100000 umpr 1000 usid 0 usin 0
       


   
    function ReviveUnit takes unit u returns boolean
        local boolean success
        if IsUnitType(u, UNIT_TYPE_HERO) == true then
            return ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        else
            call SetUnitX(ReviveUnit___reviver, GetUnitX(u))
            call SetUnitY(ReviveUnit___reviver, GetUnitY(u))
            set success=IssueImmediateOrderById(ReviveUnit___reviver, 852094)
            call SetUnitX(ReviveUnit___reviver, ReviveUnit___rx)
            call SetUnitY(ReviveUnit___reviver, ReviveUnit___ry)
        endif
        return success
    endfunction
   
   
        // For backwards compatibility
        function s__Revive_Unit takes unit whichUnit returns boolean
            return ReviveUnit(whichUnit)
        endfunction
       
//Implemented from module ReviveUnit___Init:
        function s__Revive_ReviveUnit___Init___onInit takes nothing returns nothing
            set ReviveUnit___rx=GetRectMaxX(bj_mapInitialPlayableArea) - 1
            set ReviveUnit___ry=GetRectMaxY(bj_mapInitialPlayableArea) - 1
            set ReviveUnit___reviver=CreateUnit(Player(15), ReviveUnit___DUMMY, ReviveUnit___rx, ReviveUnit___ry, 0)
            call SetUnitPathing(ReviveUnit___reviver, false)
            call UnitAddAbility(ReviveUnit___reviver, ReviveUnit___RESURRECT)
        endfunction

//library ReviveUnit ends
//library Table:
   
    
        function s__Table___dex__get_size takes nothing returns integer
            return Table___sizeK
        endfunction

        function s__Table___dex__get_list takes nothing returns integer
            return Table___listK
        endfunction
   
        function s__Table___handles_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___handles_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction
   
        function s__Table___agents__setindex takes integer this,integer key,agent value returns nothing
            call SaveAgentHandle(Table___ht, this, key, value)
        endfunction
   
   
   
//Run these textmacros to include the entire hashtable API as wrappers.
//Don't be intimidated by the number of macros - Vexorian's map optimizer is
//supposed to kill functions which inline (all of these functions inline).
//textmacro instance: NEW_ARRAY_BASIC("Real", "Real", "real")
        function s__Table___reals__getindex takes integer this,integer key returns real
            return LoadReal(Table___ht, this, key)
        endfunction

        function s__Table___reals__setindex takes integer this,integer key,real value returns nothing
            call SaveReal(Table___ht, this, key, value)
        endfunction

        function s__Table___reals_has takes integer this,integer key returns boolean
            return HaveSavedReal(Table___ht, this, key)
        endfunction

        function s__Table___reals_remove takes integer this,integer key returns nothing
            call RemoveSavedReal(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY_BASIC("Real", "Real", "real")
//textmacro instance: NEW_ARRAY_BASIC("Boolean", "Boolean", "boolean")
        function s__Table___booleans__getindex takes integer this,integer key returns boolean
            return LoadBoolean(Table___ht, this, key)
        endfunction

        function s__Table___booleans__setindex takes integer this,integer key,boolean value returns nothing
            call SaveBoolean(Table___ht, this, key, value)
        endfunction

        function s__Table___booleans_has takes integer this,integer key returns boolean
            return HaveSavedBoolean(Table___ht, this, key)
        endfunction

        function s__Table___booleans_remove takes integer this,integer key returns nothing
            call RemoveSavedBoolean(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY_BASIC("Boolean", "Boolean", "boolean")
//textmacro instance: NEW_ARRAY_BASIC("String", "Str", "string")
        function s__Table___strings__getindex takes integer this,integer key returns string
            return LoadStr(Table___ht, this, key)
        endfunction

        function s__Table___strings__setindex takes integer this,integer key,string value returns nothing
            call SaveStr(Table___ht, this, key, value)
        endfunction

        function s__Table___strings_has takes integer this,integer key returns boolean
            return HaveSavedString(Table___ht, this, key)
        endfunction

        function s__Table___strings_remove takes integer this,integer key returns nothing
            call RemoveSavedString(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY_BASIC("String", "Str", "string")
//New textmacro to allow table.integer[] syntax for compatibility with textmacros that might desire it.
//textmacro instance: NEW_ARRAY_BASIC("Integer", "Integer", "integer")
        function s__Table___integers__getindex takes integer this,integer key returns integer
            return LoadInteger(Table___ht, this, key)
        endfunction

        function s__Table___integers__setindex takes integer this,integer key,integer value returns nothing
            call SaveInteger(Table___ht, this, key, value)
        endfunction

        function s__Table___integers_has takes integer this,integer key returns boolean
            return HaveSavedInteger(Table___ht, this, key)
        endfunction

        function s__Table___integers_remove takes integer this,integer key returns nothing
            call RemoveSavedInteger(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY_BASIC("Integer", "Integer", "integer")
   
//textmacro instance: NEW_ARRAY("Player", "player")
        function s__Table___players__getindex takes integer this,integer key returns player
            return LoadPlayerHandle(Table___ht, this, key)
        endfunction

        function s__Table___players__setindex takes integer this,integer key,player value returns nothing
            call SavePlayerHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___players_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___players_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Player", "player")
//textmacro instance: NEW_ARRAY("Widget", "widget")
        function s__Table___widgets__getindex takes integer this,integer key returns widget
            return LoadWidgetHandle(Table___ht, this, key)
        endfunction

        function s__Table___widgets__setindex takes integer this,integer key,widget value returns nothing
            call SaveWidgetHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___widgets_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___widgets_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Widget", "widget")
//textmacro instance: NEW_ARRAY("Destructable", "destructable")
        function s__Table___destructables__getindex takes integer this,integer key returns destructable
            return LoadDestructableHandle(Table___ht, this, key)
        endfunction

        function s__Table___destructables__setindex takes integer this,integer key,destructable value returns nothing
            call SaveDestructableHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___destructables_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___destructables_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Destructable", "destructable")
//textmacro instance: NEW_ARRAY("Item", "item")
        function s__Table___items__getindex takes integer this,integer key returns item
            return LoadItemHandle(Table___ht, this, key)
        endfunction

        function s__Table___items__setindex takes integer this,integer key,item value returns nothing
            call SaveItemHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___items_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___items_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Item", "item")
//textmacro instance: NEW_ARRAY("Unit", "unit")
        function s__Table___units__getindex takes integer this,integer key returns unit
            return LoadUnitHandle(Table___ht, this, key)
        endfunction

        function s__Table___units__setindex takes integer this,integer key,unit value returns nothing
            call SaveUnitHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___units_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___units_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Unit", "unit")
//textmacro instance: NEW_ARRAY("Ability", "ability")
        function s__Table___abilitys__getindex takes integer this,integer key returns ability
            return LoadAbilityHandle(Table___ht, this, key)
        endfunction

        function s__Table___abilitys__setindex takes integer this,integer key,ability value returns nothing
            call SaveAbilityHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___abilitys_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___abilitys_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Ability", "ability")
//textmacro instance: NEW_ARRAY("Timer", "timer")
        function s__Table___timers__getindex takes integer this,integer key returns timer
            return LoadTimerHandle(Table___ht, this, key)
        endfunction

        function s__Table___timers__setindex takes integer this,integer key,timer value returns nothing
            call SaveTimerHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___timers_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___timers_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Timer", "timer")
//textmacro instance: NEW_ARRAY("Trigger", "trigger")
        function s__Table___triggers__getindex takes integer this,integer key returns trigger
            return LoadTriggerHandle(Table___ht, this, key)
        endfunction

        function s__Table___triggers__setindex takes integer this,integer key,trigger value returns nothing
            call SaveTriggerHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___triggers_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___triggers_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Trigger", "trigger")
//textmacro instance: NEW_ARRAY("TriggerCondition", "triggercondition")
        function s__Table___triggerconditions__getindex takes integer this,integer key returns triggercondition
            return LoadTriggerConditionHandle(Table___ht, this, key)
        endfunction

        function s__Table___triggerconditions__setindex takes integer this,integer key,triggercondition value returns nothing
            call SaveTriggerConditionHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___triggerconditions_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___triggerconditions_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("TriggerCondition", "triggercondition")
//textmacro instance: NEW_ARRAY("TriggerAction", "triggeraction")
        function s__Table___triggeractions__getindex takes integer this,integer key returns triggeraction
            return LoadTriggerActionHandle(Table___ht, this, key)
        endfunction

        function s__Table___triggeractions__setindex takes integer this,integer key,triggeraction value returns nothing
            call SaveTriggerActionHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___triggeractions_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___triggeractions_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("TriggerAction", "triggeraction")
//textmacro instance: NEW_ARRAY("TriggerEvent", "event")
        function s__Table___events__getindex takes integer this,integer key returns event
            return LoadTriggerEventHandle(Table___ht, this, key)
        endfunction

        function s__Table___events__setindex takes integer this,integer key,event value returns nothing
            call SaveTriggerEventHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___events_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___events_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("TriggerEvent", "event")
//textmacro instance: NEW_ARRAY("Force", "force")
        function s__Table___forces__getindex takes integer this,integer key returns force
            return LoadForceHandle(Table___ht, this, key)
        endfunction

        function s__Table___forces__setindex takes integer this,integer key,force value returns nothing
            call SaveForceHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___forces_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___forces_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Force", "force")
//textmacro instance: NEW_ARRAY("Group", "group")
        function s__Table___groups__getindex takes integer this,integer key returns group
            return LoadGroupHandle(Table___ht, this, key)
        endfunction

        function s__Table___groups__setindex takes integer this,integer key,group value returns nothing
            call SaveGroupHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___groups_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___groups_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Group", "group")
//textmacro instance: NEW_ARRAY("Location", "location")
        function s__Table___locations__getindex takes integer this,integer key returns location
            return LoadLocationHandle(Table___ht, this, key)
        endfunction

        function s__Table___locations__setindex takes integer this,integer key,location value returns nothing
            call SaveLocationHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___locations_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___locations_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Location", "location")
//textmacro instance: NEW_ARRAY("Rect", "rect")
        function s__Table___rects__getindex takes integer this,integer key returns rect
            return LoadRectHandle(Table___ht, this, key)
        endfunction

        function s__Table___rects__setindex takes integer this,integer key,rect value returns nothing
            call SaveRectHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___rects_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___rects_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Rect", "rect")
//textmacro instance: NEW_ARRAY("BooleanExpr", "boolexpr")
        function s__Table___boolexprs__getindex takes integer this,integer key returns boolexpr
            return LoadBooleanExprHandle(Table___ht, this, key)
        endfunction

        function s__Table___boolexprs__setindex takes integer this,integer key,boolexpr value returns nothing
            call SaveBooleanExprHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___boolexprs_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___boolexprs_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("BooleanExpr", "boolexpr")
//textmacro instance: NEW_ARRAY("Sound", "sound")
        function s__Table___sounds__getindex takes integer this,integer key returns sound
            return LoadSoundHandle(Table___ht, this, key)
        endfunction

        function s__Table___sounds__setindex takes integer this,integer key,sound value returns nothing
            call SaveSoundHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___sounds_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___sounds_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Sound", "sound")
//textmacro instance: NEW_ARRAY("Effect", "effect")
        function s__Table___effects__getindex takes integer this,integer key returns effect
            return LoadEffectHandle(Table___ht, this, key)
        endfunction

        function s__Table___effects__setindex takes integer this,integer key,effect value returns nothing
            call SaveEffectHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___effects_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___effects_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Effect", "effect")
//textmacro instance: NEW_ARRAY("UnitPool", "unitpool")
        function s__Table___unitpools__getindex takes integer this,integer key returns unitpool
            return LoadUnitPoolHandle(Table___ht, this, key)
        endfunction

        function s__Table___unitpools__setindex takes integer this,integer key,unitpool value returns nothing
            call SaveUnitPoolHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___unitpools_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___unitpools_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("UnitPool", "unitpool")
//textmacro instance: NEW_ARRAY("ItemPool", "itempool")
        function s__Table___itempools__getindex takes integer this,integer key returns itempool
            return LoadItemPoolHandle(Table___ht, this, key)
        endfunction

        function s__Table___itempools__setindex takes integer this,integer key,itempool value returns nothing
            call SaveItemPoolHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___itempools_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___itempools_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("ItemPool", "itempool")
//textmacro instance: NEW_ARRAY("Quest", "quest")
        function s__Table___quests__getindex takes integer this,integer key returns quest
            return LoadQuestHandle(Table___ht, this, key)
        endfunction

        function s__Table___quests__setindex takes integer this,integer key,quest value returns nothing
            call SaveQuestHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___quests_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___quests_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Quest", "quest")
//textmacro instance: NEW_ARRAY("QuestItem", "questitem")
        function s__Table___questitems__getindex takes integer this,integer key returns questitem
            return LoadQuestItemHandle(Table___ht, this, key)
        endfunction

        function s__Table___questitems__setindex takes integer this,integer key,questitem value returns nothing
            call SaveQuestItemHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___questitems_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___questitems_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("QuestItem", "questitem")
//textmacro instance: NEW_ARRAY("DefeatCondition", "defeatcondition")
        function s__Table___defeatconditions__getindex takes integer this,integer key returns defeatcondition
            return LoadDefeatConditionHandle(Table___ht, this, key)
        endfunction

        function s__Table___defeatconditions__setindex takes integer this,integer key,defeatcondition value returns nothing
            call SaveDefeatConditionHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___defeatconditions_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___defeatconditions_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("DefeatCondition", "defeatcondition")
//textmacro instance: NEW_ARRAY("TimerDialog", "timerdialog")
        function s__Table___timerdialogs__getindex takes integer this,integer key returns timerdialog
            return LoadTimerDialogHandle(Table___ht, this, key)
        endfunction

        function s__Table___timerdialogs__setindex takes integer this,integer key,timerdialog value returns nothing
            call SaveTimerDialogHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___timerdialogs_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___timerdialogs_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("TimerDialog", "timerdialog")
//textmacro instance: NEW_ARRAY("Leaderboard", "leaderboard")
        function s__Table___leaderboards__getindex takes integer this,integer key returns leaderboard
            return LoadLeaderboardHandle(Table___ht, this, key)
        endfunction

        function s__Table___leaderboards__setindex takes integer this,integer key,leaderboard value returns nothing
            call SaveLeaderboardHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___leaderboards_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___leaderboards_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Leaderboard", "leaderboard")
//textmacro instance: NEW_ARRAY("Multiboard", "multiboard")
        function s__Table___multiboards__getindex takes integer this,integer key returns multiboard
            return LoadMultiboardHandle(Table___ht, this, key)
        endfunction

        function s__Table___multiboards__setindex takes integer this,integer key,multiboard value returns nothing
            call SaveMultiboardHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___multiboards_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___multiboards_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Multiboard", "multiboard")
//textmacro instance: NEW_ARRAY("MultiboardItem", "multiboarditem")
        function s__Table___multiboarditems__getindex takes integer this,integer key returns multiboarditem
            return LoadMultiboardItemHandle(Table___ht, this, key)
        endfunction

        function s__Table___multiboarditems__setindex takes integer this,integer key,multiboarditem value returns nothing
            call SaveMultiboardItemHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___multiboarditems_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___multiboarditems_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("MultiboardItem", "multiboarditem")
//textmacro instance: NEW_ARRAY("Trackable", "trackable")
        function s__Table___trackables__getindex takes integer this,integer key returns trackable
            return LoadTrackableHandle(Table___ht, this, key)
        endfunction

        function s__Table___trackables__setindex takes integer this,integer key,trackable value returns nothing
            call SaveTrackableHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___trackables_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___trackables_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Trackable", "trackable")
//textmacro instance: NEW_ARRAY("Dialog", "dialog")
        function s__Table___dialogs__getindex takes integer this,integer key returns dialog
            return LoadDialogHandle(Table___ht, this, key)
        endfunction

        function s__Table___dialogs__setindex takes integer this,integer key,dialog value returns nothing
            call SaveDialogHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___dialogs_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___dialogs_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Dialog", "dialog")
//textmacro instance: NEW_ARRAY("Button", "button")
        function s__Table___buttons__getindex takes integer this,integer key returns button
            return LoadButtonHandle(Table___ht, this, key)
        endfunction

        function s__Table___buttons__setindex takes integer this,integer key,button value returns nothing
            call SaveButtonHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___buttons_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___buttons_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Button", "button")
//textmacro instance: NEW_ARRAY("TextTag", "texttag")
        function s__Table___texttags__getindex takes integer this,integer key returns texttag
            return LoadTextTagHandle(Table___ht, this, key)
        endfunction

        function s__Table___texttags__setindex takes integer this,integer key,texttag value returns nothing
            call SaveTextTagHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___texttags_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___texttags_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("TextTag", "texttag")
//textmacro instance: NEW_ARRAY("Lightning", "lightning")
        function s__Table___lightnings__getindex takes integer this,integer key returns lightning
            return LoadLightningHandle(Table___ht, this, key)
        endfunction

        function s__Table___lightnings__setindex takes integer this,integer key,lightning value returns nothing
            call SaveLightningHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___lightnings_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___lightnings_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Lightning", "lightning")
//textmacro instance: NEW_ARRAY("Image", "image")
        function s__Table___images__getindex takes integer this,integer key returns image
            return LoadImageHandle(Table___ht, this, key)
        endfunction

        function s__Table___images__setindex takes integer this,integer key,image value returns nothing
            call SaveImageHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___images_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___images_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Image", "image")
//textmacro instance: NEW_ARRAY("Ubersplat", "ubersplat")
        function s__Table___ubersplats__getindex takes integer this,integer key returns ubersplat
            return LoadUbersplatHandle(Table___ht, this, key)
        endfunction

        function s__Table___ubersplats__setindex takes integer this,integer key,ubersplat value returns nothing
            call SaveUbersplatHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___ubersplats_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___ubersplats_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Ubersplat", "ubersplat")
//textmacro instance: NEW_ARRAY("Region", "region")
        function s__Table___regions__getindex takes integer this,integer key returns region
            return LoadRegionHandle(Table___ht, this, key)
        endfunction

        function s__Table___regions__setindex takes integer this,integer key,region value returns nothing
            call SaveRegionHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___regions_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___regions_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Region", "region")
//textmacro instance: NEW_ARRAY("FogState", "fogstate")
        function s__Table___fogstates__getindex takes integer this,integer key returns fogstate
            return LoadFogStateHandle(Table___ht, this, key)
        endfunction

        function s__Table___fogstates__setindex takes integer this,integer key,fogstate value returns nothing
            call SaveFogStateHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___fogstates_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___fogstates_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("FogState", "fogstate")
//textmacro instance: NEW_ARRAY("FogModifier", "fogmodifier")
        function s__Table___fogmodifiers__getindex takes integer this,integer key returns fogmodifier
            return LoadFogModifierHandle(Table___ht, this, key)
        endfunction

        function s__Table___fogmodifiers__setindex takes integer this,integer key,fogmodifier value returns nothing
            call SaveFogModifierHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___fogmodifiers_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___fogmodifiers_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("FogModifier", "fogmodifier")
//textmacro instance: NEW_ARRAY("Hashtable", "hashtable")
        function s__Table___hashtables__getindex takes integer this,integer key returns hashtable
            return LoadHashtableHandle(Table___ht, this, key)
        endfunction

        function s__Table___hashtables__setindex takes integer this,integer key,hashtable value returns nothing
            call SaveHashtableHandle(Table___ht, this, key, value)
        endfunction

        function s__Table___hashtables_has takes integer this,integer key returns boolean
            return HaveSavedHandle(Table___ht, this, key)
        endfunction

        function s__Table___hashtables_remove takes integer this,integer key returns nothing
            call RemoveSavedHandle(Table___ht, this, key)
        endfunction

//end of: NEW_ARRAY("Hashtable", "hashtable")
   
    
        // Implement modules for intuitive syntax (tb.handle; tb.unit; etc.)
//Implemented from module Table___realm:
        function s__Table__get_real takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___integerm:
        function s__Table__get_integer takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___booleanm:
        function s__Table__get_boolean takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___stringm:
        function s__Table__get_string takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___playerm:
        function s__Table__get_player takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___widgetm:
        function s__Table__get_widget takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___destructablem:
        function s__Table__get_destructable takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___itemm:
        function s__Table__get_item takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___unitm:
        function s__Table__get_unit takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___abilitym:
        function s__Table__get_ability takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___timerm:
        function s__Table__get_timer takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___triggerm:
        function s__Table__get_trigger takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___triggerconditionm:
        function s__Table__get_triggercondition takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___triggeractionm:
        function s__Table__get_triggeraction takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___eventm:
        function s__Table__get_event takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___forcem:
        function s__Table__get_force takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___groupm:
        function s__Table__get_group takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___locationm:
        function s__Table__get_location takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___rectm:
        function s__Table__get_rect takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___boolexprm:
        function s__Table__get_boolexpr takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___soundm:
        function s__Table__get_sound takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___effectm:
        function s__Table__get_effect takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___unitpoolm:
        function s__Table__get_unitpool takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___itempoolm:
        function s__Table__get_itempool takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___questm:
        function s__Table__get_quest takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___questitemm:
        function s__Table__get_questitem takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___defeatconditionm:
        function s__Table__get_defeatcondition takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___timerdialogm:
        function s__Table__get_timerdialog takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___leaderboardm:
        function s__Table__get_leaderboard takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___multiboardm:
        function s__Table__get_multiboard takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___multiboarditemm:
        function s__Table__get_multiboarditem takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___trackablem:
        function s__Table__get_trackable takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___dialogm:
        function s__Table__get_dialog takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___buttonm:
        function s__Table__get_button takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___texttagm:
        function s__Table__get_texttag takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___lightningm:
        function s__Table__get_lightning takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___imagem:
        function s__Table__get_image takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___ubersplatm:
        function s__Table__get_ubersplat takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___regionm:
        function s__Table__get_region takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___fogstatem:
        function s__Table__get_fogstate takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___fogmodifierm:
        function s__Table__get_fogmodifier takes integer this returns integer
            return this
        endfunction
//Implemented from module Table___hashtablem:
        function s__Table__get_hashtable takes integer this returns integer
            return this
        endfunction
    
        function s__Table__get_handle takes integer this returns integer
            return this
        endfunction
    
        function s__Table__get_agent takes integer this returns integer
            return this
        endfunction
    
        //set this = tb[GetSpellAbilityId()]
        function s__Table__getindex takes integer this,integer key returns integer
            return LoadInteger(Table___ht, this, key) //return this.integer[key]
        endfunction
    
        //set tb[389034] = 8192
        function s__Table__setindex takes integer this,integer key,integer tb returns nothing
            call SaveInteger(Table___ht, this, key, tb) //set this.integer[key] = tb
        endfunction
    
        //set b = tb.has(2493223)
        function s__Table_has takes integer this,integer key returns boolean
            return HaveSavedInteger(Table___ht, this, key) //return this.integer.has(key)
        endfunction
    
        //call tb.remove(294080)
        function s__Table_remove takes integer this,integer key returns nothing
            call RemoveSavedInteger(Table___ht, this, key) //call this.integer.remove(key)
        endfunction
    
        //Remove all data from a Table instance
        function s__Table_flush takes integer this returns nothing
            call FlushChildHashtable(Table___ht, this)
        endfunction
    
        //local Table tb = Table.create()
        function s__Table_create takes nothing returns integer
            local integer this= s__Table__getindex(s__Table___dex__get_list(),0)
        
            if this == 0 then
                set this=Table___more + 1
                set Table___more=this
            else
                call s__Table__setindex(s__Table___dex__get_list(),0, s__Table__getindex(s__Table___dex__get_list(),this))
                call s__Table_remove(s__Table___dex__get_list(),this) //Clear hashed memory
            endif
        
             call s__Table__setindex(s__Table___dex__get_list(),this, - 1)
            return this
        endfunction
    
        // Removes all data from a Table instance and recycles its index.
        //
        //     call tb.destroy()
        //
        function s__Table_destroy takes integer this returns nothing
             if s__Table__getindex(s__Table___dex__get_list(),this) != - 1 then
                 call BJDebugMsg("Table Error: Tried to double-free instance: " + I2S(this))
                 return
             endif
        
            call s__Table_flush(this)
        
            call s__Table__setindex(s__Table___dex__get_list(),this, s__Table__getindex(s__Table___dex__get_list(),0))
            call s__Table__setindex(s__Table___dex__get_list(),0, this)
        endfunction
    
//ignored textmacro command: TABLE_BC_METHODS()
   
//ignored textmacro command: TABLE_BC_STRUCTS()
    
    
        //Returns a new TableArray to do your bidding. Simply use:
        //
        //    local TableArray ta = TableArray[array_size]
        //
        function s__TableArray__staticgetindex takes integer array_size returns integer
            local integer tb= s__Table__getindex(s__Table___dex__get_size(),array_size)
            local integer this= s__Table__getindex(tb,0)
        
             if array_size <= 0 then
                 call BJDebugMsg("TypeError: Invalid specified TableArray size: " + I2S(array_size))
                 return 0
             endif
        
            if this == 0 then
                set this=Table___less - array_size
                set Table___less=this
            else
                call s__Table__setindex(tb,0, s__Table__getindex(tb,this)) //Set the last destroyed to the last-last destroyed
                call s__Table_remove(tb,this) //Clear hashed memory
            endif
        
            call s__Table__setindex(s__Table___dex__get_size(),this, array_size) //This remembers the array size
            return this
        endfunction
    
        //Returns the size of the TableArray
        function s__TableArray__get_size takes integer this returns integer
            return s__Table__getindex(s__Table___dex__get_size(),this)
        endfunction
    
        //This magic method enables two-dimensional[array][syntax] for Tables,
        //similar to the two-dimensional utility provided by hashtables them-
        //selves.
        //
        //ta[integer a].unit[integer b] = unit u
        //ta[integer a][integer c] = integer d
        //
        //Inline-friendly when not running in debug mode
        //
        function s__TableArray__getindex takes integer this,integer key returns integer
//#             static if true then
                    local integer i= s__TableArray__get_size(this)
                    if i == 0 then
                        call BJDebugMsg("IndexError: Tried to get key from invalid TableArray instance: " + I2S(this))
                        return 0
                    elseif key < 0 or key >= i then
                        call BJDebugMsg("IndexError: Tried to get key [" + I2S(key) + "] from outside TableArray bounds: " + I2S(i))
                        return 0
                    endif
//#             endif
            return this + key
        endfunction
    
        //Destroys a TableArray without flushing it; I assume you call .flush()
        //if you want it flushed too. This is a public method so that you don't
        //have to loop through all TableArray indices to flush them if you don't
        //need to (ie. if you were flushing all child-keys as you used them).
        //
        function s__TableArray_destroy takes integer this returns nothing
            local integer tb= s__Table__getindex(s__Table___dex__get_size(),s__TableArray__get_size(this))
        
             if s__TableArray__get_size(this) == 0 then
                 call BJDebugMsg("TypeError: Tried to destroy an invalid TableArray: " + I2S(this))
                 return
             endif
        
            if tb == 0 then
                //Create a Table to index recycled instances with their array size
                set tb=s__Table_create()
                call s__Table__setindex(s__Table___dex__get_size(),s__TableArray__get_size(this), tb)
            endif
        
            call s__Table_remove(s__Table___dex__get_size(),this) //Clear the array size from hash memory
        
            call s__Table__setindex(tb,this, s__Table__getindex(tb,0))
            call s__Table__setindex(tb,0, this)
        endfunction
    
    
        //Avoids hitting the op limit
        function s__TableArray_clean takes nothing returns nothing
            local integer tb= s__TableArray_tempTable
            local integer end= tb + 0x1000
            if end < s__TableArray_tempEnd then
                set s__TableArray_tempTable=end
                call ForForce(bj_FORCE_PLAYER[0], function s__TableArray_clean)
            else
                set end=s__TableArray_tempEnd
            endif
            loop
                call s__Table_flush(tb)
                set tb=tb + 1
                exitwhen tb == end
            endloop
        endfunction
    
        //Flushes the TableArray and also destroys it. Doesn't get any more
        //similar to the FlushParentHashtable native than this.
        //
        function s__TableArray_flush takes integer this returns nothing
             if s__TableArray__get_size(this) == 0 then
                 call BJDebugMsg("TypeError: Tried to flush an invalid TableArray instance: " + I2S(this))
                 return
             endif
            set s__TableArray_tempTable=this
            set s__TableArray_tempEnd=this + s__TableArray__get_size(this)
            call ForForce(bj_FORCE_PLAYER[0], function s__TableArray_clean)
            call s__TableArray_destroy(this)
        endfunction
    
   
    //NEW: Added in Table 4.0. A fairly simple struct but allows you to do more
    //than that which was previously possible.

        //Enables myHash[parentKey][childKey] syntax.
        //Basically, it creates a Table in the place of the parent key if
        //it didn't already get created earlier.
        function s__HashTable__getindex takes integer this,integer index returns integer
            local integer t= s__Table__getindex((this),index)
            if t == 0 then
                set t=s__Table_create()
                call s__Table__setindex((this),index, t) //whoops! Forgot that line. I'm out of practice!
            endif
            return t
        endfunction

        //You need to call this on each parent key that you used if you
        //intend to destroy the HashTable or simply no longer need that key.
        function s__HashTable_remove takes integer this,integer index returns nothing
            local integer t= s__Table__getindex((this),index)
            if t != 0 then
                call s__Table_destroy(t)
                call s__Table_remove((this),index)
            endif
        endfunction
    
        //Added in version 4.1
        function s__HashTable_has takes integer this,integer index returns boolean
            return s__Table_has((this),index)
        endfunction
    
        //HashTables are just fancy Table indices.
        function s__HashTable_destroy takes integer this returns nothing
            call s__Table_destroy((this))
        endfunction
    
        //Like I said above...
        function s__HashTable_create takes nothing returns integer
            return s__Table_create()
        endfunction



//library Table ends
//library MIXLib:


        function s__DB_create takes player p returns integer
            local integer db= s__DB__allocate()
                set s__DB_p[db]=p
            return db
        endfunction

        function s__Playerdb__getindex takes integer this,player p returns integer
            return s__MIXLib___dbarr[GetPlayerId(p)]
        endfunction

    function MIXLib___fill_dbarr takes nothing returns nothing
        set pdb=s__Playerdb__allocate()
        set s__MIXLib___dbarr[0]= s__DB_create(Player(0x00))
        set s__MIXLib___dbarr[1]= s__DB_create(Player(0x01))
        set s__MIXLib___dbarr[2]= s__DB_create(Player(0x02))
        set s__MIXLib___dbarr[3]= s__DB_create(Player(0x03))
        set s__MIXLib___dbarr[4]= s__DB_create(Player(0x04))
        set s__MIXLib___dbarr[5]= s__DB_create(Player(0x05))
        set s__MIXLib___dbarr[6]= s__DB_create(Player(0x06))
        set s__MIXLib___dbarr[7]= s__DB_create(Player(0x07))
    endfunction

    function MIXLib___MIXLibInit takes nothing returns nothing
        call MIXLib___fill_dbarr()
    endfunction

//library MIXLib ends
//library RegisterNativeEvent:



//#         static if LIBRARY_Table then
//#         else
//#             static hashtable table = InitHashtable()
//#         endif
//Implemented from module RegisterNativeEvent___NativeEventInit:
        function s__RegisterNativeEvent___NativeEvent_RegisterNativeEvent___NativeEventInit___onInit takes nothing returns nothing
//#             static if LIBRARY_Table then
                    set s__RegisterNativeEvent___NativeEvent_table=s__TableArray__staticgetindex(0x2000)
//#             endif
        endfunction

    function IsNativeEventRegistered takes integer whichIndex,integer whichEvent returns boolean
//#         static if LIBRARY_Table then
                return s__Table___triggers_has(s__Table__get_trigger(s__TableArray__getindex(s__RegisterNativeEvent___NativeEvent_table,whichEvent)),whichIndex)
//#         else
//#             return HaveSavedHandle(RegisterNativeEvent___NativeEvent.table, whichEvent, whichIndex)
//#         endif
    endfunction

    function RegisterNativeEventTrigger takes integer whichIndex,integer whichEvent returns boolean
        if not IsNativeEventRegistered(whichIndex , whichEvent) then
//#             static if LIBRARY_Table then
                    call s__Table___triggers__setindex(s__Table__get_trigger(s__TableArray__getindex(s__RegisterNativeEvent___NativeEvent_table,whichEvent)),whichIndex, CreateTrigger())
//#             else
//#                 call SaveTriggerHandle(RegisterNativeEvent___NativeEvent.table, whichEvent, whichIndex, CreateTrigger())
//#             endif
            return true
        endif
        return false
    endfunction

    function GetIndexNativeEventTrigger takes integer whichIndex,integer whichEvent returns trigger
//#         static if LIBRARY_Table then
                return s__Table___triggers__getindex(s__Table__get_trigger(s__TableArray__getindex(s__RegisterNativeEvent___NativeEvent_table,whichEvent)),whichIndex)
//#         else
//#             return LoadTriggerHandle(RegisterNativeEvent___NativeEvent.table, whichEvent, whichIndex)
//#         endif
    endfunction

    function GetNativeEventTrigger takes integer whichEvent returns trigger
        return GetIndexNativeEventTrigger(bj_MAX_PLAYER_SLOTS , whichEvent)
    endfunction

    function CreateNativeEvent takes nothing returns integer
        local integer eventId= RegisterNativeEvent___eventIndex
        call RegisterNativeEventTrigger(bj_MAX_PLAYER_SLOTS , eventId)
        set RegisterNativeEvent___eventIndex=RegisterNativeEvent___eventIndex + 1
        return eventId
    endfunction

    function RegisterIndexNativeEvent takes integer whichIndex,integer whichEvent,code func returns triggercondition
        call RegisterNativeEventTrigger(whichIndex , whichEvent)
        return TriggerAddCondition(GetIndexNativeEventTrigger(whichIndex , whichEvent), Condition(func))
    endfunction

    function RegisterNativeEvent takes integer whichEvent,code func returns triggercondition
        return RegisterIndexNativeEvent(bj_MAX_PLAYER_SLOTS , whichEvent , func)
    endfunction

    function UnregisterNativeEventHandler takes integer whichEvent,triggercondition handler returns nothing
        call TriggerRemoveCondition(GetNativeEventTrigger(whichEvent), handler)
    endfunction


//library RegisterNativeEvent ends
//library RegisterPlayerUnitEvent:

    function GetAnyPlayerUnitEventTrigger takes playerunitevent whichEvent returns trigger
        return GetNativeEventTrigger(GetHandleId(whichEvent))
    endfunction

    function GetPlayerUnitEventTrigger takes player whichPlayer,playerunitevent whichEvent returns trigger
        return GetIndexNativeEventTrigger(GetPlayerId(whichPlayer) , GetHandleId(whichEvent))
    endfunction

    function RegisterAnyPlayerUnitEvent takes playerunitevent whichEvent,code func returns nothing
        local integer eventId= GetHandleId(whichEvent)
        local integer index= 0
        local trigger t= null

        if RegisterNativeEventTrigger(bj_MAX_PLAYER_SLOTS , eventId) then
            set t=GetNativeEventTrigger(eventId)
            loop
                call TriggerRegisterPlayerUnitEvent(t, Player(index), whichEvent, null)
                set index=index + 1
                exitwhen index == bj_MAX_PLAYER_SLOTS
            endloop
            set t=null
        endif

        call RegisterNativeEvent(eventId , func)
    endfunction

    function RegisterPlayerUnitEvent takes player whichPlayer,playerunitevent whichEvent,code func returns nothing
        local integer playerId= GetPlayerId(whichPlayer)
        local integer eventId= GetHandleId(whichEvent)

        if RegisterNativeEventTrigger(playerId , eventId) then
            call TriggerRegisterPlayerUnitEvent(GetIndexNativeEventTrigger(playerId , eventId), whichPlayer, whichEvent, null)
        endif

        call RegisterIndexNativeEvent(playerId , eventId , func)
    endfunction


//library RegisterPlayerUnitEvent ends
//library UnitRecycler:
    //CONFIGURATION SECTION



    
//#     static if UnitRecycler___AUTO_RECYCLE_DEAD then
            function UnitRecycler___DeathTime takes unit u returns real
                
                return 8.00
            endfunction
//#     endif

    // Filters units allowed for recycling
    function UnitRecycler___UnitTypeFilter takes unit u returns boolean
        return not IsUnitIllusion(u) and not IsUnitType(u, UNIT_TYPE_SUMMONED)
    endfunction

    


    //END OF CONFIGURATION

    //== Do not do changes below this line if you're not so sure on what you're doing ==





        constant function s__UnitRecycler___List__get_head takes nothing returns integer
            return 0
        endfunction

        function s__UnitRecycler___List_stockUnit takes integer this,unit u returns nothing
            local integer node= s__UnitRecycler___List_recycler[s__UnitRecycler___List__get_head()]
            local integer last= s__UnitRecycler___List_prev[this]
            set s__UnitRecycler___List_recycler[s__UnitRecycler___List__get_head()]=s__UnitRecycler___List_recycler[node]
            set s__UnitRecycler___List_prev[this]=node
            set s__UnitRecycler___List_next[last]=node
            set s__UnitRecycler___List_prev[node]=last
            set s__UnitRecycler___List_next[node]=this
            set s__UnitRecycler___List_unit[node]=u
            call PauseUnit(u, true)
            call SetUnitX(u, UnitRecycler___unitCampX)
            call SetUnitY(u, UnitRecycler___unitCampY)
             call s__Table___booleans__setindex(s__Table__get_boolean(s__UnitRecycler___List_stocked),GetHandleId(u), true)
        endfunction

        function s__UnitRecycler___List_addUnit takes integer this,unit u,real angle returns boolean
            if u != null and not IsUnitType(u, UNIT_TYPE_HERO) and UnitRecycler___UnitTypeFilter(u) then
                if not UnitAlive(u) and not ReviveUnit(u) then
//#                     static if LIBRARY_ErrorMessage then
//#                          call ThrowWarning(true, "UnitRecycler", "addUnit()", "UnitRecycler___List", GetHandleId(u), "Unable to recycle unit: Unable to revive dead unit")
//#                     endif
                    return false
                endif
                call s__UnitRecycler___List_stockUnit(this,u)
                call SetUnitFacing(u, angle)
                call SetUnitOwner(u, UnitRecycler___OWNER, true)
                call SetWidgetLife(u, GetUnitState(u, UNIT_STATE_MAX_LIFE))
                call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA))
//Implemented from module UnitRecycler___UnitRecyclerResets:
        call SetUnitScale(u, 1, 0, 0)
        call SetUnitVertexColor(u, 255, 255, 255, 255)
        call SetUnitFlyHeight(u, GetUnitDefaultFlyHeight(u), 0)
                return true
            endif
            return false
        endfunction

        function s__UnitRecycler___List_getUnit takes integer this,player owner,integer id,real x,real y,real angle returns unit
            local integer first
            local integer next
            local real facing
            local real deltaAngle
            if not IsHeroUnitId(id) then
                set first=s__UnitRecycler___List_next[this]
                set deltaAngle=RAbsBJ(GetUnitFacing(s__UnitRecycler___List_unit[first]) - angle)
                if deltaAngle > 180.00 then
                    set deltaAngle=360.00 - deltaAngle
                endif
                if first == this or deltaAngle > UnitRecycler___HALF_INTERVAL then
                    set bj_lastCreatedUnit=CreateUnit(owner, id, x, y, angle)
                else
                    set bj_lastCreatedUnit=s__UnitRecycler___List_unit[first]
                    set s__UnitRecycler___List_unit[first]=null
                    set next=s__UnitRecycler___List_next[first]
                    set s__UnitRecycler___List_prev[next]=this
                    set s__UnitRecycler___List_next[this]=next
                    call SetUnitOwner(bj_lastCreatedUnit, owner, true)
                    call SetUnitPosition(bj_lastCreatedUnit, x, y)
                    call SetUnitFacing(bj_lastCreatedUnit, angle)
                    call PauseUnit(bj_lastCreatedUnit, false)
                     call s__Table___booleans_remove(s__Table__get_boolean(s__UnitRecycler___List_stocked),GetHandleId(bj_lastCreatedUnit))
                endif
                return bj_lastCreatedUnit
            endif
            return null
        endfunction

        function s__UnitRecycler___List_init takes nothing returns nothing
            local integer this= 0
            set s__UnitRecycler___List_recycler[(8190)]=0
            loop
                set s__UnitRecycler___List_recycler[this]=this + 1
                set this=this + 1
                exitwhen this == 8190
            endloop
             set s__UnitRecycler___List_stocked=s__Table_create()
        endfunction




        function s__UnitRecycler___UnitRecycler_getRawCodeId takes integer rawCode returns integer
            local integer i= s__Table__getindex(s__UnitRecycler___UnitRecycler_rawCodeIdTable,rawCode)
            if i == 0 then
                set s__UnitRecycler___UnitRecycler_rawCodeCount=s__UnitRecycler___UnitRecycler_rawCodeCount + 1
                call s__Table__setindex(s__UnitRecycler___UnitRecycler_rawCodeIdTable,rawCode, s__UnitRecycler___UnitRecycler_rawCodeCount)
                set i=s__UnitRecycler___UnitRecycler_rawCodeCount
            endif
            return i
        endfunction

        function s__UnitRecycler___UnitRecycler_getHead takes integer id,integer index returns integer
            local integer this= s__UnitRecycler___UnitRecycler_head[id * UnitRecycler___ANGLE_COUNT + index]
            if this == 0 then
                set this=s__UnitRecycler___List_recycler[s__UnitRecycler___List__get_head()]
                set s__UnitRecycler___List_recycler[s__UnitRecycler___List__get_head()]=s__UnitRecycler___List_recycler[this]
                set s__UnitRecycler___List_prev[this]=this
                set s__UnitRecycler___List_next[this]=this
                set s__UnitRecycler___UnitRecycler_head[id * UnitRecycler___ANGLE_COUNT + index]=this
            endif
            return this
        endfunction

        function s__UnitRecycler___UnitRecycler_getListIndex takes integer id returns integer
            if s__UnitRecycler___UnitRecycler_stackSize[id] == 0 then
                if s__UnitRecycler___UnitRecycler_position[id] < UnitRecycler___ANGLE_COUNT - 1 then
                    set s__UnitRecycler___UnitRecycler_position[id]=s__UnitRecycler___UnitRecycler_position[id] + 1
                    return s__UnitRecycler___UnitRecycler_position[id]
                endif
                set s__UnitRecycler___UnitRecycler_position[id]=0
                return 0
            endif
            set s__UnitRecycler___UnitRecycler_stackSize[id]=s__UnitRecycler___UnitRecycler_stackSize[id] - 1
            return s__UnitRecycler___UnitRecycler_indexStack[id * UnitRecycler___ANGLE_COUNT + s__UnitRecycler___UnitRecycler_stackSize[id]]
        endfunction

        function s__UnitRecycler___UnitRecycler_stock takes integer rawCode returns boolean
            local integer id
            local integer index
            local unit u
            if not IsHeroUnitId(rawCode) then
                set id=s__UnitRecycler___UnitRecycler_getRawCodeId(rawCode)
                set index=s__UnitRecycler___UnitRecycler_getListIndex(id)
                set u=CreateUnit(UnitRecycler___OWNER, rawCode, 0.00, 0.00, index * UnitRecycler___ANGLE_INTERVAL)
                if u != null and not IsUnitType(u, UNIT_TYPE_HERO) and UnitRecycler___UnitTypeFilter(u) then
                    call s__UnitRecycler___List_stockUnit(s__UnitRecycler___UnitRecycler_getHead(id , index),u)
                    set u=null
                    return true
                endif
            endif
            return false
        endfunction

        function s__UnitRecycler___UnitRecycler_add takes unit u returns boolean
            local integer id= s__UnitRecycler___UnitRecycler_getRawCodeId(GetUnitTypeId(u))
            local integer index= s__UnitRecycler___UnitRecycler_getListIndex(id)
            return s__UnitRecycler___List_addUnit(s__UnitRecycler___UnitRecycler_getHead(id , index),u , index * UnitRecycler___ANGLE_INTERVAL)
        endfunction

        function s__UnitRecycler___UnitRecycler_get takes player owner,integer rawCode,real x,real y,real angle returns unit
            local integer id= s__UnitRecycler___UnitRecycler_getRawCodeId(rawCode)
            local integer index= R2I(angle / UnitRecycler___ANGLE_INTERVAL)
            if angle - UnitRecycler___ANGLE_INTERVAL * index > UnitRecycler___ANGLE_INTERVAL / 2.00 then
                if index < UnitRecycler___ANGLE_COUNT - 1 then
                    set index=index + 1
                else
                    set index=0
                endif
            endif
            set s__UnitRecycler___UnitRecycler_indexStack[id * UnitRecycler___ANGLE_COUNT + s__UnitRecycler___UnitRecycler_stackSize[id]]=index
            set s__UnitRecycler___UnitRecycler_stackSize[id]=s__UnitRecycler___UnitRecycler_stackSize[id] + 1
            return s__UnitRecycler___List_getUnit(s__UnitRecycler___UnitRecycler_getHead(id , index),owner , rawCode , x , y , angle)
        endfunction

        function s__UnitRecycler___UnitRecycler_delayedRecycle takes nothing returns nothing
            local timer t= GetExpiredTimer()
            local integer key= GetHandleId(t)
            call s__UnitRecycler___UnitRecycler_add(s__Table___units__getindex(s__Table__get_unit(s__UnitRecycler___UnitRecycler_timerTable),key))
            call s__Table___units_remove(s__Table__get_unit(s__UnitRecycler___UnitRecycler_timerTable),key)
            call DestroyTimer(t)
            set t=null
        endfunction
        function s__UnitRecycler___UnitRecycler_delayedRecycleEx takes nothing returns nothing
            local timer t= GetExpiredTimer()
            local integer key= GetHandleId(t)
            call s__UnitRecycler___UnitRecycler_add(s__Table___units__getindex(s__Table__get_unit(s__UnitRecycler___UnitRecycler_timerTable),key))
            call s__Table___units_remove(s__Table__get_unit(s__UnitRecycler___UnitRecycler_timerTable),key)
            call DestroyTimer(t)
            set t=null
        endfunction

        function s__UnitRecycler___UnitRecycler_addDelayed takes unit u,real delay,code callback returns nothing
            local timer t= CreateTimer()
            call s__Table___units__setindex(s__Table__get_unit(s__UnitRecycler___UnitRecycler_timerTable),GetHandleId(t), u)
            call TimerStart(t, delay, false, callback)
            set t=null
        endfunction

        function s__UnitRecycler___UnitRecycler_init takes nothing returns nothing
            local rect bounds= GetWorldBounds()
            // Hide recycled units at the top of the map beyond reach of the camera
            set UnitRecycler___unitCampX=0.00
            set UnitRecycler___unitCampY=GetRectMaxY(bounds) + 1000.00
            call RemoveRect(bounds)
            set bounds=null
            set s__UnitRecycler___UnitRecycler_rawCodeIdTable=s__Table_create()
            set s__UnitRecycler___UnitRecycler_timerTable=s__Table_create()
        endfunction


    //========================================================================================================

    function GetRecycledUnit takes player owner,integer rawCode,real x,real y,real facing returns unit
//#         static if true and LIBRARY_ErrorMessage then
//#             call UnitRecycler___UnitRecycler.get(owner, rawCode, x, y, facing)
//#             call ThrowError(bj_lastCreatedUnit == null, "UnitRecycler", "GetRecycledUnit()", "", 0, "Specified unit type does not exist")
//#             call ThrowError(IsHeroUnitId(rawCode), "UnitRecycler", "GetRecycledUnit()", GetUnitName(bj_lastCreatedUnit), 0, "Specified unit type is a hero")
//#             return bj_lastCreatedUnit
//#         else
                return s__UnitRecycler___UnitRecycler_get(owner , rawCode , x , y , facing)
//#         endif
    endfunction

    function GetRecycledUnitEx takes player owner,integer rawCode,real x,real y,real facing returns unit
        if not IsHeroUnitId(rawCode) then
            return s__UnitRecycler___UnitRecycler_get(owner , rawCode , x , y , facing)
        endif
//#         static if LIBRARY_ErrorMessage then
//#              call ThrowWarning(true, "UnitRecycler", "GetRecycledUnitEx()", "", 0, "Cannot retrieve a hero unit, creating new unit")
//#         endif
        return CreateUnit(owner, rawCode, x, y, facing)
    endfunction

    function RecycleUnit takes unit u returns boolean
//#         static if LIBRARY_ErrorMessage then
//#              call ThrowError(UnitRecycler___List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnit()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
//#              call ThrowWarning(u == null, "UnitRecycler", "RecycleUnit()", "", 0, "Attempted to recycle a null unit")
//#              call ThrowWarning(IsHeroUnitId(GetUnitTypeId(u)), "UnitRecycler", "RecycleUnit()", GetUnitName(u), 0, "Attempted to recycle a hero unit")
//#              call ThrowWarning(not UnitRecycler___UnitTypeFilter(u), "UnitRecycler", "RecycleUnit()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
//#         endif
        return s__UnitRecycler___UnitRecycler_add(u)
    endfunction

    function RecycleUnitEx takes unit u returns boolean
//#         static if LIBRARY_ErrorMessage then
//#              call ThrowError(UnitRecycler___List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnitEx()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
//#              call ThrowWarning(u == null, "UnitRecycler", "RecycleUnitEx()", "", 0, "Attempted to recycle a null unit")
//#              call ThrowWarning(not UnitRecycler___UnitTypeFilter(u), "UnitRecycler", "RecycleUnitEx()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
//#         endif
        if not s__UnitRecycler___UnitRecycler_add(u) then
            call RemoveUnit(u)
//#             static if LIBRARY_ErrorMessage then
//#                  call ThrowWarning(u != null, "UnitRecycler", "RecycleUnitEx()", GetUnitName(u), 0, "Cannot recycle the specified unit, removing unit")
//#             endif
            return false
        endif
        return true
    endfunction

    function RecycleUnitDelayed takes unit u,real delay returns nothing
//#         static if LIBRARY_ErrorMessage then
//#              call ThrowError(UnitRecycler___List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnitDelayed()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
//#              call ThrowWarning(u == null, "UnitRecycler", "RecycleUnitDelayed()", "", 0, "Attempted to recycle a null unit")
//#              call ThrowWarning(IsHeroUnitId(GetUnitTypeId(u)), "UnitRecycler", "RecycleUnitDelayed()", GetUnitName(u), 0, "Attempted to recycle a hero unit")
//#              call ThrowWarning(not UnitRecycler___UnitTypeFilter(u), "UnitRecycler", "RecycleUnitDelayed()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
//#         endif
        call s__UnitRecycler___UnitRecycler_addDelayed(u , delay , function s__UnitRecycler___UnitRecycler_delayedRecycle)
    endfunction

    function RecycleUnitDelayedEx takes unit u,real delay returns nothing
//#         static if LIBRARY_ErrorMessage then
//#              call ThrowError(UnitRecycler___List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnitDelayedEx()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
//#              call ThrowWarning(u == null, "UnitRecycler", "RecycleUnitDelayedEx()", "", 0, "Attempted to recycle a null unit")
//#              call ThrowWarning(not UnitRecycler___UnitTypeFilter(u), "UnitRecycler", "RecycleUnitDelayedEx()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
//#         endif
        call s__UnitRecycler___UnitRecycler_addDelayed(u , delay , function s__UnitRecycler___UnitRecycler_delayedRecycleEx)
    endfunction

    function UnitAddToStock takes integer rawCode returns boolean
//#         static if LIBRARY_ErrorMessage then
//#              local unit u = CreateUnit(UnitRecycler___OWNER, rawCode, 0, 0, 0)
//#              call ThrowWarning(u == null, "UnitRecycler", "UnitAddToStock()", "", 0, "Attempted to stock a non-existent unit type")
//#              call ThrowWarning(IsHeroUnitId(rawCode), "UnitRecycler", "UnitAddToStock()", GetUnitName(u), 0, "Attempted to stock a hero unit")
//#              call ThrowWarning(not UnitRecycler___UnitTypeFilter(u), "UnitRecycler", "UnitAddToStock()", GetUnitName(u), 0, "Attempted to stock an invalid unit type")
//#              call RemoveUnit(u)
//#              set u = null
//#         endif
        return s__UnitRecycler___UnitRecycler_stock(rawCode)
    endfunction

    //========================================================================================================



//#         static if UnitRecycler___AUTO_RECYCLE_DEAD then
                function s__UnitRecycler___Initializer_onDeath takes nothing returns nothing
                    local unit u= GetTriggerUnit()
//#                 static if LIBRARY_ErrorMessage then
//#                      call ThrowError(UnitRecycler___List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "", GetUnitName(u), 0, "A unit in stock has been killed!")
//#                 endif
                    if UnitRecycler___UnitTypeFilter(u) and not IsUnitType(u, UNIT_TYPE_HERO) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) then
                        call RecycleUnitDelayedEx(u , UnitRecycler___DeathTime(u))
                    endif
                    set u=null
                endfunction
    
                function s__UnitRecycler___Initializer_autoRecycler takes nothing returns nothing
//#                 static if UnitRecycler___AUTO_RECYCLE_DEAD then
//#                     static if LIBRARY_RegisterPlayerUnitEvent then
                            call RegisterAnyPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH , function s__UnitRecycler___Initializer_onDeath)
//#                     else
//#                         local trigger t = CreateTrigger()
//#                         local code c = function UnitRecycler___Initializer.onDeath
//#                         local integer i = 16
//#                         loop
//#                             set i = i - 1
//#                             call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_DEATH, null)
//#                             exitwhen i == 0
//#                         endloop
//#                         call TriggerAddCondition(t, Filter(c))
//#                         set t = null
//#                     endif
//#                 endif
                endfunction
//#         endif

        function s__UnitRecycler___Initializer_init takes nothing returns nothing
            call s__UnitRecycler___List_init()
            call s__UnitRecycler___UnitRecycler_init()
//#             static if UnitRecycler___AUTO_RECYCLE_DEAD then
                    call s__UnitRecycler___Initializer_autoRecycler()
//#             endif
            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, "|CFFFFCC00UnitRecycler|R library is ready!")
        endfunction
//Implemented from module UnitRecycler___Init:
        function s__UnitRecycler___Initializer_UnitRecycler___Init___onInit takes nothing returns nothing
            call s__UnitRecycler___Initializer_init()
        endfunction


//#     static if true and LIBRARY_ErrorMessage then
//#         function UnitRecycler___DisplayError takes unit removedUnit returns nothing
//#             call ThrowError(UnitRecycler___List.stocked.boolean[GetHandleId(removedUnit)], "UnitRecycler", "RemoveUnit()", GetUnitName(removedUnit), 0, "Attempted to remove a stocked unit")
//#         endfunction
//# 
//#         hook RemoveUnit UnitRecycler___DisplayError
//#     endif


//library UnitRecycler ends
//library ResourcePreloader:
    

    //========================================================================================================
    //            Do not try to change below this line if you're not so sure on what you're doing.            
    //========================================================================================================


    //============================================== TextMacros ==============================================



    //========================================================================================================

    function ResourcePreloader___DoUnitPreload takes integer id returns nothing
//#         static if LIBRARY_UnitRecycler then
                call RecycleUnitEx(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), id, 0, 0, 270))
//#         else
//#             call RemoveUnit(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), id, 0, 0, 0))
//#         endif
    endfunction

    function ResourcePreloader___DoItemPreload takes integer id returns nothing
        call RemoveItem(UnitAddItemById(s__ResourcePreloader___S_dummy, id))
    endfunction

    function ResourcePreloader___DoAbilityPreload takes integer id returns boolean
        return UnitAddAbility(s__ResourcePreloader___S_dummy, id) and UnitRemoveAbility(s__ResourcePreloader___S_dummy, id)
    endfunction

    function ResourcePreloader___DoEffectPreload takes string path returns nothing
        call DestroyEffect(AddSpecialEffect(path, GetUnitX(s__ResourcePreloader___S_dummy), GetUnitY(s__ResourcePreloader___S_dummy)))
    endfunction

    function ResourcePreloader___DoSoundPreload takes string path returns nothing
        local sound s= CreateSound(path, false, false, false, 10, 10, "")
        call SetSoundVolume(s, 0)
        call StartSound(s)
        call KillSoundWhenDone(s)
        set s=null
    endfunction

//textmacro instance: PRELOAD_TYPE("Unit", "integer", "unit", "what", "0")
    function PreloadUnit takes integer what returns nothing
//#         static if LIBRARY_Table then
                if s__Table___booleans__getindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,0)),what) then
                    return
                endif
                call s__Table___booleans__setindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,0)),what, true)
                call ResourcePreloader___DoUnitPreload(what)
//#         else
//#             if LoadBoolean(ResourcePreloader___S.tb, 0, what) then
//#                 return
//#             endif
//#             call SaveBoolean(ResourcePreloader___S.tb, 0, what, true)
//#             call ResourcePreloader___DoUnitPreload(what)
//#         endif
    endfunction
//end of: PRELOAD_TYPE("Unit", "integer", "unit", "what", "0")
//textmacro instance: PRELOAD_TYPE("Item", "integer", "item", "what", "1")
    function PreloadItem takes integer what returns nothing
//#         static if LIBRARY_Table then
                if s__Table___booleans__getindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,1)),what) then
                    return
                endif
                call s__Table___booleans__setindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,1)),what, true)
                call ResourcePreloader___DoItemPreload(what)
//#         else
//#             if LoadBoolean(ResourcePreloader___S.tb, 1, what) then
//#                 return
//#             endif
//#             call SaveBoolean(ResourcePreloader___S.tb, 1, what, true)
//#             call ResourcePreloader___DoItemPreload(what)
//#         endif
    endfunction
//end of: PRELOAD_TYPE("Item", "integer", "item", "what", "1")
//textmacro instance: PRELOAD_TYPE("Ability", "integer", "ability", "what", "2")
    function PreloadAbility takes integer what returns nothing
//#         static if LIBRARY_Table then
                if s__Table___booleans__getindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,2)),what) then
                    return
                endif
                call s__Table___booleans__setindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,2)),what, true)
                call ResourcePreloader___DoAbilityPreload(what)
//#         else
//#             if LoadBoolean(ResourcePreloader___S.tb, 2, what) then
//#                 return
//#             endif
//#             call SaveBoolean(ResourcePreloader___S.tb, 2, what, true)
//#             call ResourcePreloader___DoAbilityPreload(what)
//#         endif
    endfunction
//end of: PRELOAD_TYPE("Ability", "integer", "ability", "what", "2")
//textmacro instance: PRELOAD_TYPE("Effect", "string", "effect", "StringHash(what)", "3")
    function PreloadEffect takes string what returns nothing
//#         static if LIBRARY_Table then
                if s__Table___booleans__getindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,3)),StringHash(what)) then
                    return
                endif
                call s__Table___booleans__setindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,3)),StringHash(what), true)
                call ResourcePreloader___DoEffectPreload(what)
//#         else
//#             if LoadBoolean(ResourcePreloader___S.tb, 3, StringHash(what)) then
//#                 return
//#             endif
//#             call SaveBoolean(ResourcePreloader___S.tb, 3, StringHash(what), true)
//#             call ResourcePreloader___DoEffectPreload(what)
//#         endif
    endfunction
//end of: PRELOAD_TYPE("Effect", "string", "effect", "StringHash(what)", "3")
//textmacro instance: PRELOAD_TYPE("Sound", "string", "sound", "StringHash(what)", "4")
    function PreloadSound takes string what returns nothing
//#         static if LIBRARY_Table then
                if s__Table___booleans__getindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,4)),StringHash(what)) then
                    return
                endif
                call s__Table___booleans__setindex(s__Table__get_boolean(s__TableArray__getindex(s__ResourcePreloader___S_tb,4)),StringHash(what), true)
                call ResourcePreloader___DoSoundPreload(what)
//#         else
//#             if LoadBoolean(ResourcePreloader___S.tb, 4, StringHash(what)) then
//#                 return
//#             endif
//#             call SaveBoolean(ResourcePreloader___S.tb, 4, StringHash(what), true)
//#             call ResourcePreloader___DoSoundPreload(what)
//#         endif
    endfunction
//end of: PRELOAD_TYPE("Sound", "string", "sound", "StringHash(what)", "4")

//#     static if LIBRARY_BJObjectId then
    //textmacro instance: RANGED_PRELOAD_TYPE("Unit")
        function PreloadUnitEx takes integer start,integer end returns nothing
            local boolean forward= start < end
            loop
                call PreloadUnit(start)
                exitwhen start == end
                if forward then
                    set start=s__BJObjectId_plus_1((start))
                    exitwhen start > end
                else
                    set start=s__BJObjectId_minus_1((start))
                    exitwhen start < end
                endif
            endloop
        endfunction
    //end of: RANGED_PRELOAD_TYPE("Unit")
    //textmacro instance: RANGED_PRELOAD_TYPE("Item")
        function PreloadItemEx takes integer start,integer end returns nothing
            local boolean forward= start < end
            loop
                call PreloadItem(start)
                exitwhen start == end
                if forward then
                    set start=s__BJObjectId_plus_1((start))
                    exitwhen start > end
                else
                    set start=s__BJObjectId_minus_1((start))
                    exitwhen start < end
                endif
            endloop
        endfunction
    //end of: RANGED_PRELOAD_TYPE("Item")
    //textmacro instance: RANGED_PRELOAD_TYPE("Ability")
        function PreloadAbilityEx takes integer start,integer end returns nothing
            local boolean forward= start < end
            loop
                call PreloadAbility(start)
                exitwhen start == end
                if forward then
                    set start=s__BJObjectId_plus_1((start))
                    exitwhen start > end
                else
                    set start=s__BJObjectId_minus_1((start))
                    exitwhen start < end
                endif
            endloop
        endfunction
    //end of: RANGED_PRELOAD_TYPE("Ability")
//#     endif

    //========================================================================================================


//#         static if LIBRARY_Table then
//#         else
//#             static hashtable tb = InitHashtable()
//#         endif
//Implemented from module ResourcePreloader___Init:
        function s__ResourcePreloader___S_ResourcePreloader___Init___onInit takes nothing returns nothing
            local rect world= GetWorldBounds()
//#             static if LIBRARY_Table then
                    set s__ResourcePreloader___S_tb=s__TableArray__staticgetindex(5)
//#             endif
            set s__ResourcePreloader___S_dummy=CreateUnit(ResourcePreloader_PRELOAD_UNIT_OWNER, ResourcePreloader_PRELOAD_UNIT_TYPE_ID, 0, 0, 0)
            call SetUnitY(s__ResourcePreloader___S_dummy, GetRectMaxY(world) + ResourcePreloader_PRELOAD_UNIT_Y_BOUNDS_EXTENSION)
            call UnitAddAbility(s__ResourcePreloader___S_dummy, 'AInv')
            call UnitAddAbility(s__ResourcePreloader___S_dummy, 'Avul')
            call UnitRemoveAbility(s__ResourcePreloader___S_dummy, 'Amov')
            call RemoveRect(world)
            set world=null
        endfunction



//library ResourcePreloader ends










function Locale takes nothing returns string
    local string s= GetLocalizedString("CHEATENABLED")
    if ( s == "Чит включен!" ) then
        set s="RU"
    else
        set s="EN"
    endif
    return s

endfunction


function defeat_clear takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function defeat_quit takes nothing returns nothing
    call EndGame(true)
endfunction

function win takes player p returns nothing
    local trigger t= CreateTrigger()
    local dialog d= DialogCreate()
    call RemovePlayer(p, PLAYER_GAME_RESULT_VICTORY)
    if ( GetPlayerController(p) == MAP_CONTROL_USER ) then
        call DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE"), GetLocalizedHotkey("GAMEOVER_CONTINUE")))
        call TriggerAddAction(t, function defeat_quit)
        set t=CreateTrigger()
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
        call TriggerAddAction(t, function defeat_quit)
        if ( GetLocalPlayer() == p ) then
            call EnableUserControl(true)
            call EnableUserUI(false)
        endif
        call DialogDisplay(p, d, true)
        if ( GetLocalPlayer() == p ) then
            call VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, 1.)
            call StartSound(bj_victoryDialogSound)
        endif
    endif
    set t=null
    set d=null
endfunction

function defeat takes player p returns nothing
    local trigger t= CreateTrigger()
    local dialog d= DialogCreate()
    call RemovePlayer(p, PLAYER_GAME_RESULT_DEFEAT)
    if ( GetPlayerController(p) == MAP_CONTROL_USER ) then
        if ( Locale() == "RU" ) then
            call DialogSetMessage(d, "Вы проиграли!")
        else
            call DialogSetMessage(d, "You was defeated!")
        endif
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
        call TriggerAddAction(t, function defeat_quit)
        if ( GetLocalPlayer() == p ) then
            call EnableUserControl(true)
            call EnableUserUI(false)
        endif
        call DialogDisplay(p, d, true)
        if ( GetLocalPlayer() == p ) then
            call VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, 1.)
            call StartSound(bj_defeatDialogSound)
        endif
    endif
    set t=null
    set d=null
endfunction
function gameset_end takes nothing returns nothing
    call EnableTrigger(gg_trg_inc_colour)
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    call DisableTrigger(gg_trg_cmd_time)
    call DisableTrigger(gg_trg_cmd_build)
    call DisableTrigger(gg_trg_cmd_mode)
    call DisableTrigger(gg_trg_cmd_point)
    call DisableTrigger(gg_trg_cmd_arena)
    call TriggerExecute(gg_trg_set_wave_start_main)
    call TriggerExecute(gg_trg_set_wave_timer)
    call TriggerExecute(gg_trg_set_wave_region_rotate)
    call TriggerExecute(gg_trg_set_wave_unit_spawn)
endfunction


//===========================================================================
function gameset_owner takes nothing returns nothing
    local integer i= 0
    set udg_game_owner=null // Game owner
    loop // Sets game owner to a first available player
        if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then // Must be playing player
            set udg_game_owner=Player(0)
        endif
        exitwhen ( udg_game_owner != null or i > 7 ) // TODO: test
        set i=i + 1
    endloop

//#     static if  not true  then
//#         // Notification for game owner
//#         call DisplayTimedTextToPlayer(udg_game_owner, 0., 0., 10., "Вы получили права " + GREEN + "владельца игры|r.")
//#     endif

    // Opt. begin
    if ( GetTimeInSeconds() < R2I(udg_gameset_time_first) ) then // Shows commands and settings only at game start
        if ( udg_info[GetConvertedPlayerId(udg_game_owner)] == true ) then // Checks Info flag of game owner
//#             static if  not true  then
//#                 // Shows all available commands and settings
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "Настройка карты (доступно первые " + ( I2S(R2I(udg_gameset_time_first)) + " сек.)" ) ) )
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_gameset_time) ) + " ) " ) + "|cFFFF0000-time xxx|r, где xxx - время перед началом нового раунда (от 20 до 60 сек.)" ) )
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_wave_time) ) + " ) " ) + "|cFFFF0000-arena xxx|r. Где xxx - начальное время раунда на арене (от 60 сек. до 150 сек.)" ) )
//#                 if (udg_building_status == true) then
//#                     call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 1 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
//#                 else
//#                     call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 0 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
//#                 endif
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( " + ( I2S(udg_const_point[0]) + ( "-" + ( I2S(udg_const_point[1]) + " ) |cFFFF0000-point ##|r." ) ) ) ) )
//#                 call DisplayTextToForce( GetForceOfPlayer(udg_game_owner), "Первый # - минимальное число контрольных точек, появляющихся на арене. Второй # - максимальное число контрольных точек, оно не может превышать первый номер, а также число 9." )
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_mode) ) + " ) " ) + "|cFFFF0000-mode #. |r" ) )
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, "Если # = 1, то мини-игры будут чередоваться каждую вторую волну.\nЕсли # = 2, то мини-игр не будет совсем.\nЕсли # = 3, то мини-игры буду каждые 3 волны." )
//#                 call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( ( "( " + I2S(udg_gg) ) + " ) " ) + "|cFFFF0000-gg ##|r. Где ## - волна, после которой закончится игра (от 9 до " ) + ( I2S(( ( udg_mini_game_max * 2 ) + 3 )) + " )." ) ) )
//#             endif

        endif
    endif
    // Opt. begin
endfunction



function OnLeave takes nothing returns nothing
    local unit u= GetEnumUnit()
    if ( GetUnitTypeId(u) != 'hhdl' and GetUnitTypeId(u) != 'n001' ) then
        // Opt. begin
        if ( IsUnitInGroup(u, udg_wave_units) == true ) then
            call GroupRemoveUnitSimple(u, udg_wave_units)
        endif
        if ( IsUnitInGroup(u, udg_buildings) == true ) then
            call GroupRemoveUnitSimple(u, udg_buildings)
        endif
        // Opt. end
        call RemoveUnit(u)
    else
        call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
    endif
    set u=null
endfunction

function SetLeaveMessages takes nothing returns nothing
    local player p= GetTriggerPlayer()
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0., 0., 10., ( C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r " + GOLD + "покидает игру!|r" ))
    call SetPlayerTechResearchedSwap('R00J', 0, p)
    set s__DB_scoreboard_result[s__Playerdb__getindex(pdb,p)]=0
    // Opt. begin
    call ForGroup(GetUnitsOfPlayerMatching(p, null), function OnLeave)
    call ForceRemovePlayerSimple(GetTriggerPlayer(), udg_players_group)
    if ( p == udg_game_owner ) then
        call gameset_owner()
    endif
    call MultiboardSetItemValueBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetTriggerPlayer()) ), ( "|cFF9B9B9B" + udg_players_name[GetConvertedPlayerId(GetTriggerPlayer())] ))
    call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetTriggerPlayer()) ), "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNReplay-Loop.blp")
    // Opt. end
    call defeat(p)
    set p=null
endfunction

function SetMessagesInit takes nothing returns nothing
    local trigger t= CreateTrigger()

    call TriggerRegisterPlayerEvent(t, Player(0x00), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x01), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x02), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x03), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x04), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x05), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x06), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x07), EVENT_PLAYER_LEAVE)
    
    call TriggerAddAction(t, function SetLeaveMessages)
    set t=null
endfunction



function faq_show_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), faq_dialog, true) // Shows voting dialog
endfunction

function faq_hide_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), faq_dialog, false) // Hides voting dialog
endfunction

function faq_flush takes nothing returns nothing
    call UnfadeMap() // Unfades map
    call ForForce(udg_players_group, function faq_hide_dialog) // Hides voting dialog
    call DestroyTextTag(s__faq_tts[0]) // Уничтожает плавающий текст с голосами "За"
    call DestroyTextTag(s__faq_tts[1]) // Уничтожает плавающий текст с голосами "За"
    call DestroyTextTag(s__faq_tts[2]) // Уничтожает плавающий текст с голосами "Против"
    call DestroyTextTag(s__faq_tts[3]) // Уничтожает плавающий текст с голосами "Против"
endfunction


function faq_start_timer_actions takes nothing returns nothing
    call gameset_end()
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "|cFFFF0000Команда |cFFFFFFFF-info|r |cFFFF0000отключит сообщения о штрафах и мини-арене.|r")
    call DestroyTimerDialog(faq_timerdialog) // Destroys timer dialog for commands and settings
endfunction

function faq_start takes nothing returns nothing
     set udg_gameset_time_first=30.00
    call TimerStart(udg_gameset_timer, udg_gameset_time_first, false, function faq_start_timer_actions) // After settings were set

    set faq_timerdialog=CreateTimerDialog(udg_gameset_timer) // Timer dialog in upper-left corner for commands and settings
    call TimerDialogSetTitle(faq_timerdialog, "Настройка карты") // Title of timer dialog
    call TimerDialogDisplay(faq_timerdialog, true) // Shows timer dialog

    call gameset_owner() // Sets owner of game
    call TriggerExecute(gg_trg_scoreboard_ini) // Shows scoreboard
endfunction



function faq_get_castle takes nothing returns nothing
    local player p= GetEnumPlayer()
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0) // Resets camera angle
    call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own
    call SelectUnitForPlayerSingle(GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(p, 'ntav')), p) // Selects tavern
    set p=null
endfunction

function faq_stop takes nothing returns nothing
    set IsFaqActive=false // Disables faq_counter() and faq_active()
    call faq_flush() // Destroys all texttags, hides faq_dialog, reveals map
    call ForForce(udg_players_group, function faq_get_castle) // Focuses camera at castle you own
    call faq_start() // Commands and settings
endfunction


function faq_voting_timer_counter takes nothing returns nothing
    local timer t= GetExpiredTimer()

    if ( faq_voting_duration >= 1.00 and IsFaqActive ) then // If voting exists
        call DialogSetMessage(faq_dialog, ( "Посмотреть обучение (" + WHITE + R2S(faq_voting_duration) + " сек.|r)" ))
        set faq_voting_duration=faq_voting_duration - 1.00
    else
        call PauseTimer(t)
        call DestroyTimer(t)
        if ( IsFaqActive ) then // If there are not enough votes
            call faq_stop() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
        endif
    endif

    set t=null
endfunction

//===========================================================================
function faq_ini takes nothing returns nothing
    call FadeMap() // Сделать всю карту чёрной

    // ---За---
    // Плавающий текст с требуемым кол-вом голосов "За"
    set s__faq_tts[0]= NewTextTag(( GREEN + "\"ЗА\"|r нужно " + I2S(CountPlayersInForceBJ(udg_players_group) / 2) ) , gg_rct_guideyes , 14.00)
    
    // Плавающий текст с кол-вом голосов "За"
    set s__faq_tts[2]= NewTextTag(I2S(faq_vote_yes) , gg_rct_guideyesvote , 10.00)

    // Кнопка подтверждения просмотра обучения
    set s__faq_buttons[0]= DialogAddButton(faq_dialog, "Да", 0)

    // ---Против---
    // Плавающий текст с требуемым кол-вом голосов "Против"
    set s__faq_tts[1]= NewTextTag(( RED + "\"ПРОТИВ\"|r нужно более " + I2S(CountPlayersInForceBJ(udg_players_group) / 2) ) , gg_rct_guideno , 14.00)

    // Плавающий текст с кол-вом голосов "Против"
    set s__faq_tts[3]= NewTextTag(I2S(faq_vote_no) , gg_rct_guidenovote , 10.00)

    // Кнопка отклонения просмотра обучения
    set s__faq_buttons[1]= DialogAddButton(faq_dialog, "Нет", 0)

//#     static if true then
            call faq_stop() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
//#     else
//#         call TimerStart(CreateTimer(), 1.00, true, function faq_voting_timer_counter) // Makes duration of voting visible in faq dialog's title
//#         call faq_voting_timer_counter() // First tick of timer
//#         call ForForce(udg_players_group, function faq_show_dialog) // Shows faq dialog to all players
//#     endif
endfunction


function faq_active_condition takes nothing returns boolean
    // Disables faq_counter() and faq_active() if false
    return IsFaqActive
endfunction

function faq_active takes nothing returns nothing
    if ( GetClickedButton() == s__faq_buttons[0] ) then // Кнопка "Да"
        set faq_vote_yes=faq_vote_yes + 1 // Голосов "За"
        call SetTextTagText(s__faq_tts[2], I2S(faq_vote_yes), TextTagSize2Height(10.00)) // Плавающий текст с кол-вом голосов "За"
        if ( faq_vote_yes >= ( CountPlayersInForceBJ(udg_players_group) / 2 ) ) then // Если голосов "За" 1/1, 1/2, 1/3, 2/4, 2/5, 3/6, 3/7, 4/8 
            set IsFaqActive=false // Disables faq_counter() and faq_active()
            call faq_flush() // Destroys all texttags, hides faq_dialog, reveals map
            call TriggerExecute(gg_trg_faq) // Enables faq guide
            call TriggerSleepAction(51.8) // Duration of faq guide
            call ForForce(udg_players_group, function faq_get_castle) // Focuses camera at castle you own
            call faq_start() // Commands and settings
        endif
    else // Кнопка "Нет"
        set faq_vote_no=faq_vote_no + 1 // Голосов "Против"
        call SetTextTagText(s__faq_tts[3], I2S(faq_vote_no), TextTagSize2Height(10.00)) // Плавающий текст с кол-вом голосов "Против"
        if ( faq_vote_no > ( CountPlayersInForceBJ(udg_players_group) / 2 ) ) then // Если голосов "За" 1/1, 2/2, 2/3, 3/4, 3/5, 4/6, 4/7, 5/8 
            call faq_stop() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
        endif
    endif
endfunction

function faq_active_init takes nothing returns nothing
    local trigger t= CreateTrigger()

    // Triggers if faq_dialog's buttons were clicked
    call TriggerRegisterDialogEvent(t, faq_dialog)
    call TriggerAddAction(t, function faq_active)
    call TriggerAddCondition(t, Condition(function faq_active_condition))
endfunction



function initialization_in_game_wave_mini_condition takes nothing returns boolean
    local integer i= 0
    if ( udg_random_log == true ) then
        return false
    endif
    loop
        exitwhen i > 8
        if ( udg_wave_mini[i] == ( udg_r * 2 ) ) then
            return false
        endif
        set i=i + 1
    endloop
    return true
endfunction

function not_IsUnitIn_id_group takes nothing returns boolean
    return ( not IsUnitInGroup(GetFilterUnit(), udg_id_group) )
endfunction

function initialization_in_game_set_unit_id takes nothing returns nothing
    // Opt. begin
    set udg_id=udg_id + 1
    call GroupAddUnitSimple(GetEnumUnit(), udg_id_group)
    call SetUnitUserData(GetEnumUnit(), udg_id)
    // Opt. end
endfunction

function initialization_in_game_players takes nothing returns nothing
    local player p= GetEnumPlayer()
    local real x= GetPlayerStartLocationX(p)
    local real y= GetPlayerStartLocationY(p)
    call CameraSetupApplyForPlayer(true, gg_cam_logic, p, 0)
    if ( GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER ) then
        call SetPlayerState(p, PLAYER_STATE_GIVES_BOUNTY, 1)
        call ForceAddPlayer(udg_players_group, p)
        // TODO: Нижние переменные надо перенести в pdb
        set udg_players_name[GetConvertedPlayerId(GetEnumPlayer())]=GetPlayerName(GetEnumPlayer())
        set udg_info[GetConvertedPlayerId(GetEnumPlayer())]=true
        set udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())]=240
        set udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]=8
        set udg_leader_kf[GetConvertedPlayerId(GetEnumPlayer())]=1.00
        set udg_leader_wins[GetConvertedPlayerId(GetEnumPlayer())]=0
        set udg_changeSet[GetConvertedPlayerId(GetEnumPlayer())]=3
        call CreateUnit(p, 'ntav', x, y, bj_UNIT_FACING)
        call CreateUnit(p, 'h001', x, y, bj_UNIT_FACING)
        call CreateUnit(p, 'h029', x, y, bj_UNIT_FACING)
        call AddGoldToPlayer(100 , p) // Золото на выбор расы в таверне
        call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_all, true, false))
        call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_minersregion, true, false))
        call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_fastarena, true, false))
        call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_horseregion, true, false))
        call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_roulette, true, false))
    endif

    set p=null
endfunction

function initialization_in_game takes nothing returns nothing
    local integer i= 0
    local integer j= 0
    local unit lastCreatedUnit= null
    set udg_gg=15 // Финальная волна
    set udg_mini_game_max=8 // Максимальное кол-во миниигр за игру
    set udg_wave_mini[1]=4 // Волна с боссом
    set udg_const_point[0]=3
    set udg_const_point[1]=6
    set udg_gameset_time_first=60.00 // Таймер начала до первой волны
    // Что-то связанное с минииграми
    loop
        exitwhen i > udg_mini_game_max
        if ( i != 1 ) then
            // Если не миниигра с боссом, то
            set udg_random_log=false
            loop // Заполняем wave_mini[] рандомными, неповторяющимися числами (2, 4, 6, ..., 18) - волны, когда будут миниигры. mode = 1 (стандартный режим)
                exitwhen ( udg_random_log == true ) // TODO: test
                set udg_r=GetRandomInt(1, ( udg_mini_game_max + 1 )) // От 1 до 9 (кол-во миниигр)
                if ( initialization_in_game_wave_mini_condition() ) then
                    set udg_random_log=true
                    set udg_wave_mini[i]=udg_r * 2
                endif
            endloop
        endif
        set i=i + 1
    endloop
    set udg_r=0
    set i=1
    loop
        // Opt. begin
        exitwhen i > CountUnitsInGroup(GetUnitsInRectAll(GetPlayableMapRect()))
        call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function not_IsUnitIn_id_group)), function initialization_in_game_set_unit_id)
        set i=i + 1
        // Opt. end
    endloop
    
    call ForForce(bj_FORCE_ALL_PLAYERS, function initialization_in_game_players)
    
    call faq_ini() // Starts voting for faq guide

    // Миниигра казино
    set udg_r=0
    set i=1
    loop
        exitwhen i > 3
        set j=1
        loop
            exitwhen j > 5
            set udg_r=udg_r + 1
            // Opt. begin
            // 'n001' - Circle of Power
            set lastCreatedUnit=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'n001', PolarProjectionBJ(PolarProjectionBJ(GetRectCenter(gg_rct_circle), ( - 256.00 + ( 256.00 * I2R(i) ) ), 270.00), ( - 256.00 + ( 256.00 * I2R(j) ) ), 0), bj_UNIT_FACING)
            call SetUnitUserData(lastCreatedUnit, udg_r)
            if ( ModuloInteger(udg_r, 2) == 1 ) then
                // Z offset = 0
                // Font size = 11
                // Red =    100%
                // Green =  10%
                // Blue =   10%
                // Transparency = 0%
                call CreateTextTagUnitBJ(I2S(udg_r), lastCreatedUnit, 0, 11.00, 100, 10.00, 10.00, 0)
                call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), udg_players_group)
                call SetUnitColor(lastCreatedUnit, PLAYER_COLOR_RED)
            else
                call CreateTextTagUnitBJ(I2S(udg_r), lastCreatedUnit, 0, 11.00, 10.00, 10.00, 10.00, 0)
                call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), udg_players_group)
                call SetUnitColor(lastCreatedUnit, PLAYER_COLOR_MAROON)
            endif
            // Opt. end
            set j=j + 1
        endloop
        set i=i + 1
    endloop

    set lastCreatedUnit=null
endfunction

function Trig_income_upg_Conditions takes nothing returns boolean
    local integer i= 1
    local integer research_rc= GetResearched()
    loop
        exitwhen i == incSpellrc_count
        if research_rc == s__incSpellrc[i] then
            return true
        endif
        set i=i + 1
    endloop
    return false
endfunction

// Действие улучшения Развитие ради развития
function Trig_income_upg_actions_evforev takes player p returns nothing
    local real r
    local integer bonus_gold
    local integer bonus_lumber

    set r=evforev_bonus_res_mod * I2R(GetPlayerTechCountSimple(evforev_rc, p)) + evforev_bonus_res
    set bonus_gold=R2I(r * I2R(GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)))
    set bonus_lumber=R2I(r * I2R(GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)))
    call AdjustPlayerStateBJ(bonus_gold, p, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(bonus_lumber, p, PLAYER_STATE_RESOURCE_LUMBER)
    
endfunction

function Aggrgame_conditions takes nothing returns boolean
    return IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON)
endfunction

function Aggrgame_group takes nothing returns nothing
    if GetUnitAbilityLevelSwapped(aggrgame_aura_rc, GetEnumUnit()) == 0 then
        call UnitAddAbilityBJ(aggrgame_aura_rc, GetEnumUnit())
    else
        call IncUnitAbilityLevelSwapped(aggrgame_aura_rc, GetEnumUnit())
    endif
endfunction

// Действие улучшения Агрессивной игры
function Trig_income_upg_actions_aggrgame takes player p returns nothing
    local group gr
    local boolexpr b
    
    set gr=CreateGroup()
    set b=Condition(function Aggrgame_conditions)
    call GroupEnumUnitsOfPlayer(gr, p, b)
    call ForGroup(gr, function Aggrgame_group)
    
    call DestroyBoolExpr(b)
    call DestroyGroup(gr)
endfunction

// Добавить в группу игроков всех играющих игроков
function AllPlayingPlayers takes force gr_p returns nothing
    local integer i= 1
    local player p
    local boolean b1
    local boolean b2

    loop
        exitwhen i > max_players
        set p=Player(i)
        set b1=GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING
        set b2=GetPlayerController(p) == MAP_CONTROL_USER
        if b1 and b2 then
            call ForceAddPlayer(gr_p, p)
        endif
        set i=i + 1
    endloop

    set p=null
endfunction

// Работа таймера Вклад в игрока
function Timer_contr_to_pl_actions takes nothing returns nothing
    local timer t= GetExpiredTimer()
    local player p= s__Table___players__getindex(s__Table__get_player(s__HashTable__getindex(hash,StringHash("income"))),GetHandleId(t))
    local integer count_research= GetPlayerTechCountSimple(contr_to_pl_rc, p)
    local integer gold= contr_to_pl_gold + ( contr_to_pl_gold_mod * ( count_research - 1 ) )
    local integer lumber= contr_to_pl_lumber + ( contr_to_pl_lumber_mod * ( count_research - 1 ) )
    local string s1
    local string s2

    set gold=R2I(contr_to_pl_multy * I2R(gold))
    set lumber=R2I(contr_to_pl_multy * I2R(lumber))

    call AdjustPlayerStateBJ(gold, p, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(lumber, p, PLAYER_STATE_RESOURCE_LUMBER)

    set s1="Доход с вложения в игрока: |cFFFFCD00" + I2S(gold)
    set s2="Доход с вложения в игрока: |cFFB23AEE" + I2S(lumber)
    
    call DisplayTextToPlayer(p, 0, 0, s1)
    call DisplayTextToPlayer(p, 0, 0, s2)
    // !!! Найти причину, зачем увеличивается лвл улучшения Подождите 5 минут
    call SetPlayerTechResearchedSwap(wait_five_minutes_rc, count_research, p)
    // ----------------------------------------------------------------------

    call DestroyTimer(t)
    set p=null
    set t=null
    set s1=null
    set s2=null
endfunction

// Действие улучшения Вклад в игрока
function Trig_income_upg_actions_contr_to_pl takes player p,integer count_research returns nothing
    local force gr_p
    local player rand_p
    local integer bonus_gold
    local integer bonus_lumber
    local string mes
    local timer t

    set gr_p=CreateForce()
    call AllPlayingPlayers(gr_p)
    call ForceRemovePlayer(gr_p, p)
    set rand_p=ForcePickRandomPlayer(gr_p)

    set bonus_gold=contr_to_pl_gold + ( contr_to_pl_gold_mod * ( count_research - 1 ) )
    set bonus_lumber=contr_to_pl_lumber + ( contr_to_pl_lumber_mod * ( count_research - 1 ) )

    call AdjustPlayerStateBJ(bonus_gold, rand_p, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(bonus_lumber, rand_p, PLAYER_STATE_RESOURCE_LUMBER)

    set mes="В вас вложились: |cFFFFCD00" + I2S(bonus_gold)
    call DisplayTimedTextToPlayer(rand_p, 0, 0, 10.00, mes)
    set mes="В вас вложились: |cFFB23AEE" + I2S(bonus_lumber)
    call DisplayTimedTextToPlayer(rand_p, 0, 0, 10.00, mes)

    set t=CreateTimer()
    call s__Table___players__setindex(s__Table__get_player(s__HashTable__getindex(hash,StringHash("income"))),GetHandleId(t), rand_p)
    call TimerStart(t, contr_to_pl_time, false, function Timer_contr_to_pl_actions)

    set mes=null
    set rand_p=null
    set t=null
    call DestroyForce(gr_p)
endfunction

function Trig_income_upg_actions_goldmining takes player p,integer number_p,integer research_rc returns nothing
    local integer lvl_research

    set lvl_research=GetPlayerTechCountSimple(research_rc, p)
    set udg_income_gold[number_p]=udg_income_gold[number_p] + s__goldmining_income[lvl_research]
    set udg_income_goldmine_c[number_p]=udg_income_goldmine_c[number_p] + s__goldmining_main_mine[lvl_research]
    set udg_income_goldmine_l[number_p]=udg_income_goldmine_l[number_p] + s__goldmining_extra_mine[lvl_research]

endfunction

// Смещает все элементы массива на один вверх, последний пропадает, на первый слот ставится игрок p
function Trig_income_upg_actions_ticket takes player p returns nothing
    local integer i= max_ticket_list - 1
    loop
        exitwhen i < 1
        set s__ticket_list[i]= s__ticket_list[i - 1]
        set i=i - 1
    endloop
    set s__ticket_list[0]= p
endfunction

// Действие улучшения Драгоценные камни
function Trig_income_upg_actions_jewelry takes integer number_p returns nothing
    set udg_income_wood[number_p]=udg_income_wood[number_p] + jewelry_lumber_for_lvl
endfunction

// Действие улучшения Вклад
function Trig_income_upg_actions_contr takes player p,integer count_research returns nothing
    local string s1
    local string s2
    local integer gold= contr_gold + ( ( count_research - 1 ) * contr_gold_mod )
    local integer lumber= contr_lumber + ( ( count_research - 1 ) * contr_lumber_mod )

    set gold=gold * contr_percent / 100
    set lumber=lumber * contr_percent / 100
    set s1="Доход с вклада: |cFFFFCD00" + I2S(gold)
    set s2="Доход за вклад: |cFFB23AEE" + I2S(lumber)
    
    call AdjustPlayerStateBJ(gold, p, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(lumber, p, PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTextToPlayer(p, 0, 0, s1)
    call DisplayTextToPlayer(p, 0, 0, s2)

    set s1=null
    set s2=null
endfunction

// Поиск номера таймера
function find_number_timer takes timer t returns integer
    local integer number_timer= 0
    local integer i= 1

    loop
        exitwhen i > max_players
        if t == s__stab_timer_gold[i] or t == s__stab_timer_lumber[i] then
            set number_timer=i
        endif
        set i=i + 1
    endloop

    return number_timer
endfunction

// Работа таймера stab_timer_gold
function stab_timer_gold_actions takes nothing returns nothing
    local player p
    local integer number_p
    local integer count_research
    local timer t= GetExpiredTimer()

    set number_p=find_number_timer(t)
    set p=Player(number_p - 1)
    set count_research=GetPlayerTechCountSimple(stab_rc, p)

    call AdjustPlayerStateBJ(s__stab_gold[count_research], p, PLAYER_STATE_RESOURCE_GOLD)

    set p=null
endfunction

// Работа таймера stab_timer_lumber
function stab_timer_lumber_actions takes nothing returns nothing
    local player p
    local integer number_p
    local integer count_research
    local timer t= GetExpiredTimer()

    set number_p=find_number_timer(t)
    set p=Player(number_p - 1)
    set count_research=GetPlayerTechCountSimple(stab_rc, p)

    call AdjustPlayerStateBJ(s__stab_lumber[count_research], p, PLAYER_STATE_RESOURCE_LUMBER)

    set p=null
endfunction

// Действие улучшения Стабильность
function Trig_income_upg_actions_stab takes integer number_p,integer count_research returns nothing
    if count_research == 1 then
        set s__stab_timer_gold[number_p]= CreateTimer()
        set s__stab_timer_lumber[number_p]= CreateTimer()
    endif

    call TimerStart(s__stab_timer_gold[number_p], s__stab_time_gold[count_research], true, function stab_timer_gold_actions)
    call TimerStart(s__stab_timer_lumber[number_p], s__stab_time_lumber[count_research], true, function stab_timer_lumber_actions)
endfunction

// Условие улучшения Лидерство, удалить юнитов Больше всех убийств за прошедший раунд и Или лидерство по очкам арены за пошедший раунд
function Trig_income_upg_actions_leadership_group takes nothing returns nothing
    local unit u= GetEnumUnit()
    local integer u_rc= GetUnitTypeId(u)

    if u_rc == most_point_kill_last_round or u_rc == or_leadership_arena_last_round then
        call RemoveUnit(u)
    endif

    set u=null
endfunction

// Действие улучшения Лидерство
function Trig_income_upg_actions_leadership takes player p,integer number_p returns nothing
    local group gr= CreateGroup()

    set udg_leader_kf[number_p]=udg_leader_kf[number_p] + leadership_bonus
    call GroupEnumUnitsOfPlayer(gr, p, null)

    // !!! Муторная система с группой, разобраться
    call ForGroup(gr, function Trig_income_upg_actions_leadership_group)
    //----------------------------------------------

    call DestroyGroup(gr)
    set gr=null
endfunction

// Основное тело
function Trig_income_upg_Actions takes nothing returns nothing
    local unit u= GetTriggerUnit()
    local player p= GetOwningPlayer(u)
    local integer number_p= GetConvertedPlayerId(p)
    local integer count_upg= udg_scoreboard_upg[number_p]
    local integer research_rc= GetResearched()
    local integer bonus_gold
    local integer bonus_lumber
    local integer count_research= GetPlayerTechCountSimple(research_rc, p)
    local real r

    set count_upg=count_upg + 1
    set udg_scoreboard_upg[number_p]=count_upg

    // Обновление значений кол-ва исследований в таблице
    call MultiboardSetItemValueBJ(udg_scoreboard, 5, ( number_p + 1 ), I2S(count_upg))

    // Кол-во исследований(улучшений)
    if count_upg == count_research_for_t1 then
        call SetPlayerTechResearchedSwap(t1_research_rc, 1, p)
    elseif count_upg == count_research_for_t2 then
        call SetPlayerTechResearchedSwap(t2_research_rc, 1, p)
    endif

    // Грабёж
    if research_rc == robbery_rc then
        if GetPlayerTechCountSimple(robbery_rc, p) == 3 then
            call SetPlayerTechResearchedSwap(robbery_lvl3_rc, 1, p)
        elseif GetPlayerTechCountSimple(robbery_rc, p) == 5 then
            call SetPlayerTechResearchedSwap(robbery_lvl5_rc, 1, p)
        endif
    endif
    
    // Развитие ради развития
    if GetPlayerTechCountSimple(evforev_rc, p) > 0 then
        call Trig_income_upg_actions_evforev(p)
    endif

    // Агрессивная игра
    // |Выделяем всех наших юнитов типа рабочий
    // |и даём им ауру на скорость атаки и скорость бега, если
    // |её нет, повышаем её уровень
    // !!!стоит переделать, если всего 1 рабочий, проще его в переменные забить и давать способность ему напрямую
    if research_rc == aggrgame_rc then
        call Trig_income_upg_actions_aggrgame(p)
    endif
        
    // Вклад в игрока
    // !!!добавить удаление улучшения, если игрок один на карте
    if research_rc == contr_to_pl_rc then
        call Trig_income_upg_actions_contr_to_pl(p , count_research)
    endif

    // Золотодобыча
    if research_rc == goldmining_rc then
        call Trig_income_upg_actions_goldmining(p , number_p , research_rc)
    endif

    // Билет
    if research_rc == ticket_rc then
        call Trig_income_upg_actions_ticket(p)
    endif

    // Драгоценные камни
    if research_rc == jewelry_rc then
        call Trig_income_upg_actions_jewelry(number_p)
    endif

    // Вклад
    if research_rc == contr_rc then
        call Trig_income_upg_actions_contr(p , count_research)
    endif

    // Стабильность
    if research_rc == stab_rc then
        call Trig_income_upg_actions_stab(number_p , count_research)
    endif

    // Лидерство
    if research_rc == leadership_rc then
        call Trig_income_upg_actions_leadership(p , number_p)
    endif

    set p=null
    set u=null
endfunction

//===========================================================================
function InitTrig_income_upg takes nothing returns nothing
    local trigger trg_income_upg= CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trg_income_upg, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(trg_income_upg, Condition(function Trig_income_upg_Conditions))
    call TriggerAddAction(trg_income_upg, function Trig_income_upg_Actions)
    set trg_income_upg=null
endfunction


function Trig_income_upgA_Conditions takes nothing returns boolean
    local boolean b1
    local boolean b2
    local boolean b3
    local boolean b4
    local unit killer= GetKillingUnit()
    local unit victim= GetDyingUnit()
    local player p_k= GetOwningPlayer(killer)
    local player p_v= GetOwningPlayer(victim)
    
    set b1=GetPlayerTechCountSimple(robbery_rc, p_k) > 0
    set b2=IsUnitInGroup(killer, udg_wave_units)
    set b3=IsPlayerEnemy(p_v, p_k)
    set b4=GetUnitTypeId(GetDyingUnit()) == castle_rc
    
    set p_k=null
    set p_v=null
    set killer=null
    set victim=null
    
    if b1 and b2 and b3 and b4 then
        return true
    endif
    return false

endfunction

function Trig_income_upgA_Actions takes nothing returns nothing
    local unit killer= GetKillingUnit()
    local unit victim= GetDyingUnit()
    local player p_k= GetOwningPlayer(killer)
    local player p_v= GetOwningPlayer(victim)
    local integer gold= GetPlayerState(p_v, PLAYER_STATE_RESOURCE_GOLD)
    local integer lumber= GetPlayerState(p_v, PLAYER_STATE_RESOURCE_LUMBER)
    local integer lvl_research= GetPlayerTechCountSimple(robbery_rc, p_k)
    local integer p_k_n= GetConvertedPlayerId(p_k)
    local integer p_v_n= GetConvertedPlayerId(p_v)
    local real multy= s__robbery_pr_f[lvl_research] * 0.01
    local string killer_mes
    local string victim_mes
    local string color_k= udg_players_colour[p_k_n]
    local string color_v= udg_players_colour[p_v_n]
    local string name_k= udg_players_name[p_k_n]
    local string name_v= udg_players_name[p_v_n]

    set gold=R2I(I2R(gold) * multy)
    set lumber=R2I(I2R(lumber) * multy)
    
    call AdjustPlayerStateBJ(gold, p_k, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(lumber, p_k, PLAYER_STATE_RESOURCE_LUMBER)
    call AdjustPlayerStateBJ(- 1 * gold, p_v, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(- 1 * lumber, p_v, PLAYER_STATE_RESOURCE_LUMBER)

    set killer_mes="Вы украли |cFFFFCD00" + I2S(gold) + "|r ед. золота и |cFFB23AEE" + I2S(lumber) + "|r ед. самоцветов у игрока " + color_v + name_v
    set victim_mes="Вас ограбил игрок " + color_k + name_k
    call DisplayTextToPlayer(p_k, 0, 0, killer_mes)
    call DisplayTextToPlayer(p_v, 0, 0, victim_mes)

    set p_k=null
    set p_v=null
    set killer=null
    set victim=null
    set killer_mes=null
    set victim_mes=null
endfunction

//===========================================================================
function InitTrig_income_upgA takes nothing returns nothing
    local trigger trg_income_upgA= CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trg_income_upgA, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(trg_income_upgA, Condition(function Trig_income_upgA_Conditions))
    call TriggerAddAction(trg_income_upgA, function Trig_income_upgA_Actions)
    set trg_income_upgA=null
endfunction


function Trig_income_upgR_Conditions takes nothing returns boolean
    local boolean b1
    local boolean b2
    local boolean b3
    local unit killer= GetKillingUnit()
    local unit victim= GetDyingUnit()
    local player p_k= GetOwningPlayer(killer)
    local player p_v= GetOwningPlayer(victim)
    
    set b1=GetPlayerTechCountSimple(deadmoney_rc, p_k) > 0
    set b2=IsUnitInGroup(killer, udg_wave_units)
    set b3=IsPlayerEnemy(p_v, p_k)
    
    set p_k=null
    set p_v=null
    set killer=null
    set victim=null
    
    if b1 and b2 and b3 then
        return true
    endif
    return false

endfunction

function Trig_income_upgR_Actions takes nothing returns nothing
    local unit killer= GetKillingUnit()
    local player p_k= GetOwningPlayer(killer)
    local integer n= deadmoney_money_for_lvl
    local integer sum

    set sum=n * GetPlayerTechCountSimple(deadmoney_rc, p_k)
    call AdjustPlayerStateBJ(sum, p_k, PLAYER_STATE_RESOURCE_GOLD)

    set killer=null
    set p_k=null
endfunction

//===========================================================================
function InitTrig_income_upgR takes nothing returns nothing
    local trigger trg_income_upgR= CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trg_income_upgR, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(trg_income_upgR, Condition(function Trig_income_upgR_Conditions))
    call TriggerAddAction(trg_income_upgR, function Trig_income_upgR_Actions)
    set trg_income_upgR=null
endfunction



function Trig_income_upgTQ_Conditions takes nothing returns boolean
    local boolean IsIncomeObjective= false
    local boolean DoesVictimHasUpgrade= false
    local boolean DoesVictimsUpgradeGreaterThanKillers= false
    local unit killer= GetKillingUnit()
    local unit victim= GetDyingUnit()
    local integer v_rc= GetUnitTypeId(victim)
    local integer k_rc= GetUnitTypeId(killer)
    local player p_v= GetOwningPlayer(victim)
    local player p_k= GetOwningPlayer(killer)

    // n003 - Gold Mine большой
    // n004 - Gold Mine маленький
    // n005 - Флаг
    set IsIncomeObjective=( v_rc == 'n003' or v_rc == 'n004' or v_rc == 'n005' )

    // Не действует на игроков с уровнем улучшения "Проклятый рудник" ниже вашего на 1 и выше.
    set DoesVictimHasUpgrade=GetPlayerTechCountSimple(cursed_mine_rc, p_v) > 0
    set DoesVictimsUpgradeGreaterThanKillers=( GetPlayerTechCountSimple(cursed_mine_rc, p_v) - 1 ) > GetPlayerTechCountSimple(cursed_mine_rc, p_k)

    set killer=null
    set victim=null
    set p_v=null
    set p_k=null
    return IsIncomeObjective and DoesVictimHasUpgrade and DoesVictimsUpgradeGreaterThanKillers
endfunction

// !!! Урон юнитам наносит сам рудник, но после смерти он передаётся убийце, проверить, что урон наносится до передачи
// Функция вызывается к каждому юниту около погибшего рудника
// Если юнит принадлежит убившему и юнит находится в группе udg_wave_units(!!! понять, что за группа), ему наносится урон от рудника типа chaos
function Trig_income_upgTQ_Actions_group takes nothing returns nothing
    local unit u= GetEnumUnit()
    local boolean b1
    local boolean b2
    local player p= GetOwningPlayer(u)
    local player p_k= s__Table___players__getindex(s__Table__get_player(s__HashTable__getindex(hash,StringHash("income"))),StringHash("player_killer"))
    local player p_v= s__Table___players__getindex(s__Table__get_player(s__HashTable__getindex(hash,StringHash("income"))),StringHash("player_victim"))
    local real damage= cursed_mine_damage_for_lvl
    local unit damage_u= s__Table___units__getindex(s__Table__get_unit(s__HashTable__getindex(hash,StringHash("income"))),StringHash("victim"))

    set b1=IsUnitInGroup(u, udg_wave_units)
    set b2=( p == p_k )
    if b1 and b2 then
        set damage=damage * I2R(GetPlayerTechCountSimple(cursed_mine_rc, p_v)) // формула расчёта урона: урон = cursed_mine_damage_for_lvl * уровень улучшения
        // !!!
        call UnitDamageTargetBJ(damage_u, u, damage, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
        // -----
    endif

    set p=null
    set p_k=null
    set p_v=null
    set u=null
endfunction

function Trig_income_upgTQ_Actions takes nothing returns nothing
    local unit killer= GetKillingUnit()
    local unit victim= GetDyingUnit()
    local integer v_rc= GetUnitTypeId(victim)
    local integer k_rc= GetUnitTypeId(killer)
    local integer i= 1
    local player p_v= GetOwningPlayer(victim)
    local player p_k= GetOwningPlayer(killer)
    local integer n_p_v= GetConvertedPlayerId(p_v)
    local integer n_p_k= GetConvertedPlayerId(p_k)
    local string name_ef= "Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl"
    local real x= GetUnitX(victim)
    local real y= GetUnitY(victim)
    local real x_ef
    local real y_ef
    local real range= cursed_mine_cast_range
    local integer count_wave= cursed_mine_count_wave
    local real angle= 360.00 / I2R(count_wave)
    local group gr= CreateGroup()
    local real range_damage= cursed_mine_range_damage
    local integer gold
    local integer lumber
    local integer percent= cursed_mine_percent
    local string s1
    local string s2
    
    loop
        exitwhen i > count_wave
        set x_ef=x + range * Cos(angle * i * bj_DEGTORAD)
        set y_ef=y + range * Sin(angle * i * bj_DEGTORAD)
        call DestroyEffect(AddSpecialEffect(name_ef, x_ef, y_ef))
        set i=i + 1
    endloop

    call GroupEnumUnitsInRange(gr, x, y, range_damage, null)

    call s__Table___players__setindex(s__Table__get_player(s__HashTable__getindex(hash,StringHash("income"))),StringHash("player_killer"), p_k)
    call s__Table___players__setindex(s__Table__get_player(s__HashTable__getindex(hash,StringHash("income"))),StringHash("player_victim"), p_v)
    call s__Table___units__setindex(s__Table__get_unit(s__HashTable__getindex(hash,StringHash("income"))),StringHash("victim"), victim)

    call ForGroup(gr, function Trig_income_upgTQ_Actions_group)

    set gold=GetPlayerState(p_k, PLAYER_STATE_RESOURCE_GOLD) * percent / 100
    set lumber=GetPlayerState(p_k, PLAYER_STATE_RESOURCE_LUMBER) * percent / 100
    call AdjustPlayerStateBJ(gold, p_v, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(lumber, p_v, PLAYER_STATE_RESOURCE_LUMBER)
    call AdjustPlayerStateBJ(- 1 * gold, p_k, PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(- 1 * lumber, p_k, PLAYER_STATE_RESOURCE_LUMBER)

    set s1="Вы украли |cFFFFCD00" + I2S(gold) + "|r ед. золота и |cFFB23AEE" + I2S(lumber) + "|r ед. самоцветов у игрока " + udg_players_colour[n_p_k] + udg_players_name[n_p_k]
    set s2="Вас ограбил игрок " + udg_players_colour[n_p_v] + udg_players_name[n_p_v]
    call DisplayTextToPlayer(p_v, 0, 0, s1)
    call DisplayTextToPlayer(p_k, 0, 0, s2)

    call DestroyGroup(gr)
    set gr=null
    set killer=null
    set victim=null
    set p_v=null
    set p_k=null
    set s1=null
    set s2=null
endfunction

//===========================================================================
function InitTrig_income_upgTQ takes nothing returns nothing
    local trigger t= CreateTrigger()

    // Так быстрее
    call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x08), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x09), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x0A), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x0B), EVENT_PLAYER_UNIT_DEATH, null)
    call TriggerAddCondition(t, Condition(function Trig_income_upgTQ_Conditions))
    call TriggerAddAction(t, function Trig_income_upgTQ_Actions)

    set t=null
endfunction


// scope Main begins
  
    function map_init takes nothing returns nothing
        local string strTestWarning_RU
        local string strWarning_RU
        local string strVar_RU
        local string Feedback_RU

        // Аналогично, но только по-английски.
        local string strTestWarning_EN
        local string strWarning_EN
        local string strVar_EN
        local string Feedback_EN

        local integer i= 0


//#         static if  not true  then
//#             // Отображает strVar_** в зависимости от типа карты
//#             set strTestWarning_RU = "В данной версии вы можете увидеть десинхронизацию, баги, неправильную работу способностей и ошиКБи в словах."
//#             set strWarning_RU = (RED + "Внимание:|r " + "вы играете в " + Version + " версию " + strVersion + ". ")
//#             set strTestWarning_EN = "In this version you can experience desyncs, bugs, and miTSakes in localization."
//#             set strWarning_EN = (RED + "Caution:|r " + "you are playing in " + Version + " version " + strVersion + ". ")
//#             if (Version != "" and strVersion != "") then
//#                 if (Version == "Test") then
//#                     set strVar_RU = strWarning_RU + strTestWarning_RU + "\n "
//#                     set strVar_EN = strWarning_EN + strTestWarning_EN + "\n "
//#                 elseif (Version == "Release") then
//#                     set strVar_RU = "Вы играете в " + GREEN + "стабильную|r " + strVersion + " версию.\n "
//#                     set strVar_EN = "You are playing in " + GREEN + "stable|r " + strVersion + " version.\n "
//#                 endif
//#                 if (Locale() == "RU") then
//#                     call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_RU)
//#                 else
//#                     call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_EN)
//#                 endif
//#             endif
//# 
//#             // Сообщение об обратной связи
//#             set Feedback_RU = "Связаться со мной можно по электронной почте, буду рад ответить на любые вопросы: " + strEmail + "\n "
//#             set Feedback_EN = "If you see an issue, please, leave the feedback/suggestions in the E-Mail: " + strEmail + "\n "
//#             if (Locale() == "RU") then
//#                 call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_RU)
//#             else
//#                 call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_EN)
//#             endif
//# 
//#             // Условие: один из разработчиков в игре?
//#             loop
//#                 exitwhen (i > 11)
//#                 if (GetPlayerName(Player(i)) == "Nokladr" or GetPlayerName(Player(i)) == "Nokladr#2429") then
//#                     if (Locale() == "RU") then
//#                         call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("С вами играет создатель данной карты, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Критика приветствуется :)\n "))
//#                     else
//#                         call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("You are playing with author, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Any feedback is welcome :)\n "))
//#                     endif
//#                     set IsDevInGame = true
//#                 endif
//#                 set i = i + 1
//#             endloop
//#         endif

        // Инициализируем хэш-таблицу
        set hash=s__HashTable_create()

        // Заполнение массива incSpellrc равкодами инкам способностей
        set s__incSpellrc[1]= 'R00F'
        set s__incSpellrc[2]= 'R00G'
        set s__incSpellrc[3]= 'R00H'
        set s__incSpellrc[4]= 'R00I'
        set s__incSpellrc[5]= 'R00J'
        set s__incSpellrc[6]= 'R00Q'
        set s__incSpellrc[7]= 'R00R'
        set s__incSpellrc[8]= 'R00S'
        set s__incSpellrc[9]= 'R027'
        set s__incSpellrc[10]= 'R029'
        set s__incSpellrc[11]= 'R02I'
        set s__incSpellrc[12]= 'R02J'
        set s__incSpellrc[13]= 'R02K'

        // Заполнение массивов robbery_pr_f и robbery_pr_s процентами спосоности Грабёж
        set s__robbery_pr_f[1]= 5
        set s__robbery_pr_f[2]= 10
        set s__robbery_pr_f[3]= 15
        set s__robbery_pr_f[4]= 20
        set s__robbery_pr_f[5]= 30
        set s__robbery_pr_f[6]= 40

        set s__robbery_pr_s[1]= 5
        set s__robbery_pr_s[2]= 6
        set s__robbery_pr_s[3]= 7
        set s__robbery_pr_s[4]= 8
        set s__robbery_pr_s[5]= 9
        set s__robbery_pr_s[6]= 10

        // Заполнение массивов stab_time_gold и stab_time_lumber периодом инкама
        set s__stab_time_gold[1]= 3
        set s__stab_time_gold[2]= 3
        set s__stab_time_gold[3]= 3
        set s__stab_time_gold[4]= 3
        set s__stab_time_gold[5]= 3
        set s__stab_time_gold[6]= 3

        set s__stab_time_lumber[1]= 40
        set s__stab_time_lumber[2]= 40
        set s__stab_time_lumber[3]= 30
        set s__stab_time_lumber[4]= 20
        set s__stab_time_lumber[5]= 15
        set s__stab_time_lumber[6]= 12

        // Заполнение массивов stab_gold и stab_lumber кол-вом инкама
        set s__stab_gold[1]= 1
        set s__stab_gold[2]= 1
        set s__stab_gold[3]= 2
        set s__stab_gold[4]= 2
        set s__stab_gold[5]= 3
        set s__stab_gold[6]= 4
        
        set s__stab_lumber[1]= 0
        set s__stab_lumber[2]= 1
        set s__stab_lumber[3]= 1
        set s__stab_lumber[4]= 1
        set s__stab_lumber[5]= 1
        set s__stab_lumber[6]= 1

        // Заполнение массивов goldmining_main_mine, goldmining_extra_mine, goldmining_income кол-вом увеличения инкама
        set s__goldmining_main_mine[1]= 1
        set s__goldmining_main_mine[2]= 1
        set s__goldmining_main_mine[3]= 1
        set s__goldmining_main_mine[4]= 1
        set s__goldmining_main_mine[5]= 1
        set s__goldmining_main_mine[6]= 1

        set s__goldmining_extra_mine[1]= 0
        set s__goldmining_extra_mine[2]= 0
        set s__goldmining_extra_mine[3]= 1
        set s__goldmining_extra_mine[4]= 0
        set s__goldmining_extra_mine[5]= 1
        set s__goldmining_extra_mine[6]= 1

        set s__goldmining_income[1]= 10
        set s__goldmining_income[2]= 10
        set s__goldmining_income[3]= 10
        set s__goldmining_income[4]= 10
        set s__goldmining_income[5]= 10
        set s__goldmining_income[6]= 10

        call Log("map_init finished!")

        // Не забываем обнулить переменные!!!
        set strTestWarning_RU=null
        set strWarning_RU=null
        set strVar_RU=null
        set Feedback_RU=null
        
        set strTestWarning_EN=null
        set strWarning_EN=null
        set strVar_EN=null
        set Feedback_EN=null
    endfunction

    //-----------------------------Post main init------------------------------

    function post_map_init takes nothing returns nothing

        // Сообщения в чате
        call SetMessagesInit()

        // initialization in game trigger
        call initialization_in_game()

        // income upg trigger
        call InitTrig_income_upg()
        call InitTrig_income_upgR()
        call InitTrig_income_upgA()
        call InitTrig_income_upgTQ()

        // faq active Trigger
        call faq_active_init()

        call Log("post_map_init finished!")
        
    endfunction

    //-------------------------The very first function-------------------------
    // Starts map initialization
    function MainInit takes nothing returns nothing
        local trigger t= CreateTrigger()

        call map_init()
        call TriggerRegisterTimerEventSingle(t, 0.01)
        call TriggerAddAction(t, function post_map_init)
        call C_SetComputers()
        call StartInitTimer()

        set t=null
    endfunction

// scope Main ends
//===========================================================================
// 
// MIX |cffffffff0.0.1|r
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Map Author: MIX community
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************


function InitGlobals takes nothing returns nothing
    local integer i= 0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_dmg_player_inflicted[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_dmg_player_taken[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_players_colour[i]=""
        set i=i + 1
    endloop

    set udg_dmg=0
    set udg_players_group=CreateForce()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_players_name[i]=""
        set i=i + 1
    endloop

    set udg_i=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_time[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_light[i]=CreateGroup()
        set i=i + 1
    endloop

    set udg_footrmans=CreateGroup()
    set udg_buildings=CreateGroup()
    set udg_id=0
    set udg_id_save=""
    set udg_wave_timer=CreateTimer()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_region_status[i]=false
        set i=i + 1
    endloop

    set udg_random=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_region_player_status[i]=false
        set i=i + 1
    endloop

    set udg_j=0
    set udg_k=0
    set udg_goldmine_colour=0
    set udg_gameset_time=0
    set udg_gameset_timer=CreateTimer()
    set udg_wave_end_timer=CreateTimer()
    set udg_wave_time=0
    set udg_wave_units=CreateGroup()
    set udg_wave=0
    set udg_wave_status=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_income_gold[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_income_wood[i]=0
        set i=i + 1
    endloop

    set udg_r=0
    set udg_g=0
    set udg_sold_gold=0
    set udg_sold_wood=0
    set udg_boss_wave=false
    set udg_boss_time=0
    set udg_boss_end_timer=CreateTimer()
    set udg_id_group=CreateGroup()
    set udg_boss_hp=0
    set udg_boss_spell_integer=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_boss_phase[i]=false
        set i=i + 1
    endloop

    set udg_building_status=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_wave_mini[i]=0
        set i=i + 1
    endloop

    set udg_random_log=false
    set udg_miners_log=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_income_goldmine_c[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_income_goldmine_l[i]=0
        set i=i + 1
    endloop

    set udg_ticket_resources=0
    set udg_ticket_gold=0
    set udg_ticket_lumber=0
    set udg_pillage_resources=0
    set udg_pillage_lumber=0
    set udg_pillage_gold=0
    set udg_scoreboard_limit=0
    set udg_scoreboard_coloumns=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_scoreboard_win[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_scoreboard_mini[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_scoreboard_upg[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_scoreboard_kills[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_scoreboard_result[i]=0
        set i=i + 1
    endloop

    set udg_wave_winner=false
    set udg_ticket=false
    set udg_p=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_hide[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_roulette_gold[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_roulette_gems[i]=0
        set i=i + 1
    endloop

    set udg_roulette_winners=CreateForce()
    set udg_mini_game_max=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_end_result[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_fastarena_group[i]=CreateGroup()
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_fastarena_value[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_fastarena_player[i]=0
        set i=i + 1
    endloop

    set udg_fastarena_time=0
    set udg_cycle_i=0
    set udg_rot_P=0
    set udg_cycle_j=0
    set udg_rotation_value=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_income_limit[i]=0
        set i=i + 1
    endloop

    set udg_income_group=CreateForce()
    set udg_income_max=0
    set udg_castle_unit=CreateGroup()
    set udg_point=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_fastarena_hp[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_fastarena_hp_start[i]=0
        set i=i + 1
    endloop

    set udg_fastarena_players=CreateForce()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_vklad_timer[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_inc_max[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_inc_all[i]=0
        set i=i + 1
    endloop

    set udg_inc_status=false
    set udg_mode=1
    set i=0
    loop
        exitwhen ( i > 2 )
        set udg_const_point[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 9 )
        set udg_inc_ps[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_inc_pp[i]=0
        set i=i + 1
    endloop

    set udg_gg=0
    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_leader_kf[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_leader_point[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_leader_kills[i]=0
        set i=i + 1
    endloop

    set udg_leader_bool=false
    set udg_leader_num=0
    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_leader_wins[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_leader_owner[i]=0
        set i=i + 1
    endloop

    set udg_gameset_time_first=0
    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_info[i]=false
        set i=i + 1
    endloop

    set udg_incometemp=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_weather[i]=0
        set i=i + 1
    endloop

    set udg_parody_time=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_is_casted[i]=false
        set i=i + 1
    endloop

    set udg_parody_game=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_changeSet[i]=0
        set i=i + 1
    endloop

endfunction

//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************

//***************************************************************************
//*
//*  Sound Assets
//*
//***************************************************************************

function InitSounds takes nothing returns nothing
    set gg_snd_BattleNetTick=CreateSound("Sound\\Interface\\BattleNetTick.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_BattleNetTick, 476)
    call SetSoundChannel(gg_snd_BattleNetTick, 0)
    call SetSoundVolume(gg_snd_BattleNetTick, - 1)
    call SetSoundPitch(gg_snd_BattleNetTick, 1.0)
    set gg_snd_Warning=CreateSound("Sound\\Interface\\Warning.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Warning, 1903)
    call SetSoundChannel(gg_snd_Warning, 0)
    call SetSoundVolume(gg_snd_Warning, - 1)
    call SetSoundPitch(gg_snd_Warning, 1.0)
    set gg_snd_QuestNew=CreateSound("Sound\\Interface\\QuestNew.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_QuestNew, 3750)
    call SetSoundChannel(gg_snd_QuestNew, 0)
    call SetSoundVolume(gg_snd_QuestNew, - 1)
    call SetSoundPitch(gg_snd_QuestNew, 1.0)
    set gg_snd_QuestCompleted=CreateSound("Sound\\Interface\\QuestCompleted.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_QuestCompleted, 5154)
    call SetSoundChannel(gg_snd_QuestCompleted, 0)
    call SetSoundVolume(gg_snd_QuestCompleted, - 1)
    call SetSoundPitch(gg_snd_QuestCompleted, 1.0)
    set gg_snd_BloodElfMageYesAttack1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageYesAttack1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageYesAttack1, 1718)
    call SetSoundChannel(gg_snd_BloodElfMageYesAttack1, 0)
    call SetSoundVolume(gg_snd_BloodElfMageYesAttack1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageYesAttack1, 1.0)
    set gg_snd_BloodElfMageYesAttack3=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageYesAttack3.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageYesAttack3, 1938)
    call SetSoundChannel(gg_snd_BloodElfMageYesAttack3, 0)
    call SetSoundVolume(gg_snd_BloodElfMageYesAttack3, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageYesAttack3, 1.0)
    set gg_snd_BloodElfMageWarcry1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageWarcry1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageWarcry1, 2002)
    call SetSoundChannel(gg_snd_BloodElfMageWarcry1, 0)
    call SetSoundVolume(gg_snd_BloodElfMageWarcry1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageWarcry1, 1.0)
    set gg_snd_BloodElfMageReady1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageReady1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageReady1, 2012)
    call SetSoundChannel(gg_snd_BloodElfMageReady1, 0)
    call SetSoundVolume(gg_snd_BloodElfMageReady1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageReady1, 1.0)
    set gg_snd_BloodElfMagePissed1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMagePissed1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMagePissed1, 2948)
    call SetSoundChannel(gg_snd_BloodElfMagePissed1, 0)
    call SetSoundVolume(gg_snd_BloodElfMagePissed1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMagePissed1, 1.0)
    set gg_snd_BattleNetTick01=CreateSound("Sound\\Interface\\BattleNetTick.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_BattleNetTick01, 476)
    call SetSoundChannel(gg_snd_BattleNetTick01, 0)
    call SetSoundVolume(gg_snd_BattleNetTick01, - 1)
    call SetSoundPitch(gg_snd_BattleNetTick01, 1.0)
    set gg_snd_ClanInvitation=CreateSound("Sound\\Interface\\ClanInvitation.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_ClanInvitation, 4295)
    call SetSoundChannel(gg_snd_ClanInvitation, 0)
    call SetSoundVolume(gg_snd_ClanInvitation, - 1)
    call SetSoundPitch(gg_snd_ClanInvitation, 1.0)
endfunction

//***************************************************************************
//*
//*  Items
//*
//***************************************************************************

function CreateAllItems takes nothing returns nothing
    local integer itemID

    call BlzCreateItemWithSkin('I001', 9411.5, 6208.3, 'I001')
    call BlzCreateItemWithSkin('I001', 9415.8, 7100.5, 'I001')
    call BlzCreateItemWithSkin('I001', 8515.9, 7102.1, 'I001')
    call BlzCreateItemWithSkin('I001', 8516.7, 6187.6, 'I001')
    call BlzCreateItemWithSkin('I001', 8951.7, 6656.9, 'I001')
endfunction

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'nwgt', - 832.0, - 768.0, 270.000, 'nwgt')
    call WaygateSetDestination(u, GetRectCenterX(gg_rct_teleport1), GetRectCenterY(gg_rct_teleport1))
    call WaygateActivate(u, true)
    call SetUnitColor(u, ConvertPlayerColor(2))
    set u=BlzCreateUnitWithSkin(p, 'nwgt', 2176.0, 4096.0, 270.000, 'nwgt')
    call WaygateSetDestination(u, GetRectCenterX(gg_rct_teleport2), GetRectCenterY(gg_rct_teleport2))
    call WaygateActivate(u, true)
    call SetUnitColor(u, ConvertPlayerColor(6))
    set u=BlzCreateUnitWithSkin(p, 'nwgt', 2432.0, 1152.0, 270.000, 'nwgt')
    set u=BlzCreateUnitWithSkin(p, 'nwgt', - 1216.0, - 64.0, 270.000, 'nwgt')
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings()
    call CreatePlayerBuildings()
    call CreatePlayerUnits()
endfunction

//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************

function CreateRegions takes nothing returns nothing
    local weathereffect we

    set gg_rct_centreUP=Rect(- 32.0, 608.0, 32.0, 672.0)
    set gg_rct_centreDOWN=Rect(- 32.0, - 672.0, 32.0, - 608.0)
    set gg_rct_centreRIGHT=Rect(608.0, - 32.0, 672.0, 32.0)
    set gg_rct_centreLEFT=Rect(- 672.0, - 32.0, - 608.0, 32.0)
    set gg_rct_centreCENTRE=Rect(- 32.0, - 32.0, 32.0, 32.0)
    set gg_rct_player1=Rect(- 7392.0, 6400.0, - 5856.0, 7936.0)
    set gg_rct_player2=Rect(- 7424.0, 4352.0, - 5888.0, 5888.0)
    set gg_rct_player3=Rect(- 7424.0, 2304.0, - 5888.0, 3840.0)
    set gg_rct_player4=Rect(- 7424.0, 224.0, - 5888.0, 1760.0)
    set gg_rct_player5=Rect(- 7424.0, - 1824.0, - 5888.0, - 288.0)
    set gg_rct_player6=Rect(- 7424.0, - 3840.0, - 5888.0, - 2304.0)
    set gg_rct_player7=Rect(- 7424.0, - 5888.0, - 5888.0, - 4352.0)
    set gg_rct_player8=Rect(- 7424.0, - 7936.0, - 5888.0, - 6400.0)
    set gg_rct_start1=Rect(- 256.0, 4352.0, 256.0, 4864.0)
    set gg_rct_start2=Rect(3072.0, 3072.0, 3584.0, 3584.0)
    set gg_rct_start3=Rect(4352.0, - 256.0, 4864.0, 256.0)
    set gg_rct_start4=Rect(3072.0, - 3584.0, 3584.0, - 3072.0)
    set gg_rct_start5=Rect(- 256.0, - 4864.0, 256.0, - 4352.0)
    set gg_rct_start6=Rect(- 3584.0, - 3584.0, - 3072.0, - 3072.0)
    set gg_rct_start7=Rect(- 4864.0, - 256.0, - 4352.0, 256.0)
    set gg_rct_start8=Rect(- 3584.0, 3072.0, - 3072.0, 3584.0)
    set gg_rct_upright=Rect(1760.0, 1760.0, 1824.0, 1824.0)
    set gg_rct_downright=Rect(1760.0, - 1824.0, 1824.0, - 1760.0)
    set gg_rct_downleft=Rect(- 1824.0, - 1824.0, - 1760.0, - 1760.0)
    set gg_rct_upleft=Rect(- 1824.0, 1760.0, - 1760.0, 1824.0)
    set gg_rct_waveunitsCENTRE=Rect(- 3968.0, - 4224.0, 3968.0, 4224.0)
    set gg_rct_waveunitsRIGHT=Rect(3968.0, - 3712.0, 5120.0, 3712.0)
    set gg_rct_waveunitsLEFT=Rect(- 5120.0, - 3712.0, - 3968.0, 3712.0)
    set gg_rct_waveunitsDOWN=Rect(- 3328.0, - 5120.0, 3328.0, - 4224.0)
    set gg_rct_waveunitsUP=Rect(- 3328.0, 4224.0, 3328.0, 5120.0)
    set gg_rct_teleport1=Rect(- 1312.0, - 160.0, - 1120.0, 32.0)
    set gg_rct_teleport2=Rect(2336.0, 1056.0, 2528.0, 1248.0)
    set gg_rct_finish=Rect(2752.0, 6144.0, 2944.0, 7808.0)
    set gg_rct_horse1=Rect(- 2816.0, 7584.0, - 2560.0, 7776.0)
    set gg_rct_miner1=Rect(7808.0, 7552.0, 8064.0, 7808.0)
    set gg_rct_miner2=Rect(8832.0, 7552.0, 9088.0, 7808.0)
    set gg_rct_miner3=Rect(9856.0, 7552.0, 10112.0, 7808.0)
    set gg_rct_miner4=Rect(9856.0, 6528.0, 10112.0, 6784.0)
    set gg_rct_miner5=Rect(9856.0, 5504.0, 10112.0, 5760.0)
    set gg_rct_miner6=Rect(8832.0, 5504.0, 9088.0, 5760.0)
    set gg_rct_miner7=Rect(7808.0, 5504.0, 8064.0, 5760.0)
    set gg_rct_miner8=Rect(7808.0, 6528.0, 8064.0, 6784.0)
    set gg_rct_minersregion=Rect(7808.0, 5504.0, 10112.0, 7808.0)
    set gg_rct_horseregion=Rect(- 2816.0, 6144.0, 3072.0, 7808.0)
    set gg_rct_horse2=Rect(- 2816.0, 7392.0, - 2560.0, 7584.0)
    set gg_rct_horse3=Rect(- 2816.0, 7200.0, - 2560.0, 7392.0)
    set gg_rct_horse4=Rect(- 2816.0, 7008.0, - 2560.0, 7200.0)
    set gg_rct_horse5=Rect(- 2816.0, 6752.0, - 2560.0, 6944.0)
    set gg_rct_horse6=Rect(- 2816.0, 6560.0, - 2560.0, 6752.0)
    set gg_rct_horse7=Rect(- 2816.0, 6368.0, - 2560.0, 6560.0)
    set gg_rct_horse8=Rect(- 2816.0, 6176.0, - 2560.0, 6368.0)
    set gg_rct_hideandseek=Rect(5312.0, 5504.0, 6080.0, 6208.0)
    set gg_rct_hideandseekcam=Rect(8608.0, - 4096.0, 10464.0, - 2432.0)
    set we=AddWeatherEffect(gg_rct_hideandseekcam, 'SNhs')
    call EnableWeatherEffect(we, true)
    set gg_rct_roulettespawn=Rect(- 4736.0, 6176.0, - 3328.0, 6368.0)
    set gg_rct_roulette=Rect(- 4864.0, 6144.0, - 3200.0, 7424.0)
    set gg_rct_circle=Rect(- 4608.0, 7040.0, - 4480.0, 7168.0)
    set gg_rct_roulettegame=Rect(- 4768.0, 6400.0, - 3328.0, 7296.0)
    set gg_rct_fastarena=Rect(8576.0, 896.0, 11392.0, 3712.0)
    set gg_rct_fastarenaSPAWN1=Rect(8960.0, 2816.0, 9472.0, 3328.0)
    set gg_rct_fastarenaSPAWN2=Rect(10496.0, 2816.0, 11008.0, 3328.0)
    set gg_rct_fastarenaSPAWN3=Rect(10496.0, 1280.0, 11008.0, 1792.0)
    set gg_rct_fastarenaSPAWN4=Rect(8960.0, 1280.0, 9472.0, 1792.0)
    set gg_rct_fastarenaFIRE=Rect(9824.0, 2144.0, 10144.0, 2464.0)
    set gg_rct_guideyes=Rect(6400.0, 2432.0, 6528.0, 2560.0)
    set gg_rct_banshispawn=Rect(3968.0, 4992.0, 6912.0, 7680.0)
    set gg_rct_all=Rect(- 5120.0, - 5120.0, 5120.0, 5120.0)
    set gg_rct_downmid=Rect(- 32.0, - 2976.0, 32.0, - 2912.0)
    set gg_rct_upmid=Rect(- 160.0, 2528.0, - 96.0, 2592.0)
    set gg_rct_rightmid=Rect(2784.0, - 32.0, 2848.0, 32.0)
    set gg_rct_leftmid=Rect(- 2720.0, - 32.0, - 2656.0, 32.0)
    set gg_rct_guideno=Rect(7040.0, 2432.0, 7168.0, 2560.0)
    set gg_rct_guideyesvote=Rect(6400.0, 2304.0, 6528.0, 2432.0)
    set gg_rct_guidenovote=Rect(7040.0, 2304.0, 7168.0, 2432.0)
    set gg_rct________________075=Rect(6272.0, 1792.0, 7296.0, 2816.0)
    set gg_rct________________075_____________________u=Rect(6432.0, 1920.0, 6560.0, 2048.0)
    set gg_rct________________075______________________2=Rect(6624.0, 1856.0, 6752.0, 1984.0)
    set gg_rct________________075______________________3=Rect(6816.0, 1856.0, 6944.0, 1984.0)
    set gg_rct________________075______________________4=Rect(7008.0, 1920.0, 7136.0, 2048.0)
    set gg_rct_stormeff=Rect(5216.0, - 4480.0, 5568.0, - 4160.0)
    set gg_rct________________081=Rect(6720.0, - 64.0, 6848.0, 64.0)
    set gg_rct________________082=Rect(6272.0, - 512.0, 7296.0, 512.0)
    set gg_rct_hideandseekall=Rect(3456.0, 4224.0, 7040.0, 7808.0)
    set we=AddWeatherEffect(gg_rct_hideandseekall, 'RLlr')
    call EnableWeatherEffect(we, true)
    set gg_rct_inc=Rect(- 384.0, 0.0, - 288.0, 96.0)
endfunction

//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************

function CreateCameras takes nothing returns nothing

    set gg_cam_hide_and_seek=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_NEARZ, 100.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_hide_and_seek, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_hide_and_seek, 9536.0, - 3264.0, 0.0)

    set gg_cam_logic=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_ANGLE_OF_ATTACK, 280.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_TARGET_DISTANCE, 2000.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_FIELD_OF_VIEW, 60.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_NEARZ, 100.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_logic, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_logic, 6778.2, 2306.0, 0.0)

    set gg_cam_Camera_003=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_NEARZ, 100.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_003, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_003, 6782.3, 2310.4, 0.0)

endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: initialization
//
// Устанавливаем переменные
//===========================================================================
function Trig_initialization_Actions takes nothing returns nothing
    set udg_leader_player[0]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_leader_player[1]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[1]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[2]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[3]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[4]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[5]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[6]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[7]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_ticket_players[8]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_gameset_time=30
    set udg_wave_time=120
    set udg_players_name[16]="Нейтрал"
    set udg_building_status=false
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreUP), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[0])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreDOWN), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[0])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreRIGHT), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[0])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreLEFT), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[0])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[0])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upright), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[1])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downright), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[2])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[3])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upleft), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[4])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upmid), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[5])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_rightmid), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[6])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downmid), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[7])
    call CreateNUnitsAtLoc(1, 'h000', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_leftmid), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_light[8])
    set udg_time[0]=0
    set udg_time[1]=0
    set udg_time[2]=0
    set udg_dmg_player_inflicted[1]=1.00
    set udg_dmg_player_taken[1]=1.00
    set udg_dmg_player_inflicted[2]=1.00
    set udg_dmg_player_taken[2]=2.00
    set udg_dmg_player_inflicted[3]=2.00
    set udg_dmg_player_taken[3]=2.00
    set udg_dmg_player_inflicted[4]=3.00
    set udg_dmg_player_taken[4]=2.00
    set udg_dmg_player_inflicted[5]=3.00
    set udg_dmg_player_taken[5]=3.00
    set udg_dmg_player_inflicted[6]=4.00
    set udg_dmg_player_taken[6]=4.00
    set udg_players_colour[1]="|cffFF0202"
    set udg_players_colour[2]="|cff0041FF"
    set udg_players_colour[3]="|cff1BE6D8"
    set udg_players_colour[4]="|cff530080"
    set udg_players_colour[5]="|cffFFFC00"
    set udg_players_colour[6]="|cffFE890D"
    set udg_players_colour[7]="|cff1FBF00"
    set udg_players_colour[8]="|cffE55AAF"
    set udg_players_colour[9]="|cff949596"
    set udg_players_colour[10]="|cff7DBEF1"
    set udg_players_colour[11]="|cff0F6146"
    set udg_players_colour[12]="|cff4D2903"
    set udg_players_colour[13]="|cff272727"
    set udg_players_colour[14]="|cff272727"
    set udg_players_colour[15]="|cff272727"
    set udg_players_colour[16]="|cff272727"
    set udg_id=40
endfunction

//===========================================================================
function InitTrig_initialization takes nothing returns nothing
    set gg_trg_initialization=CreateTrigger()
    call TriggerAddAction(gg_trg_initialization, function Trig_initialization_Actions)
endfunction

//===========================================================================
// Trigger: ini id
//===========================================================================
function Trig_ini_id_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'h00G' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'n001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_ini_id_Conditions takes nothing returns boolean
    if ( not Trig_ini_id_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_ini_id_Func002Func001C takes nothing returns boolean
    if ( not ( IsUnitInGroup(GetEnteringUnit(), udg_id_group) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_ini_id_Func002Func003C takes nothing returns boolean
    if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_MECHANICAL) == true ) ) then
        return false
    endif
    if ( not ( IsUnitInGroup(GetEnteringUnit(), udg_buildings) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_ini_id_Func002C takes nothing returns boolean
    if ( not Trig_ini_id_Func002Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_ini_id_Actions takes nothing returns nothing
    if ( Trig_ini_id_Func002C() ) then
        call DoNothing()
    else
        if ( Trig_ini_id_Func002Func001C() ) then
            set udg_id=( udg_id + 1 )
            call SetUnitUserData(GetEnteringUnit(), udg_id)
            call GroupAddUnitSimple(GetEnteringUnit(), udg_id_group)
        else
        endif
    endif
endfunction

//===========================================================================
function InitTrig_ini_id takes nothing returns nothing
    set gg_trg_ini_id=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_ini_id, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_ini_id, Condition(function Trig_ini_id_Conditions))
    call TriggerAddAction(gg_trg_ini_id, function Trig_ini_id_Actions)
endfunction

//===========================================================================
// Trigger: game end
//===========================================================================
function Trig_game_end_Func003A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetOwningPlayer(GetEnumUnit()), GetPlayerStartLocationLoc(GetOwningPlayer(GetEnumUnit())), 0)
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_game_end_Func004A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_game_end_Func006Func001Func002001002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_buildings) == true )
endfunction

function Trig_game_end_Func006Func001Func002A takes nothing returns nothing
    call IssueImmediateOrderBJ(GetEnumUnit(), "berserk")
endfunction

function Trig_game_end_Func006Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(udg_i)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_game_end_Func009A takes nothing returns nothing
    set udg_end_result[GetConvertedPlayerId(GetEnumPlayer())]=udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]
endfunction

function Trig_game_end_Func010Func001Func001C takes nothing returns boolean
    if ( not ( udg_scoreboard_result[GetForLoopIndexA()] < udg_scoreboard_result[GetForLoopIndexB()] ) ) then
        return false
    endif
    return true
endfunction

function Trig_game_end_Func012Func001C takes nothing returns boolean
    if ( not ( udg_end_result[GetConvertedPlayerId(GetEnumPlayer())] == udg_scoreboard_result[1] ) ) then
        return false
    endif
    return true
endfunction

function Trig_game_end_Func012A takes nothing returns nothing
    if ( Trig_game_end_Func012Func001C() ) then
        call DisplayTimedTextToForce(GetPlayersAll(), 900.00, ( "Победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + ( udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] + "|r !" ) ) ))
    else
    endif
endfunction

function Trig_game_end_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetDayNightModels("", "")
    call ForGroupBJ(GetUnitsOfTypeIdAll('hbla'), function Trig_game_end_Func003A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('hwtw'), function Trig_game_end_Func004A)
    call DisplayTimedTextToForce(GetPlayersAll(), 900.00, "TRIGSTR_1138")
    set udg_i=1
    loop
        exitwhen udg_i > udg_scoreboard_limit
        if ( Trig_game_end_Func006Func001C() ) then
            set udg_end_result[udg_i]=udg_scoreboard_result[udg_i]
            call ForGroupBJ(GetUnitsOfPlayerMatching(ConvertedPlayer(udg_i), Condition(function Trig_game_end_Func006Func001Func002001002)), function Trig_game_end_Func006Func001Func002A)
            call CreateDestructableLoc('B008', GetPlayerStartLocationLoc(ConvertedPlayer(udg_i)), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=1
            loop
                exitwhen udg_k > 8
                call CreateDestructableLoc('B008', PolarProjectionBJ(GetPlayerStartLocationLoc(ConvertedPlayer(udg_i)), 633.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
                set udg_k=udg_k + 1
            endloop
        else
        endif
        call TriggerSleepAction(0.10)
        set udg_i=udg_i + 1
    endloop
    call TriggerSleepAction(3.00)
    call ClearTextMessagesBJ(GetPlayersAll())
    call ForForce(udg_players_group, function Trig_game_end_Func009A)
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=7
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set bj_forLoopBIndex=( GetForLoopIndexA() + 1 )
        set bj_forLoopBIndexEnd=8
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            if ( Trig_game_end_Func010Func001Func001C() ) then
                set udg_scoreboard_result[GetForLoopIndexA()]=( udg_scoreboard_result[GetForLoopIndexA()] + udg_scoreboard_result[GetForLoopIndexB()] )
                set udg_scoreboard_result[GetForLoopIndexB()]=( udg_scoreboard_result[GetForLoopIndexA()] - udg_scoreboard_result[GetForLoopIndexB()] )
                set udg_scoreboard_result[GetForLoopIndexA()]=( udg_scoreboard_result[GetForLoopIndexA()] - udg_scoreboard_result[GetForLoopIndexB()] )
            else
            endif
            set bj_forLoopBIndex=bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call PlaySoundBJ(gg_snd_ClanInvitation)
    call ForForce(udg_players_group, function Trig_game_end_Func012A)
    call DisplayTimedTextToForce(GetPlayersAll(), 900.00, "TRIGSTR_1148")
endfunction

//===========================================================================
function InitTrig_game_end takes nothing returns nothing
    set gg_trg_game_end=CreateTrigger()
    call TriggerAddAction(gg_trg_game_end, function Trig_game_end_Actions)
endfunction

//===========================================================================
// Trigger: cmd clear
//===========================================================================
function Trig_cmd_clear_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetForceOfPlayer(GetTriggerPlayer()))
endfunction

//===========================================================================
function InitTrig_cmd_clear takes nothing returns nothing
    set gg_trg_cmd_clear=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(0), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(0), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(0), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(1), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(1), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(1), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(2), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(2), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(2), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(3), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(3), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(3), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(4), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(4), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(4), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(5), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(5), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(5), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(6), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(6), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(6), "-с", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(7), "-c", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(7), "-clear", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_clear, Player(7), "-с", true)
    call TriggerAddAction(gg_trg_cmd_clear, function Trig_cmd_clear_Actions)
endfunction

//===========================================================================
// Trigger: cmd build
//===========================================================================
function Trig_cmd_build_Conditions takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == udg_game_owner ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_build_Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 8, 8)) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_build_Actions takes nothing returns nothing
    if ( Trig_cmd_build_Func002C() ) then
        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "TRIGSTR_413")
        set udg_building_status=true
    else
        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "TRIGSTR_414")
        set udg_building_status=false
    endif
endfunction

//===========================================================================
function InitTrig_cmd_build takes nothing returns nothing
    set gg_trg_cmd_build=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(0), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(1), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(2), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(3), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(4), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(5), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(6), "-build ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_build, Player(7), "-build ", false)
    call TriggerAddCondition(gg_trg_cmd_build, Condition(function Trig_cmd_build_Conditions))
    call TriggerAddAction(gg_trg_cmd_build, function Trig_cmd_build_Actions)
endfunction

//===========================================================================
// Trigger: cmd time
//===========================================================================
function Trig_cmd_time_Func003C takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == udg_game_owner ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 8)) >= 20 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 8)) <= 60 ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_time_Conditions takes nothing returns boolean
    if ( not Trig_cmd_time_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_time_Actions takes nothing returns nothing
    set udg_gameset_time=S2I(SubStringBJ(GetEventPlayerChatString(), 7, 8))
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ( "Время перед началом каждого раунда изменено на |cFF00FF00" + ( I2S(udg_gameset_time) + "|r сек." ) ))
endfunction

//===========================================================================
function InitTrig_cmd_time takes nothing returns nothing
    set gg_trg_cmd_time=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(0), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(1), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(2), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(3), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(4), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(5), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(6), "-time ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_time, Player(7), "-time ", false)
    call TriggerAddCondition(gg_trg_cmd_time, Condition(function Trig_cmd_time_Conditions))
    call TriggerAddAction(gg_trg_cmd_time, function Trig_cmd_time_Actions)
endfunction

//===========================================================================
// Trigger: cmd arena
//===========================================================================
function Trig_cmd_arena_Func011C takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == udg_game_owner ) ) then
        return false
    endif
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 7) == "-arena " ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 8, 10)) >= 60 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 8, 10)) <= 150 ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_arena_Conditions takes nothing returns boolean
    if ( not Trig_cmd_arena_Func011C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_arena_Actions takes nothing returns nothing
    set udg_wave_time=S2I(SubStringBJ(GetEventPlayerChatString(), 8, 10))
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ( "Начальное время на арене изменено на |cFF00FF00" + ( I2S(udg_wave_time) + "|r сек." ) ))
endfunction

//===========================================================================
function InitTrig_cmd_arena takes nothing returns nothing
    set gg_trg_cmd_arena=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(0), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(1), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(2), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(3), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(4), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(5), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(6), "-arena ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_arena, Player(7), "-arena ", false)
    call TriggerAddCondition(gg_trg_cmd_arena, Condition(function Trig_cmd_arena_Conditions))
    call TriggerAddAction(gg_trg_cmd_arena, function Trig_cmd_arena_Actions)
endfunction

//===========================================================================
// Trigger: cmd mode
//
// mode - 1. Стандартный режим. Каждую нечет. волну арена, каждую чёт. волну миниигра.
// mode - 2. Режим без миниигр.
// mode - 3. Режим с упором на сражения. Каждая третья волна миниигра. Босса нет.
//===========================================================================
function Trig_cmd_mode_Func003C takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == udg_game_owner ) ) then
        return false
    endif
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-mode " ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Conditions takes nothing returns boolean
    if ( not Trig_cmd_mode_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func001Func001Func006Func001Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_random_log == false ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[0] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[2] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[3] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[4] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[5] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[6] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[7] != ( udg_r * 3 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[8] != ( udg_r * 3 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func001Func001Func006Func001Func003Func002C takes nothing returns boolean
    if ( not Trig_cmd_mode_Func001Func001Func001Func006Func001Func003Func002Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func001Func001Func006Func001C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() != 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func001Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 7, 7) == "3" ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func001Func006A takes nothing returns nothing
    set udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]=14
endfunction

function Trig_cmd_mode_Func001Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 7, 7) == "2" ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func006Func001Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_random_log == false ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[0] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[1] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[2] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[3] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[4] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[5] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[6] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[7] != ( udg_r * 2 ) ) ) then
        return false
    endif
    if ( not ( udg_wave_mini[8] != ( udg_r * 2 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func006Func001Func003Func002C takes nothing returns boolean
    if ( not Trig_cmd_mode_Func001Func006Func001Func003Func002Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001Func006Func001C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() != 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 7, 7) == "1" ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_mode_Actions takes nothing returns nothing
    if ( Trig_cmd_mode_Func001C() ) then
        call PlaySoundBJ(gg_snd_Warning)
        call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2534")
        set udg_mode=1
        set udg_wave_mini[1]=4
        set bj_forLoopAIndex=0
        set bj_forLoopAIndexEnd=udg_mini_game_max
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_cmd_mode_Func001Func006Func001C() ) then
                set udg_random_log=false
                set bj_forLoopBIndex=1
                set bj_forLoopBIndexEnd=( udg_mini_game_max * 7 )
                loop
                    exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                    set udg_r=GetRandomInt(1, ( udg_mini_game_max + 1 ))
                    if ( Trig_cmd_mode_Func001Func006Func001Func003Func002C() ) then
                        set udg_random_log=true
                        set udg_wave_mini[GetForLoopIndexA()]=( udg_r * 2 )
                    else
                    endif
                    set bj_forLoopBIndex=bj_forLoopBIndex + 1
                endloop
                set udg_r=0
            else
            endif
            set bj_forLoopAIndex=bj_forLoopAIndex + 1
        endloop
    else
        if ( Trig_cmd_mode_Func001Func001C() ) then
            call PlaySoundBJ(gg_snd_Warning)
            call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2535")
            set udg_mode=2
            set bj_forLoopAIndex=0
            set bj_forLoopAIndexEnd=udg_mini_game_max
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_wave_mini[GetForLoopIndexA()]=99
                set bj_forLoopAIndex=bj_forLoopAIndex + 1
            endloop
            call ForForce(udg_players_group, function Trig_cmd_mode_Func001Func001Func006A)
        else
            if ( Trig_cmd_mode_Func001Func001Func001C() ) then
                call PlaySoundBJ(gg_snd_Warning)
                call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2536")
                set udg_mode=3
                set udg_wave_mini[1]=99
                set bj_forLoopAIndex=0
                set bj_forLoopAIndexEnd=udg_mini_game_max
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if ( Trig_cmd_mode_Func001Func001Func001Func006Func001C() ) then
                        set udg_random_log=false
                        set bj_forLoopBIndex=1
                        set bj_forLoopBIndexEnd=( udg_mini_game_max * 7 )
                        loop
                            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                            set udg_r=GetRandomInt(1, udg_mini_game_max)
                            if ( Trig_cmd_mode_Func001Func001Func001Func006Func001Func003Func002C() ) then
                                set udg_random_log=true
                                set udg_wave_mini[GetForLoopIndexA()]=( udg_r * 3 )
                            else
                            endif
                            set bj_forLoopBIndex=bj_forLoopBIndex + 1
                        endloop
                    else
                    endif
                    set bj_forLoopAIndex=bj_forLoopAIndex + 1
                endloop
                set udg_r=0
            else
                call DisplayTimedTextToForce(GetForceOfPlayer(GetTriggerPlayer()), 20.00, "TRIGSTR_2537")
            endif
        endif
    endif
    call DisableTrigger(GetTriggeringTrigger())
endfunction

//===========================================================================
function InitTrig_cmd_mode takes nothing returns nothing
    set gg_trg_cmd_mode=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(0), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(1), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(2), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(3), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(4), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(5), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(6), "-mode ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_mode, Player(7), "-mode ", false)
    call TriggerAddCondition(gg_trg_cmd_mode, Condition(function Trig_cmd_mode_Conditions))
    call TriggerAddAction(gg_trg_cmd_mode, function Trig_cmd_mode_Actions)
endfunction

//===========================================================================
// Trigger: cmd point
//===========================================================================
function Trig_cmd_point_Func010C takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == udg_game_owner ) ) then
        return false
    endif
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 7) == "-point " ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_point_Conditions takes nothing returns boolean
    if ( not Trig_cmd_point_Func010C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_point_Func001Func004C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 8, 8)) >= 0 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 9, 9)) <= 9 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 9, 9)) >= S2I(SubStringBJ(GetEventPlayerChatString(), 8, 8)) ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_point_Func001C takes nothing returns boolean
    if ( not Trig_cmd_point_Func001Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_point_Actions takes nothing returns nothing
    if ( Trig_cmd_point_Func001C() ) then
        set udg_const_point[0]=S2I(SubStringBJ(GetEventPlayerChatString(), 8, 8))
        set udg_const_point[1]=S2I(SubStringBJ(GetEventPlayerChatString(), 9, 9))
        call DisplayTextToForce(GetPlayersAll(), ( "Число контрольных точек будет варьироваться от |cFF00FF00" + ( I2S(udg_const_point[0]) + ( "|r до |cFF00FF00" + ( I2S(udg_const_point[1]) + "|r" ) ) ) ))
    else
    endif
endfunction

//===========================================================================
function InitTrig_cmd_point takes nothing returns nothing
    set gg_trg_cmd_point=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(0), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(1), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(2), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(3), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(4), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(5), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(6), "-point ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_point, Player(7), "-point ", false)
    call TriggerAddCondition(gg_trg_cmd_point, Condition(function Trig_cmd_point_Conditions))
    call TriggerAddAction(gg_trg_cmd_point, function Trig_cmd_point_Actions)
endfunction

//===========================================================================
// Trigger: cmd gg
//===========================================================================
function Trig_cmd_gg_Func010C takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == udg_game_owner ) ) then
        return false
    endif
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 4) == "-gg " ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_gg_Conditions takes nothing returns boolean
    if ( not Trig_cmd_gg_Func010C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_gg_Func001Func003C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 5, 6)) >= 9 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 5, 6)) <= ( ( udg_mini_game_max * 2 ) + 3 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_gg_Func001C takes nothing returns boolean
    if ( not Trig_cmd_gg_Func001Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_gg_Actions takes nothing returns nothing
    if ( Trig_cmd_gg_Func001C() ) then
        set udg_gg=S2I(SubStringBJ(GetEventPlayerChatString(), 5, 6))
        call DisplayTextToForce(GetPlayersAll(), ( "Игра закончится после |cFF00FF00" + ( I2S(udg_gg) + "|r волны." ) ))
    else
    endif
endfunction

//===========================================================================
function InitTrig_cmd_gg takes nothing returns nothing
    set gg_trg_cmd_gg=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(0), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(1), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(2), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(3), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(4), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(5), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(6), "-gg ", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_gg, Player(7), "-gg ", false)
    call TriggerAddCondition(gg_trg_cmd_gg, Condition(function Trig_cmd_gg_Conditions))
    call TriggerAddAction(gg_trg_cmd_gg, function Trig_cmd_gg_Actions)
endfunction

//===========================================================================
// Trigger: cmd info
//===========================================================================
function Trig_cmd_info_Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetTriggerPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_cmd_info_Actions takes nothing returns nothing
    if ( Trig_cmd_info_Func001C() ) then
        set udg_info[GetConvertedPlayerId(GetTriggerPlayer())]=false
        call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_2651")
    else
        set udg_info[GetConvertedPlayerId(GetTriggerPlayer())]=true
        call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_2652")
    endif
endfunction

//===========================================================================
function InitTrig_cmd_info takes nothing returns nothing
    set gg_trg_cmd_info=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(0), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(1), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(2), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(3), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(4), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(5), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(6), "-info", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_info, Player(7), "-info", true)
    call TriggerAddAction(gg_trg_cmd_info, function Trig_cmd_info_Actions)
endfunction

//===========================================================================
// Trigger: cmd zoom
//===========================================================================
function Trig_cmd_zoom_Actions takes nothing returns nothing
    call SetCameraFieldForPlayer(GetTriggerPlayer(), CAMERA_FIELD_TARGET_DISTANCE, ( 10.00 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 9)) ), 1.00)
endfunction

//===========================================================================
function InitTrig_cmd_zoom takes nothing returns nothing
    set gg_trg_cmd_zoom=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(0), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(1), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(2), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(3), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(4), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(5), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(6), "-zoom", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_cmd_zoom, Player(7), "-zoom", false)
    call TriggerAddAction(gg_trg_cmd_zoom, function Trig_cmd_zoom_Actions)
endfunction

//===========================================================================
// Trigger: scoreboard ini
//
// как-нибудь потом, если не забуду...
//===========================================================================
function Trig_scoreboard_ini_Func002Func001001 takes nothing returns boolean
    return ( IsPlayerInForce(ConvertedPlayer(GetForLoopIndexA()), udg_players_group) == true )
endfunction

function Trig_scoreboard_ini_Func010A takes nothing returns nothing
    call MultiboardSetItemValueBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetEnumPlayer()) ), ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] ))
    call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetEnumPlayer()) ), "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp")
endfunction

function Trig_scoreboard_ini_Func012Func001C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() != 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func012Func003C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func012Func004C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func012Func005C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func012Func006C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func012Func007C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func012Func008C takes nothing returns boolean
    if ( not ( GetForLoopIndexB() == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_ini_Func014A takes nothing returns nothing
    call MultiboardSetItemValueBJ(udg_scoreboard, 2, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), "TRIGSTR_846")
    call MultiboardSetItemValueBJ(udg_scoreboard, 3, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), "TRIGSTR_847")
    call MultiboardSetItemValueBJ(udg_scoreboard, 4, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_kills[GetConvertedPlayerId(GetEnumPlayer())]))
    call MultiboardSetItemValueBJ(udg_scoreboard, 5, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_upg[GetConvertedPlayerId(GetEnumPlayer())]))
    call MultiboardSetItemValueBJ(udg_scoreboard, 6, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_mini[GetConvertedPlayerId(GetEnumPlayer())]))
    call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
endfunction

function Trig_scoreboard_ini_Func019A takes nothing returns nothing
    call MultiboardSetItemValueBJ(udg_scoreboard, 8, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), R2S(udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]))
endfunction

function Trig_scoreboard_ini_Actions takes nothing returns nothing
    set udg_scoreboard_coloumns=8
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=8
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_scoreboard_ini_Func002Func001001() ) then
            set udg_scoreboard_limit=GetForLoopIndexA()
        else
            call DoNothing()
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call CreateMultiboardBJ(udg_scoreboard_coloumns, ( 1 + udg_scoreboard_limit ), ( "Информация | Волна #|cFF00FFFF" + ( I2S(udg_wave) + "|r" ) ))
    set udg_scoreboard=GetLastCreatedMultiboard()
    // имя игрока
    call MultiboardSetItemWidthBJ(udg_scoreboard, 1, 0, 11.50)
    call MultiboardSetItemStyleBJ(udg_scoreboard, 1, 1, true, false)
    call MultiboardSetItemValueBJ(udg_scoreboard, 1, 1, "TRIGSTR_834")
    set bj_forLoopAIndex=2
    set bj_forLoopAIndexEnd=( udg_scoreboard_limit + 1 )
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call MultiboardSetItemStyleBJ(udg_scoreboard, 1, GetForLoopIndexA(), true, true)
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, GetForLoopIndexA(), "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNReplay-Loop.blp")
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call ForForce(udg_players_group, function Trig_scoreboard_ini_Func010A)
    // доход
    set bj_forLoopBIndex=2
    set bj_forLoopBIndexEnd=7
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        if ( Trig_scoreboard_ini_Func012Func001C() ) then
            call MultiboardSetItemWidthBJ(udg_scoreboard, GetForLoopIndexB(), 0, 2.00)
        else
            call MultiboardSetItemWidthBJ(udg_scoreboard, GetForLoopIndexB(), 0, 3.50)
        endif
        call MultiboardSetItemStyleBJ(udg_scoreboard, GetForLoopIndexB(), 1, false, true)
        if ( Trig_scoreboard_ini_Func012Func003C() ) then
            call MultiboardSetItemIconBJ(udg_scoreboard, GetForLoopIndexB(), 1, "UI\\Feedback\\Resources\\ResourceGold.blp")
        else
        endif
        if ( Trig_scoreboard_ini_Func012Func004C() ) then
            call MultiboardSetItemIconBJ(udg_scoreboard, GetForLoopIndexB(), 1, "ReplaceableTextures\\PassiveButtons\\PASBTNgems.blp")
        else
        endif
        if ( Trig_scoreboard_ini_Func012Func005C() ) then
            call MultiboardSetItemIconBJ(udg_scoreboard, GetForLoopIndexB(), 1, "ReplaceableTextures\\CommandButtons\\BTNAttack.blp")
        else
        endif
        if ( Trig_scoreboard_ini_Func012Func006C() ) then
            call MultiboardSetItemIconBJ(udg_scoreboard, GetForLoopIndexB(), 1, "ReplaceableTextures\\CommandButtons\\BTNSpy.blp")
        else
        endif
        if ( Trig_scoreboard_ini_Func012Func007C() ) then
            call MultiboardSetItemIconBJ(udg_scoreboard, GetForLoopIndexB(), 1, "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
        else
        endif
        if ( Trig_scoreboard_ini_Func012Func008C() ) then
            call MultiboardSetItemIconBJ(udg_scoreboard, GetForLoopIndexB(), 1, "ReplaceableTextures\\CommandButtons\\BTNOrcCaptureFlag.blp")
        else
        endif
        set bj_forLoopAIndex=2
        set bj_forLoopAIndexEnd=( udg_scoreboard_limit + 1 )
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call MultiboardSetItemStyleBJ(udg_scoreboard, GetForLoopIndexB(), GetForLoopIndexA(), true, false)
            set bj_forLoopAIndex=bj_forLoopAIndex + 1
        endloop
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
    call MultiboardSetItemWidthBJ(udg_scoreboard, 7, 0, 3.00)
    call ForForce(udg_players_group, function Trig_scoreboard_ini_Func014A)
    // результат
    call MultiboardSetItemWidthBJ(udg_scoreboard, 8, 0, 3.00)
    call MultiboardSetItemStyleBJ(udg_scoreboard, 8, 0, true, false)
    call MultiboardSetItemStyleBJ(udg_scoreboard, 8, 1, false, false)
    call ForForce(udg_players_group, function Trig_scoreboard_ini_Func019A)
    // отображение
    call MultiboardMinimizeBJ(true, GetLastCreatedMultiboard())
    call MultiboardMinimizeBJ(false, GetLastCreatedMultiboard())
endfunction

//===========================================================================
function InitTrig_scoreboard_ini takes nothing returns nothing
    set gg_trg_scoreboard_ini=CreateTrigger()
    call TriggerAddAction(gg_trg_scoreboard_ini, function Trig_scoreboard_ini_Actions)
endfunction

//===========================================================================
// Trigger: scoreboard update
//===========================================================================
function Trig_scoreboard_update_Func001Func001C takes nothing returns boolean
    if ( not ( IsPlayerInForce(ConvertedPlayer(udg_g), udg_players_group) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_scoreboard_update_Func002A takes nothing returns nothing
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=0.00
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())] + ( ( I2R(GetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)) / 1250.00 ) * 5.00 ) )
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())] + ( ( I2R(GetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)) / 25.00 ) * 5.00 ) )
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())] + ( ( I2R(udg_scoreboard_kills[GetConvertedPlayerId(GetEnumPlayer())]) / 5.00 ) * ( 10.00 + I2R(GetPlayerTechCountSimple('R02J', GetEnumPlayer())) ) ) )
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())] + ( ( I2R(udg_scoreboard_upg[GetConvertedPlayerId(GetEnumPlayer())]) / 5.00 ) * 10.00 ) )
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())] + ( ( I2R(udg_scoreboard_mini[GetConvertedPlayerId(GetEnumPlayer())]) / 2.00 ) * 25.00 ) )
    set udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())] + ( ( I2R(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]) * 0.07 ) * udg_leader_kf[GetConvertedPlayerId(GetEnumPlayer())] ) )
    call MultiboardSetItemValueBJ(udg_scoreboard, 8, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), R2S(udg_scoreboard_result[GetConvertedPlayerId(GetEnumPlayer())]))
endfunction

function Trig_scoreboard_update_Actions takes nothing returns nothing
    set udg_g=1
    loop
        exitwhen udg_g > udg_scoreboard_limit
        if ( Trig_scoreboard_update_Func001Func001C() ) then
            call MultiboardSetItemValueBJ(udg_scoreboard, 2, ( udg_g + 1 ), I2S(GetPlayerState(ConvertedPlayer(udg_g), PLAYER_STATE_RESOURCE_GOLD)))
            call MultiboardSetItemValueBJ(udg_scoreboard, 3, ( udg_g + 1 ), I2S(GetPlayerState(ConvertedPlayer(udg_g), PLAYER_STATE_RESOURCE_LUMBER)))
        else
        endif
        set udg_g=udg_g + 1
    endloop
    call ForForce(udg_players_group, function Trig_scoreboard_update_Func002A)
endfunction

//===========================================================================
function InitTrig_scoreboard_update takes nothing returns nothing
    set gg_trg_scoreboard_update=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_scoreboard_update, 1.00)
    call TriggerAddAction(gg_trg_scoreboard_update, function Trig_scoreboard_update_Actions)
endfunction

//===========================================================================
// Trigger: units death
//===========================================================================
function Trig_units_death_Func001Func001C takes nothing returns boolean
    if ( not ( IsPlayerInForce(GetOwningPlayer(GetKillingUnitBJ()), udg_players_group) == true ) ) then
        return false
    endif
    if ( not ( IsPlayerInForce(GetOwningPlayer(GetDyingUnit()), udg_players_group) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_units_death_Func001C takes nothing returns boolean
    if ( not Trig_units_death_Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_units_death_Func002C takes nothing returns boolean
    if ( not ( IsUnitInGroup(GetDyingUnit(), udg_wave_units) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_units_death_Actions takes nothing returns nothing
    if ( Trig_units_death_Func001C() ) then
        set udg_scoreboard_kills[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]=( udg_scoreboard_kills[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))] + 1 )
        call MultiboardSetItemValueBJ(udg_scoreboard, 4, ( GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ())) + 1 ), I2S(udg_scoreboard_kills[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]))
    else
    endif
    if ( Trig_units_death_Func002C() ) then
        call GroupRemoveUnitSimple(GetDyingUnit(), udg_wave_units)
    else
    endif
    call TriggerSleepAction(60.00)
    call RemoveUnit(GetDyingUnit())
endfunction

//===========================================================================
function InitTrig_units_death takes nothing returns nothing
    set gg_trg_units_death=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_units_death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_units_death, function Trig_units_death_Actions)
endfunction

//===========================================================================
// Trigger: unit dammi
//===========================================================================
function Trig_unit_dammi_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h00G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_unit_dammi_Func002C takes nothing returns boolean
    if ( not ( IsUnitInGroup(GetEnteringUnit(), udg_castle_unit) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_unit_dammi_Actions takes nothing returns nothing
    call TriggerSleepAction(60.00)
    if ( Trig_unit_dammi_Func002C() ) then
        call RemoveUnit(GetEnteringUnit())
    else
    endif
endfunction

//===========================================================================
function InitTrig_unit_dammi takes nothing returns nothing
    set gg_trg_unit_dammi=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_unit_dammi, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_unit_dammi, Condition(function Trig_unit_dammi_Conditions))
    call TriggerAddAction(gg_trg_unit_dammi, function Trig_unit_dammi_Actions)
endfunction

//===========================================================================
// Trigger: units leave
//===========================================================================
function Trig_units_leave_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetEnteringUnit()) == Player(11) ) ) then
        return false
    endif
    return true
endfunction

function Trig_units_leave_Actions takes nothing returns nothing
    call SetUnitPositionLoc(GetEnteringUnit(), GetRectCenter(gg_rct_waveunitsCENTRE))
endfunction

//===========================================================================
function InitTrig_units_leave takes nothing returns nothing
    set gg_trg_units_leave=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player1)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player2)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player3)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player4)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player5)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player6)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player7)
    call TriggerRegisterEnterRectSimple(gg_trg_units_leave, gg_rct_player8)
    call TriggerAddCondition(gg_trg_units_leave, Condition(function Trig_units_leave_Conditions))
    call TriggerAddAction(gg_trg_units_leave, function Trig_units_leave_Actions)
endfunction

//===========================================================================
// Trigger: unit resources
//===========================================================================
function Trig_unit_resources_Func001C takes nothing returns boolean
    if ( ( GetResearched() == 'R01S' ) ) then
        return true
    endif
    if ( ( GetResearched() == 'R01T' ) ) then
        return true
    endif
    return false
endfunction

function Trig_unit_resources_Conditions takes nothing returns boolean
    if ( not Trig_unit_resources_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_unit_resources_Func003C takes nothing returns boolean
    if ( not ( GetResearched() == 'R01T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_unit_resources_Actions takes nothing returns nothing
    if ( Trig_unit_resources_Func003C() ) then
        call SetPlayerTechResearchedSwap('R01T', 0, GetOwningPlayer(GetTriggerUnit()))
        call AdjustPlayerStateBJ(250, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD)
    else
        call AdjustPlayerStateBJ(5, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_LUMBER)
        call SetPlayerTechResearchedSwap('R01S', 0, GetOwningPlayer(GetTriggerUnit()))
    endif
endfunction

//===========================================================================
function InitTrig_unit_resources takes nothing returns nothing
    set gg_trg_unit_resources=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_unit_resources, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_unit_resources, Condition(function Trig_unit_resources_Conditions))
    call TriggerAddAction(gg_trg_unit_resources, function Trig_unit_resources_Actions)
endfunction

//===========================================================================
// Trigger: upgrade def and dmg
//===========================================================================
function Trig_upgrade_def_and_dmg_Func002C takes nothing returns boolean
    if ( ( GetResearched() == 'Rhme' ) ) then
        return true
    endif
    if ( ( GetResearched() == 'Rhar' ) ) then
        return true
    endif
    return false
endfunction

function Trig_upgrade_def_and_dmg_Conditions takes nothing returns boolean
    if ( not Trig_upgrade_def_and_dmg_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_upgrade_def_and_dmg_Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A036', GetEnumUnit()) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001Func001Func002C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A035', GetEnumUnit()) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001Func001C takes nothing returns boolean
    if ( not ( GetResearched() == 'Rhar' ) ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001A takes nothing returns nothing
    if ( Trig_upgrade_def_and_dmg_Func001Func001C() ) then
        if ( Trig_upgrade_def_and_dmg_Func001Func001Func002C() ) then
            call UnitAddAbilityBJ('A035', GetEnumUnit())
        else
            call IncUnitAbilityLevelSwapped('A035', GetEnumUnit())
        endif
    else
        if ( Trig_upgrade_def_and_dmg_Func001Func001Func001C() ) then
            call UnitAddAbilityBJ('A036', GetEnumUnit())
        else
            call IncUnitAbilityLevelSwapped('A036', GetEnumUnit())
        endif
    endif
endfunction

function Trig_upgrade_def_and_dmg_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetOwningPlayer(GetTriggerUnit()), Condition(function Trig_upgrade_def_and_dmg_Func001001002)), function Trig_upgrade_def_and_dmg_Func001A)
endfunction

//===========================================================================
function InitTrig_upgrade_def_and_dmg takes nothing returns nothing
    set gg_trg_upgrade_def_and_dmg=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_upgrade_def_and_dmg, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_upgrade_def_and_dmg, Condition(function Trig_upgrade_def_and_dmg_Conditions))
    call TriggerAddAction(gg_trg_upgrade_def_and_dmg, function Trig_upgrade_def_and_dmg_Actions)
endfunction

//===========================================================================
// Trigger: set wave start main
//===========================================================================
function Trig_set_wave_start_main_Func001A takes nothing returns nothing
    set udg_leader_kills[GetConvertedPlayerId(GetEnumPlayer())]=udg_scoreboard_kills[GetConvertedPlayerId(GetEnumPlayer())]
    set udg_leader_point[GetConvertedPlayerId(GetEnumPlayer())]=udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]
    set udg_leader_owner[GetConvertedPlayerId(GetEnumPlayer())]=0
endfunction

function Trig_set_wave_start_main_Func002Func001A takes nothing returns nothing
    call PauseUnitBJ(true, GetEnumUnit())
endfunction

function Trig_set_wave_start_main_Func002Func002001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_set_wave_start_main_Func002Func002A takes nothing returns nothing
    call PauseUnitBJ(true, GetEnumUnit())
endfunction

function Trig_set_wave_start_main_Func002C takes nothing returns boolean
    if ( not ( udg_building_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_start_main_Func003A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_set_wave_start_main_Func009C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[1] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_start_main_Func010C takes nothing returns boolean
    if ( not ( udg_boss_wave == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_start_main_Actions takes nothing returns nothing
    call ForForce(udg_players_group, function Trig_set_wave_start_main_Func001A)
    if ( Trig_set_wave_start_main_Func002C() ) then
        call ForGroupBJ(udg_buildings, function Trig_set_wave_start_main_Func002Func001A)
        call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_set_wave_start_main_Func002Func002001002)), function Trig_set_wave_start_main_Func002Func002A)
    else
    endif
    call ForGroupBJ(GetUnitsOfTypeIdAll('h029'), function Trig_set_wave_start_main_Func003A)
    set udg_wave_status=true
    call EnableTrigger(gg_trg_building_inf)
    call EnableTrigger(gg_trg_wave_castle_destr)
    call PlaySoundBJ(gg_snd_QuestNew)
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    if ( Trig_set_wave_start_main_Func009C() ) then
        set udg_boss_wave=true
        call TriggerExecute(gg_trg_boss_ini_start)
    else
    endif
    if ( Trig_set_wave_start_main_Func010C() ) then
        call TriggerSleepAction(1.00)
        call EnableTrigger(gg_trg_wave_end)
    else
    endif
endfunction

//===========================================================================
function InitTrig_set_wave_start_main takes nothing returns nothing
    set gg_trg_set_wave_start_main=CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_set_wave_start_main, udg_wave_timer)
    call TriggerAddAction(gg_trg_set_wave_start_main, function Trig_set_wave_start_main_Actions)
endfunction

//===========================================================================
// Trigger: set wave timer
//===========================================================================
function Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[8] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[7] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[6] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[5] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[3] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[2] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004Func002C takes nothing returns boolean
    if ( not ( udg_wave != ( udg_wave_mini[2] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[3] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[5] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[6] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[7] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[8] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func004C takes nothing returns boolean
    if ( not Trig_set_wave_timer_Func003Func002Func004Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func006Func003C takes nothing returns boolean
    if ( not ( udg_wave != ( udg_wave_mini[0] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[2] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[3] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[5] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[6] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[7] - 1 ) ) ) then
        return false
    endif
    if ( not ( udg_wave != ( udg_wave_mini[8] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002Func006C takes nothing returns boolean
    if ( not Trig_set_wave_timer_Func003Func002Func006Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003Func002C takes nothing returns boolean
    if ( not ( udg_boss_wave == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func003C takes nothing returns boolean
    if ( not ( udg_wave != ( udg_wave_mini[4] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func007Func001C takes nothing returns boolean
    if ( not ( udg_leader_num != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Func007C takes nothing returns boolean
    if ( not ( udg_leader_num == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_timer_Actions takes nothing returns nothing
    call TriggerSleepAction(0.10)
    if ( Trig_set_wave_timer_Func003C() ) then
        if ( Trig_set_wave_timer_Func003Func002C() ) then
            if ( Trig_set_wave_timer_Func003Func002Func004C() ) then
                call StartTimerBJ(udg_wave_end_timer, false, I2R(udg_wave_time))
            else
                if ( Trig_set_wave_timer_Func003Func002Func004Func001C() ) then
                    call StartTimerBJ(udg_wave_end_timer, false, 150.00)
                else
                    if ( Trig_set_wave_timer_Func003Func002Func004Func001Func001C() ) then
                        call StartTimerBJ(udg_wave_end_timer, false, 30.00)
                    else
                        if ( Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001C() ) then
                            call StartTimerBJ(udg_wave_end_timer, false, 135.00)
                        else
                            if ( Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001Func001C() ) then
                                call StartTimerBJ(udg_wave_end_timer, false, 150.00)
                            else
                                if ( Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001Func001Func001C() ) then
                                    call StartTimerBJ(udg_wave_end_timer, false, 90.00)
                                else
                                    if ( Trig_set_wave_timer_Func003Func002Func004Func001Func001Func001Func001Func001Func001C() ) then
                                        call StartTimerBJ(udg_wave_end_timer, false, 60.00)
                                    else
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
            call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "TRIGSTR_489")
            if ( Trig_set_wave_timer_Func003Func002Func006C() ) then
                call EnableTrigger(gg_trg_inc_per_second)
                call TriggerExecute(gg_trg_inc_rotate)
            else
            endif
        else
            call StartTimerBJ(udg_boss_end_timer, false, udg_boss_time)
            call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "TRIGSTR_488")
        endif
        call TimerDialogDisplayBJ(true, GetLastCreatedTimerDialogBJ())
        call TimerDialogSetTimeColorBJ(GetLastCreatedTimerDialogBJ(), 100, 0.00, 0.00, 0)
        call TimerDialogSetTitleColorBJ(GetLastCreatedTimerDialogBJ(), 100, 100.00, 100.00, 0)
    else
    endif
    set udg_wave=( udg_wave + 1 )
    call SetPlayerTechResearchedSwap('R01J', ( udg_wave / 2 ), Player(PLAYER_NEUTRAL_PASSIVE))
    set udg_wave_time=( udg_wave_time + 2 )
    if ( Trig_set_wave_timer_Func007C() ) then
        call MultiboardSetTitleText(udg_scoreboard, ( ( ( "Пред. лидеры - " + ( ( udg_players_colour[GetConvertedPlayerId(udg_leader_player[0])] + udg_players_name[GetConvertedPlayerId(udg_leader_player[0])] ) + ( "|r и " + ( udg_players_colour[GetConvertedPlayerId(udg_leader_player[1])] + udg_players_name[GetConvertedPlayerId(udg_leader_player[1])] ) ) ) ) + "|r | Волна #|cFF00FFFF" ) + ( I2S(udg_wave) + "|r" ) ))
    else
        if ( Trig_set_wave_timer_Func007Func001C() ) then
            call MultiboardSetTitleText(udg_scoreboard, ( ( ( "Пред. лидер - " + ( udg_players_colour[GetConvertedPlayerId(udg_leader_player[0])] + udg_players_name[GetConvertedPlayerId(udg_leader_player[0])] ) ) + "|r | Волна #|cFF00FFFF" ) + ( I2S(udg_wave) + "|r" ) ))
        else
            call MultiboardSetTitleText(udg_scoreboard, ( ( "Первое сражение за лидерство | Волна #|cFF00FFFF" ) + ( I2S(udg_wave) + "|r" ) ))
        endif
    endif
endfunction

//===========================================================================
function InitTrig_set_wave_timer takes nothing returns nothing
    set gg_trg_set_wave_timer=CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_set_wave_timer, udg_wave_timer)
    call TriggerAddAction(gg_trg_set_wave_timer, function Trig_set_wave_timer_Actions)
endfunction

//===========================================================================
// Trigger: set wave region rotate
//===========================================================================
function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func004001 takes nothing returns boolean
    return ( udg_random == 1 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func005001 takes nothing returns boolean
    return ( udg_random == 2 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func006001 takes nothing returns boolean
    return ( udg_random == 3 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func007001 takes nothing returns boolean
    return ( udg_random == 4 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func008001 takes nothing returns boolean
    return ( udg_random == 5 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func009001 takes nothing returns boolean
    return ( udg_random == 6 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func010001 takes nothing returns boolean
    return ( udg_random == 7 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func011001 takes nothing returns boolean
    return ( udg_random == 8 )
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003C takes nothing returns boolean
    if ( not ( udg_region_status[udg_random] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_region_rotate_Func004Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_region_player_status[udg_j] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_region_rotate_Func004Func001C takes nothing returns boolean
    if ( not ( IsPlayerInForce(ConvertedPlayer(udg_j), udg_players_group) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_region_rotate_Func005A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), 0)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUTIN, 2, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
endfunction

function Trig_set_wave_region_rotate_Actions takes nothing returns nothing
    call TriggerSleepAction(0.20)
    set bj_forLoopBIndex=1
    set bj_forLoopBIndexEnd=8
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_region_status[GetForLoopIndexB()]=false
        set udg_region_player_status[GetForLoopIndexB()]=false
        set udg_income_limit[GetForLoopIndexB()]=0
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
    set udg_j=1
    loop
        exitwhen udg_j > 8
        if ( Trig_set_wave_region_rotate_Func004Func001C() ) then
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=100
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001C() ) then
                    set udg_random=GetRandomInt(1, 8)
                    if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003C() ) then
                        set udg_region_status[udg_random]=true
                        set udg_region_player_status[udg_j]=true
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func004001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start1
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func005001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start2
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func006001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start3
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func007001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start4
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func008001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start5
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func009001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start6
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func010001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start7
                        else
                            call DoNothing()
                        endif
                        if ( Trig_set_wave_region_rotate_Func004Func001Func001Func001Func003Func011001() ) then
                            set udg_region_spawn[udg_j]=gg_rct_start8
                        else
                            call DoNothing()
                        endif
                    else
                    endif
                else
                    call DoNothing()
                endif
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
        else
        endif
        set udg_j=udg_j + 1
    endloop
    call ForForce(udg_players_group, function Trig_set_wave_region_rotate_Func005A)
endfunction

//===========================================================================
function InitTrig_set_wave_region_rotate takes nothing returns nothing
    set gg_trg_set_wave_region_rotate=CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_set_wave_region_rotate, udg_wave_timer)
    call TriggerAddAction(gg_trg_set_wave_region_rotate, function Trig_set_wave_region_rotate_Actions)
endfunction

//===========================================================================
// Trigger: set wave unit spawn
//===========================================================================
function Trig_set_wave_unit_spawn_Func003Func001C takes nothing returns boolean
    if ( not ( udg_wave != udg_wave_mini[0] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[2] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[3] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[4] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[5] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[6] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[7] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func002Func002A takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'Ewar', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), bj_UNIT_FACING)
    call ClearSelectionForPlayer(GetEnumPlayer())
    call SelectUnitForPlayerSingle(GetLastCreatedUnit(), GetEnumPlayer())
    call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(GetEnumPlayer()))
endfunction

function Trig_set_wave_unit_spawn_Func003Func002C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[0] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func003Func003A takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'h00I', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), bj_UNIT_FACING)
    call ClearSelectionForPlayer(GetEnumPlayer())
    call SelectUnitForPlayerSingle(GetLastCreatedUnit(), GetEnumPlayer())
endfunction

function Trig_set_wave_unit_spawn_Func003Func003C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[2] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func004C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[3] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func005C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[4] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func006C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[5] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func007C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[6] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func008C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[7] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func009C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func001Func002Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'hbla' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func001Func002A takes nothing returns nothing
    if ( Trig_set_wave_unit_spawn_Func003Func010Func001Func002Func001001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h01O', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func001C takes nothing returns boolean
    if ( not ( udg_wave != udg_wave_mini[1] ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002001002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_buildings) == true )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h002' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h004' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func003001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h005' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func004001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h003' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func005001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h007' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func006001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h008' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func007001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h009' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func008001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00A' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func009001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00B' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func010001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00C' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func011001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00E' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func012001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00F' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func013001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00J' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func014001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00L' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func015001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00N' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func016001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00P' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func017001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00Q' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func018001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00R' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func019001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00U' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func020001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00V' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func021001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h00W' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func022001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h012' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func023001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h013' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func024001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h014' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func025001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h016' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func026001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h017' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func027001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h018' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func028001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h019' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func029001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01A' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func030001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01B' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func031001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01C' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func032001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01D' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func033001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01E' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func034001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01F' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func035001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01H' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func036001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01I' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func037001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01J' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func038001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01K' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func039001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01L' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func040001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01M' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func041001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01N' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func042001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01P' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func043001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01Q' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func044001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01R' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func045001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01S' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func046001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01T' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func047001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01V' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func048001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01W' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func049001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01X' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func050001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01Y' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func051001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h01Z' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func052001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h020' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func053001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h021' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func054001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h022' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func055001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h026' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func056001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h027' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func057001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h028' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func058001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02A' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func059001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02B' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func060001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02C' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func061001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02D' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func062001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02E' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func063001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02F' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002Func064001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'h02G' )
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func002A takes nothing returns nothing
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func001001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hfoo', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func002001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hhes', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func003001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hcth', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func004001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hrif', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func005001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h006', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func006001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nhea', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func007001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hmpr', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func008001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nemi', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func009001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nhym', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func010001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hkni', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func011001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h00D', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func012001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nbld', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func013001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hsor', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func014001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h00K', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func015001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h00M', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func016001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nrog', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func017001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hspt', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func018001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h00O', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func019001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hgyr', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func020001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h00S', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func021001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h00T', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func022001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'hmtt', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func023001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h010', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func024001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'h011', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func025001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'uske', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func026001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nska', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func027001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ndmu', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func028001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'unec', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func029001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ugho', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func030001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ucry', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func031001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'uabo', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func032001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'uban', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func033001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nrvd', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func034001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ufro', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func035001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'esen', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func036001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'earc', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func037001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ewsp', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func038001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'edot', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func039001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'edry', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func040001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'efdr', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func041001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'edoc', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func042001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ebal', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func043001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'emtg', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func044001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'echm', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func045001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ogru', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func046001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'ohun', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func047001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'okod', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func048001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nw2w', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func049001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'orai', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func050001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'otbk', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func051001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'owyv', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func052001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'oshm', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func053001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'otau', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func054001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nbdk', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func055001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nmyr', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func056001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nsnp', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func057001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nrel', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func058001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nnsw', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func059001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nnrg', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func060001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nhyc', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func061001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nwgs', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func062001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nnsu', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func063001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nsgb', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func002Func064001() ) then
        call CreateNUnitsAtLocFacingLocBJ(1, 'nahy', GetEnumPlayer(), GetRectCenter(udg_region_spawn[GetConvertedPlayerId(GetEnumPlayer())]), GetRectCenter(gg_rct_centreCENTRE))
    else
        call DoNothing()
    endif
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func003Func001A takes nothing returns nothing
    call UnitAddAbilityBJ('S001', GetEnumUnit())
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func003C takes nothing returns boolean
    if ( not ( udg_weather[GetConvertedPlayerId(GetEnumPlayer())] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func004Func001A takes nothing returns nothing
    call UnitAddAbilityBJ('A03A', GetEnumUnit())
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func004C takes nothing returns boolean
    if ( not ( udg_weather[GetConvertedPlayerId(GetEnumPlayer())] == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func010Func005C takes nothing returns boolean
    if ( not ( udg_weather[GetConvertedPlayerId(GetEnumPlayer())] == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Func003Func010A takes nothing returns nothing
    if ( Trig_set_wave_unit_spawn_Func003Func010Func001C() ) then
        call ForGroupBJ(GetUnitsOfPlayerAll(GetEnumPlayer()), function Trig_set_wave_unit_spawn_Func003Func010Func001Func002A)
    else
    endif
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_set_wave_unit_spawn_Func003Func010Func002001002)), function Trig_set_wave_unit_spawn_Func003Func010Func002A)
    if ( Trig_set_wave_unit_spawn_Func003Func010Func003C() ) then
        call ForGroupBJ(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'h01O'), function Trig_set_wave_unit_spawn_Func003Func010Func003Func001A)
        call AddWeatherEffectSaveLast(gg_rct_all, 'SNbs')
        call EnableWeatherEffect(GetLastCreatedWeatherEffect(), true)
        call SetTerrainFogExBJ(0, 1000, 3500.00, 0.50, 60.00, 60.00, 100)
    else
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func004C() ) then
        call ForGroupBJ(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'h01O'), function Trig_set_wave_unit_spawn_Func003Func010Func004Func001A)
        call EnableTrigger(gg_trg_Storm_effect)
        call AddWeatherEffectSaveLast(gg_rct_all, 'RAhr')
        call EnableWeatherEffect(GetLastCreatedWeatherEffect(), true)
        call SetTerrainFogExBJ(0, 1000, 3500.00, 0.50, 0.00, 50.00, 50.00)
    else
    endif
    if ( Trig_set_wave_unit_spawn_Func003Func010Func005C() ) then
        call AddWeatherEffectSaveLast(gg_rct_all, 'WOcw')
        call EnableWeatherEffect(GetLastCreatedWeatherEffect(), true)
        call SetTerrainFogExBJ(0, 1000, 3500.00, 0.50, 100.00, 0.00, 0.00)
        call EnableTrigger(gg_trg_Armageddon_effect)
        call EnableTrigger(gg_trg_Armageddon_effect_2)
        call SetDayNightModels("", "")
        set udg_k=1
        loop
            exitwhen udg_k > 8
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 512.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        set udg_k=1
        loop
            exitwhen udg_k > 9
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 768.00, ( 40.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        set udg_k=1
        loop
            exitwhen udg_k > 10
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 1024.00, ( 36.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        set udg_k=1
        loop
            exitwhen udg_k > 12
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 1512.00, ( 30.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        set udg_k=1
        loop
            exitwhen udg_k > 18
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 2048.00, ( 20.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        set udg_k=1
        loop
            exitwhen udg_k > 24
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 3072.00, ( 15.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        set udg_k=1
        loop
            exitwhen udg_k > 36
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 4096.00, ( 10.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
            set udg_k=udg_k + 1
        endloop
        call CreateDestructableLoc('B008', GetRectCenter(gg_rct_centreCENTRE), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', GetRectCenter(gg_rct_upright), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', GetRectCenter(gg_rct_downright), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', GetRectCenter(gg_rct_downleft), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', GetRectCenter(gg_rct_upleft), GetRandomDirectionDeg(), 2.00, 0)
    else
    endif
endfunction

function Trig_set_wave_unit_spawn_Func003C takes nothing returns boolean
    if ( not Trig_set_wave_unit_spawn_Func003Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_set_wave_unit_spawn_Actions takes nothing returns nothing
    call TriggerSleepAction(0.30)
    if ( Trig_set_wave_unit_spawn_Func003C() ) then
        call ForForce(udg_players_group, function Trig_set_wave_unit_spawn_Func003Func010A)
    else
        if ( Trig_set_wave_unit_spawn_Func003Func002C() ) then
            call EnableTrigger(gg_trg_hunter_time)
            call ForForce(udg_players_group, function Trig_set_wave_unit_spawn_Func003Func002Func002A)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func003C() ) then
            call TriggerExecute(gg_trg_wave_friends_on)
            call TriggerExecute(gg_trg_zombie_ini_start)
            call ForForce(udg_players_group, function Trig_set_wave_unit_spawn_Func003Func003Func003A)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func004C() ) then
            call TriggerExecute(gg_trg_gold_ini_start)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func005C() ) then
            call TriggerExecute(gg_trg_horse_ini_start)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func006C() ) then
            call TriggerExecute(gg_trg_miners_ini_start)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func007C() ) then
            call TriggerExecute(gg_trg_hide_ini)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func008C() ) then
            call TriggerExecute(gg_trg_banshi_ini)
        else
        endif
        if ( Trig_set_wave_unit_spawn_Func003Func009C() ) then
            call TriggerExecute(gg_trg_parody_ini_start)
        else
        endif
    endif
endfunction

//===========================================================================
function InitTrig_set_wave_unit_spawn takes nothing returns nothing
    set gg_trg_set_wave_unit_spawn=CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_set_wave_unit_spawn, udg_wave_timer)
    call TriggerAddAction(gg_trg_set_wave_unit_spawn, function Trig_set_wave_unit_spawn_Actions)
endfunction

//===========================================================================
// Trigger: wave units
//===========================================================================
function Trig_wave_units_Func002C takes nothing returns boolean
    if ( not ( IsPlayerInForce(GetOwningPlayer(GetEnteringUnit()), udg_players_group) == true ) ) then
        return false
    endif
    if ( not ( IsUnitInGroup(GetEnteringUnit(), udg_wave_units) == false ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'h00G' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'nzom' ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_units_Conditions takes nothing returns boolean
    if ( not Trig_wave_units_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_units_Actions takes nothing returns nothing
    call GroupAddUnitSimple(GetEnteringUnit(), udg_wave_units)
endfunction

//===========================================================================
function InitTrig_wave_units takes nothing returns nothing
    set gg_trg_wave_units=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_wave_units, gg_rct_waveunitsCENTRE)
    call TriggerRegisterEnterRectSimple(gg_trg_wave_units, gg_rct_waveunitsRIGHT)
    call TriggerRegisterEnterRectSimple(gg_trg_wave_units, gg_rct_waveunitsLEFT)
    call TriggerRegisterEnterRectSimple(gg_trg_wave_units, gg_rct_waveunitsDOWN)
    call TriggerRegisterEnterRectSimple(gg_trg_wave_units, gg_rct_waveunitsUP)
    call TriggerRegisterEnterRectSimple(gg_trg_wave_units, gg_rct_fastarena)
    call TriggerAddCondition(gg_trg_wave_units, Condition(function Trig_wave_units_Conditions))
    call TriggerAddAction(gg_trg_wave_units, function Trig_wave_units_Actions)
endfunction

//===========================================================================
// Trigger: wave waiting timer
//===========================================================================
function Trig_wave_waiting_timer_Func002C takes nothing returns boolean
    if ( not ( udg_wave < udg_gg ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_waiting_timer_Actions takes nothing returns nothing
    set udg_wave_winner=false
    if ( Trig_wave_waiting_timer_Func002C() ) then
        call TriggerExecute(gg_trg_wave_notification)
        call StartTimerBJ(udg_wave_timer, false, I2R(udg_gameset_time))
        call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "TRIGSTR_1136")
        call TimerDialogDisplayBJ(true, GetLastCreatedTimerDialogBJ())
        call TimerDialogSetTimeColorBJ(GetLastCreatedTimerDialogBJ(), 100, 0.00, 0.00, 0)
        call TimerDialogSetTitleColorBJ(GetLastCreatedTimerDialogBJ(), 100, 100.00, 100.00, 0)
    else
        call TriggerSleepAction(0.10)
        call TriggerExecute(gg_trg_game_end)
    endif
endfunction

//===========================================================================
function InitTrig_wave_waiting_timer takes nothing returns nothing
    set gg_trg_wave_waiting_timer=CreateTrigger()
    call TriggerAddAction(gg_trg_wave_waiting_timer, function Trig_wave_waiting_timer_Actions)
endfunction

//===========================================================================
// Trigger: wave notification
//===========================================================================
function Trig_wave_notification_Func002Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func002Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func002Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_466")
    else
    endif
endfunction

function Trig_wave_notification_Func002C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[0] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func003Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func003Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func003Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_465")
    else
    endif
endfunction

function Trig_wave_notification_Func003C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[1] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func004Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func004Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func004Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_486")
    else
    endif
endfunction

function Trig_wave_notification_Func004C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[2] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func005Func003Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func005Func003A takes nothing returns nothing
    if ( Trig_wave_notification_Func005Func003Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(( udg_gameset_time + 40 )), "TRIGSTR_3207")
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(( udg_gameset_time + 40 )), "TRIGSTR_3208")
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(( udg_gameset_time + 40 )), "TRIGSTR_3209")
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(( udg_gameset_time + 40 )), "TRIGSTR_3210")
    else
    endif
endfunction

function Trig_wave_notification_Func005C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[3] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func006Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func006Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func006Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_533")
    else
    endif
endfunction

function Trig_wave_notification_Func006C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[4] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func007Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func007Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func007Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_534")
    else
    endif
endfunction

function Trig_wave_notification_Func007C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[5] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func008Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func008Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func008Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_1070")
    else
    endif
endfunction

function Trig_wave_notification_Func008C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[6] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func009Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func009Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func009Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_1378")
    else
    endif
endfunction

function Trig_wave_notification_Func009C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[7] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func010Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Func010Func001A takes nothing returns nothing
    if ( Trig_wave_notification_Func010Func001Func001C() ) then
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), I2R(udg_gameset_time), "TRIGSTR_3748")
    else
    endif
endfunction

function Trig_wave_notification_Func010C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[8] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_notification_Actions takes nothing returns nothing
    call TriggerSleepAction(5.00)
    if ( Trig_wave_notification_Func002C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func002Func001A)
    else
    endif
    if ( Trig_wave_notification_Func003C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func003Func001A)
    else
    endif
    if ( Trig_wave_notification_Func004C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func004Func001A)
    else
    endif
    if ( Trig_wave_notification_Func005C() ) then
        call TriggerSleepAction(3.00)
        call PlaySoundBJ(gg_snd_ClanInvitation)
        call ForForce(udg_players_group, function Trig_wave_notification_Func005Func003A)
    else
    endif
    if ( Trig_wave_notification_Func006C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func006Func001A)
    else
    endif
    if ( Trig_wave_notification_Func007C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func007Func001A)
    else
    endif
    if ( Trig_wave_notification_Func008C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func008Func001A)
    else
    endif
    if ( Trig_wave_notification_Func009C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func009Func001A)
    else
    endif
    if ( Trig_wave_notification_Func010C() ) then
        call ForForce(udg_players_group, function Trig_wave_notification_Func010Func001A)
    else
    endif
endfunction

//===========================================================================
function InitTrig_wave_notification takes nothing returns nothing
    set gg_trg_wave_notification=CreateTrigger()
    call TriggerAddAction(gg_trg_wave_notification, function Trig_wave_notification_Actions)
endfunction

//===========================================================================
// Trigger: wave end timer
//===========================================================================
function Trig_wave_end_timer_Conditions takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func003C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[2] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func004Func001A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func004C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[5] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func005C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[3] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func007C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[0] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func008Func001A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func008Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func008Func005Func001Func001Func002001001002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_end_timer_Func008Func005Func001Func001C takes nothing returns boolean
    if ( not ( GetEnumPlayer() != udg_hide_hunter ) ) then
        return false
    endif
    if ( not ( CountUnitsInGroup(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_wave_end_timer_Func008Func005Func001Func001Func002001001002))) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func008Func005Func001C takes nothing returns boolean
    if ( not Trig_wave_end_timer_Func008Func005Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func008Func005A takes nothing returns nothing
    if ( Trig_wave_end_timer_Func008Func005Func001C() ) then
        call AdjustPlayerStateBJ(( 150 + ( 20 * udg_wave ) ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Победа в hide&seek: |cFFFFCD00" + I2S(( 150 + ( 20 * udg_wave ) )) ))
        call AdjustPlayerStateBJ(R2I(( 0.50 * I2R(udg_wave) )), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
        call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Победа в hide&seek: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ))
    else
    endif
endfunction

function Trig_wave_end_timer_Func008C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[6] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func009Func005A takes nothing returns nothing
    call DisplayTextToForce(GetPlayersAll(), ( "Победил " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + "|r" ) ) ))
    call AdjustPlayerStateBJ(( 200 + ( 30 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мине-игре: |cFFFFCD00" + I2S(( 200 + ( 30 * udg_wave ) )) ))
    call AdjustPlayerStateBJ(R2I(( 0.50 * I2R(udg_wave) )), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мини-игре: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ))
endfunction

function Trig_wave_end_timer_Func009Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func009C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[7] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func010Func004A takes nothing returns nothing
    call DisplayTextToForce(GetPlayersAll(), ( "Победил " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + "|r" ) ) ))
    call AdjustPlayerStateBJ(( 200 + ( 40 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мине-игре: |cFFFFCD00" + I2S(( 200 + ( 40 * udg_wave ) )) ))
    call AdjustPlayerStateBJ(R2I(( 0.50 * I2R(udg_wave) )), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мини-игре: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ))
endfunction

function Trig_wave_end_timer_Func010Func005A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func010C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func011Func001Func001Func005Func001003001002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_end_timer_Func011Func001Func001Func005C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == CountUnitsInGroup(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_wave_end_timer_Func011Func001Func001Func005Func001003001002))) ) ) then
        return false
    endif
    if ( not ( udg_wave_winner == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func011Func001Func001C takes nothing returns boolean
    if ( not Trig_wave_end_timer_Func011Func001Func001Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func011Func001A takes nothing returns nothing
    if ( Trig_wave_end_timer_Func011Func001Func001C() ) then
        call DisplayTextToForce(GetPlayersAll(), ( "На арене победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + ( udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] + "|r" ) ) ))
        set udg_wave_winner=true
        set udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())] + 50 )
        call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
    else
    endif
endfunction

function Trig_wave_end_timer_Func011Func002Func001A takes nothing returns nothing
    call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, false, GetEnumPlayer())
    call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
endfunction

function Trig_wave_end_timer_Func011Func002Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func011Func002Func008Func001C takes nothing returns boolean
    if ( not ( udg_info[udg_r] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func011Func002Func009001002001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_wave_end_timer_Func011Func002Func009001002002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_SAPPER) == true )
endfunction

function Trig_wave_end_timer_Func011Func002Func009001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_wave_end_timer_Func011Func002Func009001002001(), Trig_wave_end_timer_Func011Func002Func009001002002())
endfunction

function Trig_wave_end_timer_Func011Func002Func009A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_timer_Func011Func002C takes nothing returns boolean
    if ( not ( udg_wave_winner == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func011Func003C takes nothing returns boolean
    if ( not ( udg_wave != udg_wave_mini[0] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[1] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[2] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[3] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[4] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[5] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[6] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[7] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[8] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[9] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[10] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[11] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[12] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[13] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Func011C takes nothing returns boolean
    if ( not Trig_wave_end_timer_Func011Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_timer_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_wave_end_attack)
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    if ( Trig_wave_end_timer_Func003C() ) then
        call TriggerExecute(gg_trg_zombie_ini_finish)
    else
    endif
    if ( Trig_wave_end_timer_Func004C() ) then
        call ForGroupBJ(GetUnitsOfTypeIdAll('ngsp'), function Trig_wave_end_timer_Func004Func001A)
        call GroupClear(udg_wave_units)
    else
    endif
    if ( Trig_wave_end_timer_Func005C() ) then
        call TriggerExecute(gg_trg_gold_result)
        call DisableTrigger(gg_trg_gold_bet)
    else
    endif
    if ( Trig_wave_end_timer_Func007C() ) then
        call DisableTrigger(gg_trg_hunter_time)
        set udg_k=0
        call EnableTrigger(gg_trg_hunter_end)
        set bj_forLoopBIndex=1
        set bj_forLoopBIndexEnd=8
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call CreateNUnitsAtLoc(1, 'h00T', Player(11), PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 4584.00, ( 45.00 * I2R(GetForLoopIndexB()) )), bj_UNIT_FACING)
            call SetUnitMoveSpeed(GetLastCreatedUnit(), 522.00)
            call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 10.00, 10.00, 10.00, 0.00)
            call CreateNUnitsAtLoc(1, 'nhea', Player(11), PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 4584.00, ( 45.00 * I2R(GetForLoopIndexB()) )), bj_UNIT_FACING)
            call SetUnitMoveSpeed(GetLastCreatedUnit(), 522.00)
            call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 10.00, 10.00, 10.00, 0.00)
            set bj_forLoopBIndex=bj_forLoopBIndex + 1
        endloop
    else
    endif
    if ( Trig_wave_end_timer_Func008C() ) then
        call ForGroupBJ(GetUnitsOfTypeIdAll('h00Z'), function Trig_wave_end_timer_Func008Func001A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('h00Y'), function Trig_wave_end_timer_Func008Func002A)
        call GroupClear(udg_wave_units)
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, "TRIGSTR_1056")
        call ForForce(udg_players_group, function Trig_wave_end_timer_Func008Func005A)
    else
    endif
    if ( Trig_wave_end_timer_Func009C() ) then
        call DisableTrigger(gg_trg_banshi_end)
        call DisableTrigger(gg_trg_banshi_attack)
        call DisableTrigger(gg_trg_banshi_spawn)
        call ForGroupBJ(udg_wave_units, function Trig_wave_end_timer_Func009Func005A)
        call ForGroupBJ(GetUnitsInRectAll(gg_rct_hideandseekall), function Trig_wave_end_timer_Func009Func006A)
        call GroupClear(udg_wave_units)
    else
    endif
    if ( Trig_wave_end_timer_Func010C() ) then
        call DisableTrigger(gg_trg_parodys_cast)
        call DisableTrigger(gg_trg_parodys_set_cast)
        call ForGroupBJ(udg_wave_units, function Trig_wave_end_timer_Func010Func004A)
        call ForGroupBJ(GetUnitsInRectAll(gg_rct________________082), function Trig_wave_end_timer_Func010Func005A)
        call GroupClear(udg_wave_units)
    else
    endif
    if ( Trig_wave_end_timer_Func011C() ) then
        call ForForce(udg_players_group, function Trig_wave_end_timer_Func011Func001A)
        if ( Trig_wave_end_timer_Func011Func002C() ) then
            call ForForce(udg_players_group, function Trig_wave_end_timer_Func011Func002Func001A)
            set udg_fastarena_time=R2I(( 0.41 * I2R(udg_wave_time) ))
            call TriggerExecute(gg_trg_wave_rotation)
            call DisableTrigger(gg_trg_inc_per_second)
            call EnableTrigger(gg_trg_wave_fast_arena_end)
            set udg_r=1
            loop
                exitwhen udg_r > 8
                if ( Trig_wave_end_timer_Func011Func002Func008Func001C() ) then
                    call DisplayTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), "TRIGSTR_2653")
                    call DisplayTimedTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), 25.00, ( "У вас есть |cFF00FF00" + ( I2S(udg_fastarena_time) + "|r сек." ) ))
                    call DisplayTimedTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), 25.00, "TRIGSTR_2654")
                else
                endif
                set udg_r=udg_r + 1
            endloop
            call ForGroupBJ(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_end_timer_Func011Func002Func009001002)), function Trig_wave_end_timer_Func011Func002Func009A)
            call DisableTrigger(gg_trg_wave_castle_destr)
        else
            call ForGroupBJ(udg_wave_units, function Trig_wave_end_timer_Func011Func002Func002A)
            call GroupClear(udg_wave_units)
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_wave_end_timer takes nothing returns nothing
    set gg_trg_wave_end_timer=CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_wave_end_timer, udg_wave_end_timer)
    call TriggerAddCondition(gg_trg_wave_end_timer, Condition(function Trig_wave_end_timer_Conditions))
    call TriggerAddAction(gg_trg_wave_end_timer, function Trig_wave_end_timer_Actions)
endfunction

//===========================================================================
// Trigger: wave rotation
//===========================================================================
function Trig_wave_rotation_Func002A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_fastarena), 0)
endfunction

function Trig_wave_rotation_Func003Func001001 takes nothing returns boolean
    return ( udg_cycle_i == 1 )
endfunction

function Trig_wave_rotation_Func003Func002001 takes nothing returns boolean
    return ( udg_cycle_i == 2 )
endfunction

function Trig_wave_rotation_Func003Func003001 takes nothing returns boolean
    return ( udg_cycle_i == 3 )
endfunction

function Trig_wave_rotation_Func003Func004001 takes nothing returns boolean
    return ( udg_cycle_i == 4 )
endfunction

function Trig_wave_rotation_Func003Func006001002001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_wave_rotation_Func003Func006001002002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_rotation_Func003Func006001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_wave_rotation_Func003Func006001002001(), Trig_wave_rotation_Func003Func006001002002())
endfunction

function Trig_wave_rotation_Func003Func006A takes nothing returns nothing
    call GroupAddUnitSimple(GetEnumUnit(), udg_fastarena_group[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))])
endfunction

function Trig_wave_rotation_Func003Func007A takes nothing returns nothing
    set udg_fastarena_value[GetConvertedPlayerId(GetEnumPlayer())]=CountUnitsInGroup(udg_fastarena_group[GetConvertedPlayerId(GetEnumPlayer())])
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func002Func001A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func002Func003C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func002Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func002Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func002Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func002C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010Func003A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), GetRectCenter(udg_FFF))
endfunction

function Trig_wave_rotation_Func003Func010Func005C takes nothing returns boolean
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_value[udg_rotation_value] >= udg_fastarena_value[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func010C takes nothing returns boolean
    if ( not Trig_wave_rotation_Func003Func010Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_rotation_Func003Func011A takes nothing returns nothing
    set udg_fastarena_hp_start[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=udg_dmg_player_inflicted[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]
    call ForceAddPlayerSimple(GetOwningPlayer(GetEnumUnit()), udg_fastarena_players)
endfunction

function Trig_wave_rotation_Func005001002001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_wave_rotation_Func005001002002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_rotation_Func005001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_wave_rotation_Func005001002001(), Trig_wave_rotation_Func005001002002())
endfunction

function Trig_wave_rotation_Func005A takes nothing returns nothing
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_wave_units)
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_rotation_Func006001002001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_wave_rotation_Func006001002002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_rotation_Func006001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_wave_rotation_Func006001002001(), Trig_wave_rotation_Func006001002002())
endfunction

function Trig_wave_rotation_Func006A takes nothing returns nothing
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_wave_units)
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_rotation_Func007001002001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_wave_rotation_Func007001002002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_rotation_Func007001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_wave_rotation_Func007001002001(), Trig_wave_rotation_Func007001002002())
endfunction

function Trig_wave_rotation_Func007A takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnumUnit(), "attack", GetRectCenter(gg_rct_fastarena))
endfunction

function Trig_wave_rotation_Actions takes nothing returns nothing
    call ForceClear(udg_fastarena_players)
    call ForForce(udg_players_group, function Trig_wave_rotation_Func002A)
    set udg_cycle_i=1
    loop
        exitwhen udg_cycle_i > 4
        if ( Trig_wave_rotation_Func003Func001001() ) then
            set udg_FFF=gg_rct_fastarenaSPAWN1
        else
            call DoNothing()
        endif
        if ( Trig_wave_rotation_Func003Func002001() ) then
            set udg_FFF=gg_rct_fastarenaSPAWN2
        else
            call DoNothing()
        endif
        if ( Trig_wave_rotation_Func003Func003001() ) then
            set udg_FFF=gg_rct_fastarenaSPAWN3
        else
            call DoNothing()
        endif
        if ( Trig_wave_rotation_Func003Func004001() ) then
            set udg_FFF=gg_rct_fastarenaSPAWN4
        else
            call DoNothing()
        endif
        set udg_cycle_j=1
        loop
            exitwhen udg_cycle_j > 8
            call GroupClear(udg_fastarena_group[udg_cycle_j])
            set udg_fastarena_value[udg_cycle_j]=0
            set udg_cycle_j=udg_cycle_j + 1
        endloop
        call ForGroupBJ(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_rotation_Func003Func006001002)), function Trig_wave_rotation_Func003Func006A)
        call ForForce(udg_players_group, function Trig_wave_rotation_Func003Func007A)
        // у кого больше
        set udg_rotation_value=1
        if ( Trig_wave_rotation_Func003Func010C() ) then
            call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func003A)
            call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
        else
            set udg_rotation_value=2
            if ( Trig_wave_rotation_Func003Func010Func002C() ) then
                call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func003A)
                call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
            else
                set udg_rotation_value=3
                if ( Trig_wave_rotation_Func003Func010Func002Func002C() ) then
                    call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func002Func003A)
                    call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
                else
                    set udg_rotation_value=4
                    if ( Trig_wave_rotation_Func003Func010Func002Func002Func002C() ) then
                        call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func002Func002Func003A)
                        call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
                    else
                        set udg_rotation_value=5
                        if ( Trig_wave_rotation_Func003Func010Func002Func002Func002Func002C() ) then
                            call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func003A)
                            call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
                        else
                            set udg_rotation_value=6
                            if ( Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002C() ) then
                                call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func003A)
                                call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
                            else
                                set udg_rotation_value=7
                                if ( Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002C() ) then
                                    call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func003A)
                                    call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
                                else
                                    set udg_rotation_value=8
                                    if ( Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func002C() ) then
                                        call ForGroupBJ(udg_fastarena_group[udg_rotation_value], function Trig_wave_rotation_Func003Func010Func002Func002Func002Func002Func002Func002Func002Func001A)
                                        call PanCameraToTimedLocForPlayer(ConvertedPlayer(udg_rotation_value), GetRectCenter(udg_FFF), 0)
                                    else
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        call ForGroupBJ(GetRandomSubGroup(1, GetUnitsInRectAll(udg_FFF)), function Trig_wave_rotation_Func003Func011A)
        call TriggerSleepAction(0.10)
        set udg_cycle_i=udg_cycle_i + 1
    endloop
    call TriggerSleepAction(0.10)
    call ForGroupBJ(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_rotation_Func005001002)), function Trig_wave_rotation_Func005A)
    call ForGroupBJ(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_rotation_Func006001002)), function Trig_wave_rotation_Func006A)
    call ForGroupBJ(GetUnitsInRectMatching(gg_rct_fastarena, Condition(function Trig_wave_rotation_Func007001002)), function Trig_wave_rotation_Func007A)
endfunction

//===========================================================================
function InitTrig_wave_rotation takes nothing returns nothing
    set gg_trg_wave_rotation=CreateTrigger()
    call TriggerAddAction(gg_trg_wave_rotation, function Trig_wave_rotation_Actions)
endfunction

//===========================================================================
// Trigger: wave fast arena end
//===========================================================================
function Trig_wave_fast_arena_end_Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLifePercent(GetEnumUnit()) > 10.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func001A takes nothing returns nothing
    if ( Trig_wave_fast_arena_end_Func001Func001C() ) then
        call SetUnitLifePercentBJ(GetEnumUnit(), ( GetUnitLifePercent(GetEnumUnit()) - 4.00 ))
    else
    endif
endfunction

function Trig_wave_fast_arena_end_Func003Func003C takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003Func004C takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003Func005C takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func001A takes nothing returns nothing
    set udg_fastarena_hp[GetConvertedPlayerId(GetEnumPlayer())]=( udg_dmg_player_inflicted[GetConvertedPlayerId(GetEnumPlayer())] - udg_fastarena_hp_start[GetConvertedPlayerId(GetEnumPlayer())] )
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func002Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[udg_r] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func002Func001Func004C takes nothing returns boolean
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func002Func001C takes nothing returns boolean
    if ( not Trig_wave_fast_arena_end_Func003Func006Func002Func001Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func003A takes nothing returns nothing
    set udg_fastarena_hp[GetConvertedPlayerId(GetEnumPlayer())]=0.00
    set udg_fastarena_hp_start[GetConvertedPlayerId(GetEnumPlayer())]=0.00
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func004A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_fast_arena_end_Func003Func006Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_fast_arena_end_Func003Func006C takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Func003C takes nothing returns boolean
    if ( not ( udg_fastarena_time == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_fast_arena_end_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsInRectAll(gg_rct_fastarenaFIRE), function Trig_wave_fast_arena_end_Func001A)
    set udg_fastarena_time=( udg_fastarena_time - 1 )
    if ( Trig_wave_fast_arena_end_Func003C() ) then
        set udg_fastarena_time=- 1
        call DisableTrigger(GetTriggeringTrigger())
        if ( Trig_wave_fast_arena_end_Func003Func003C() ) then
            call PlaySoundBJ(gg_snd_BattleNetTick)
            call TriggerSleepAction(1.00)
        else
        endif
        if ( Trig_wave_fast_arena_end_Func003Func004C() ) then
            call PlaySoundBJ(gg_snd_BattleNetTick)
            call TriggerSleepAction(1.00)
        else
        endif
        if ( Trig_wave_fast_arena_end_Func003Func005C() ) then
            call PlaySoundBJ(gg_snd_BattleNetTick)
            call TriggerSleepAction(1.00)
        else
        endif
        if ( Trig_wave_fast_arena_end_Func003Func006C() ) then
            call ForForce(udg_fastarena_players, function Trig_wave_fast_arena_end_Func003Func006Func001A)
            set udg_cycle_i=1
            loop
                exitwhen udg_cycle_i > 8
                if ( Trig_wave_fast_arena_end_Func003Func006Func002Func001C() ) then
                    set udg_r=1
                    loop
                        exitwhen udg_r > 8
                        if ( Trig_wave_fast_arena_end_Func003Func006Func002Func001Func001Func001C() ) then
                            call DisplayTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), ( ( "Нанеся " + ( I2S(R2I(udg_fastarena_hp[GetConvertedPlayerId(ConvertedPlayer(udg_cycle_i))])) + " ед. урона на арене победил игрок " ) ) + ( udg_players_colour[GetConvertedPlayerId(ConvertedPlayer(udg_cycle_i))] + ( udg_players_name[GetConvertedPlayerId(ConvertedPlayer(udg_cycle_i))] + "|r" ) ) ))
                        else
                        endif
                        set udg_r=udg_r + 1
                    endloop
                    set udg_scoreboard_win[udg_cycle_i]=( udg_scoreboard_win[udg_cycle_i] + 50 )
                    call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( udg_cycle_i + 1 ), I2S(udg_scoreboard_win[udg_cycle_i]))
                else
                endif
                set udg_cycle_i=udg_cycle_i + 1
            endloop
            call ForForce(udg_players_group, function Trig_wave_fast_arena_end_Func003Func006Func003A)
            call ForGroupBJ(udg_wave_units, function Trig_wave_fast_arena_end_Func003Func006Func004A)
            call GroupClear(udg_wave_units)
            call ForGroupBJ(udg_castle_unit, function Trig_wave_fast_arena_end_Func003Func006Func006A)
            call GroupClear(udg_castle_unit)
            set udg_wave_winner=true
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_wave_fast_arena_end takes nothing returns nothing
    set gg_trg_wave_fast_arena_end=CreateTrigger()
    call DisableTrigger(gg_trg_wave_fast_arena_end)
    call TriggerRegisterTimerEventPeriodic(gg_trg_wave_fast_arena_end, 1.00)
    call TriggerAddAction(gg_trg_wave_fast_arena_end, function Trig_wave_fast_arena_end_Actions)
endfunction

//===========================================================================
// Trigger: wave friends on
//===========================================================================
function Trig_wave_friends_on_Actions takes nothing returns nothing
    set udg_i=1
    loop
        exitwhen udg_i > 7
        set udg_j=( udg_i + 1 )
        loop
            exitwhen udg_j > 8
            call SetPlayerAllianceBJ(ConvertedPlayer(udg_i), ALLIANCE_PASSIVE, true, ConvertedPlayer(udg_j))
            call SetPlayerAllianceBJ(ConvertedPlayer(udg_j), ALLIANCE_PASSIVE, true, ConvertedPlayer(udg_i))
            set udg_j=udg_j + 1
        endloop
        set udg_i=udg_i + 1
    endloop
endfunction

//===========================================================================
function InitTrig_wave_friends_on takes nothing returns nothing
    set gg_trg_wave_friends_on=CreateTrigger()
    call TriggerAddAction(gg_trg_wave_friends_on, function Trig_wave_friends_on_Actions)
endfunction

//===========================================================================
// Trigger: wave friends off
//===========================================================================
function Trig_wave_friends_off_Actions takes nothing returns nothing
    set udg_i=1
    loop
        exitwhen udg_i > 7
        set udg_j=( udg_i + 1 )
        loop
            exitwhen udg_j > 8
            call SetPlayerAllianceBJ(ConvertedPlayer(udg_i), ALLIANCE_PASSIVE, false, ConvertedPlayer(udg_j))
            call SetPlayerAllianceBJ(ConvertedPlayer(udg_j), ALLIANCE_PASSIVE, false, ConvertedPlayer(udg_i))
            set udg_j=udg_j + 1
        endloop
        set udg_i=udg_i + 1
    endloop
endfunction

//===========================================================================
function InitTrig_wave_friends_off takes nothing returns nothing
    set gg_trg_wave_friends_off=CreateTrigger()
    call TriggerAddAction(gg_trg_wave_friends_off, function Trig_wave_friends_off_Actions)
endfunction

//===========================================================================
// Trigger: wave end attack
//===========================================================================
function Trig_wave_end_attack_Func001Func001A takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnumUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
endfunction

function Trig_wave_end_attack_Actions takes nothing returns nothing
    set bj_forLoopBIndex=1
    set bj_forLoopBIndexEnd=10
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        call ForGroupBJ(GetRandomSubGroup(3, GetUnitsOfPlayerAll(Player(11))), function Trig_wave_end_attack_Func001Func001A)
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_wave_end_attack takes nothing returns nothing
    set gg_trg_wave_end_attack=CreateTrigger()
    call DisableTrigger(gg_trg_wave_end_attack)
    call TriggerRegisterTimerEventPeriodic(gg_trg_wave_end_attack, 5.00)
    call TriggerAddAction(gg_trg_wave_end_attack, function Trig_wave_end_attack_Actions)
endfunction

//===========================================================================
// Trigger: wave end
//===========================================================================
function Trig_wave_end_Func001Func001Func001Func001003001002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_end_Func001Func001Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == CountUnitsInGroup(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_wave_end_Func001Func001Func001Func001003001002))) ) ) then
        return false
    endif
    if ( not ( CountUnitsInGroup(udg_wave_units) != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func001A takes nothing returns nothing
    set udg_fastarena_hp[GetConvertedPlayerId(GetEnumPlayer())]=( udg_dmg_player_inflicted[GetConvertedPlayerId(GetEnumPlayer())] - udg_fastarena_hp_start[GetConvertedPlayerId(GetEnumPlayer())] )
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func002Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[udg_r] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func002Func001Func004C takes nothing returns boolean
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[1] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[2] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[3] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[4] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[5] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[6] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[7] ) ) then
        return false
    endif
    if ( not ( udg_fastarena_hp[udg_cycle_i] >= udg_fastarena_hp[8] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func002Func001C takes nothing returns boolean
    if ( not Trig_wave_end_Func001Func001Func002Func001Func002Func001Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func007A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func009A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func001Func001Func002Func001Func011A takes nothing returns nothing
    set udg_fastarena_hp[GetConvertedPlayerId(GetEnumPlayer())]=0.00
    set udg_fastarena_hp_start[GetConvertedPlayerId(GetEnumPlayer())]=0.00
endfunction

function Trig_wave_end_Func001Func001Func002Func001C takes nothing returns boolean
    if ( not ( udg_fastarena_time != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002Func002Func002C takes nothing returns boolean
    if ( not ( udg_wave != udg_wave_mini[0] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[1] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[2] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[3] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[4] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[5] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[6] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[7] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[8] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[9] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[10] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[11] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[12] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[13] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002Func002C takes nothing returns boolean
    if ( not ( udg_wave_winner == false ) ) then
        return false
    endif
    if ( not Trig_wave_end_Func001Func001Func002Func002Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001Func002C takes nothing returns boolean
    if ( not Trig_wave_end_Func001Func001Func002Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001Func001C takes nothing returns boolean
    if ( not Trig_wave_end_Func001Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func001A takes nothing returns nothing
    if ( Trig_wave_end_Func001Func001C() ) then
        if ( Trig_wave_end_Func001Func001Func002C() ) then
            if ( Trig_wave_end_Func001Func001Func002Func001C() ) then
                call ForForce(udg_fastarena_players, function Trig_wave_end_Func001Func001Func002Func001Func001A)
                set udg_cycle_i=1
                loop
                    exitwhen udg_cycle_i > 8
                    if ( Trig_wave_end_Func001Func001Func002Func001Func002Func001C() ) then
                        set udg_r=1
                        loop
                            exitwhen udg_r > 8
                            if ( Trig_wave_end_Func001Func001Func002Func001Func002Func001Func001Func001C() ) then
                                call DisplayTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), ( ( "Нанеся " + ( I2S(R2I(udg_fastarena_hp[GetConvertedPlayerId(ConvertedPlayer(udg_cycle_i))])) + " ед. урона на арене победил игрок " ) ) + ( udg_players_colour[GetConvertedPlayerId(ConvertedPlayer(udg_cycle_i))] + ( udg_players_name[GetConvertedPlayerId(ConvertedPlayer(udg_cycle_i))] + "|r" ) ) ))
                            else
                            endif
                            set udg_r=udg_r + 1
                        endloop
                        set udg_scoreboard_win[udg_cycle_i]=( udg_scoreboard_win[udg_cycle_i] + 50 )
                        call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( udg_cycle_i + 1 ), I2S(udg_scoreboard_win[udg_cycle_i]))
                    else
                    endif
                    set udg_cycle_i=udg_cycle_i + 1
                endloop
                call ForGroupBJ(udg_wave_units, function Trig_wave_end_Func001Func001Func002Func001Func007A)
                call GroupClear(udg_wave_units)
                call ForGroupBJ(udg_castle_unit, function Trig_wave_end_Func001Func001Func002Func001Func009A)
                call GroupClear(udg_castle_unit)
                call ForForce(udg_players_group, function Trig_wave_end_Func001Func001Func002Func001Func011A)
                set udg_wave_winner=true
            else
                call DisplayTextToForce(GetPlayersAll(), ( "На арене победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + ( udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] + "|r" ) ) ))
                set udg_wave_winner=true
                set udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())] + 50 )
                call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
            endif
        else
        endif
    else
    endif
endfunction

function Trig_wave_end_Func002Func001C takes nothing returns boolean
    if ( not ( ModuloInteger(udg_wave, 3) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func002Func002C takes nothing returns boolean
    if ( not ( udg_wave == udg_wave_mini[0] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func002Func004A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func013A takes nothing returns nothing
    call SetUnitInvulnerable(GetEnumUnit(), false)
endfunction

function Trig_wave_end_Func002Func020001002001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_wave_end_Func002Func020001002002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_SAPPER) == true )
endfunction

function Trig_wave_end_Func002Func020001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_wave_end_Func002Func020001002001(), Trig_wave_end_Func002Func020001002002())
endfunction

function Trig_wave_end_Func002Func020A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func021Func001A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
    call PauseUnitBJ(false, GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func021Func002001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_wave_end_Func002Func021Func002A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func021C takes nothing returns boolean
    if ( not ( udg_building_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func002Func022A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func023A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func024A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func025A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func026A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func027A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func028A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func029A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func030A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func031A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func032A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func033A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func034A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func035A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func036A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_wave_end_Func002Func037A takes nothing returns nothing
    call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, GetEnumPlayer())
    call SetCameraBoundsToRectForPlayerBJ(GetEnumPlayer(), GetEntireMapRect())
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0.50)
    call AdjustPlayerStateBJ(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход золота: |cFFFFCD00" + I2S(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())]) ))
    call AdjustPlayerStateBJ(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход самоцветов: |cFFB23AEE" + I2S(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]) ))
    call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
endfunction

function Trig_wave_end_Func002Func040A takes nothing returns nothing
    call DestructableRestoreLife(GetEnumDestructable(), GetDestructableMaxLife(GetEnumDestructable()), false)
endfunction

function Trig_wave_end_Func002Func043Func002C takes nothing returns boolean
    if ( not ( udg_wave != udg_wave_mini[0] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[1] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[2] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[3] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[4] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[5] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[6] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[7] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[8] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[9] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[10] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[11] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[12] ) ) then
        return false
    endif
    if ( not ( udg_wave != udg_wave_mini[13] ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func002Func043C takes nothing returns boolean
    if ( not Trig_wave_end_Func002Func043Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Func002C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_end_Actions takes nothing returns nothing
    call ForForce(udg_players_group, function Trig_wave_end_Func001A)
    if ( Trig_wave_end_Func002C() ) then
        if ( Trig_wave_end_Func002Func001C() ) then
            call TriggerExecute(gg_trg_inc_upg)
        else
        endif
        if ( Trig_wave_end_Func002Func002C() ) then
            call DisableTrigger(gg_trg_hunter_time)
            call EnableTrigger(gg_trg_hunter_end)
        else
        endif
        call GroupClear(udg_wave_units)
        call ForGroupBJ(udg_castle_unit, function Trig_wave_end_Func002Func004A)
        call GroupClear(udg_castle_unit)
        call ForGroupBJ(GetUnitsOfPlayerAll(Player(11)), function Trig_wave_end_Func002Func006A)
        set udg_wave_status=false
        call DisableTrigger(gg_trg_inc_per_second)
        call DisableTrigger(gg_trg_wave_end_attack)
        call DisableTrigger(gg_trg_wave_castle_destr)
        call DisableTrigger(gg_trg_building_inf)
        call ForGroupBJ(udg_buildings, function Trig_wave_end_Func002Func013A)
        call DisableTrigger(GetTriggeringTrigger())
        set udg_wave_winner=false
        call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
        set udg_fastarena_time=0
        call DisableTrigger(gg_trg_wave_fast_arena_end)
        call PlaySoundBJ(gg_snd_QuestCompleted)
        call ForGroupBJ(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_end_Func002Func020001002)), function Trig_wave_end_Func002Func020A)
        if ( Trig_wave_end_Func002Func021C() ) then
            call ForGroupBJ(udg_buildings, function Trig_wave_end_Func002Func021Func001A)
            call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_wave_end_Func002Func021Func002001002)), function Trig_wave_end_Func002Func021Func002A)
        else
        endif
        call ForGroupBJ(udg_light[0], function Trig_wave_end_Func002Func022A)
        call ForGroupBJ(udg_light[1], function Trig_wave_end_Func002Func023A)
        call ForGroupBJ(udg_light[2], function Trig_wave_end_Func002Func024A)
        call ForGroupBJ(udg_light[3], function Trig_wave_end_Func002Func025A)
        call ForGroupBJ(udg_light[4], function Trig_wave_end_Func002Func026A)
        call ForGroupBJ(udg_light[5], function Trig_wave_end_Func002Func027A)
        call ForGroupBJ(udg_light[6], function Trig_wave_end_Func002Func028A)
        call ForGroupBJ(udg_light[7], function Trig_wave_end_Func002Func029A)
        call ForGroupBJ(udg_light[8], function Trig_wave_end_Func002Func030A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n006'), function Trig_wave_end_Func002Func031A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n003'), function Trig_wave_end_Func002Func032A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n004'), function Trig_wave_end_Func002Func033A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n005'), function Trig_wave_end_Func002Func034A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('h023'), function Trig_wave_end_Func002Func035A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('h024'), function Trig_wave_end_Func002Func036A)
        call ForForce(udg_players_group, function Trig_wave_end_Func002Func037A)
        call TriggerExecute(gg_trg_income_effects)
        call TriggerExecute(gg_trg_wave_waiting_timer)
        call EnumDestructablesInCircleBJ(5632.00, GetRectCenter(GetPlayableMapRect()), function Trig_wave_end_Func002Func040A)
        call TriggerSleepAction(0.10)
        call ConditionalTriggerExecute(gg_trg_Weather)
        if ( Trig_wave_end_Func002Func043C() ) then
            call TriggerExecute(gg_trg_wave_result_rotation)
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_wave_end takes nothing returns nothing
    set gg_trg_wave_end=CreateTrigger()
    call DisableTrigger(gg_trg_wave_end)
    call TriggerRegisterTimerEventPeriodic(gg_trg_wave_end, 0.50)
    call TriggerAddAction(gg_trg_wave_end, function Trig_wave_end_Actions)
endfunction

//===========================================================================
// Trigger: wave result rotation
//===========================================================================
function Trig_wave_result_rotation_Func006Func002Func001Func007C takes nothing returns boolean
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) != 0 ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[1] - udg_leader_kills[1] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[2] - udg_leader_kills[2] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[3] - udg_leader_kills[3] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[4] - udg_leader_kills[4] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[5] - udg_leader_kills[5] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[6] - udg_leader_kills[6] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[7] - udg_leader_kills[7] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_kills[udg_rotation_value] - udg_leader_kills[udg_rotation_value] ) >= ( udg_scoreboard_kills[8] - udg_leader_kills[8] ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func006Func002Func001C takes nothing returns boolean
    if ( not Trig_wave_result_rotation_Func006Func002Func001Func007C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func006Func002C takes nothing returns boolean
    if ( not ( udg_leader_bool == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func008Func002Func001Func003C takes nothing returns boolean
    if ( not ( udg_leader_player[0] != ConvertedPlayer(udg_rotation_value) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func008Func002Func001Func004C takes nothing returns boolean
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) != 0 ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[1] - udg_leader_point[1] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[2] - udg_leader_point[2] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[3] - udg_leader_point[3] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[4] - udg_leader_point[4] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[5] - udg_leader_point[5] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[6] - udg_leader_point[6] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[7] - udg_leader_point[7] ) ) ) then
        return false
    endif
    if ( not ( ( udg_scoreboard_win[udg_rotation_value] - udg_leader_point[udg_rotation_value] ) >= ( udg_scoreboard_win[8] - udg_leader_point[8] ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func008Func002Func001C takes nothing returns boolean
    if ( not Trig_wave_result_rotation_Func008Func002Func001Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func008Func002C takes nothing returns boolean
    if ( not ( udg_leader_bool == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func009C takes nothing returns boolean
    if ( not ( udg_leader_num == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_info[udg_r] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010Func001Func001Func002Func001C takes nothing returns boolean
    if ( not ( udg_info[udg_r] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010Func001Func001Func005C takes nothing returns boolean
    if ( not ( udg_leader_wins[GetConvertedPlayerId(GetEnumPlayer())] == 0 ) ) then
        return false
    endif
    if ( not ( udg_wave > 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010Func001Func001C takes nothing returns boolean
    if ( not Trig_wave_result_rotation_Func010Func001Func001Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010Func001Func002C takes nothing returns boolean
    if ( not ( udg_leader_owner[GetConvertedPlayerId(GetEnumPlayer())] == 0 ) ) then
        return false
    endif
    if ( not ( udg_leader_player[0] != GetEnumPlayer() ) ) then
        return false
    endif
    if ( not ( udg_leader_player[1] != GetEnumPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010Func001C takes nothing returns boolean
    if ( not Trig_wave_result_rotation_Func010Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_result_rotation_Func010A takes nothing returns nothing
    if ( Trig_wave_result_rotation_Func010Func001C() ) then
        if ( Trig_wave_result_rotation_Func010Func001Func001C() ) then
            set udg_r=1
            loop
                exitwhen udg_r > 8
                if ( Trig_wave_result_rotation_Func010Func001Func001Func002Func001C() ) then
                    call DisplayTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), ( "|cFFFF0000СЛАБЫЙ ИГРОК: |r" + ( ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] ) + "|r освобождается от штрафа, т.к. ни разу не был в списках лидеров." ) ))
                else
                endif
                set udg_r=udg_r + 1
            endloop
        else
            set udg_r=1
            loop
                exitwhen udg_r > 8
                if ( Trig_wave_result_rotation_Func010Func001Func001Func001Func001C() ) then
                    call DisplayTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_r)), ( "|cFFFF0000ШТРАФ: |r" + ( ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] ) + ( "|r лишается |cFFFF0000" + ( I2S(( 40 * udg_wave )) + "|r очков арены, т.к. не захватил ни одной точки или не разрушил ни одного замка." ) ) ) ))
                else
                endif
                set udg_r=udg_r + 1
            endloop
            set udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]=( udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())] - ( 40 * udg_wave ) )
            call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
        endif
    else
    endif
endfunction

function Trig_wave_result_rotation_Actions takes nothing returns nothing
    set udg_rotation_value=0
    set udg_leader_bool=false
    set udg_leader_num=0
    set udg_leader_player[0]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_leader_player[1]=Player(PLAYER_NEUTRAL_PASSIVE)
    set udg_r=1
    loop
        exitwhen udg_r > 8
        set udg_rotation_value=udg_r
        if ( Trig_wave_result_rotation_Func006Func002C() ) then
            if ( Trig_wave_result_rotation_Func006Func002Func001C() ) then
                set udg_leader_bool=true
                set udg_leader_player[0]=ConvertedPlayer(udg_rotation_value)
                set udg_leader_num=1
                set udg_leader_wins[udg_rotation_value]=( udg_leader_wins[udg_rotation_value] + 1 )
                call CreateNUnitsAtLoc(1, 'h023', ConvertedPlayer(udg_rotation_value), GetPlayerStartLocationLoc(ConvertedPlayer(udg_rotation_value)), bj_UNIT_FACING)
                call CreateNUnitsAtLoc(1, 'h024', ConvertedPlayer(udg_rotation_value), GetPlayerStartLocationLoc(ConvertedPlayer(udg_rotation_value)), bj_UNIT_FACING)
            else
            endif
        else
        endif
        set udg_r=udg_r + 1
    endloop
    set udg_leader_bool=false
    set udg_r=1
    loop
        exitwhen udg_r > 8
        set udg_rotation_value=udg_r
        if ( Trig_wave_result_rotation_Func008Func002C() ) then
            if ( Trig_wave_result_rotation_Func008Func002Func001C() ) then
                set udg_leader_bool=true
                set udg_leader_wins[udg_rotation_value]=( udg_leader_wins[udg_rotation_value] + 1 )
                if ( Trig_wave_result_rotation_Func008Func002Func001Func003C() ) then
                    set udg_leader_player[1]=ConvertedPlayer(udg_rotation_value)
                    set udg_leader_num=2
                    call CreateNUnitsAtLoc(1, 'h023', ConvertedPlayer(udg_rotation_value), GetPlayerStartLocationLoc(ConvertedPlayer(udg_rotation_value)), bj_UNIT_FACING)
                    call CreateNUnitsAtLoc(1, 'h024', ConvertedPlayer(udg_rotation_value), GetPlayerStartLocationLoc(ConvertedPlayer(udg_rotation_value)), bj_UNIT_FACING)
                else
                endif
            else
            endif
        else
        endif
        set udg_r=udg_r + 1
    endloop
    if ( Trig_wave_result_rotation_Func009C() ) then
        call MultiboardSetTitleText(udg_scoreboard, ( ( ( "Лидеры - " + ( ( udg_players_colour[GetConvertedPlayerId(udg_leader_player[0])] + udg_players_name[GetConvertedPlayerId(udg_leader_player[0])] ) + ( "|r и " + ( udg_players_colour[GetConvertedPlayerId(udg_leader_player[1])] + udg_players_name[GetConvertedPlayerId(udg_leader_player[1])] ) ) ) ) + "|r | Волна #|cFF00FFFF" ) + ( I2S(udg_wave) + "|r" ) ))
    else
        call MultiboardSetTitleText(udg_scoreboard, ( ( ( "Абсолютный лидер - " + ( udg_players_colour[GetConvertedPlayerId(udg_leader_player[0])] + udg_players_name[GetConvertedPlayerId(udg_leader_player[0])] ) ) + "|r | Волна #|cFF00FFFF" ) + ( I2S(udg_wave) + "|r" ) ))
    endif
    call ForForce(udg_players_group, function Trig_wave_result_rotation_Func010A)
endfunction

//===========================================================================
function InitTrig_wave_result_rotation takes nothing returns nothing
    set gg_trg_wave_result_rotation=CreateTrigger()
    call TriggerAddAction(gg_trg_wave_result_rotation, function Trig_wave_result_rotation_Actions)
endfunction

//===========================================================================
// Trigger: wave castle destr
//===========================================================================
function Trig_wave_castle_destr_Func018C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'h01O' ) ) then
        return true
    endif
    return false
endfunction

function Trig_wave_castle_destr_Conditions takes nothing returns boolean
    if ( not Trig_wave_castle_destr_Func018C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_castle_destr_Func003Func001C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_wave_castle_destr_Func003A takes nothing returns nothing
    if ( Trig_wave_castle_destr_Func003Func001C() ) then
        call DisplayTextToForce(GetForceOfPlayer(GetEnumPlayer()), ( "База игрока " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] + "|r была уничтожена! 10% его очков арены достаются убившему, а все юниты теряют 15% скорости боя и передвижения." ) ) ))
    else
    endif
endfunction

function Trig_wave_castle_destr_Func010001002 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_wave_castle_destr_Func010A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 70.00, 70.00, 70.00, 0)
endfunction

function Trig_wave_castle_destr_Actions takes nothing returns nothing
    set udg_point=0.00
    call PlaySoundBJ(gg_snd_Warning)
    call ForForce(udg_players_group, function Trig_wave_castle_destr_Func003A)
    call CreateNUnitsAtLoc(1, 'h00G', GetOwningPlayer(GetDyingUnit()), GetRectCenter(gg_rct_waveunitsCENTRE), bj_UNIT_FACING)
    call UnitAddAbilityBJ('A02G', GetLastCreatedUnit())
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_castle_unit)
    call CreateNUnitsAtLoc(1, 'h00G', GetOwningPlayer(GetDyingUnit()), GetRectCenter(gg_rct_fastarenaFIRE), bj_UNIT_FACING)
    call UnitAddAbilityBJ('A02G', GetLastCreatedUnit())
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_castle_unit)
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetOwningPlayer(GetDyingUnit()), Condition(function Trig_wave_castle_destr_Func010001002)), function Trig_wave_castle_destr_Func010A)
    set udg_point=( I2R(udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))]) * 0.10 )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]=( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))] + R2I(udg_point) )
    call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ())) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]))
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))]=( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] - R2I(udg_point) )
    call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit())) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))]))
    set udg_scoreboard_mini[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]=( udg_scoreboard_mini[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + 1 )
    call MultiboardSetItemValueBJ(udg_scoreboard, 6, ( GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ())) + 1 ), I2S(udg_scoreboard_mini[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]))
endfunction

//===========================================================================
function InitTrig_wave_castle_destr takes nothing returns nothing
    set gg_trg_wave_castle_destr=CreateTrigger()
    call DisableTrigger(gg_trg_wave_castle_destr)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_wave_castle_destr, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_wave_castle_destr, Condition(function Trig_wave_castle_destr_Conditions))
    call TriggerAddAction(gg_trg_wave_castle_destr, function Trig_wave_castle_destr_Actions)
endfunction

//===========================================================================
// Trigger: wave leader owner
//===========================================================================
function Trig_wave_leader_owner_Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'h01O' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'n003' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'n004' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'n005' ) ) then
        return true
    endif
    return false
endfunction

function Trig_wave_leader_owner_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) != GetOwningPlayer(GetKillingUnitBJ()) ) ) then
        return false
    endif
    if ( not Trig_wave_leader_owner_Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_leader_owner_Conditions takes nothing returns boolean
    if ( not Trig_wave_leader_owner_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_wave_leader_owner_Actions takes nothing returns nothing
    set udg_leader_owner[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]=( udg_leader_owner[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))] + 1 )
endfunction

//===========================================================================
function InitTrig_wave_leader_owner takes nothing returns nothing
    set gg_trg_wave_leader_owner=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_wave_leader_owner, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_wave_leader_owner, Condition(function Trig_wave_leader_owner_Conditions))
    call TriggerAddAction(gg_trg_wave_leader_owner, function Trig_wave_leader_owner_Actions)
endfunction

//===========================================================================
// Trigger: inc ini
//===========================================================================
function Trig_inc_ini_Func003A takes nothing returns nothing
    set udg_income_goldmine_c[GetConvertedPlayerId(GetEnumPlayer())]=3
    set udg_income_goldmine_l[GetConvertedPlayerId(GetEnumPlayer())]=1
endfunction

function Trig_inc_ini_Actions takes nothing returns nothing
    set udg_inc_pp[0]=2
    set udg_inc_pp[1]=1
    call ForForce(udg_players_group, function Trig_inc_ini_Func003A)
endfunction

//===========================================================================
function InitTrig_inc_ini takes nothing returns nothing
    set gg_trg_inc_ini=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_inc_ini, 1.00)
    call TriggerAddAction(gg_trg_inc_ini, function Trig_inc_ini_Actions)
endfunction

//===========================================================================
// Trigger: inc rotate
//===========================================================================
function Trig_inc_rotate_Func012Func002Func002Func001Func002C takes nothing returns boolean
    if ( not ( udg_inc_all[1] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[2] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[3] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[4] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[5] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[6] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[7] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[8] != udg_cycle_i ) ) then
        return false
    endif
    if ( not ( udg_inc_all[9] != udg_cycle_i ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func004C takes nothing returns boolean
    if ( not ( udg_cycle_i == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func005C takes nothing returns boolean
    if ( not ( udg_cycle_i == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func006C takes nothing returns boolean
    if ( not ( udg_cycle_i == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func007C takes nothing returns boolean
    if ( not ( udg_cycle_i == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func008C takes nothing returns boolean
    if ( not ( udg_cycle_i == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func009C takes nothing returns boolean
    if ( not ( udg_cycle_i == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func010C takes nothing returns boolean
    if ( not ( udg_cycle_i == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func011C takes nothing returns boolean
    if ( not ( udg_cycle_i == 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func012C takes nothing returns boolean
    if ( not ( udg_cycle_i == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func013A takes nothing returns nothing
    call ShowUnitShow(GetEnumUnit())
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001Func015C takes nothing returns boolean
    if ( not ( udg_random == GetForLoopIndexA() ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002Func001C takes nothing returns boolean
    if ( not Trig_inc_rotate_Func012Func002Func002Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Func012Func002Func002C takes nothing returns boolean
    if ( not ( udg_inc_status == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_rotate_Actions takes nothing returns nothing
    set udg_inc_status=false
    set udg_inc_all[1]=0
    set udg_inc_all[2]=0
    set udg_inc_all[3]=0
    set udg_inc_all[4]=0
    set udg_inc_all[5]=0
    set udg_inc_all[6]=0
    set udg_inc_all[7]=0
    set udg_inc_all[8]=0
    set udg_inc_all[9]=0
    set udg_random=GetRandomInt(udg_const_point[0], udg_const_point[1])
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=udg_random
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_inc_status=false
        set bj_forLoopBIndex=1
        set bj_forLoopBIndexEnd=( udg_random * 7 )
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            set udg_cycle_i=GetRandomInt(1, 9)
            if ( Trig_inc_rotate_Func012Func002Func002C() ) then
                if ( Trig_inc_rotate_Func012Func002Func002Func001C() ) then
                    set udg_inc_status=true
                    set udg_inc_all[GetForLoopIndexA()]=udg_cycle_i
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func004C() ) then
                        call CreateNUnitsAtLoc(1, 'n003', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func005C() ) then
                        call CreateNUnitsAtLoc(1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upright), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upright), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 225.00, 225.00, 225.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func006C() ) then
                        call CreateNUnitsAtLoc(1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downright), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downright), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 225.00, 225.00, 225.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func007C() ) then
                        call CreateNUnitsAtLoc(1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 225.00, 225.00, 225.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func008C() ) then
                        call CreateNUnitsAtLoc(1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upleft), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upleft), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 225.00, 225.00, 225.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func009C() ) then
                        call CreateNUnitsAtLoc(1, 'n005', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upmid), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_upmid), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 150.00, 15.00, 150.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func010C() ) then
                        call CreateNUnitsAtLoc(1, 'n005', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_rightmid), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_rightmid), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 150.00, 15.00, 150.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func011C() ) then
                        call CreateNUnitsAtLoc(1, 'n005', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downmid), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downmid), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 150.00, 15.00, 150.00)
                    else
                    endif
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func012C() ) then
                        call CreateNUnitsAtLoc(1, 'n005', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_leftmid), bj_UNIT_FACING)
                        call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_leftmid), bj_UNIT_FACING)
                        call SetUnitScalePercent(GetLastCreatedUnit(), 150.00, 15.00, 150.00)
                    else
                    endif
                    call ForGroupBJ(udg_light[( udg_cycle_i - 1 )], function Trig_inc_rotate_Func012Func002Func002Func001Func013A)
                    call PingMinimapLocForForceEx(GetPlayersAll(), GetUnitLoc(GetLastCreatedUnit()), 4.00, bj_MINIMAPPINGSTYLE_FLASHY, 0.00, 100.00, 0.00)
                    if ( Trig_inc_rotate_Func012Func002Func002Func001Func015C() ) then
                        set udg_inc_status=true
                    else
                    endif
                else
                endif
            else
            endif
            set bj_forLoopBIndex=bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    set udg_cycle_i=0
endfunction

//===========================================================================
function InitTrig_inc_rotate takes nothing returns nothing
    set gg_trg_inc_rotate=CreateTrigger()
    call TriggerAddAction(gg_trg_inc_rotate, function Trig_inc_rotate_Actions)
endfunction

//===========================================================================
// Trigger: inc per second
//
// inc_ps, scoreboard_win, icometemp, inc_pp[], income_goldmine_c, wave, inc_max[]
//===========================================================================
function Trig_inc_per_second_Func002001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n003' )
endfunction

function Trig_inc_per_second_Func002001002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) )
endfunction

function Trig_inc_per_second_Func002001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_inc_per_second_Func002001002001(), Trig_inc_per_second_Func002001002002())
endfunction

function Trig_inc_per_second_Func002A takes nothing returns nothing
    set udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[0] )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[0] )
    set udg_incometemp=( ( 1 - ( 0.10 * I2R(GetPlayerTechCountSimple('R02K', GetOwningPlayer(GetEnumUnit()))) ) ) * ( ( ( I2R(udg_wave) + 4.00 ) / 5.00 ) * I2R(udg_income_goldmine_c[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]) ) )
    call AdjustPlayerStateBJ(R2I(udg_incometemp), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call CreateTextTagLocBJ(( "|cFFFFCD00+" + I2S(R2I(udg_incometemp)) ), GetUnitLoc(GetEnumUnit()), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(udg_inc_pp[0]) ), PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
endfunction

function Trig_inc_per_second_Func003001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n004' )
endfunction

function Trig_inc_per_second_Func003001002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) )
endfunction

function Trig_inc_per_second_Func003001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_inc_per_second_Func003001002001(), Trig_inc_per_second_Func003001002002())
endfunction

function Trig_inc_per_second_Func003A takes nothing returns nothing
    set udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_incometemp=( ( 1 - ( 0.10 * I2R(GetPlayerTechCountSimple('R02K', GetOwningPlayer(GetEnumUnit()))) ) ) * ( ( ( I2R(udg_wave) + 4.00 ) / 5.00 ) * I2R(udg_income_goldmine_l[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]) ) )
    call AdjustPlayerStateBJ(R2I(udg_incometemp), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call CreateTextTagLocBJ(( "|cFFFFCD00+" + I2S(R2I(udg_incometemp)) ), GetUnitLoc(GetEnumUnit()), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(udg_inc_pp[1]) ), PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
endfunction

function Trig_inc_per_second_Func004001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n005' )
endfunction

function Trig_inc_per_second_Func004001002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) )
endfunction

function Trig_inc_per_second_Func004001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_inc_per_second_Func004001002001(), Trig_inc_per_second_Func004001002002())
endfunction

function Trig_inc_per_second_Func004A takes nothing returns nothing
    set udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_incometemp=( ( 1 - ( 0.10 * I2R(GetPlayerTechCountSimple('R02K', GetOwningPlayer(GetEnumUnit()))) ) ) * ( ( ( I2R(udg_wave) + 4.00 ) / 5.00 ) * I2R(udg_income_goldmine_l[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]) ) )
    call AdjustPlayerStateBJ(R2I(udg_incometemp), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call CreateTextTagLocBJ(( "|cFFFFCD00+" + I2S(R2I(udg_incometemp)) ), GetUnitLoc(GetEnumUnit()), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(udg_inc_pp[1]) ), PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
endfunction

function Trig_inc_per_second_Func006Func001C takes nothing returns boolean
    if ( not ( udg_inc_ps[GetConvertedPlayerId(GetEnumPlayer())] != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func006Func005C takes nothing returns boolean
    if ( not ( udg_inc_max[0] < udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func006A takes nothing returns nothing
    if ( Trig_inc_per_second_Func006Func001C() ) then
        call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), ( I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]) + ( " (|cFF00FF00" + ( I2S(udg_inc_ps[GetConvertedPlayerId(GetEnumPlayer())]) + "|r)" ) ) ))
    else
        call MultiboardSetItemValueBJ(udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]))
    endif
    set udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())]=CountUnitsInGroup(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'n003'))
    set udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())]=( udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] + CountLivingPlayerUnitsOfTypeId('n004', GetEnumPlayer()) )
    set udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())]=( udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] + CountLivingPlayerUnitsOfTypeId('n005', GetEnumPlayer()) )
    if ( Trig_inc_per_second_Func006Func005C() ) then
        set udg_inc_max[0]=udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())]
    else
    endif
    set udg_inc_ps[GetConvertedPlayerId(GetEnumPlayer())]=0
endfunction

function Trig_inc_per_second_Func007Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLifePercent(GetEnumUnit()) > 20.00 ) ) then
        return false
    endif
    if ( not ( udg_inc_max[0] > udg_inc_max[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func007Func001C takes nothing returns boolean
    if ( not Trig_inc_per_second_Func007Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func007A takes nothing returns nothing
    if ( Trig_inc_per_second_Func007Func001C() ) then
        call SetUnitLifePercentBJ(GetEnumUnit(), ( GetUnitLifePercent(GetEnumUnit()) - 0.80 ))
    else
    endif
endfunction

function Trig_inc_per_second_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_inc_per_second_Func002001002)), function Trig_inc_per_second_Func002A)
    call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_inc_per_second_Func003001002)), function Trig_inc_per_second_Func003A)
    call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_inc_per_second_Func004001002)), function Trig_inc_per_second_Func004A)
    set udg_inc_max[0]=0
    call ForForce(udg_players_group, function Trig_inc_per_second_Func006A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h01O'), function Trig_inc_per_second_Func007A)
endfunction

//===========================================================================
function InitTrig_inc_per_second takes nothing returns nothing
    set gg_trg_inc_per_second=CreateTrigger()
    call DisableTrigger(gg_trg_inc_per_second)
    call TriggerRegisterTimerEventPeriodic(gg_trg_inc_per_second, 1.00)
    call TriggerAddAction(gg_trg_inc_per_second, function Trig_inc_per_second_Actions)
endfunction

//===========================================================================
// Trigger: inc colour
//===========================================================================
function Trig_inc_colour_Func004C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'n003' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'n004' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetDyingUnit()) == 'n005' ) ) then
        return true
    endif
    return false
endfunction

function Trig_inc_colour_Conditions takes nothing returns boolean
    if ( not Trig_inc_colour_Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_leftmid, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_downmid, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_rightmid, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_upmid, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_upleft, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_downleft, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_downright, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_upright, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func002C takes nothing returns boolean
    if ( not ( RectContainsUnit(gg_rct_centreCENTRE, GetDyingUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100, 100.00, 100.00, 0)
endfunction

function Trig_inc_colour_Func003Func004001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n006' )
endfunction

function Trig_inc_colour_Func003Func004A takes nothing returns nothing
    call SetUnitColor(GetEnumUnit(), PLAYER_COLOR_MAROON)
endfunction

function Trig_inc_colour_Func003Func005Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100, 0.00, 0.00, 0)
endfunction

function Trig_inc_colour_Func003Func005C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func006Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 0.00, 40.00, 100.00, 0)
endfunction

function Trig_inc_colour_Func003Func006C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func007Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 0.00, 100.00, 100.00, 0)
endfunction

function Trig_inc_colour_Func003Func007C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func008Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 40.00, 0.00, 100.00, 0)
endfunction

function Trig_inc_colour_Func003Func008C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func009Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 0.00, 0)
endfunction

function Trig_inc_colour_Func003Func009C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func010Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 60.00, 0.00, 0)
endfunction

function Trig_inc_colour_Func003Func010C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func011Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 0.00, 100.00, 0.00, 0)
endfunction

function Trig_inc_colour_Func003Func011C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func012Func001A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 0.00, 80.00, 0)
endfunction

function Trig_inc_colour_Func003Func012C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Func003Func015001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n006' )
endfunction

function Trig_inc_colour_Func003Func015A takes nothing returns nothing
    call SetUnitColor(GetEnumUnit(), GetPlayerColor(GetOwningPlayer(GetKillingUnitBJ())))
endfunction

function Trig_inc_colour_Func003C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) != GetOwningPlayer(GetKillingUnitBJ()) ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_colour_Actions takes nothing returns nothing
    call MoveRectToLoc(gg_rct_inc, GetUnitLoc(GetDyingUnit()))
    if ( Trig_inc_colour_Func002C() ) then
        set udg_goldmine_colour=0
    else
        if ( Trig_inc_colour_Func002Func001C() ) then
            set udg_goldmine_colour=1
        else
            if ( Trig_inc_colour_Func002Func001Func001C() ) then
                set udg_goldmine_colour=2
            else
                if ( Trig_inc_colour_Func002Func001Func001Func001C() ) then
                    set udg_goldmine_colour=3
                else
                    if ( Trig_inc_colour_Func002Func001Func001Func001Func001C() ) then
                        set udg_goldmine_colour=4
                    else
                        if ( Trig_inc_colour_Func002Func001Func001Func001Func001Func001C() ) then
                            set udg_goldmine_colour=5
                        else
                            if ( Trig_inc_colour_Func002Func001Func001Func001Func001Func001Func001C() ) then
                                set udg_goldmine_colour=6
                            else
                                if ( Trig_inc_colour_Func002Func001Func001Func001Func001Func001Func001Func001C() ) then
                                    set udg_goldmine_colour=7
                                else
                                    if ( Trig_inc_colour_Func002Func001Func001Func001Func001Func001Func001Func001Func001C() ) then
                                        set udg_goldmine_colour=8
                                    else
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if ( Trig_inc_colour_Func003C() ) then
        if ( Trig_inc_colour_Func003Func005C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func005Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func006C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func006Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func007C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func007Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func008C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func008Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func009C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func009Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func010C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func010Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func011C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func011Func001A)
        else
        endif
        if ( Trig_inc_colour_Func003Func012C() ) then
            call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func012Func001A)
        else
        endif
        call CreateNUnitsAtLoc(1, GetUnitTypeId(GetDyingUnit()), GetOwningPlayer(GetKillingUnitBJ()), GetRectCenter(gg_rct_inc), bj_UNIT_FACING)
        call RemoveUnit(GetDyingUnit())
        call ForGroupBJ(GetUnitsInRangeOfLocMatching(128.00, GetUnitLoc(GetLastCreatedUnit()), Condition(function Trig_inc_colour_Func003Func015001003)), function Trig_inc_colour_Func003Func015A)
    else
        call ForGroupBJ(udg_light[udg_goldmine_colour], function Trig_inc_colour_Func003Func001A)
        call CreateNUnitsAtLoc(1, GetUnitTypeId(GetDyingUnit()), Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_inc), bj_UNIT_FACING)
        call RemoveUnit(GetDyingUnit())
        call ForGroupBJ(GetUnitsInRangeOfLocMatching(128.00, GetUnitLoc(GetLastCreatedUnit()), Condition(function Trig_inc_colour_Func003Func004001003)), function Trig_inc_colour_Func003Func004A)
    endif
endfunction

//===========================================================================
function InitTrig_inc_colour takes nothing returns nothing
    set gg_trg_inc_colour=CreateTrigger()
    call DisableTrigger(gg_trg_inc_colour)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_inc_colour, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_inc_colour, Condition(function Trig_inc_colour_Conditions))
    call TriggerAddAction(gg_trg_inc_colour, function Trig_inc_colour_Actions)
endfunction

//===========================================================================
// Trigger: inc upg
//===========================================================================
function Trig_inc_upg_Actions takes nothing returns nothing
    set udg_inc_pp[0]=( udg_inc_pp[0] + 2 )
    set udg_inc_pp[1]=( udg_inc_pp[1] + 1 )
endfunction

//===========================================================================
function InitTrig_inc_upg takes nothing returns nothing
    set gg_trg_inc_upg=CreateTrigger()
    call TriggerAddAction(gg_trg_inc_upg, function Trig_inc_upg_Actions)
endfunction

//===========================================================================
// Trigger: income effects
//===========================================================================
function Trig_income_effects_Func004Func005C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(udg_ticket_players[GetForLoopIndexB()])] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( 3 * GetForLoopIndexB() ) ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R00H', GetEnumPlayer()) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006Func001Func001Func003C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006Func001Func001C takes nothing returns boolean
    if ( not Trig_income_effects_Func006Func001Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006A takes nothing returns nothing
    set bj_forLoopBIndex=1
    set bj_forLoopBIndexEnd=20
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        if ( Trig_income_effects_Func006Func001Func001C() ) then
            call AdjustPlayerStateBJ(( 3 * GetPlayerTechCountSimple('R00H', GetEnumPlayer()) ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
            if ( Trig_income_effects_Func006Func001Func001Func003C() ) then
                call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход от драгоценных камней: |cFFB23AEE" + I2S(( 3 * GetPlayerTechCountSimple('R00H', GetEnumPlayer()) )) ))
            else
            endif
        else
        endif
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
endfunction

function Trig_income_effects_Func008Func001Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p)) > 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerSlotState(ConvertedPlayer(udg_p)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func004Func001C takes nothing returns boolean
    if ( not ( udg_pillage_player == ConvertedPlayer(udg_p) ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func010Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p)) == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func010C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p)) == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func013C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(ConvertedPlayer(udg_p))] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func014C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(udg_pillage_player)] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001C takes nothing returns boolean
    if ( not Trig_income_effects_Func008Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Actions takes nothing returns nothing
    // 2
    set udg_ticket_resources=0
    set bj_forLoopBIndex=1
    set bj_forLoopBIndexEnd=8
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_ticket_resources=( udg_ticket_resources + ( GetPlayerState(ConvertedPlayer(GetForLoopIndexB()), PLAYER_STATE_RESOURCE_GOLD) + ( GetPlayerState(ConvertedPlayer(GetForLoopIndexB()), PLAYER_STATE_RESOURCE_LUMBER) * 10 ) ) )
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex=1
    set bj_forLoopBIndexEnd=5
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_ticket_gold=( ( I2R(udg_ticket_resources) * 0.90 ) * ( 0.06 - ( 0.01 * I2R(GetForLoopIndexB()) ) ) )
        set udg_ticket_lumber=( ( I2R(udg_ticket_resources) * 0.01 ) * ( 0.06 - ( 0.01 * I2R(GetForLoopIndexB()) ) ) )
        call AdjustPlayerStateBJ(R2I(udg_ticket_gold), udg_ticket_players[GetForLoopIndexB()], PLAYER_STATE_RESOURCE_GOLD)
        call AdjustPlayerStateBJ(R2I(udg_ticket_lumber), udg_ticket_players[GetForLoopIndexB()], PLAYER_STATE_RESOURCE_LUMBER)
        if ( Trig_income_effects_Func004Func005C() ) then
            call DisplayTimedTextToForce(GetForceOfPlayer(udg_ticket_players[GetForLoopIndexB()]), 10.00, ( "Доход от билетов: |cFFFFCD00" + I2S(R2I(udg_ticket_gold)) ))
            call DisplayTimedTextToForce(GetForceOfPlayer(udg_ticket_players[GetForLoopIndexB()]), 10.00, ( "Доход от билетов: |cFFB23AEE" + I2S(R2I(udg_ticket_lumber)) ))
        else
        endif
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
    // 3
    call ForForce(udg_players_group, function Trig_income_effects_Func006A)
    // 5
    set udg_p=1
    loop
        exitwhen udg_p > 8
        if ( Trig_income_effects_Func008Func001C() ) then
            set udg_pillage_player=ConvertedPlayer(udg_p)
            set udg_pillage_resources=0
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=10
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                if ( Trig_income_effects_Func008Func001Func004Func001C() ) then
                    set udg_pillage_player=ForcePickRandomPlayer(udg_players_group)
                else
                endif
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
            set udg_pillage_resources=( udg_pillage_resources + ( GetPlayerState(udg_pillage_player, PLAYER_STATE_RESOURCE_GOLD) + ( GetPlayerState(udg_pillage_player, PLAYER_STATE_RESOURCE_LUMBER) * 10 ) ) )
            set udg_pillage_gold=( ( I2R(udg_pillage_resources) * 0.90 ) * ( 0.04 + ( 0.01 * I2R(GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p))) ) ) )
            set udg_pillage_lumber=( ( I2R(udg_pillage_resources) * 0.01 ) * ( 0.04 + ( 0.01 * I2R(GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p))) ) ) )
            call AdjustPlayerStateBJ(( - 1 * R2I(udg_pillage_gold) ), udg_pillage_player, PLAYER_STATE_RESOURCE_GOLD)
            call AdjustPlayerStateBJ(( - 1 * R2I(udg_pillage_lumber) ), udg_pillage_player, PLAYER_STATE_RESOURCE_LUMBER)
            if ( Trig_income_effects_Func008Func001Func010C() ) then
                set udg_pillage_lumber=( udg_pillage_lumber + 1.00 )
            else
                if ( Trig_income_effects_Func008Func001Func010Func001C() ) then
                    set udg_pillage_lumber=( udg_pillage_lumber + 2.00 )
                else
                endif
            endif
            call AdjustPlayerStateBJ(R2I(udg_pillage_gold), ConvertedPlayer(udg_p), PLAYER_STATE_RESOURCE_GOLD)
            call AdjustPlayerStateBJ(R2I(udg_pillage_lumber), ConvertedPlayer(udg_p), PLAYER_STATE_RESOURCE_LUMBER)
            if ( Trig_income_effects_Func008Func001Func013C() ) then
                call DisplayTimedTextToForce(GetForceOfPlayer(ConvertedPlayer(udg_p)), 10.00, ( "Вы украли |cFFFFCD00" + ( I2S(R2I(udg_pillage_gold)) + ( "|r ед. золота и |cFFB23AEE" + ( I2S(R2I(udg_pillage_lumber)) + ( "|r ед. самоцветов у игрока " + ( udg_players_colour[GetConvertedPlayerId(udg_pillage_player)] + udg_players_name[GetConvertedPlayerId(udg_pillage_player)] ) ) ) ) ) ))
            else
            endif
            if ( Trig_income_effects_Func008Func001Func014C() ) then
                call DisplayTimedTextToForce(GetForceOfPlayer(udg_pillage_player), 10.00, ( "Вас ограбил игрок " + ( udg_players_colour[GetConvertedPlayerId(ConvertedPlayer(udg_p))] + udg_players_name[GetConvertedPlayerId(ConvertedPlayer(udg_p))] ) ))
            else
            endif
        else
        endif
        set udg_p=udg_p + 1
    endloop
endfunction

//===========================================================================
function InitTrig_income_effects takes nothing returns nothing
    set gg_trg_income_effects=CreateTrigger()
    call TriggerAddAction(gg_trg_income_effects, function Trig_income_effects_Actions)
endfunction

//===========================================================================
// Trigger: Weather
//===========================================================================
function Trig_Weather_Func007A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())]=0
    call CreateNUnitsAtLoc(1, 'h029', GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), bj_UNIT_FACING)
endfunction

function Trig_Weather_Func008A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Weather_Func010Func001C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetEnumDestructable()) == 'B008' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Weather_Func010A takes nothing returns nothing
    if ( Trig_Weather_Func010Func001C() ) then
        call RemoveDestructable(GetEnumDestructable())
    else
    endif
endfunction

function Trig_Weather_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Storm_effect)
    call DisableTrigger(gg_trg_Armageddon_effect)
    call DisableTrigger(gg_trg_Armageddon_effect_2)
    call ResetTerrainFogBJ()
    call EnableWeatherEffect(GetLastCreatedWeatherEffect(), false)
    call RemoveWeatherEffectBJ(GetLastCreatedWeatherEffect())
    call ForForce(udg_players_group, function Trig_Weather_Func007A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('ninf'), function Trig_Weather_Func008A)
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call EnumDestructablesInRectAll(GetPlayableMapRect(), function Trig_Weather_Func010A)
endfunction

//===========================================================================
function InitTrig_Weather takes nothing returns nothing
    set gg_trg_Weather=CreateTrigger()
    call TriggerAddAction(gg_trg_Weather, function Trig_Weather_Actions)
endfunction

//===========================================================================
// Trigger: Blizzard
//===========================================================================
function Trig_Blizzard_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R02L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blizzard_Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Blizzard_Func003A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())]=0
endfunction

function Trig_Blizzard_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfTypeIdAll('h029'), function Trig_Blizzard_Func002A)
    call ForForce(udg_players_group, function Trig_Blizzard_Func003A)
    set udg_weather[GetConvertedPlayerId(GetTriggerPlayer())]=1
endfunction

//===========================================================================
function InitTrig_Blizzard takes nothing returns nothing
    set gg_trg_Blizzard=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Blizzard, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_Blizzard, Condition(function Trig_Blizzard_Conditions))
    call TriggerAddAction(gg_trg_Blizzard, function Trig_Blizzard_Actions)
endfunction

//===========================================================================
// Trigger: Storm
//===========================================================================
function Trig_Storm_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R02M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Storm_Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Storm_Func003A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())]=0
endfunction

function Trig_Storm_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfTypeIdAll('h029'), function Trig_Storm_Func002A)
    call ForForce(udg_players_group, function Trig_Storm_Func003A)
    set udg_weather[GetConvertedPlayerId(GetTriggerPlayer())]=2
endfunction

//===========================================================================
function InitTrig_Storm takes nothing returns nothing
    set gg_trg_Storm=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Storm, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_Storm, Condition(function Trig_Storm_Conditions))
    call TriggerAddAction(gg_trg_Storm, function Trig_Storm_Actions)
endfunction

//===========================================================================
// Trigger: Storm effect
//===========================================================================
function Trig_Storm_effect_Func006001002001 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_Storm_effect_Func006001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Storm_effect_Func006001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Storm_effect_Func006001002001(), Trig_Storm_effect_Func006001002002())
endfunction

function Trig_Storm_effect_Func006A takes nothing returns nothing
    call UnitDamageTargetBJ(GroupPickRandomUnit(GetRandomSubGroup(1, GetUnitsInRectAll(gg_rct_all))), GetEnumUnit(), 500, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
endfunction

function Trig_Storm_effect_Actions takes nothing returns nothing
    call MoveRectToLoc(gg_rct_stormeff, GetRandomLocInRect(gg_rct_all))
    call AddSpecialEffectLocBJ(GetRectCenter(gg_rct_stormeff), "Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl")
    set udg_stormeff_eff=GetLastCreatedEffectBJ()
    call AddSpecialEffectLocBJ(GetRectCenter(gg_rct_stormeff), "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call ForGroupBJ(GetUnitsInRectMatching(gg_rct_stormeff, Condition(function Trig_Storm_effect_Func006001002)), function Trig_Storm_effect_Func006A)
    call TriggerSleepAction(0.35)
    call DestroyEffectBJ(udg_stormeff_eff)
endfunction

//===========================================================================
function InitTrig_Storm_effect takes nothing returns nothing
    set gg_trg_Storm_effect=CreateTrigger()
    call DisableTrigger(gg_trg_Storm_effect)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Storm_effect, 4.00)
    call TriggerAddAction(gg_trg_Storm_effect, function Trig_Storm_effect_Actions)
endfunction

//===========================================================================
// Trigger: Armageddon
//===========================================================================
function Trig_Armageddon_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R02N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Armageddon_Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Armageddon_Func003A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())]=0
endfunction

function Trig_Armageddon_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfTypeIdAll('h029'), function Trig_Armageddon_Func002A)
    call ForForce(udg_players_group, function Trig_Armageddon_Func003A)
    set udg_weather[GetConvertedPlayerId(GetTriggerPlayer())]=3
endfunction

//===========================================================================
function InitTrig_Armageddon takes nothing returns nothing
    set gg_trg_Armageddon=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Armageddon, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_Armageddon, Condition(function Trig_Armageddon_Conditions))
    call TriggerAddAction(gg_trg_Armageddon, function Trig_Armageddon_Actions)
endfunction

//===========================================================================
// Trigger: Armageddon effect
//===========================================================================
function Trig_Armageddon_effect_Func005Func001003001001002001 takes nothing returns boolean
    return ( IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), Player(PLAYER_NEUTRAL_AGGRESSIVE)) == true )
endfunction

function Trig_Armageddon_effect_Func005Func001003001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Armageddon_effect_Func005Func001003001001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armageddon_effect_Func005Func001003001001002001(), Trig_Armageddon_effect_Func005Func001003001001002002())
endfunction

function Trig_Armageddon_effect_Func005A takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnumUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_Armageddon_effect_Func005Func001003001001002)))))
endfunction

function Trig_Armageddon_effect_Actions takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'h00G', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(GetPlayableMapRect()), bj_UNIT_FACING)
    call UnitApplyTimedLifeBJ(5.00, 'BTLF', GetLastCreatedUnit())
    call UnitAddAbilityBJ('A03B', GetLastCreatedUnit())
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "dreadlordinferno", GetRandomLocInRect(gg_rct_all))
    call ForGroupBJ(GetUnitsOfTypeIdAll('ninf'), function Trig_Armageddon_effect_Func005A)
endfunction

//===========================================================================
function InitTrig_Armageddon_effect takes nothing returns nothing
    set gg_trg_Armageddon_effect=CreateTrigger()
    call DisableTrigger(gg_trg_Armageddon_effect)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Armageddon_effect, 10.00)
    call TriggerAddAction(gg_trg_Armageddon_effect, function Trig_Armageddon_effect_Actions)
endfunction

//===========================================================================
// Trigger: Armageddon effect 2
//===========================================================================
function Trig_Armageddon_effect_2_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'ninf' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Armageddon_effect_2_Func001003001001002001 takes nothing returns boolean
    return ( IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), Player(PLAYER_NEUTRAL_AGGRESSIVE)) == true )
endfunction

function Trig_Armageddon_effect_2_Func001003001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Armageddon_effect_2_Func001003001001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armageddon_effect_2_Func001003001001002001(), Trig_Armageddon_effect_2_Func001003001001002002())
endfunction

function Trig_Armageddon_effect_2_Actions takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnteringUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_Armageddon_effect_2_Func001003001001002)))))
endfunction

//===========================================================================
function InitTrig_Armageddon_effect_2 takes nothing returns nothing
    set gg_trg_Armageddon_effect_2=CreateTrigger()
    call DisableTrigger(gg_trg_Armageddon_effect_2)
    call TriggerRegisterEnterRectSimple(gg_trg_Armageddon_effect_2, gg_rct_all)
    call TriggerAddCondition(gg_trg_Armageddon_effect_2, Condition(function Trig_Armageddon_effect_2_Conditions))
    call TriggerAddAction(gg_trg_Armageddon_effect_2, function Trig_Armageddon_effect_2_Actions)
endfunction

//===========================================================================
// Trigger: faq
//
// 6 + 7 + 0.8 + 11 + 8 + 5 + 6 + 8
//===========================================================================
function Trig_faq_Func002A takes nothing returns nothing
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, GetEnumPlayer(), 0)
endfunction

function Trig_faq_Func019A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_centreCENTRE), 1.00)
endfunction

function Trig_faq_Func020A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func034A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func035A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func036A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func037A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_downleft), 1.00)
endfunction

function Trig_faq_Func038A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100, 100.00, 100.00, 0)
endfunction

function Trig_faq_Func048A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func049A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func050A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_start3), 1.00)
endfunction

function Trig_faq_Func059A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func061A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0)
    call SelectUnitForPlayerSingle(GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'ntav')), GetEnumPlayer())
endfunction

function Trig_faq_Actions takes nothing returns nothing
    call CinematicModeBJ(true, GetPlayersAll())
    call ForForce(udg_players_group, function Trig_faq_Func002A)
    call CreateNUnitsAtLoc(1, 'h01O', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075), bj_UNIT_FACING)
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2638")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2630", null, "TRIGSTR_2631", bj_TIMETYPE_ADD, 6.00, false)
    call TriggerSleepAction(6.00)
    call CreateNUnitsAtLoc(1, 'h01S', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075_____________________u), bj_UNIT_FACING)
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call CreateNUnitsAtLoc(1, 'h01T', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075______________________2), bj_UNIT_FACING)
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call CreateNUnitsAtLoc(1, 'h01V', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075______________________3), bj_UNIT_FACING)
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call CreateNUnitsAtLoc(1, 'h01W', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075______________________4), bj_UNIT_FACING)
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2639")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2645", null, "TRIGSTR_2633", bj_TIMETYPE_ADD, 7.00, false)
    call TriggerSleepAction(7.00)
    call ForForce(udg_players_group, function Trig_faq_Func019A)
    call ForGroupBJ(GetUnitsInRectAll(gg_rct________________075), function Trig_faq_Func020A)
    call TriggerSleepAction(0.80)
    call EnableTrigger(gg_trg_faq_death)
    call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
    call CreateNUnitsAtLoc(1, 'n003', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
    set udg_faq_unit[1]=GetLastCreatedUnit()
    call SetUnitLifePercentBJ(GetLastCreatedUnit(), 40.00)
    call CreateNUnitsAtLocFacingLocBJ(1, 'ebal', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreUP), GetUnitLoc(GetLastCreatedUnit()))
    set udg_faq_unit[0]=GetLastCreatedUnit()
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call IssuePointOrderLocBJ(udg_faq_unit[0], "attackground", GetRectCenter(gg_rct_centreCENTRE))
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2640")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2646", null, "TRIGSTR_2632", bj_TIMETYPE_ADD, 11.00, false)
    call TriggerSleepAction(11.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('n006'), function Trig_faq_Func034A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('n003'), function Trig_faq_Func035A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('ebal'), function Trig_faq_Func036A)
    call ForForce(udg_players_group, function Trig_faq_Func037A)
    call ForGroupBJ(udg_light[0], function Trig_faq_Func038A)
    call CreateNUnitsAtLoc(1, 'n006', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING)
    call SetUnitScalePercent(GetLastCreatedUnit(), 230.00, 230.00, 230.00)
    call CreateNUnitsAtLoc(1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2641")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2647", null, "TRIGSTR_2634", bj_TIMETYPE_ADD, 8.00, false)
    call TriggerSleepAction(8.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2642")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2648", null, "TRIGSTR_2635", bj_TIMETYPE_ADD, 5.00, false)
    call TriggerSleepAction(5.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('n006'), function Trig_faq_Func048A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('n004'), function Trig_faq_Func049A)
    call ForForce(udg_players_group, function Trig_faq_Func050A)
    call CreateNUnitsAtLoc(1, 'h01O', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_start3), bj_UNIT_FACING)
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2643")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2649", null, "TRIGSTR_2636", bj_TIMETYPE_ADD, 6.00, false)
    call TriggerSleepAction(6.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2644")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2650", null, "TRIGSTR_2637", bj_TIMETYPE_ADD, 8.00, false)
    call TriggerSleepAction(8.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h01O'), function Trig_faq_Func059A)
    call CinematicModeBJ(false, GetPlayersAll())
    call ForForce(udg_players_group, function Trig_faq_Func061A)
endfunction

//===========================================================================
function InitTrig_faq takes nothing returns nothing
    set gg_trg_faq=CreateTrigger()
    call TriggerAddAction(gg_trg_faq, function Trig_faq_Actions)
endfunction

//===========================================================================
// Trigger: faq death
//===========================================================================
function Trig_faq_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_death_Func001A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_death_Func003A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100, 0.00, 0.00, 0)
endfunction

function Trig_faq_death_Func007A takes nothing returns nothing
    call SetUnitColor(GetEnumUnit(), PLAYER_COLOR_RED)
endfunction

function Trig_faq_death_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfTypeIdAll('ebal'), function Trig_faq_death_Func001A)
    call DisableTrigger(GetTriggeringTrigger())
    call ForGroupBJ(udg_light[0], function Trig_faq_death_Func003A)
    call CreateNUnitsAtLoc(1, GetUnitTypeId(GetDyingUnit()), Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
    set udg_faq_unit[1]=GetLastCreatedUnit()
    call RemoveUnit(GetDyingUnit())
    call ForGroupBJ(GetUnitsOfTypeIdAll('n006'), function Trig_faq_death_Func007A)
    call CreateTextTagLocBJ(( "|cFFFFCD00+6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call TriggerSleepAction(0.60)
    call CreateTextTagLocBJ(( "|cFFFFCD00+6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call TriggerSleepAction(0.60)
    call CreateTextTagLocBJ(( "|cFFFFCD00+6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call TriggerSleepAction(0.60)
    call CreateTextTagLocBJ(( "|cFFFFCD00+6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call TriggerSleepAction(1.20)
    call CreateTextTagLocBJ(( "|cFFFFCD00+6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
    call CreateTextTagLocBJ(( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), - 64.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersAll())
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64, 90)
endfunction

//===========================================================================
function InitTrig_faq_death takes nothing returns nothing
    set gg_trg_faq_death=CreateTrigger()
    call DisableTrigger(gg_trg_faq_death)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_faq_death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_faq_death, Condition(function Trig_faq_death_Conditions))
    call TriggerAddAction(gg_trg_faq_death, function Trig_faq_death_Actions)
endfunction

//===========================================================================
// Trigger: building ini
//===========================================================================
function Trig_building_ini_Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'hbla' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'hwtw' ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_MECHANICAL) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnteringUnit()) != 'hhou' ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( IsUnitInGroup(GetEnteringUnit(), udg_buildings) == false ) ) then
        return false
    endif
    if ( not ( IsPlayerInForce(GetOwningPlayer(GetEnteringUnit()), udg_players_group) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_ini_Conditions takes nothing returns boolean
    if ( not Trig_building_ini_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_building_ini_Actions takes nothing returns nothing
    call ReplaceUnitBJ(GetEnteringUnit(), GetUnitTypeId(GetEnteringUnit()), bj_UNIT_STATE_METHOD_MAXIMUM)
    call GroupAddUnitSimple(GetLastReplacedUnitBJ(), udg_buildings)
endfunction

//===========================================================================
function InitTrig_building_ini takes nothing returns nothing
    set gg_trg_building_ini=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_building_ini, GetPlayableMapRect())
    call TriggerAddCondition(gg_trg_building_ini, Condition(function Trig_building_ini_Conditions))
    call TriggerAddAction(gg_trg_building_ini, function Trig_building_ini_Actions)
endfunction

//===========================================================================
// Trigger: building selling
//===========================================================================
function Trig_building_selling_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A002' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h002' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h004' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h005' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func005C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h007' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func007C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h008' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func008C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func009C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func010C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func011C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func012C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func013C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func014C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00J' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func015C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func016C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func017C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00P' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func018C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func019C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00R' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func020C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00U' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func021C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00V' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func022C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h00W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func023C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h012' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func024C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h013' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func025C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h014' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func026C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h016' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func027C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h017' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func028C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h018' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func029C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h019' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func030C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func031C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func032C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func033C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01D' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func034C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func035C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func036C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func037C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func038C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01J' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func039C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func040C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func041C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func042C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func043C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01P' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func044C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func045C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01R' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func046C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01S' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func047C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func048C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01V' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func049C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func050C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01X' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func051C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01Y' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func052C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h01Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func053C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h020' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func054C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h021' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func055C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h022' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func056C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h026' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func057C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h027' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func058C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h028' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func059C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func060C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func061C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func062C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02D' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func063C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func064C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func065C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'h02G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func068C takes nothing returns boolean
    if ( not ( udg_sold_gold > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Func069C takes nothing returns boolean
    if ( not ( udg_sold_wood > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_selling_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetSpellAbilityUnit(), udg_buildings)
    if ( Trig_building_selling_Func002C() ) then
        set udg_sold_wood=1
        set udg_sold_gold=75
    else
    endif
    if ( Trig_building_selling_Func003C() ) then
        set udg_sold_wood=1
        set udg_sold_gold=128
    else
    endif
    if ( Trig_building_selling_Func004C() ) then
        set udg_sold_wood=2
        set udg_sold_gold=243
    else
    endif
    if ( Trig_building_selling_Func005C() ) then
        set udg_sold_gold=113
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func006C() ) then
        set udg_sold_gold=170
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func007C() ) then
        set udg_sold_gold=338
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func008C() ) then
        set udg_sold_gold=145
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func009C() ) then
        set udg_sold_gold=210
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func010C() ) then
        set udg_sold_gold=266
        set udg_sold_wood=2
    else
    endif
    if ( Trig_building_selling_Func011C() ) then
        set udg_sold_gold=172
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func012C() ) then
        set udg_sold_gold=316
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func013C() ) then
        set udg_sold_gold=471
        set udg_sold_wood=13
    else
    endif
    if ( Trig_building_selling_Func014C() ) then
        set udg_sold_gold=148
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func015C() ) then
        set udg_sold_gold=195
        set udg_sold_wood=2
    else
    endif
    if ( Trig_building_selling_Func016C() ) then
        set udg_sold_gold=413
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func017C() ) then
        set udg_sold_gold=194
        set udg_sold_wood=2
    else
    endif
    if ( Trig_building_selling_Func018C() ) then
        set udg_sold_gold=348
        set udg_sold_wood=5
    else
    endif
    if ( Trig_building_selling_Func019C() ) then
        set udg_sold_gold=465
        set udg_sold_wood=9
    else
    endif
    if ( Trig_building_selling_Func020C() ) then
        set udg_sold_gold=138
        set udg_sold_wood=4
    else
    endif
    if ( Trig_building_selling_Func021C() ) then
        set udg_sold_gold=185
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func022C() ) then
        set udg_sold_gold=795
        set udg_sold_wood=12
    else
    endif
    if ( Trig_building_selling_Func023C() ) then
        set udg_sold_gold=123
        set udg_sold_wood=4
    else
    endif
    if ( Trig_building_selling_Func024C() ) then
        set udg_sold_gold=409
        set udg_sold_wood=9
    else
    endif
    if ( Trig_building_selling_Func025C() ) then
        set udg_sold_gold=973
        set udg_sold_wood=14
    else
    endif
    if ( Trig_building_selling_Func026C() ) then
        set udg_sold_gold=179
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func027C() ) then
        set udg_sold_gold=297
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func028C() ) then
        set udg_sold_gold=276
        set udg_sold_wood=2
    else
    endif
    if ( Trig_building_selling_Func029C() ) then
        set udg_sold_gold=783
        set udg_sold_wood=19
    else
    endif
    if ( Trig_building_selling_Func030C() ) then
        set udg_sold_gold=448
        set udg_sold_wood=10
    else
    endif
    if ( Trig_building_selling_Func031C() ) then
        set udg_sold_gold=391
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func032C() ) then
        set udg_sold_gold=548
        set udg_sold_wood=14
    else
    endif
    if ( Trig_building_selling_Func033C() ) then
        set udg_sold_gold=357
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func034C() ) then
        set udg_sold_gold=838
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func035C() ) then
        set udg_sold_gold=1080
        set udg_sold_wood=12
    else
    endif
    if ( Trig_building_selling_Func036C() ) then
        set udg_sold_gold=280
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func037C() ) then
        set udg_sold_gold=326
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func038C() ) then
        set udg_sold_gold=303
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func039C() ) then
        set udg_sold_gold=442
        set udg_sold_wood=15
    else
    endif
    if ( Trig_building_selling_Func040C() ) then
        set udg_sold_gold=560
        set udg_sold_wood=19
    else
    endif
    if ( Trig_building_selling_Func041C() ) then
        set udg_sold_gold=413
        set udg_sold_wood=14
    else
    endif
    if ( Trig_building_selling_Func042C() ) then
        set udg_sold_gold=410
        set udg_sold_wood=13
    else
    endif
    if ( Trig_building_selling_Func043C() ) then
        set udg_sold_gold=657
        set udg_sold_wood=22
    else
    endif
    if ( Trig_building_selling_Func044C() ) then
        set udg_sold_gold=716
        set udg_sold_wood=17
    else
    endif
    if ( Trig_building_selling_Func045C() ) then
        set udg_sold_gold=930
        set udg_sold_wood=23
    else
    endif
    if ( Trig_building_selling_Func046C() ) then
        set udg_sold_gold=304
        set udg_sold_wood=2
    else
    endif
    if ( Trig_building_selling_Func047C() ) then
        set udg_sold_gold=345
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func048C() ) then
        set udg_sold_gold=322
        set udg_sold_wood=3
    else
    endif
    if ( Trig_building_selling_Func049C() ) then
        set udg_sold_gold=601
        set udg_sold_wood=13
    else
    endif
    if ( Trig_building_selling_Func050C() ) then
        set udg_sold_gold=437
        set udg_sold_wood=9
    else
    endif
    if ( Trig_building_selling_Func051C() ) then
        set udg_sold_gold=618
        set udg_sold_wood=13
    else
    endif
    if ( Trig_building_selling_Func052C() ) then
        set udg_sold_gold=550
        set udg_sold_wood=11
    else
    endif
    if ( Trig_building_selling_Func053C() ) then
        set udg_sold_gold=564
        set udg_sold_wood=12
    else
    endif
    if ( Trig_building_selling_Func054C() ) then
        set udg_sold_gold=991
        set udg_sold_wood=9
    else
    endif
    if ( Trig_building_selling_Func055C() ) then
        set udg_sold_gold=1562
        set udg_sold_wood=15
    else
    endif
    if ( Trig_building_selling_Func056C() ) then
        set udg_sold_gold=240
    else
    endif
    if ( Trig_building_selling_Func057C() ) then
        set udg_sold_gold=357
        set udg_sold_wood=1
    else
    endif
    if ( Trig_building_selling_Func058C() ) then
        set udg_sold_gold=231
        set udg_sold_wood=2
    else
    endif
    if ( Trig_building_selling_Func059C() ) then
        set udg_sold_gold=488
        set udg_sold_wood=12
    else
    endif
    if ( Trig_building_selling_Func060C() ) then
        set udg_sold_gold=433
        set udg_sold_wood=10
    else
    endif
    if ( Trig_building_selling_Func061C() ) then
        set udg_sold_gold=397
        set udg_sold_wood=10
    else
    endif
    if ( Trig_building_selling_Func062C() ) then
        set udg_sold_gold=806
        set udg_sold_wood=19
    else
    endif
    if ( Trig_building_selling_Func063C() ) then
        set udg_sold_gold=550
        set udg_sold_wood=13
    else
    endif
    if ( Trig_building_selling_Func064C() ) then
        set udg_sold_gold=663
        set udg_sold_wood=8
    else
    endif
    if ( Trig_building_selling_Func065C() ) then
        set udg_sold_gold=1352
        set udg_sold_wood=14
    else
    endif
    call AdjustPlayerStateBJ(udg_sold_gold, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(udg_sold_wood, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER)
    if ( Trig_building_selling_Func068C() ) then
        call CreateTextTagLocBJ(( "|cFFFFCD00+" + I2S(udg_sold_gold) ), GetUnitLoc(GetSpellAbilityUnit()), 0, 11.00, 100, 100, 100, 0)
        call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
        call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 48.00, 90)
    else
    endif
    if ( Trig_building_selling_Func069C() ) then
        call CreateTextTagLocBJ(( "|cFFB23AEE+" + I2S(udg_sold_wood) ), GetUnitLoc(GetSpellAbilityUnit()), 48.00, 11.00, 100, 100, 100, 0)
        call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
        call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 48.00, 90)
    else
    endif
    call GroupRemoveUnitSimple(GetSpellAbilityUnit(), udg_buildings)
    call RemoveUnit(GetSpellAbilityUnit())
    set udg_sold_gold=0
    set udg_sold_wood=0
    call AddSpecialEffectLocBJ(GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_building_selling takes nothing returns nothing
    set gg_trg_building_selling=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_building_selling, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_building_selling, Condition(function Trig_building_selling_Conditions))
    call TriggerAddAction(gg_trg_building_selling, function Trig_building_selling_Actions)
endfunction

//===========================================================================
// Trigger: building inf
//===========================================================================
function Trig_building_inf_Conditions takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_inf_Func002A takes nothing returns nothing
    call SetUnitInvulnerable(GetEnumUnit(), true)
endfunction

function Trig_building_inf_Actions takes nothing returns nothing
    call ForGroupBJ(udg_buildings, function Trig_building_inf_Func002A)
endfunction

//===========================================================================
function InitTrig_building_inf takes nothing returns nothing
    set gg_trg_building_inf=CreateTrigger()
    call DisableTrigger(gg_trg_building_inf)
    call TriggerRegisterTimerEventPeriodic(gg_trg_building_inf, 1.00)
    call TriggerAddCondition(gg_trg_building_inf, Condition(function Trig_building_inf_Conditions))
    call TriggerAddAction(gg_trg_building_inf, function Trig_building_inf_Actions)
endfunction

//===========================================================================
// Trigger: builder select
//===========================================================================
function Trig_builder_select_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_PEON) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Func002001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_SAPPER) == true )
endfunction

function Trig_builder_select_Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_builder_select_Func009C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'hpea' ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Func010C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h015' ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Func011C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h01G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Func012C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h01U' ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Func013C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h025' ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Func014C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h02H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_select_Actions takes nothing returns nothing
    call SelectUnitForPlayerSingle(GetEnteringUnit(), GetOwningPlayer(GetEnteringUnit()))
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetOwningPlayer(GetEnteringUnit()), Condition(function Trig_builder_select_Func002001002)), function Trig_builder_select_Func002A)
    call SetPlayerStateBJ(GetOwningPlayer(GetEnteringUnit()), PLAYER_STATE_RESOURCE_GOLD, 755)
    call SetPlayerStateBJ(GetOwningPlayer(GetEnteringUnit()), PLAYER_STATE_RESOURCE_LUMBER, 22)
    call CreateNUnitsAtLoc(1, 'hbla', GetOwningPlayer(GetEnteringUnit()), GetPlayerStartLocationLoc(GetOwningPlayer(GetEnteringUnit())), bj_UNIT_FACING)
    call CreateNUnitsAtLoc(1, 'hwtw', GetOwningPlayer(GetEnteringUnit()), PolarProjectionBJ(GetPlayerStartLocationLoc(GetOwningPlayer(GetEnteringUnit())), 781.00, 125.00), bj_UNIT_FACING)
    call SetUnitPositionLocFacingLocBJ(GetEnteringUnit(), PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), 192.00, ( ( I2R(GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit()))) * 45.00 ) + 225.00 )), GetUnitLoc(GetLastCreatedUnit()))
    call PanCameraToTimedLocForPlayer(GetOwningPlayer(GetEnteringUnit()), GetUnitLoc(GetEnteringUnit()), 0)
    if ( Trig_builder_select_Func009C() ) then
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNPeasant.blp")
        call SetPlayerTechResearchedSwap('R02G', 1, GetOwningPlayer(GetEnteringUnit()))
    else
    endif
    if ( Trig_builder_select_Func010C() ) then
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp")
    else
    endif
    if ( Trig_builder_select_Func011C() ) then
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNWisp.blp")
        call SetPlayerTechResearchedSwap('R00H', 2, GetOwningPlayer(GetEnteringUnit()))
        call SetPlayerTechResearchedSwap('R02F', 1, GetOwningPlayer(GetEnteringUnit()))
        set udg_scoreboard_upg[GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit()))]=2
    else
    endif
    if ( Trig_builder_select_Func012C() ) then
        call AdjustPlayerStateBJ(150, GetOwningPlayer(GetEnteringUnit()), PLAYER_STATE_RESOURCE_GOLD)
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNPeon.blp")
        call SetPlayerTechResearchedSwap('R02H', 1, GetOwningPlayer(GetEnteringUnit()))
    else
    endif
    if ( Trig_builder_select_Func013C() ) then
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNMurgalSlave.blp")
    else
    endif
    if ( Trig_builder_select_Func014C() ) then
        call MultiboardSetItemIconBJ(udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
        set udg_mediv=GetOwningPlayer(GetEnteringUnit())
        call TriggerExecute(gg_trg_mediv_select)
    else
    endif
endfunction

//===========================================================================
function InitTrig_builder_select takes nothing returns nothing
    set gg_trg_builder_select=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_builder_select, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_builder_select, Condition(function Trig_builder_select_Conditions))
    call TriggerAddAction(gg_trg_builder_select, function Trig_builder_select_Actions)
endfunction

//===========================================================================
// Trigger: builder left
//===========================================================================
function Trig_builder_left_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetLeavingUnit(), UNIT_TYPE_PEON) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_left_Actions takes nothing returns nothing
    call SetUnitPositionLoc(GetLeavingUnit(), GetPlayerStartLocationLoc(GetOwningPlayer(GetLeavingUnit())))
endfunction

//===========================================================================
function InitTrig_builder_left takes nothing returns nothing
    set gg_trg_builder_left=CreateTrigger()
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player1)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player2)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player3)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player4)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player5)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player6)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player7)
    call TriggerRegisterLeaveRectSimple(gg_trg_builder_left, gg_rct_player8)
    call TriggerAddCondition(gg_trg_builder_left, Condition(function Trig_builder_left_Conditions))
    call TriggerAddAction(gg_trg_builder_left, function Trig_builder_left_Actions)
endfunction

//===========================================================================
// Trigger: mediv select
//===========================================================================
function Trig_mediv_select_Func056C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func057C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func058C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func059C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func060C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func063C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func064C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func065C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func066C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func067C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func070C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func071C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func072C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func073C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func074C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func077C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func078C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func079C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func080C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func081C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func084C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func085C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func086C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func087C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func088C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func091C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func092C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func093C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func094C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func095C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func098C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func099C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func100C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func101C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func102C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func105C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func106C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func107C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func108C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func109C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func112C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func113C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func114C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func115C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func118C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func119C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func120C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func121C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Actions takes nothing returns nothing
    // Альянс
    call SetPlayerUnitAvailableBJ('h002', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h003', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h009', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h00C', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h00J', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h00P', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h00U', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h012', false, udg_mediv)
    // Нежить
    call SetPlayerUnitAvailableBJ('h016', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h017', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h018', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h019', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01A', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01B', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01C', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01D', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01E', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01F', false, udg_mediv)
    // Ночные эльфы
    call SetPlayerUnitAvailableBJ('h01H', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01I', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01J', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01K', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01L', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01M', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01N', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01P', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01Q', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01R', false, udg_mediv)
    // Орда
    call SetPlayerUnitAvailableBJ('h01S', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01T', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01V', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01W', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01X', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01Y', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h01Z', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h020', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h021', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h022', false, udg_mediv)
    // Наги
    call SetPlayerUnitAvailableBJ('h026', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h027', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h028', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02A', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02B', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02C', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02D', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02E', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02F', false, udg_mediv)
    call SetPlayerUnitAvailableBJ('h02G', false, udg_mediv)
    // Q
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func056C() ) then
        call SetPlayerUnitAvailableBJ('h002', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func057C() ) then
        call SetPlayerUnitAvailableBJ('h016', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func058C() ) then
        call SetPlayerUnitAvailableBJ('h01H', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func059C() ) then
        call SetPlayerUnitAvailableBJ('h01S', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func060C() ) then
        call SetPlayerUnitAvailableBJ('h026', true, udg_mediv)
    else
    endif
    // W
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func063C() ) then
        call SetPlayerUnitAvailableBJ('h003', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func064C() ) then
        call SetPlayerUnitAvailableBJ('h017', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func065C() ) then
        call SetPlayerUnitAvailableBJ('h01I', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func066C() ) then
        call SetPlayerUnitAvailableBJ('h01T', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func067C() ) then
        call SetPlayerUnitAvailableBJ('h027', true, udg_mediv)
    else
    endif
    // E
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func070C() ) then
        call SetPlayerUnitAvailableBJ('h009', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func071C() ) then
        call SetPlayerUnitAvailableBJ('h018', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func072C() ) then
        call SetPlayerUnitAvailableBJ('h01J', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func073C() ) then
        call SetPlayerUnitAvailableBJ('h01V', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func074C() ) then
        call SetPlayerUnitAvailableBJ('h028', true, udg_mediv)
    else
    endif
    // R
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func077C() ) then
        call SetPlayerUnitAvailableBJ('h00C', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func078C() ) then
        call SetPlayerUnitAvailableBJ('h019', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func079C() ) then
        call SetPlayerUnitAvailableBJ('h01K', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func080C() ) then
        call SetPlayerUnitAvailableBJ('h01W', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func081C() ) then
        call SetPlayerUnitAvailableBJ('h02A', true, udg_mediv)
    else
    endif
    // A
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func084C() ) then
        call SetPlayerUnitAvailableBJ('h00J', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func085C() ) then
        call SetPlayerUnitAvailableBJ('h01A', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func086C() ) then
        call SetPlayerUnitAvailableBJ('h01L', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func087C() ) then
        call SetPlayerUnitAvailableBJ('h01X', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func088C() ) then
        call SetPlayerUnitAvailableBJ('h02B', true, udg_mediv)
    else
    endif
    // S
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func091C() ) then
        call SetPlayerUnitAvailableBJ('h00P', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func092C() ) then
        call SetPlayerUnitAvailableBJ('h01B', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func093C() ) then
        call SetPlayerUnitAvailableBJ('h01M', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func094C() ) then
        call SetPlayerUnitAvailableBJ('h01Y', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func095C() ) then
        call SetPlayerUnitAvailableBJ('h02C', true, udg_mediv)
    else
    endif
    // D
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func098C() ) then
        call SetPlayerUnitAvailableBJ('h00U', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func099C() ) then
        call SetPlayerUnitAvailableBJ('h01C', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func100C() ) then
        call SetPlayerUnitAvailableBJ('h01N', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func101C() ) then
        call SetPlayerUnitAvailableBJ('h01Z', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func102C() ) then
        call SetPlayerUnitAvailableBJ('h02D', true, udg_mediv)
    else
    endif
    // F
    set udg_random=GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func105C() ) then
        call SetPlayerUnitAvailableBJ('h012', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func106C() ) then
        call SetPlayerUnitAvailableBJ('h01D', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func107C() ) then
        call SetPlayerUnitAvailableBJ('h01P', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func108C() ) then
        call SetPlayerUnitAvailableBJ('h020', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func109C() ) then
        call SetPlayerUnitAvailableBJ('h02E', true, udg_mediv)
    else
    endif
    // Z
    set udg_random=GetRandomInt(1, 4)
    if ( Trig_mediv_select_Func112C() ) then
        call SetPlayerUnitAvailableBJ('h01E', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func113C() ) then
        call SetPlayerUnitAvailableBJ('h01Q', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func114C() ) then
        call SetPlayerUnitAvailableBJ('h021', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func115C() ) then
        call SetPlayerUnitAvailableBJ('h02F', true, udg_mediv)
    else
    endif
    // X
    set udg_random=GetRandomInt(1, 4)
    if ( Trig_mediv_select_Func118C() ) then
        call SetPlayerUnitAvailableBJ('h01F', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func119C() ) then
        call SetPlayerUnitAvailableBJ('h01R', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func120C() ) then
        call SetPlayerUnitAvailableBJ('h022', true, udg_mediv)
    else
    endif
    if ( Trig_mediv_select_Func121C() ) then
        call SetPlayerUnitAvailableBJ('h02G', true, udg_mediv)
    else
    endif
endfunction

//===========================================================================
function InitTrig_mediv_select takes nothing returns nothing
    set gg_trg_mediv_select=CreateTrigger()
    call TriggerAddAction(gg_trg_mediv_select, function Trig_mediv_select_Actions)
endfunction

//===========================================================================
// Trigger: change set
//===========================================================================
function Trig_change_set_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004Func004Func004C takes nothing returns boolean
    if ( not ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] == 1 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 400 ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004Func004C takes nothing returns boolean
    if ( not Trig_change_set_Func001Func004Func004Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004Func006C takes nothing returns boolean
    if ( not ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] == 2 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004C takes nothing returns boolean
    if ( not Trig_change_set_Func001Func004Func006C() ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func006C takes nothing returns boolean
    if ( not ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] == 3 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 50 ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001C takes nothing returns boolean
    if ( not Trig_change_set_Func001Func006C() ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Actions takes nothing returns nothing
    if ( Trig_change_set_Func001C() ) then
        call IncUnitAbilityLevelSwapped('A03T', GetSpellAbilityUnit())
        call AddSpecialEffectLocBJ(GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call AdjustPlayerStateBJ(- 50, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
        set udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))]=( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] - 1 )
        set udg_mediv=GetOwningPlayer(GetSpellAbilityUnit())
        call TriggerExecute(gg_trg_mediv_select)
    else
        if ( Trig_change_set_Func001Func004C() ) then
            call IncUnitAbilityLevelSwapped('A03T', GetSpellAbilityUnit())
            call AddSpecialEffectLocBJ(GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call AdjustPlayerStateBJ(- 200, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
            set udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))]=( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] - 1 )
            set udg_mediv=GetOwningPlayer(GetSpellAbilityUnit())
            call TriggerExecute(gg_trg_mediv_select)
        else
            if ( Trig_change_set_Func001Func004Func004C() ) then
                call AddSpecialEffectLocBJ(GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call AdjustPlayerStateBJ(- 400, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
                set udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))]=( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] - 1 )
                set udg_mediv=GetOwningPlayer(GetSpellAbilityUnit())
                call TriggerExecute(gg_trg_mediv_select)
                call UnitRemoveAbilityBJ('A03T', GetSpellAbilityUnit())
            else
            endif
        endif
    endif
endfunction

//===========================================================================
function InitTrig_change_set takes nothing returns nothing
    set gg_trg_change_set=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_change_set, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_change_set, Condition(function Trig_change_set_Conditions))
    call TriggerAddAction(gg_trg_change_set, function Trig_change_set_Actions)
endfunction

//===========================================================================
// Trigger: assassin
//
// Можно не трогать
//===========================================================================
function Trig_assassin_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'h00O' ) ) then
        return false
    endif
    if ( not ( GetUnitAbilityLevelSwapped('A013', GetEnteringUnit()) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R00M', GetOwningPlayer(GetEnteringUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_assassin_Conditions takes nothing returns boolean
    if ( not Trig_assassin_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_assassin_Actions takes nothing returns nothing
    call UnitAddAbilityBJ('A013', GetEnteringUnit())
endfunction

//===========================================================================
function InitTrig_assassin takes nothing returns nothing
    set gg_trg_assassin=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_assassin, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_assassin, Condition(function Trig_assassin_Conditions))
    call TriggerAddAction(gg_trg_assassin, function Trig_assassin_Actions)
endfunction

//===========================================================================
// Trigger: banshi
//
// Можно не трогать
//===========================================================================
function Trig_banshi_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A01Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ('A015', GetSpellTargetUnit())
endfunction

//===========================================================================
function InitTrig_banshi takes nothing returns nothing
    set gg_trg_banshi=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_banshi, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_banshi, Condition(function Trig_banshi_Conditions))
    call TriggerAddAction(gg_trg_banshi, function Trig_banshi_Actions)
endfunction

//===========================================================================
// Trigger: ghost
//
// Можно не трогать
//===========================================================================
function Trig_ghost_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'ewsp' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R01B', GetOwningPlayer(GetDyingUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_Conditions takes nothing returns boolean
    if ( not Trig_ghost_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_Func001Func001001002003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_ghost_Func001Func001001002003002001 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit()) )
endfunction

function Trig_ghost_Func001Func001001002003002002 takes nothing returns boolean
    return ( GetFilterUnit() != GetDyingUnit() )
endfunction

function Trig_ghost_Func001Func001001002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_ghost_Func001Func001001002003002001(), Trig_ghost_Func001Func001001002003002002())
endfunction

function Trig_ghost_Func001Func001001002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_ghost_Func001Func001001002003001(), Trig_ghost_Func001Func001001002003002())
endfunction

function Trig_ghost_Func001Func001A takes nothing returns nothing
    call UnitAddAbilityBJ('A021', GetEnumUnit())
    call IssueImmediateOrderBJ(GetEnumUnit(), "divineshield")
    call SetUnitLifeBJ(GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + 150.00 ))
endfunction

function Trig_ghost_Func001Func002001001003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_ghost_Func001Func002001001003002001 takes nothing returns boolean
    return ( GetFilterUnit() != GetDyingUnit() )
endfunction

function Trig_ghost_Func001Func002001001003002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit()) )
endfunction

function Trig_ghost_Func001Func002001001003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_ghost_Func001Func002001001003002001(), Trig_ghost_Func001Func002001001003002002())
endfunction

function Trig_ghost_Func001Func002001001003 takes nothing returns boolean
    return GetBooleanAnd(Trig_ghost_Func001Func002001001003001(), Trig_ghost_Func001Func002001001003002())
endfunction

function Trig_ghost_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRangeOfLocMatching(400.00, GetUnitLoc(GetDyingUnit()), Condition(function Trig_ghost_Func001Func002001001003))) != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_Actions takes nothing returns nothing
    if ( Trig_ghost_Func001C() ) then
        call ForGroupBJ(GetRandomSubGroup(1, GetUnitsInRangeOfLocMatching(400.00, GetUnitLoc(GetDyingUnit()), Condition(function Trig_ghost_Func001Func001001002003))), function Trig_ghost_Func001Func001A)
    else
    endif
endfunction

//===========================================================================
function InitTrig_ghost takes nothing returns nothing
    set gg_trg_ghost=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ghost, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_ghost, Condition(function Trig_ghost_Conditions))
    call TriggerAddAction(gg_trg_ghost, function Trig_ghost_Actions)
endfunction

//===========================================================================
// Trigger: ghost active
//
// Можно не трогать
//===========================================================================
function Trig_ghost_active_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A021' ) ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_active_Actions takes nothing returns nothing
    call TriggerExecute(gg_trg_ghost_del_1)
endfunction

//===========================================================================
function InitTrig_ghost_active takes nothing returns nothing
    set gg_trg_ghost_active=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ghost_active, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_ghost_active, Condition(function Trig_ghost_active_Conditions))
    call TriggerAddAction(gg_trg_ghost_active, function Trig_ghost_active_Actions)
endfunction

//===========================================================================
// Trigger: ghost del 1
//
// Можно не трогать
//===========================================================================
function Trig_ghost_del_1_Actions takes nothing returns nothing
    call TriggerSleepAction(5.00)
    call UnitRemoveAbilityBJ('A021', GetTriggerUnit())
endfunction

//===========================================================================
function InitTrig_ghost_del_1 takes nothing returns nothing
    set gg_trg_ghost_del_1=CreateTrigger()
    call TriggerAddAction(gg_trg_ghost_del_1, function Trig_ghost_del_1_Actions)
endfunction

//===========================================================================
// Trigger: rejuvenation
//
// Можно не трогать
//===========================================================================
function Trig_rejuvenation_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A026' ) ) then
        return false
    endif
    return true
endfunction

function Trig_rejuvenation_Func001001002003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_rejuvenation_Func001001002003002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetSpellAbilityUnit()) )
endfunction

function Trig_rejuvenation_Func001001002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_rejuvenation_Func001001002003001(), Trig_rejuvenation_Func001001002003002())
endfunction

function Trig_rejuvenation_Func001A takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'h00G', GetOwningPlayer(GetSpellAbilityUnit()), GetUnitLoc(GetEnumUnit()), bj_UNIT_FACING)
    call UnitAddAbilityBJ('A025', GetLastCreatedUnit())
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "rejuvination", GetEnumUnit())
endfunction

function Trig_rejuvenation_Actions takes nothing returns nothing
    call ForGroupBJ(GetRandomSubGroup(5, GetUnitsInRangeOfLocMatching(200.00, GetSpellTargetLoc(), Condition(function Trig_rejuvenation_Func001001002003))), function Trig_rejuvenation_Func001A)
endfunction

//===========================================================================
function InitTrig_rejuvenation takes nothing returns nothing
    set gg_trg_rejuvenation=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_rejuvenation, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_rejuvenation, Condition(function Trig_rejuvenation_Conditions))
    call TriggerAddAction(gg_trg_rejuvenation, function Trig_rejuvenation_Actions)
endfunction

//===========================================================================
// Trigger: tip
//
// Можно не трогать
//===========================================================================
function Trig_tip_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_tip_Func001Func003001001003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_tip_Func001Func003001001003002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00Z' )
endfunction

function Trig_tip_Func001Func003001001003 takes nothing returns boolean
    return GetBooleanAnd(Trig_tip_Func001Func003001001003001(), Trig_tip_Func001Func003001001003002())
endfunction

function Trig_tip_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRangeOfLocMatching(1200.00, GetUnitLoc(GetSpellAbilityUnit()), Condition(function Trig_tip_Func001Func003001001003))) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_tip_Actions takes nothing returns nothing
    if ( Trig_tip_Func001C() ) then
        call DisplayTextToForce(GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())), "TRIGSTR_2092")
    else
        call DisplayTextToForce(GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())), "TRIGSTR_2091")
    endif
endfunction

//===========================================================================
function InitTrig_tip takes nothing returns nothing
    set gg_trg_tip=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_tip, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_tip, Condition(function Trig_tip_Conditions))
    call TriggerAddAction(gg_trg_tip, function Trig_tip_Actions)
endfunction

//===========================================================================
// Trigger: gold for gems
//
// Можно не трогать
//===========================================================================
function Trig_gold_for_gems_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02H' ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 250 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_for_gems_Conditions takes nothing returns boolean
    if ( not Trig_gold_for_gems_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_for_gems_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ(- 250, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(5, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER)
endfunction

//===========================================================================
function InitTrig_gold_for_gems takes nothing returns nothing
    set gg_trg_gold_for_gems=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_gold_for_gems, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_gold_for_gems, Condition(function Trig_gold_for_gems_Conditions))
    call TriggerAddAction(gg_trg_gold_for_gems, function Trig_gold_for_gems_Actions)
endfunction

//===========================================================================
// Trigger: gems for gold
//
// Можно не трогать
//===========================================================================
function Trig_gems_for_gold_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02I' ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER) >= 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gems_for_gold_Conditions takes nothing returns boolean
    if ( not Trig_gems_for_gold_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gems_for_gold_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ(250, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(- 5, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER)
endfunction

//===========================================================================
function InitTrig_gems_for_gold takes nothing returns nothing
    set gg_trg_gems_for_gold=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_gems_for_gold, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_gems_for_gold, Condition(function Trig_gems_for_gold_Conditions))
    call TriggerAddAction(gg_trg_gems_for_gold, function Trig_gems_for_gold_Actions)
endfunction

//===========================================================================
// Trigger: sea dragon
//
// Можно не трогать
//===========================================================================
function Trig_sea_dragon_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'nsnp' ) ) then
        return false
    endif
    if ( not ( GetUnitAbilityLevelSwapped('A032', GetEnteringUnit()) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R02C', GetOwningPlayer(GetEnteringUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_sea_dragon_Conditions takes nothing returns boolean
    if ( not Trig_sea_dragon_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_sea_dragon_Actions takes nothing returns nothing
    call UnitAddAbilityBJ('A032', GetEnteringUnit())
endfunction

//===========================================================================
function InitTrig_sea_dragon takes nothing returns nothing
    set gg_trg_sea_dragon=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_sea_dragon, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_sea_dragon, Condition(function Trig_sea_dragon_Conditions))
    call TriggerAddAction(gg_trg_sea_dragon, function Trig_sea_dragon_Actions)
endfunction

//===========================================================================
// Trigger: boss ini start
//===========================================================================
function Trig_boss_ini_start_Func004C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[1] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_ini_start_Func009C takes nothing returns boolean
    if ( not ( CountPlayersInForceBJ(udg_players_group) < 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_ini_start_Actions takes nothing returns nothing
    call TriggerExecute(gg_trg_wave_friends_on)
    call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, Player(11))
    set udg_boss_time=300.00
    if ( Trig_boss_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc(1, 'n000', Player(11), GetRectCenter(gg_rct_waveunitsCENTRE), bj_UNIT_FACING)
        set udg_boss=GetLastCreatedUnit()
        call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
        call EnableTrigger(gg_trg_spells_check)
    else
    endif
    call PauseUnitBJ(true, udg_boss)
    call SetUnitInvulnerable(udg_boss, true)
    call SetUnitLifePercentBJ(udg_boss, ( 12.50 * I2R(CountPlayersInForceBJ(udg_players_group)) ))
    set udg_boss_hp=GetUnitLifePercent(udg_boss)
    if ( Trig_boss_ini_start_Func009C() ) then
        call UnitAddAbilityBJ('A01B', udg_boss)
        call SetUnitAbilityLevelSwapped('A01B', udg_boss, CountPlayersInForceBJ(udg_players_group))
    else
    endif
    call TriggerSleepAction(2)
    call EnableTrigger(gg_trg_boss_end)
    call EnableTrigger(gg_trg_boss_end_timer)
    call PauseUnitBJ(false, udg_boss)
    call SetUnitInvulnerable(udg_boss, false)
endfunction

//===========================================================================
function InitTrig_boss_ini_start takes nothing returns nothing
    set gg_trg_boss_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_boss_ini_start, function Trig_boss_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: boss ini finish
//===========================================================================
function Trig_boss_ini_finish_Func005A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_boss_ini_finish_Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_boss_ini_finish_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_spells_check)
    call QueuedTriggerRemoveBJ(gg_trg_spell_1)
    call DisableTrigger(gg_trg_spell_2)
    call DisableTrigger(gg_trg_spell_4)
    call ForGroupBJ(GetUnitsOfPlayerAll(GetOwningPlayer(udg_boss)), function Trig_boss_ini_finish_Func005A)
    call ForGroupBJ(udg_wave_units, function Trig_boss_ini_finish_Func006A)
    call GroupClear(udg_wave_units)
    set udg_boss_wave=false
    call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, false, Player(11))
    call TriggerExecute(gg_trg_wave_friends_off)
    set udg_j=0
    loop
        exitwhen udg_j > 5
        set udg_boss_phase[udg_j]=false
        set udg_j=udg_j + 1
    endloop
endfunction

//===========================================================================
function InitTrig_boss_ini_finish takes nothing returns nothing
    set gg_trg_boss_ini_finish=CreateTrigger()
    call TriggerAddAction(gg_trg_boss_ini_finish, function Trig_boss_ini_finish_Actions)
endfunction

//===========================================================================
// Trigger: boss end timer
//===========================================================================
function Trig_boss_end_timer_Conditions takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_timer_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(udg_boss) == 'n000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_timer_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_wave_end_attack)
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    if ( Trig_boss_end_timer_Func004C() ) then
        set bj_forLoopBIndex=1
        set bj_forLoopBIndexEnd=( 20 + ( 3 * CountPlayersInForceBJ(udg_players_group) ) )
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call CreateNUnitsAtLoc(1, 'nlv1', Player(11), PolarProjectionBJ(GetUnitLoc(udg_boss), GetRandomReal(0, 1024.00), GetRandomDirectionDeg()), bj_UNIT_FACING)
            call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 10.00, 10.00, 10.00, 0.00)
            set bj_forLoopBIndex=bj_forLoopBIndex + 1
        endloop
    else
    endif
endfunction

//===========================================================================
function InitTrig_boss_end_timer takes nothing returns nothing
    set gg_trg_boss_end_timer=CreateTrigger()
    call DisableTrigger(gg_trg_boss_end_timer)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_boss_end_timer, udg_boss_end_timer)
    call TriggerAddCondition(gg_trg_boss_end_timer, Condition(function Trig_boss_end_timer_Conditions))
    call TriggerAddAction(gg_trg_boss_end_timer, function Trig_boss_end_timer_Actions)
endfunction

//===========================================================================
// Trigger: boss end
//===========================================================================
function Trig_boss_end_Func001Func001A takes nothing returns nothing
    call AdjustPlayerStateBJ(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Бонус золота за прохождение босса (x2 доход): |cFFFFCD00" + I2S(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())]) ))
    call AdjustPlayerStateBJ(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Бонус самоцветов за прохождение босса (x2 доход): |cFFB23AEE" + I2S(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]) ))
endfunction

function Trig_boss_end_Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(udg_boss) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_Func002Func001C takes nothing returns boolean
    if ( ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return true
    endif
    if ( ( IsUnitAliveBJ(udg_boss) == false ) ) then
        return true
    endif
    return false
endfunction

function Trig_boss_end_Func002Func005A takes nothing returns nothing
    call SetUnitInvulnerable(GetEnumUnit(), false)
endfunction

function Trig_boss_end_Func002Func010Func001A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func010Func002001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_boss_end_Func002Func010Func002A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func010C takes nothing returns boolean
    if ( not ( udg_building_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_Func002Func011A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func012A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func013A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func014A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func015A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func016A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func017A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func018A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func019A takes nothing returns nothing
    call SetUnitVertexColorBJ(GetEnumUnit(), 100.00, 100.00, 100.00, 0)
    call ShowUnitHide(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func020A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func021A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func022A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func023A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_boss_end_Func002Func024A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0.50)
    call AdjustPlayerStateBJ(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход золота: |cFFFFCD00" + I2S(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())]) ))
    call AdjustPlayerStateBJ(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход самоцветов: |cFFB23AEE" + I2S(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]) ))
endfunction

function Trig_boss_end_Func002Func028A takes nothing returns nothing
    call DestructableRestoreLife(GetEnumDestructable(), GetDestructableMaxLife(GetEnumDestructable()), false)
endfunction

function Trig_boss_end_Func002C takes nothing returns boolean
    if ( not Trig_boss_end_Func002Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_Actions takes nothing returns nothing
    if ( Trig_boss_end_Func001C() ) then
        call ForForce(udg_players_group, function Trig_boss_end_Func001Func001A)
    else
    endif
    if ( Trig_boss_end_Func002C() ) then
        call TriggerExecute(gg_trg_boss_ini_finish)
        call DisableTrigger(gg_trg_boss_end_timer)
        call DisableTrigger(gg_trg_building_inf)
        call ForGroupBJ(udg_buildings, function Trig_boss_end_Func002Func005A)
        set udg_wave_status=false
        call DisableTrigger(GetTriggeringTrigger())
        call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
        call PlaySoundBJ(gg_snd_QuestCompleted)
        if ( Trig_boss_end_Func002Func010C() ) then
            call ForGroupBJ(udg_buildings, function Trig_boss_end_Func002Func010Func001A)
            call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_boss_end_Func002Func010Func002001002)), function Trig_boss_end_Func002Func010Func002A)
        else
        endif
        call ForGroupBJ(udg_light[0], function Trig_boss_end_Func002Func011A)
        call ForGroupBJ(udg_light[1], function Trig_boss_end_Func002Func012A)
        call ForGroupBJ(udg_light[2], function Trig_boss_end_Func002Func013A)
        call ForGroupBJ(udg_light[3], function Trig_boss_end_Func002Func014A)
        call ForGroupBJ(udg_light[4], function Trig_boss_end_Func002Func015A)
        call ForGroupBJ(udg_light[5], function Trig_boss_end_Func002Func016A)
        call ForGroupBJ(udg_light[6], function Trig_boss_end_Func002Func017A)
        call ForGroupBJ(udg_light[7], function Trig_boss_end_Func002Func018A)
        call ForGroupBJ(udg_light[8], function Trig_boss_end_Func002Func019A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n006'), function Trig_boss_end_Func002Func020A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n003'), function Trig_boss_end_Func002Func021A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n004'), function Trig_boss_end_Func002Func022A)
        call ForGroupBJ(GetUnitsOfTypeIdAll('n005'), function Trig_boss_end_Func002Func023A)
        call ForForce(udg_players_group, function Trig_boss_end_Func002Func024A)
        call TriggerExecute(gg_trg_income_effects)
        call DisableTrigger(gg_trg_wave_end_attack)
        call TriggerExecute(gg_trg_wave_waiting_timer)
        call EnumDestructablesInCircleBJ(5632.00, GetRectCenter(GetPlayableMapRect()), function Trig_boss_end_Func002Func028A)
    else
    endif
endfunction

//===========================================================================
function InitTrig_boss_end takes nothing returns nothing
    set gg_trg_boss_end=CreateTrigger()
    call DisableTrigger(gg_trg_boss_end)
    call TriggerRegisterTimerEventPeriodic(gg_trg_boss_end, 0.50)
    call TriggerAddAction(gg_trg_boss_end, function Trig_boss_end_Actions)
endfunction

//===========================================================================
// Trigger: spells check
//===========================================================================
function Trig_spells_check_Func001Func001C takes nothing returns boolean
    if ( not ( udg_boss_phase[0] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.87 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func001C takes nothing returns boolean
    if ( not Trig_spells_check_Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func002Func005C takes nothing returns boolean
    if ( not ( udg_boss_phase[1] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.74 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func002C takes nothing returns boolean
    if ( not Trig_spells_check_Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func003Func004C takes nothing returns boolean
    if ( not ( udg_boss_phase[2] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.61 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func003C takes nothing returns boolean
    if ( not Trig_spells_check_Func003Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func004Func009C takes nothing returns boolean
    if ( not ( udg_boss_phase[3] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.48 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func004C takes nothing returns boolean
    if ( not Trig_spells_check_Func004Func009C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func005Func004003001001003 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_spells_check_Func005Func005C takes nothing returns boolean
    if ( not ( udg_boss_phase[4] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.35 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func005C takes nothing returns boolean
    if ( not Trig_spells_check_Func005Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func006Func007001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00H' )
endfunction

function Trig_spells_check_Func006Func007A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_spells_check_Func006Func013C takes nothing returns boolean
    if ( not ( udg_boss_phase[5] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.22 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func006C takes nothing returns boolean
    if ( not Trig_spells_check_Func006Func013C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Actions takes nothing returns nothing
    if ( Trig_spells_check_Func001C() ) then
        call ConditionalTriggerExecute(gg_trg_spell_1)
        set udg_boss_phase[0]=true
        call PlaySoundBJ(gg_snd_BloodElfMageReady1)
    else
    endif
    if ( Trig_spells_check_Func002C() ) then
        set udg_boss_phase[1]=true
        set udg_k=1
        loop
            exitwhen udg_k > 11
            call CreateNUnitsAtLoc(1, 'h00H', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), ( 68.00 * I2R(udg_k) ), 90.00), bj_UNIT_FACING)
            set udg_k=udg_k + 1
        endloop
        call EnableTrigger(gg_trg_spell_2)
        call PlaySoundBJ(gg_snd_BloodElfMageWarcry1)
    else
    endif
    if ( Trig_spells_check_Func003C() ) then
        set udg_boss_phase[2]=true
        set udg_k=1
        loop
            exitwhen udg_k > ( CountPlayersInForceBJ(udg_players_group) + ( ( CountPlayersInForceBJ(udg_players_group) * CountPlayersInForceBJ(udg_players_group) ) / 5 ) )
            call CreateNUnitsAtLoc(1, 'h00G', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), GetRandomReal(512.00, 2512.00), GetRandomDirectionDeg()), bj_UNIT_FACING)
            call UnitAddAbilityBJ('A00Q', GetLastCreatedUnit())
            call IssueImmediateOrderBJ(GetLastCreatedUnit(), "lavamonster")
            set udg_k=udg_k + 1
        endloop
        call PlaySoundBJ(gg_snd_BloodElfMageYesAttack1)
    else
    endif
    if ( Trig_spells_check_Func004C() ) then
        set udg_boss_phase[3]=true
        call PlaySoundBJ(gg_snd_BloodElfMageYesAttack3)
        call SetUnitInvulnerable(udg_boss, true)
        call UnitAddAbilityBJ('A00R', udg_boss)
        call SetUnitAbilityLevelSwapped('A00R', udg_boss, ( CountPlayersInForceBJ(udg_players_group) / 2 ))
        call IssuePointOrderLocBJ(udg_boss, "volcano", GetUnitLoc(udg_boss))
        call TriggerSleepAction(24.00)
        call SetUnitInvulnerable(udg_boss, false)
    else
    endif
    if ( Trig_spells_check_Func005C() ) then
        set udg_boss_phase[4]=true
        call PlaySoundBJ(gg_snd_BloodElfMageReady1)
        call UnitAddAbilityBJ('A00S', udg_boss)
        call IssuePointOrderLocBJ(udg_boss, "stampede", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(900.00, GetUnitLoc(udg_boss), Condition(function Trig_spells_check_Func005Func004003001001003)))))
    else
    endif
    if ( Trig_spells_check_Func006C() ) then
        set udg_boss_phase[5]=true
        call PlaySoundBJ(gg_snd_BloodElfMagePissed1)
        call SetUnitVertexColorBJ(udg_boss, 100, 60.00, 0.00, 0)
        call AddSpecialEffectTargetUnitBJ("left,hand", udg_boss, "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
        call AddSpecialEffectTargetUnitBJ("right,hand", udg_boss, "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
        call UnitAddAbilityBJ('A00N', udg_boss)
        call ForGroupBJ(GetUnitsOfPlayerMatching(GetOwningPlayer(udg_boss), Condition(function Trig_spells_check_Func006Func007001002)), function Trig_spells_check_Func006Func007A)
        call DisableTrigger(gg_trg_spell_2)
        set udg_k=0
        set udg_boss_spell_integer=0
        set udg_k=1
        loop
            exitwhen udg_k > 11
            call CreateNUnitsAtLoc(1, 'h00H', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), ( 68.00 * I2R(udg_k) ), 90.00), bj_UNIT_FACING)
            set udg_k=udg_k + 1
        endloop
        call EnableTrigger(gg_trg_spell_4)
    else
    endif
endfunction

//===========================================================================
function InitTrig_spells_check takes nothing returns nothing
    set gg_trg_spells_check=CreateTrigger()
    call DisableTrigger(gg_trg_spells_check)
    call TriggerRegisterTimerEventPeriodic(gg_trg_spells_check, 1.00)
    call TriggerAddAction(gg_trg_spells_check, function Trig_spells_check_Actions)
endfunction

//===========================================================================
// Trigger: spell 1
//===========================================================================
function Trig_spell_1_Actions takes nothing returns nothing
    set udg_j=1
    loop
        exitwhen udg_j > 10
        call CreateNUnitsAtLoc(1, 'h00G', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), GetRandomReal(175.00, 900.00), GetRandomDirectionDeg()), bj_UNIT_FACING)
        call UnitAddAbilityBJ('A00O', GetLastCreatedUnit())
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "flamestrike", GetUnitLoc(GetLastCreatedUnit()))
        call TriggerSleepAction(4.00)
        set udg_j=udg_j + 1
    endloop
endfunction

//===========================================================================
function InitTrig_spell_1 takes nothing returns nothing
    set gg_trg_spell_1=CreateTrigger()
    call TriggerAddAction(gg_trg_spell_1, function Trig_spell_1_Actions)
endfunction

//===========================================================================
// Trigger: spell 2
//===========================================================================
function Trig_spell_2_Func002A takes nothing returns nothing
    set udg_k=( udg_k + 1 )
    call SetUnitPositionLoc(GetEnumUnit(), PolarProjectionBJ(GetUnitLoc(udg_boss), ( 68.00 * I2R(udg_k) ), ( 1.13 * I2R(udg_boss_spell_integer) )))
endfunction

function Trig_spell_2_Func004Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_spell_2_Func004C takes nothing returns boolean
    if ( not ( udg_boss_spell_integer >= 2000 ) ) then
        return false
    endif
    return true
endfunction

function Trig_spell_2_Actions takes nothing returns nothing
    set udg_boss_spell_integer=( udg_boss_spell_integer + 1 )
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00H'), function Trig_spell_2_Func002A)
    set udg_k=0
    if ( Trig_spell_2_Func004C() ) then
        call DisableTrigger(GetTriggeringTrigger())
        call ForGroupBJ(GetUnitsOfTypeIdAll('h00H'), function Trig_spell_2_Func004Func002A)
        set udg_boss_spell_integer=0
    else
    endif
endfunction

//===========================================================================
function InitTrig_spell_2 takes nothing returns nothing
    set gg_trg_spell_2=CreateTrigger()
    call DisableTrigger(gg_trg_spell_2)
    call TriggerRegisterTimerEventPeriodic(gg_trg_spell_2, 0.05)
    call TriggerAddAction(gg_trg_spell_2, function Trig_spell_2_Actions)
endfunction

//===========================================================================
// Trigger: spell 3
//===========================================================================
function Trig_spell_3_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'nlv1' ) ) then
        return false
    endif
    return true
endfunction

function Trig_spell_3_Actions takes nothing returns nothing
    call SetUnitPathing(GetEnteringUnit(), false)
    call IssuePointOrderLocBJ(GetEnteringUnit(), "attack", GetUnitLoc(udg_boss))
endfunction

//===========================================================================
function InitTrig_spell_3 takes nothing returns nothing
    set gg_trg_spell_3=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_spell_3, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_spell_3, Condition(function Trig_spell_3_Conditions))
    call TriggerAddAction(gg_trg_spell_3, function Trig_spell_3_Actions)
endfunction

//===========================================================================
// Trigger: spell 4
//===========================================================================
function Trig_spell_4_Func002A takes nothing returns nothing
    set udg_k=( udg_k + 1 )
    call SetUnitPositionLoc(GetEnumUnit(), PolarProjectionBJ(GetUnitLoc(udg_boss), ( ( I2R(udg_k) * GetRandomReal(77.00, 238.00) ) * 1.00 ), ( 1.13 * I2R(udg_boss_spell_integer) )))
endfunction

function Trig_spell_4_Func004Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_spell_4_Func004C takes nothing returns boolean
    if ( not ( udg_boss_spell_integer >= 800 ) ) then
        return false
    endif
    return true
endfunction

function Trig_spell_4_Actions takes nothing returns nothing
    set udg_boss_spell_integer=( udg_boss_spell_integer + 1 )
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00H'), function Trig_spell_4_Func002A)
    set udg_k=0
    if ( Trig_spell_4_Func004C() ) then
        call DisableTrigger(GetTriggeringTrigger())
        call ForGroupBJ(GetUnitsOfTypeIdAll('h00H'), function Trig_spell_4_Func004Func002A)
        set udg_boss_spell_integer=0
    else
    endif
endfunction

//===========================================================================
function InitTrig_spell_4 takes nothing returns nothing
    set gg_trg_spell_4=CreateTrigger()
    call DisableTrigger(gg_trg_spell_4)
    call TriggerRegisterTimerEventPeriodic(gg_trg_spell_4, 0.05)
    call TriggerAddAction(gg_trg_spell_4, function Trig_spell_4_Actions)
endfunction

//===========================================================================
// Trigger: hunter death
//===========================================================================
function Trig_hunter_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'Ewar' ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_death_Func004Func001A takes nothing returns nothing
endfunction

function Trig_hunter_death_Func004C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_death_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetDyingUnit(), udg_wave_units)
    call SetHeroLevelBJ(GetKillingUnitBJ(), ( GetHeroLevel(GetKillingUnitBJ()) + 1 ), true)
    call RemoveUnit(GetDyingUnit())
    if ( Trig_hunter_death_Func004C() ) then
        call ForGroupBJ(GetUnitsOfTypeIdAll('Ewar'), function Trig_hunter_death_Func004Func001A)
    else
    endif
endfunction

//===========================================================================
function InitTrig_hunter_death takes nothing returns nothing
    set gg_trg_hunter_death=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_hunter_death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_hunter_death, Condition(function Trig_hunter_death_Conditions))
    call TriggerAddAction(gg_trg_hunter_death, function Trig_hunter_death_Actions)
endfunction

//===========================================================================
// Trigger: hunter time
//===========================================================================
function Trig_hunter_time_Func004C takes nothing returns boolean
    if ( not ( udg_k >= ( 9 - CountPlayersInForceBJ(udg_players_group) ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_time_Actions takes nothing returns nothing
    call IssuePointOrderLocBJ(GroupPickRandomUnit(GetUnitsOfPlayerAll(Player(11))), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
    set udg_j=1
    loop
        exitwhen udg_j > CountPlayersInForceBJ(udg_players_group)
        call CreateItemLoc('gold', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), GetRandomReal(0, 5200.00), GetRandomDirectionDeg()))
        set udg_j=udg_j + 1
    endloop
    set udg_k=( udg_k + 1 )
    if ( Trig_hunter_time_Func004C() ) then
        set udg_k=0
        call CreateNUnitsAtLoc(1, 'nlv1', Player(11), PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), GetRandomReal(0, 5000.00), GetRandomDirectionDeg()), bj_UNIT_FACING)
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
        call SetUnitVertexColorBJ(GetLastCreatedUnit(), 10.00, 10.00, 10.00, 0.00)
    else
    endif
endfunction

//===========================================================================
function InitTrig_hunter_time takes nothing returns nothing
    set gg_trg_hunter_time=CreateTrigger()
    call DisableTrigger(gg_trg_hunter_time)
    call TriggerRegisterTimerEventPeriodic(gg_trg_hunter_time, 1.30)
    call TriggerAddAction(gg_trg_hunter_time, function Trig_hunter_time_Actions)
endfunction

//===========================================================================
// Trigger: hunter end
//
// Оптимизировать!!!
//===========================================================================
function Trig_hunter_end_Func002001002 takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == 'gold' )
endfunction

function Trig_hunter_end_Func003C takes nothing returns boolean
    if ( not ( udg_k >= 2200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_end_Actions takes nothing returns nothing
    set udg_k=( udg_k + 1 )
    call RemoveItem(RandomItemInRectBJ(GetPlayableMapRect(), Condition(function Trig_hunter_end_Func002001002)))
    if ( Trig_hunter_end_Func003C() ) then
        call DisableTrigger(GetTriggeringTrigger())
        set udg_k=0
    else
    endif
endfunction

//===========================================================================
function InitTrig_hunter_end takes nothing returns nothing
    set gg_trg_hunter_end=CreateTrigger()
    call DisableTrigger(gg_trg_hunter_end)
    call TriggerRegisterTimerEventPeriodic(gg_trg_hunter_end, 0.04)
    call TriggerAddAction(gg_trg_hunter_end, function Trig_hunter_end_Actions)
endfunction

//===========================================================================
// Trigger: zombie ini start
//===========================================================================
function Trig_zombie_ini_start_Func001A takes nothing returns nothing
    call SetPlayerTechMaxAllowedSwap('hhou', 20, GetEnumPlayer())
endfunction

function Trig_zombie_ini_start_Actions takes nothing returns nothing
    call ForForce(udg_players_group, function Trig_zombie_ini_start_Func001A)
    call SetDayNightModels("", "")
    set udg_k=1
    loop
        exitwhen udg_k > 8
        call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 4096.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 3072.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 2048.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
        call CreateDestructableLoc('B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 1024.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0)
        set udg_k=udg_k + 1
    endloop
    call CreateDestructableLoc('B008', GetRectCenter(gg_rct_centreCENTRE), GetRandomDirectionDeg(), 2.00, 0)
    call CreateDestructableLoc('B008', GetRectCenter(gg_rct_upright), GetRandomDirectionDeg(), 2.00, 0)
    call CreateDestructableLoc('B008', GetRectCenter(gg_rct_downright), GetRandomDirectionDeg(), 2.00, 0)
    call CreateDestructableLoc('B008', GetRectCenter(gg_rct_downleft), GetRandomDirectionDeg(), 2.00, 0)
    call CreateDestructableLoc('B008', GetRectCenter(gg_rct_upleft), GetRandomDirectionDeg(), 2.00, 0)
    call TriggerSleepAction(30.00)
    call EnableTrigger(gg_trg_wave_end_attack)
    set udg_k=0
    call EnableTrigger(gg_trg_zombie_spawn)
endfunction

//===========================================================================
function InitTrig_zombie_ini_start takes nothing returns nothing
    set gg_trg_zombie_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_zombie_ini_start, function Trig_zombie_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: zombie ini finish
//===========================================================================
function Trig_zombie_ini_finish_Func004Func001C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetEnumDestructable()) == 'B008' ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_ini_finish_Func004A takes nothing returns nothing
    if ( Trig_zombie_ini_finish_Func004Func001C() ) then
        call RemoveDestructable(GetEnumDestructable())
    else
    endif
endfunction

function Trig_zombie_ini_finish_Func005A takes nothing returns nothing
    call SetPlayerAllianceBJ(GetEnumPlayer(), ALLIANCE_PASSIVE, false, Player(11))
    call SetPlayerAllianceBJ(Player(11), ALLIANCE_PASSIVE, false, GetEnumPlayer())
endfunction

function Trig_zombie_ini_finish_Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_zombie_ini_finish_Func007Func001Func001A takes nothing returns nothing
    call AdjustPlayerStateBJ(( 150 + ( 25 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
endfunction

function Trig_zombie_ini_finish_Func007Func001A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'nzom'), function Trig_zombie_ini_finish_Func007Func001Func001A)
endfunction

function Trig_zombie_ini_finish_Func007Func004Func001A takes nothing returns nothing
    call AdjustPlayerStateBJ(( 325 + ( 35 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
endfunction

function Trig_zombie_ini_finish_Func007Func004A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'h00I'), function Trig_zombie_ini_finish_Func007Func004Func001A)
endfunction

function Trig_zombie_ini_finish_Func007Func007001001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00I' )
endfunction

function Trig_zombie_ini_finish_Func007Func007001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_zombie_ini_finish_Func007Func007001001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_zombie_ini_finish_Func007Func007001001002001(), Trig_zombie_ini_finish_Func007Func007001001002002())
endfunction

function Trig_zombie_ini_finish_Func007C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_zombie_ini_finish_Func007Func007001001002))) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_ini_finish_Func008A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_zombie_ini_finish_Func009A takes nothing returns nothing
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_wave_units)
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_zombie_ini_finish_Actions takes nothing returns nothing
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call DisableTrigger(gg_trg_zombie_spawn)
    call TriggerExecute(gg_trg_wave_friends_off)
    call EnumDestructablesInRectAll(GetPlayableMapRect(), function Trig_zombie_ini_finish_Func004A)
    call ForForce(udg_players_group, function Trig_zombie_ini_finish_Func005A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('hhou'), function Trig_zombie_ini_finish_Func006A)
    if ( Trig_zombie_ini_finish_Func007C() ) then
        call ForForce(udg_players_group, function Trig_zombie_ini_finish_Func007Func004A)
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, "TRIGSTR_484")
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Все выжившие игроки получают |cFFFFCD00" + ( I2S(( 325 + ( 35 * udg_wave ) )) + "|r ед. золота!" ) ))
    else
        call ForForce(udg_players_group, function Trig_zombie_ini_finish_Func007Func001A)
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, "TRIGSTR_3793")
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Все игроки получают |cFFFFCD00" + ( I2S(( 150 + ( 25 * udg_wave ) )) + "|r ед. золота!" ) ))
    endif
    call ForGroupBJ(GetUnitsOfTypeIdAll('nzom'), function Trig_zombie_ini_finish_Func008A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00I'), function Trig_zombie_ini_finish_Func009A)
endfunction

//===========================================================================
function InitTrig_zombie_ini_finish takes nothing returns nothing
    set gg_trg_zombie_ini_finish=CreateTrigger()
    call TriggerAddAction(gg_trg_zombie_ini_finish, function Trig_zombie_ini_finish_Actions)
endfunction

//===========================================================================
// Trigger: zombie death
//===========================================================================
function Trig_zombie_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'h00I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_death_Func002A takes nothing returns nothing
    call SetPlayerAllianceBJ(GetOwningPlayer(GetDyingUnit()), ALLIANCE_PASSIVE, false, GetEnumPlayer())
    call SetPlayerAllianceBJ(GetEnumPlayer(), ALLIANCE_PASSIVE, false, GetOwningPlayer(GetDyingUnit()))
endfunction

function Trig_zombie_death_Func010Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_zombie_death_Func010Func003001001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00I' )
endfunction

function Trig_zombie_death_Func010Func003001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_zombie_death_Func010Func003001001002 takes nothing returns boolean
    return GetBooleanAnd(Trig_zombie_death_Func010Func003001001002001(), Trig_zombie_death_Func010Func003001001002002())
endfunction

function Trig_zombie_death_Func010C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_zombie_death_Func010Func003001001002))) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_death_Actions takes nothing returns nothing
    call ForForce(udg_players_group, function Trig_zombie_death_Func002A)
    call SetPlayerAllianceBJ(GetOwningPlayer(GetDyingUnit()), ALLIANCE_PASSIVE, true, Player(11))
    call SetPlayerAllianceBJ(Player(11), ALLIANCE_PASSIVE, true, GetOwningPlayer(GetDyingUnit()))
    call CreateNUnitsAtLoc(1, 'nzom', GetOwningPlayer(GetDyingUnit()), GetUnitLoc(GetDyingUnit()), bj_UNIT_FACING)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
    call UnitAddAbilityBJ('A00U', GetLastCreatedUnit())
    call UnitAddAbilityBJ('A00V', GetLastCreatedUnit())
    call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(GetOwningPlayer(GetLastCreatedUnit())))
    if ( Trig_zombie_death_Func010C() ) then
        call TriggerExecute(gg_trg_zombie_ini_finish)
        call ForGroupBJ(GetUnitsOfTypeIdAll('nzom'), function Trig_zombie_death_Func010Func002A)
    else
    endif
endfunction

//===========================================================================
function InitTrig_zombie_death takes nothing returns nothing
    set gg_trg_zombie_death=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_zombie_death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_zombie_death, Condition(function Trig_zombie_death_Conditions))
    call TriggerAddAction(gg_trg_zombie_death, function Trig_zombie_death_Actions)
endfunction

//===========================================================================
// Trigger: zombie spawn
//===========================================================================
function Trig_zombie_spawn_Func002C takes nothing returns boolean
    if ( not ( udg_k >= ( 9 - CountPlayersInForceBJ(udg_players_group) ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_spawn_Actions takes nothing returns nothing
    set udg_k=( udg_k + 1 )
    if ( Trig_zombie_spawn_Func002C() ) then
        set udg_k=0
        call CreateNUnitsAtLoc(1, 'nzom', Player(11), PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), GetRandomReal(0, 5000.00), GetRandomDirectionDeg()), bj_UNIT_FACING)
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)))
    else
    endif
endfunction

//===========================================================================
function InitTrig_zombie_spawn takes nothing returns nothing
    set gg_trg_zombie_spawn=CreateTrigger()
    call DisableTrigger(gg_trg_zombie_spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_zombie_spawn, 1.00)
    call TriggerAddAction(gg_trg_zombie_spawn, function Trig_zombie_spawn_Actions)
endfunction

//===========================================================================
// Trigger: gold ini start
//===========================================================================
function Trig_gold_ini_start_Func001Func001A takes nothing returns nothing
    call PauseUnitBJ(true, GetEnumUnit())
endfunction

function Trig_gold_ini_start_Func001A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerAll(GetEnumPlayer()), function Trig_gold_ini_start_Func001Func001A)
endfunction

function Trig_gold_ini_start_Func004A takes nothing returns nothing
    call SetCameraBoundsToRectForPlayerBJ(GetEnumPlayer(), gg_rct_roulette)
    call CreateNUnitsAtLoc(1, 'h00X', GetEnumPlayer(), GetRandomLocInRect(gg_rct_roulettespawn), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    call SelectUnitForPlayerSingle(GetLastCreatedUnit(), GetEnumPlayer())
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetUnitLoc(GetLastCreatedUnit()), 0)
endfunction

function Trig_gold_ini_start_Func006A takes nothing returns nothing
    call UnitAddAbilityBJ('A00U', GetEnumUnit())
    call SetUnitColor(GetEnumUnit(), GetPlayerColor(GetOwningPlayer(GetEnumUnit())))
endfunction

function Trig_gold_ini_start_Actions takes nothing returns nothing
    call ForForce(udg_players_group, function Trig_gold_ini_start_Func001A)
    call TriggerSleepAction(0.30)
    call EnableTrigger(gg_trg_gold_bet)
    call ForForce(udg_players_group, function Trig_gold_ini_start_Func004A)
    call TriggerSleepAction(0.10)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00X'), function Trig_gold_ini_start_Func006A)
endfunction

//===========================================================================
function InitTrig_gold_ini_start takes nothing returns nothing
    set gg_trg_gold_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_gold_ini_start, function Trig_gold_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: gold bet
//===========================================================================
function Trig_gold_bet_Func002C takes nothing returns boolean
    if ( ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gold" ) ) then
        return true
    endif
    if ( ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gems" ) ) then
        return true
    endif
    return false
endfunction

function Trig_gold_bet_Conditions takes nothing returns boolean
    if ( not Trig_gold_bet_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func002Func001C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 0 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func002C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func002Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func003Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 11 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 25 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func003C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func003Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func004Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 26 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 50 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func004C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func004Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func005Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 51 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func005C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func005Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gems" ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func003Func001C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 0 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func003C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func003Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func004Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 201 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 500 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func004C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func004Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func005Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 501 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 1000 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func005C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func005Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func006Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 1001 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func006C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func006Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 6, 10)) <= GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gold" ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Actions takes nothing returns nothing
    if ( Trig_gold_bet_Func001C() ) then
        if ( Trig_gold_bet_Func001Func002C() ) then
            if ( Trig_gold_bet_Func001Func002Func003C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 0.25 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            if ( Trig_gold_bet_Func001Func002Func004C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 0.50 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            if ( Trig_gold_bet_Func001Func002Func005C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 0.75 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            if ( Trig_gold_bet_Func001Func002Func006C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 1.00 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), ( "|cFF00FF00Вы ввели ставку золота|r, в случае победы вы получите: " + I2S(R2I(( 0.80 * I2R(udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]) ))) ))
            call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), ( "|cFFFF0000Вы ввели ставку золота|r, в случае проигрыша вы потеряете: " + I2S(udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]) ))
        else
            call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_1092")
        endif
    else
        if ( Trig_gold_bet_Func001Func001C() ) then
            if ( Trig_gold_bet_Func001Func001Func002C() ) then
                if ( Trig_gold_bet_Func001Func001Func002Func002C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 0.25 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                if ( Trig_gold_bet_Func001Func001Func002Func003C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 0.50 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                if ( Trig_gold_bet_Func001Func001Func002Func004C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 0.75 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                if ( Trig_gold_bet_Func001Func001Func002Func005C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]=R2I(( 1.00 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), ( "|cFF00FF00Вы ввели ставку самоцветов|r, в случае победы вы получите: " + I2S(R2I(( 0.80 * I2R(udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]) ))) ))
                call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), ( "|cFFFF0000Вы ввели ставку самоцветов|r, в случае проигрыша вы потеряете: " + I2S(udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]) ))
            else
                call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_1093")
            endif
        else
            call DisplayTextToForce(GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_1085")
        endif
    endif
endfunction

//===========================================================================
function InitTrig_gold_bet takes nothing returns nothing
    set gg_trg_gold_bet=CreateTrigger()
    call DisableTrigger(gg_trg_gold_bet)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(0), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(0), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(1), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(1), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(2), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(2), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(3), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(3), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(4), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(4), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(5), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(5), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(6), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(6), "-gems", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(7), "-gold", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_gold_bet, Player(7), "-gems", false)
    call TriggerAddCondition(gg_trg_gold_bet, Condition(function Trig_gold_bet_Conditions))
    call TriggerAddAction(gg_trg_gold_bet, function Trig_gold_bet_Actions)
endfunction

//===========================================================================
// Trigger: gold result
//===========================================================================
function Trig_gold_result_Func001A takes nothing returns nothing
    call PauseUnitBJ(true, GetEnumUnit())
endfunction

function Trig_gold_result_Func002Func001001002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n001' )
endfunction

function Trig_gold_result_Func002Func001Func005001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00X' )
endfunction

function Trig_gold_result_Func002Func001Func005A takes nothing returns nothing
    call ForceAddPlayerSimple(GetOwningPlayer(GetEnumUnit()), udg_roulette_winners)
endfunction

function Trig_gold_result_Func002Func001A takes nothing returns nothing
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, ( "Победили номер |cFFFF9B00" + I2S(GetUnitUserData(GetEnumUnit())) ))
    call SetUnitScalePercent(GetEnumUnit(), 150.00, 150.00, 150.00)
    call AddSpecialEffectTargetUnitBJ("overhead", GetEnumUnit(), "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl")
    call PlaySoundBJ(gg_snd_QuestNew)
    call ForGroupBJ(GetUnitsInRangeOfLocMatching(64.00, GetUnitLoc(GetEnumUnit()), Condition(function Trig_gold_result_Func002Func001Func005001003)), function Trig_gold_result_Func002Func001Func005A)
endfunction

function Trig_gold_result_Func002Func002001002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n001' )
endfunction

function Trig_gold_result_Func002Func002Func005001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00X' )
endfunction

function Trig_gold_result_Func002Func002Func005A takes nothing returns nothing
    call ForceAddPlayerSimple(GetOwningPlayer(GetEnumUnit()), udg_roulette_winners)
endfunction

function Trig_gold_result_Func002Func002A takes nothing returns nothing
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, ( "Победили номер |cFFFF9B00" + I2S(GetUnitUserData(GetEnumUnit())) ))
    call SetUnitScalePercent(GetEnumUnit(), 150.00, 150.00, 150.00)
    call AddSpecialEffectTargetUnitBJ("overhead", GetEnumUnit(), "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl")
    call PlaySoundBJ(gg_snd_QuestNew)
    call ForGroupBJ(GetUnitsInRangeOfLocMatching(64.00, GetUnitLoc(GetEnumUnit()), Condition(function Trig_gold_result_Func002Func002Func005001003)), function Trig_gold_result_Func002Func002Func005A)
endfunction

function Trig_gold_result_Func002C takes nothing returns boolean
    if ( not ( CountPlayersInForceBJ(udg_players_group) <= 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_result_Func003Func001Func003Func002C takes nothing returns boolean
    if ( ( udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())] != 0 ) ) then
        return true
    endif
    if ( ( udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())] != 0 ) ) then
        return true
    endif
    return false
endfunction

function Trig_gold_result_Func003Func001Func003C takes nothing returns boolean
    if ( not Trig_gold_result_Func003Func001Func003Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_result_Func003Func001C takes nothing returns boolean
    if ( not ( IsPlayerInForce(GetEnumPlayer(), udg_roulette_winners) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_result_Func003A takes nothing returns nothing
    if ( Trig_gold_result_Func003Func001C() ) then
        call AdjustPlayerStateBJ(( udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())] * - 1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
        call AdjustPlayerStateBJ(( udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())] * - 1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
        if ( Trig_gold_result_Func003Func001Func003C() ) then
            call DisplayTextToForce(GetForceOfPlayer(GetEnumPlayer()), "TRIGSTR_1088")
        else
        endif
    else
        call AdjustPlayerStateBJ(R2I(( I2R(udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())]) * 0.80 )), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
        call AdjustPlayerStateBJ(R2I(( I2R(udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())]) * 0.80 )), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
        call DisplayTextToForce(GetPlayersAll(), ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + ( udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] + ( "|r выигрывает |cFFFFCD00" + ( I2S(R2I(( 0.80 * I2R(udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())]) ))) + ( "|r ед. золота и |cFFB23AEE" + ( I2S(R2I(( 0.80 * I2R(udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())]) ))) + "|r ед. самоцветов." ) ) ) ) ) ))
    endif
endfunction

function Trig_gold_result_Func004Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) != 'h00X' )
endfunction

function Trig_gold_result_Func004Func001A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
endfunction

function Trig_gold_result_Func004A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_gold_result_Func004Func001001002)), function Trig_gold_result_Func004Func001A)
endfunction

function Trig_gold_result_Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_gold_result_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00X'), function Trig_gold_result_Func001A)
    if ( Trig_gold_result_Func002C() ) then
        call ForGroupBJ(GetRandomSubGroup(4, GetUnitsInRectMatching(gg_rct_roulettegame, Condition(function Trig_gold_result_Func002Func002001002002))), function Trig_gold_result_Func002Func002A)
    else
        call ForGroupBJ(GetRandomSubGroup(2, GetUnitsInRectMatching(gg_rct_roulettegame, Condition(function Trig_gold_result_Func002Func001001002002))), function Trig_gold_result_Func002Func001A)
    endif
    call ForForce(udg_players_group, function Trig_gold_result_Func003A)
    call ForForce(udg_players_group, function Trig_gold_result_Func004A)
    call TriggerSleepAction(5.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00X'), function Trig_gold_result_Func006A)
    call GroupClear(udg_wave_units)
endfunction

//===========================================================================
function InitTrig_gold_result takes nothing returns nothing
    set gg_trg_gold_result=CreateTrigger()
    call TriggerAddAction(gg_trg_gold_result, function Trig_gold_result_Actions)
endfunction

//===========================================================================
// Trigger: horse ini start
//===========================================================================
function Trig_horse_ini_start_Func004C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func005C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(1)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func006C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(2)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func007C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(3)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func008C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(4)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func009C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(5)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func010C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(6)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func011C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(7)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func012Func001002001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func012A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetUnitLoc(GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func012Func001002001001002)))), 0)
    call SetCameraTargetControllerNoZForPlayer(GetEnumPlayer(), GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'hhdl')), 0, 0, false)
endfunction

function Trig_horse_ini_start_Func015Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func015Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_491", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
endfunction

function Trig_horse_ini_start_Func015A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func015Func001001002)), function Trig_horse_ini_start_Func015Func001A)
endfunction

function Trig_horse_ini_start_Func018Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func018Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_1032", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
endfunction

function Trig_horse_ini_start_Func018A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func018Func001001002)), function Trig_horse_ini_start_Func018Func001A)
endfunction

function Trig_horse_ini_start_Func021Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func021Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_1033", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
endfunction

function Trig_horse_ini_start_Func021A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func021Func001001002)), function Trig_horse_ini_start_Func021Func001A)
endfunction

function Trig_horse_ini_start_Func023Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func023Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_1034", GetUnitLoc(GetEnumUnit()), 0, 20.00, 100, 0.00, 0.00, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 6.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 6.00)
endfunction

function Trig_horse_ini_start_Func023A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func023Func001001002)), function Trig_horse_ini_start_Func023Func001A)
endfunction

function Trig_horse_ini_start_Func026A takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnumUnit(), "move", PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 5568.00, 0))
endfunction

function Trig_horse_ini_start_Actions takes nothing returns nothing
    call TriggerSleepAction(0.30)
    set udg_r=0
    // Я без понятия чего редактор так активно создаёт дессинхрон при цикличном спавне лошадок, посему каждому персонально. мдя.
    if ( Trig_horse_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(0), GetRectCenter(gg_rct_horse1), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(0)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func005C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(1), GetRectCenter(gg_rct_horse2), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(1)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func006C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(2), GetRectCenter(gg_rct_horse3), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(2)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func007C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(3), GetRectCenter(gg_rct_horse4), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(3)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func008C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(4), GetRectCenter(gg_rct_horse5), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(4)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func009C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(5), GetRectCenter(gg_rct_horse6), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(5)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func010C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(6), GetRectCenter(gg_rct_horse7), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(6)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func011C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(7), GetRectCenter(gg_rct_horse8), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(7)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    call ForForce(udg_players_group, function Trig_horse_ini_start_Func012A)
    call TriggerSleepAction(2.00)
    call PlaySoundBJ(gg_snd_BattleNetTick)
    call ForForce(udg_players_group, function Trig_horse_ini_start_Func015A)
    call TriggerSleepAction(1.00)
    call PlaySoundBJ(gg_snd_BattleNetTick)
    call ForForce(udg_players_group, function Trig_horse_ini_start_Func018A)
    call TriggerSleepAction(1.00)
    call PlaySoundBJ(gg_snd_BattleNetTick)
    call ForForce(udg_players_group, function Trig_horse_ini_start_Func021A)
    call TriggerSleepAction(1.00)
    call ForForce(udg_players_group, function Trig_horse_ini_start_Func023A)
    call EnableTrigger(gg_trg_horse_speed)
    call EnableTrigger(gg_trg_horse_finish)
    call ForGroupBJ(GetUnitsOfTypeIdAll('hhdl'), function Trig_horse_ini_start_Func026A)
endfunction

//===========================================================================
function InitTrig_horse_ini_start takes nothing returns nothing
    set gg_trg_horse_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_horse_ini_start, function Trig_horse_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: horse speed
//===========================================================================
function Trig_horse_speed_Func001A takes nothing returns nothing
    call SetUnitMoveSpeed(GetEnumUnit(), ( GetUnitMoveSpeed(GetEnumUnit()) + 1.50 ))
endfunction

function Trig_horse_speed_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 'hhdl'), function Trig_horse_speed_Func001A)
endfunction

//===========================================================================
function InitTrig_horse_speed takes nothing returns nothing
    set gg_trg_horse_speed=CreateTrigger()
    call DisableTrigger(gg_trg_horse_speed)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(1), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(1), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(2), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(2), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(3), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(3), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(4), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(4), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(5), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(5), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(6), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(6), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(7), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(7), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerAddAction(gg_trg_horse_speed, function Trig_horse_speed_Actions)
endfunction

//===========================================================================
// Trigger: horse finish
//===========================================================================
function Trig_horse_finish_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'hhdl' ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_finish_Func005Func001Func004C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_finish_Func005C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_finish_Actions takes nothing returns nothing
    set udg_r=( udg_r + 1 )
    call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit()))] + ( "|r финишировал со скоростью |cFFFF9B00" + R2S(GetUnitMoveSpeed(GetEnteringUnit())) ) ) ))
    set udg_horse_winners[udg_r]=GetOwningPlayer(GetEnteringUnit())
    call GroupRemoveUnitSimple(GetEnteringUnit(), udg_wave_units)
    if ( Trig_horse_finish_Func005C() ) then
        set bj_forLoopAIndex=1
        set bj_forLoopAIndexEnd=udg_r
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Место |cFF00FF00#" + ( I2S(GetForLoopIndexA()) + ( "|r занимает " + ( udg_players_colour[GetConvertedPlayerId(udg_horse_winners[GetForLoopIndexA()])] + udg_players_name[GetConvertedPlayerId(udg_horse_winners[GetForLoopIndexA()])] ) ) ) ))
            call AdjustPlayerStateBJ(( 666 - ( 66 * GetForLoopIndexA() ) ), udg_horse_winners[GetForLoopIndexA()], PLAYER_STATE_RESOURCE_GOLD)
            call DisplayTimedTextToForce(GetForceOfPlayer(udg_horse_winners[GetForLoopIndexA()]), 10.00, ( "Золото за результат гонок: |cFFFFCD00" + I2S(( 666 - ( GetForLoopIndexA() * 66 ) )) ))
            if ( Trig_horse_finish_Func005Func001Func004C() ) then
            else
            endif
            set bj_forLoopAIndex=bj_forLoopAIndex + 1
        endloop
        set udg_r=0
        call DisableTrigger(GetTriggeringTrigger())
        call DisableTrigger(gg_trg_horse_speed)
    else
    endif
    call AddSpecialEffectLocBJ(GetUnitLoc(GetEnteringUnit()), "Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveUnit(GetEnteringUnit())
endfunction

//===========================================================================
function InitTrig_horse_finish takes nothing returns nothing
    set gg_trg_horse_finish=CreateTrigger()
    call DisableTrigger(gg_trg_horse_finish)
    call TriggerRegisterEnterRectSimple(gg_trg_horse_finish, gg_rct_finish)
    call TriggerAddCondition(gg_trg_horse_finish, Condition(function Trig_horse_finish_Conditions))
    call TriggerAddAction(gg_trg_horse_finish, function Trig_horse_finish_Actions)
endfunction

//===========================================================================
// Trigger: miners ini start
//===========================================================================
function Trig_miners_ini_start_Func002C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func003C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(1)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func004C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(2)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func005C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(3)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func006C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(4)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func007C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(5)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func008C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(6)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func009C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(7)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func010Func001002001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'ngsp' )
endfunction

function Trig_miners_ini_start_Func010A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetUnitLoc(GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_miners_ini_start_Func010Func001002001001002)))), 0)
    call SetCameraBoundsToRectForPlayerBJ(GetEnumPlayer(), gg_rct_minersregion)
endfunction

function Trig_miners_ini_start_Actions takes nothing returns nothing
    call TriggerSleepAction(0.30)
    if ( Trig_miners_ini_start_Func002C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(0), GetRectCenter(gg_rct_miner1), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func003C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(1), GetRectCenter(gg_rct_miner2), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(2), GetRectCenter(gg_rct_miner3), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func005C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(3), GetRectCenter(gg_rct_miner4), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func006C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(4), GetRectCenter(gg_rct_miner5), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func007C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(5), GetRectCenter(gg_rct_miner6), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func008C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(6), GetRectCenter(gg_rct_miner7), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_miners_ini_start_Func009C() ) then
        call CreateNUnitsAtLoc(1, 'ngsp', Player(7), GetRectCenter(gg_rct_miner8), bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    call ForForce(udg_players_group, function Trig_miners_ini_start_Func010A)
endfunction

//===========================================================================
function InitTrig_miners_ini_start takes nothing returns nothing
    set gg_trg_miners_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_miners_ini_start, function Trig_miners_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: miners death
//===========================================================================
function Trig_miners_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'ngsp' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == GetOwningPlayer(GetDyingUnit()) ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Func002Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Func002Func001A takes nothing returns nothing
    if ( Trig_miners_death_Func002Func001Func001C() ) then
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] ) ))
        call AdjustPlayerStateBJ(( 250 + ( 25 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
        call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в Miners: |cFFFFCD00" + I2S(( 250 + ( 25 * udg_wave ) )) ))
    else
    endif
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_miners_death_Func002C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) <= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Actions takes nothing returns nothing
    if ( Trig_miners_death_Func001C() ) then
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Игрок " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] + "|r подорвал сам себя." ) ) ))
    else
    endif
    if ( Trig_miners_death_Func002C() ) then
        call ForGroupBJ(GetUnitsOfTypeIdAll('ngsp'), function Trig_miners_death_Func002Func001A)
        call GroupClear(udg_wave_units)
    else
    endif
endfunction

//===========================================================================
function InitTrig_miners_death takes nothing returns nothing
    set gg_trg_miners_death=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_miners_death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_miners_death, Condition(function Trig_miners_death_Conditions))
    call TriggerAddAction(gg_trg_miners_death, function Trig_miners_death_Actions)
endfunction

//===========================================================================
// Trigger: miners explosion
//===========================================================================
function Trig_miners_explosion_Conditions takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetFilterDestructable()) == 'B009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_explosion_Func006C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_explosion_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ(GetDestructableLoc(GetDyingDestructable()), "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    set udg_random=GetRandomInt(1, ( ( CountPlayersInForceBJ(udg_players_group) * 3 ) + 12 ))
    if ( Trig_miners_explosion_Func006C() ) then
        call CreateItemLoc('I000', GetDestructableLoc(GetFilterDestructable()))
    else
    endif
endfunction

//===========================================================================
function InitTrig_miners_explosion takes nothing returns nothing
    set gg_trg_miners_explosion=CreateTrigger()
    call TriggerRegisterDestDeathInRegionEvent(gg_trg_miners_explosion, gg_rct_minersregion)
    call TriggerAddCondition(gg_trg_miners_explosion, Condition(function Trig_miners_explosion_Conditions))
    call TriggerAddAction(gg_trg_miners_explosion, function Trig_miners_explosion_Actions)
endfunction

//===========================================================================
// Trigger: miners set
//===========================================================================
function Trig_miners_set_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'nglm' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func002Func001Func002Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(RectFromCenterSizeBJ(Location(( 7872.00 + ( 128.00 * I2R(udg_i) ) ), ( 7744.00 - ( 128.00 * I2R(udg_j) ) )), 128.00, 128.00), GetEnteringUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func002Func001C takes nothing returns boolean
    if ( not ( udg_miners_log == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func004Func001Func001001002 takes nothing returns boolean
    return ( GetDestructableTypeId(GetFilterDestructable()) == 'B009' )
endfunction

function Trig_miners_set_Func004Func001Func004Func003003002001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'ngsp' )
endfunction

function Trig_miners_set_Func004Func001Func004C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() == GetUnitAbilityLevelSwapped('AIpm', GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetOwningPlayer(GetEnteringUnit()), Condition(function Trig_miners_set_Func004Func001Func004Func003003002001002)))) ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func004Func001Func005Func002001002 takes nothing returns boolean
    return ( GetDestructableTypeId(GetFilterDestructable()) == 'B009' )
endfunction

function Trig_miners_set_Func004Func001Func005Func004C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func004Func001Func005C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(RandomDestructableInRectSimpleBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 96.00, 96.00))) == 'B009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Actions takes nothing returns nothing
    set udg_miners_log=false
    set udg_i=0
    loop
        exitwhen udg_i > 17
        if ( Trig_miners_set_Func002Func001C() ) then
            set udg_j=0
            loop
                exitwhen udg_j > 17
                if ( Trig_miners_set_Func002Func001Func002Func001C() ) then
                    set udg_miners_log=true
                    call SetUnitPositionLoc(GetEnteringUnit(), Location(( 7872.00 + ( 128.00 * I2R(udg_i) ) ), ( 7744.00 - ( 128.00 * I2R(udg_j) ) )))
                else
                endif
                set udg_j=udg_j + 1
            endloop
        else
        endif
        set udg_i=udg_i + 1
    endloop
    call TriggerSleepAction(3.00)
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=GetUnitAbilityLevelSwapped('AIpm', GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetOwningPlayer(GetEnteringUnit()), 'ngsp')))
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set bj_forLoopBIndex=1
        set bj_forLoopBIndexEnd=4
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call KillDestructable(RandomDestructableInRectBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), 0.00, 0), 96.00, 96.00), Condition(function Trig_miners_set_Func004Func001Func001001002)))
            call UnitDamagePointLoc(GetEnteringUnit(), 0, 64.00, GetUnitLoc(GetEnteringUnit()), 1000.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
            call UnitDamagePointLoc(GetEnteringUnit(), 0, 62.00, PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 1000.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
            if ( Trig_miners_set_Func004Func001Func004C() ) then
                call AddSpecialEffectLocBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
            endif
            if ( Trig_miners_set_Func004Func001Func005C() ) then
                call KillDestructable(RandomDestructableInRectBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 96.00, 96.00), Condition(function Trig_miners_set_Func004Func001Func005Func002001002)))
                set udg_random=GetRandomInt(1, ( ( CountPlayersInForceBJ(udg_players_group) * 3 ) + 12 ))
                if ( Trig_miners_set_Func004Func001Func005Func004C() ) then
                    call CreateItemLoc('I000', GetDestructableLoc(RandomDestructableInRectSimpleBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 96.00, 96.00))))
                else
                endif
            else
            endif
            set bj_forLoopBIndex=bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call KillUnit(GetEnteringUnit())
endfunction

//===========================================================================
function InitTrig_miners_set takes nothing returns nothing
    set gg_trg_miners_set=CreateTrigger()
    call TriggerRegisterEnterRectSimple(gg_trg_miners_set, GetEntireMapRect())
    call TriggerAddCondition(gg_trg_miners_set, Condition(function Trig_miners_set_Conditions))
    call TriggerAddAction(gg_trg_miners_set, function Trig_miners_set_Actions)
endfunction

//===========================================================================
// Trigger: miners reward
//===========================================================================
function Trig_miners_reward_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_reward_Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('AIpm', GetManipulatingUnit()) < 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_reward_Actions takes nothing returns nothing
    if ( Trig_miners_reward_Func001C() ) then
        call IncUnitAbilityLevelSwapped('AIpm', GetManipulatingUnit())
        call AddSpecialEffectLocBJ(GetUnitLoc(GetManipulatingUnit()), "Abilities\\Spells\\Other\\Levelup\\LevelupCaster.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
    endif
endfunction

//===========================================================================
function InitTrig_miners_reward takes nothing returns nothing
    set gg_trg_miners_reward=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_miners_reward, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_miners_reward, Condition(function Trig_miners_reward_Conditions))
    call TriggerAddAction(gg_trg_miners_reward, function Trig_miners_reward_Actions)
endfunction

//===========================================================================
// Trigger: hide ini
//===========================================================================
function Trig_hide_ini_Func025Func001C takes nothing returns boolean
    if ( not ( GetEnumPlayer() != udg_hide_hunter ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func025A takes nothing returns nothing
    if ( Trig_hide_ini_Func025Func001C() ) then
        call DestroyFogModifier(GetLastCreatedFogModifier())
        call CreateNUnitsAtLoc(1, 'h00X', GetEnumPlayer(), GetRandomLocInRect(gg_rct_hideandseek), bj_UNIT_FACING)
        call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 100.00)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
        call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetUnitLoc(GetLastCreatedUnit()), 0)
        call SetCameraBoundsToRectForPlayerBJ(GetEnumPlayer(), gg_rct_hideandseekall)
        set udg_hide[GetConvertedPlayerId(GetEnumPlayer())]=GetRandomInt(1, 5)
    else
    endif
endfunction

function Trig_hide_ini_Func027Func001Func002C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func001Func003C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func001C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func002C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func003C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func004C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func005Func002C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func005Func003C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func005C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027A takes nothing returns nothing
    if ( Trig_hide_ini_Func027Func001C() ) then
        set udg_random=GetRandomInt(1, 3)
        if ( Trig_hide_ini_Func027Func001Func002C() ) then
            call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Rocks\\Lords_Rock\\Lords_Rock0.mdl")
        else
        endif
        if ( Trig_hide_ini_Func027Func001Func003C() ) then
            call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Rocks\\Lords_Rock\\Lords_Rock5.mdl")
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=6
        else
            call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Rocks\\Lords_Rock\\Lords_Rock8.mdl")
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=7
        endif
    else
    endif
    if ( Trig_hide_ini_Func027Func002C() ) then
        call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Buildings\\Other\\BarrelsUnit0\\BarrelsUnit0.mdl")
    else
    endif
    if ( Trig_hide_ini_Func027Func003C() ) then
        call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\Northrend\\Water\\FloatingBox\\FloatingBox.mdl")
    else
    endif
    if ( Trig_hide_ini_Func027Func004C() ) then
        call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Props\\TorchHuman\\TorchHuman.mdl")
    else
    endif
    if ( Trig_hide_ini_Func027Func005C() ) then
        set udg_random=GetRandomInt(1, 3)
        if ( Trig_hide_ini_Func027Func005Func002C() ) then
            call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\Dungeon\\Props\\JunkPile\\JunkPile0.mdl")
        else
        endif
        if ( Trig_hide_ini_Func027Func005Func003C() ) then
            call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\Dungeon\\Props\\JunkPile\\JunkPile1.mdl")
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=8
        else
            call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Doodads\\Dungeon\\Props\\TreasurePile\\TreasurePile0.mdl")
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=9
        endif
    else
    endif
endfunction

function Trig_hide_ini_Func034A takes nothing returns nothing
    call CreateFogModifierRectBJ(true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_all)
endfunction

function Trig_hide_ini_Actions takes nothing returns nothing
    call TriggerSleepAction(0.30)
    set udg_hide_hunter=ForcePickRandomPlayer(udg_players_group)
    call SetTimeOfDay(0.00)
    call DisplayTextToForce(GetPlayersAll(), ( "ИЩЕТ: " + ( udg_players_colour[GetConvertedPlayerId(udg_hide_hunter)] + udg_players_name[GetConvertedPlayerId(udg_hide_hunter)] ) ))
    call CameraSetupApplyForPlayer(true, gg_cam_hide_and_seek, udg_hide_hunter, 0)
    call SetCameraBoundsToRectForPlayerBJ(udg_hide_hunter, gg_rct_hideandseekcam)
    call CreateTextTagLocBJ("TRIGSTR_1046", GetRectCenter(gg_rct_hideandseekcam), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(udg_hide_hunter))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 30.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 30.00)
    call CreateTextTagLocBJ("TRIGSTR_1153", PolarProjectionBJ(GetRectCenter(gg_rct_hideandseekcam), - 256.00, 270.00), 0.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(udg_hide_hunter))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 30.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 30.00)
    call CreateTextTagLocBJ("TRIGSTR_1154", PolarProjectionBJ(GetRectCenter(gg_rct_hideandseekcam), 376.00, 270.00), 0.00, 10.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(udg_hide_hunter))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 30.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 30.00)
    call ForForce(udg_players_group, function Trig_hide_ini_Func025A)
    call TriggerSleepAction(0.10)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00X'), function Trig_hide_ini_Func027A)
    call TriggerSleepAction(29.00)
    call TriggerExecute(gg_trg_hide_stop)
    call TriggerSleepAction(2.00)
    call CreateNUnitsAtLoc(1, 'h00Y', udg_hide_hunter, GetRectCenter(gg_rct_hideandseek), bj_UNIT_FACING)
    call SetCameraBoundsToRectForPlayerBJ(udg_hide_hunter, gg_rct_hideandseekall)
    call PanCameraToTimedLocForPlayer(udg_hide_hunter, GetRectCenter(gg_rct_hideandseek), 0)
    call ForForce(udg_players_group, function Trig_hide_ini_Func034A)
endfunction

//===========================================================================
function InitTrig_hide_ini takes nothing returns nothing
    set gg_trg_hide_ini=CreateTrigger()
    call TriggerAddAction(gg_trg_hide_ini, function Trig_hide_ini_Actions)
endfunction

//===========================================================================
// Trigger: hide stop
//===========================================================================
function Trig_hide_stop_Func001Func002C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func003C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func004C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func005C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func006C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func007C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func008C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func009C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func010C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001A takes nothing returns nothing
    call ClearSelectionForPlayer(GetOwningPlayer(GetEnumUnit()))
    if ( Trig_hide_stop_Func001Func002C() ) then
        call CreateDestructableLoc('B00A', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func003C() ) then
        call CreateDestructableLoc('B00B', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func004C() ) then
        call CreateDestructableLoc('B00C', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func005C() ) then
        call CreateDestructableLoc('B00E', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func006C() ) then
        call CreateDestructableLoc('B00F', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func007C() ) then
        call CreateDestructableLoc('B00D', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func008C() ) then
        call CreateDestructableLoc('B00G', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func009C() ) then
        call CreateDestructableLoc('B00H', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    if ( Trig_hide_stop_Func001Func010C() ) then
        call CreateDestructableLoc('B00I', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0)
    else
    endif
    call CreateNUnitsAtLoc(1, 'h00Z', GetOwningPlayer(GetEnumUnit()), GetUnitLoc(GetEnumUnit()), bj_UNIT_FACING)
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_wave_units)
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_hide_stop_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfTypeIdAll('h00X'), function Trig_hide_stop_Func001A)
endfunction

//===========================================================================
function InitTrig_hide_stop takes nothing returns nothing
    set gg_trg_hide_stop=CreateTrigger()
    call TriggerAddAction(gg_trg_hide_stop, function Trig_hide_stop_Actions)
endfunction

//===========================================================================
// Trigger: hide kill
//===========================================================================
function Trig_hide_kill_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'h00Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_kill_Func003A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction

function Trig_hide_kill_Func009Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_hide_kill_Func009C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_kill_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ(GetUnitLoc(GetDyingUnit()), "Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call EnumDestructablesInCircleBJ(32.00, GetUnitLoc(GetDyingUnit()), function Trig_hide_kill_Func003A)
    call GroupRemoveUnitSimple(GetDyingUnit(), udg_wave_units)
    call RemoveUnit(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 'h00Y', GetOwningPlayer(GetDyingUnit()), GetUnitLoc(GetDyingUnit()), bj_UNIT_FACING)
    if ( Trig_hide_kill_Func009C() ) then
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Победил охотник: " + ( udg_players_colour[GetConvertedPlayerId(udg_hide_hunter)] + udg_players_name[GetConvertedPlayerId(udg_hide_hunter)] ) ))
        call AdjustPlayerStateBJ(( 200 + ( 30 * udg_wave ) ), udg_hide_hunter, PLAYER_STATE_RESOURCE_GOLD)
        call DisplayTimedTextToForce(GetForceOfPlayer(udg_hide_hunter), 10.00, ( "Победа в hide&seek: |cFFFFCD00" + I2S(( 200 + ( 30 * udg_wave ) )) ))
        call AdjustPlayerStateBJ(R2I(( 0.50 * I2R(udg_wave) )), udg_hide_hunter, PLAYER_STATE_RESOURCE_LUMBER)
        call DisplayTimedTextToForce(GetForceOfPlayer(udg_hide_hunter), 10.00, ( "Победа в hide&seek: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ))
        call ForGroupBJ(GetUnitsInRectAll(gg_rct_hideandseekall), function Trig_hide_kill_Func009Func006A)
    else
    endif
endfunction

//===========================================================================
function InitTrig_hide_kill takes nothing returns nothing
    set gg_trg_hide_kill=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_hide_kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_hide_kill, Condition(function Trig_hide_kill_Conditions))
    call TriggerAddAction(gg_trg_hide_kill, function Trig_hide_kill_Actions)
endfunction

//===========================================================================
// Trigger: banshi ini
//===========================================================================
function Trig_banshi_ini_Func002A takes nothing returns nothing
    call CreateFogModifierRectBJ(true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_hideandseekall)
    call CreateNUnitsAtLoc(1, 'u000', GetEnumPlayer(), GetRandomLocInRect(gg_rct_hideandseek), bj_UNIT_FACING)
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetUnitLoc(GetLastCreatedUnit()), 0)
    call SelectUnitForPlayerSingle(GetLastCreatedUnit(), GetEnumPlayer())
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
endfunction

function Trig_banshi_ini_Actions takes nothing returns nothing
    call TriggerSleepAction(0.30)
    call ForForce(udg_players_group, function Trig_banshi_ini_Func002A)
    call EnableTrigger(gg_trg_banshi_attack)
    call EnableTrigger(gg_trg_banshi_spawn)
    call EnableTrigger(gg_trg_banshi_end)
endfunction

//===========================================================================
function InitTrig_banshi_ini takes nothing returns nothing
    set gg_trg_banshi_ini=CreateTrigger()
    call TriggerAddAction(gg_trg_banshi_ini, function Trig_banshi_ini_Actions)
endfunction

//===========================================================================
// Trigger: banshi cast
//===========================================================================
function Trig_banshi_cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'Apos' ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_cast_Actions takes nothing returns nothing
    call UnitAddAbilityBJ('Amim', GetSpellTargetUnit())
    call GroupAddUnitSimple(GetSpellTargetUnit(), udg_wave_units)
endfunction

//===========================================================================
function InitTrig_banshi_cast takes nothing returns nothing
    set gg_trg_banshi_cast=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_banshi_cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_banshi_cast, Condition(function Trig_banshi_cast_Conditions))
    call TriggerAddAction(gg_trg_banshi_cast, function Trig_banshi_cast_Actions)
endfunction

//===========================================================================
// Trigger: banshi end
//===========================================================================
function Trig_banshi_end_Func007C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 1 ) ) then
        return false
    endif
    if ( not ( udg_wave == udg_wave_mini[7] ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_end_Conditions takes nothing returns boolean
    if ( not Trig_banshi_end_Func007C() ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_end_Func004A takes nothing returns nothing
    call DisplayTextToForce(GetPlayersAll(), ( "Победил " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + "|r" ) ) ))
    call AdjustPlayerStateBJ(( 200 + ( 30 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мине-игре: |cFFFFCD00" + I2S(( 200 + ( 30 * udg_wave ) )) ))
    call AdjustPlayerStateBJ(R2I(( 0.50 * I2R(udg_wave) )), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_LUMBER)
    call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мини-игре: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ))
endfunction

function Trig_banshi_end_Func005A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_banshi_end_Actions takes nothing returns nothing
    call DisableTrigger(GetTriggeringTrigger())
    call DisableTrigger(gg_trg_banshi_attack)
    call DisableTrigger(gg_trg_banshi_spawn)
    call ForGroupBJ(udg_wave_units, function Trig_banshi_end_Func004A)
    call ForGroupBJ(GetUnitsInRectAll(gg_rct_hideandseekall), function Trig_banshi_end_Func005A)
    call GroupClear(udg_wave_units)
endfunction

//===========================================================================
function InitTrig_banshi_end takes nothing returns nothing
    set gg_trg_banshi_end=CreateTrigger()
    call DisableTrigger(gg_trg_banshi_end)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_banshi_end, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_banshi_end, Condition(function Trig_banshi_end_Conditions))
    call TriggerAddAction(gg_trg_banshi_end, function Trig_banshi_end_Actions)
endfunction

//===========================================================================
// Trigger: banshi spawn
//===========================================================================
function Trig_banshi_spawn_Func002C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func003C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func004C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func005C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func006C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func007C takes nothing returns boolean
    if ( not ( udg_random == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func008C takes nothing returns boolean
    if ( not ( udg_random == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func009C takes nothing returns boolean
    if ( not ( udg_random == 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func010C takes nothing returns boolean
    if ( not ( udg_random == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func011C takes nothing returns boolean
    if ( not ( udg_random == 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func012C takes nothing returns boolean
    if ( not ( udg_random == 11 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func013C takes nothing returns boolean
    if ( not ( udg_random == 12 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func014C takes nothing returns boolean
    if ( not ( udg_random == 13 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func015C takes nothing returns boolean
    if ( not ( udg_random == 14 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func016C takes nothing returns boolean
    if ( not ( udg_random == 15 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func017C takes nothing returns boolean
    if ( not ( udg_random == 16 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func018C takes nothing returns boolean
    if ( not ( udg_random == 17 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func019C takes nothing returns boolean
    if ( not ( udg_random == 18 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func020C takes nothing returns boolean
    if ( not ( udg_random == 19 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func021C takes nothing returns boolean
    if ( not ( udg_random == 20 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func022C takes nothing returns boolean
    if ( not ( udg_random == 21 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func023C takes nothing returns boolean
    if ( not ( udg_random == 22 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func024C takes nothing returns boolean
    if ( not ( udg_random == 23 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func025C takes nothing returns boolean
    if ( not ( udg_random == 24 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func026C takes nothing returns boolean
    if ( not ( udg_random == 25 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func027C takes nothing returns boolean
    if ( not ( udg_random == 26 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func028C takes nothing returns boolean
    if ( not ( udg_random == 27 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func029C takes nothing returns boolean
    if ( not ( udg_random == 28 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func030C takes nothing returns boolean
    if ( not ( udg_random == 29 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func031C takes nothing returns boolean
    if ( not ( udg_random == 30 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func032C takes nothing returns boolean
    if ( not ( udg_random == 31 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func033003001001002 takes nothing returns boolean
    return ( GetPlayerSlotState(GetOwningPlayer(GetFilterUnit())) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_banshi_spawn_Actions takes nothing returns nothing
    set udg_random=GetRandomInt(1, 31)
    if ( Trig_banshi_spawn_Func002C() ) then
        call CreateNUnitsAtLoc(1, 'nltl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func003C() ) then
        call CreateNUnitsAtLoc(1, 'nssp', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func004C() ) then
        call CreateNUnitsAtLoc(1, 'nfrl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func005C() ) then
        call CreateNUnitsAtLoc(1, 'ndtt', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func006C() ) then
        call CreateNUnitsAtLoc(1, 'nwlt', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func007C() ) then
        call CreateNUnitsAtLoc(1, 'nmrm', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func008C() ) then
        call CreateNUnitsAtLoc(1, 'nsts', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func009C() ) then
        call CreateNUnitsAtLoc(1, 'nslf', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func010C() ) then
        call CreateNUnitsAtLoc(1, 'nslr', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func011C() ) then
        call CreateNUnitsAtLoc(1, 'nenp', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func012C() ) then
        call CreateNUnitsAtLoc(1, 'nmmu', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func013C() ) then
        call CreateNUnitsAtLoc(1, 'npfl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func014C() ) then
        call CreateNUnitsAtLoc(1, 'ngnv', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func015C() ) then
        call CreateNUnitsAtLoc(1, 'ngno', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func016C() ) then
        call CreateNUnitsAtLoc(1, 'ngns', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func017C() ) then
        call CreateNUnitsAtLoc(1, 'nomg', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func018C() ) then
        call CreateNUnitsAtLoc(1, 'nogl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func019C() ) then
        call CreateNUnitsAtLoc(1, 'nith', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func020C() ) then
        call CreateNUnitsAtLoc(1, 'nspd', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func021C() ) then
        call CreateNUnitsAtLoc(1, 'nnwa', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func022C() ) then
        call CreateNUnitsAtLoc(1, 'nplb', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func023C() ) then
        call CreateNUnitsAtLoc(1, 'ntkh', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func024C() ) then
        call CreateNUnitsAtLoc(1, 'ntkw', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func025C() ) then
        call CreateNUnitsAtLoc(1, 'ntkc', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func026C() ) then
        call CreateNUnitsAtLoc(1, 'nwen', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func027C() ) then
        call CreateNUnitsAtLoc(1, 'nwna', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func028C() ) then
        call CreateNUnitsAtLoc(1, 'nsc3', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func029C() ) then
        call CreateNUnitsAtLoc(1, 'nfpt', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func030C() ) then
        call CreateNUnitsAtLoc(1, 'nanw', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func031C() ) then
        call CreateNUnitsAtLoc(1, 'nbdm', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    if ( Trig_banshi_spawn_Func032C() ) then
        call CreateNUnitsAtLoc(1, 'nfod', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING)
    else
    endif
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_hideandseekall, Condition(function Trig_banshi_spawn_Func033003001001002)))))
endfunction

//===========================================================================
function InitTrig_banshi_spawn takes nothing returns nothing
    set gg_trg_banshi_spawn=CreateTrigger()
    call DisableTrigger(gg_trg_banshi_spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_banshi_spawn, 4.00)
    call TriggerAddAction(gg_trg_banshi_spawn, function Trig_banshi_spawn_Actions)
endfunction

//===========================================================================
// Trigger: banshi attack
//===========================================================================
function Trig_banshi_attack_Func001A takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnumUnit(), "attack", GetRandomLocInRect(gg_rct_hideandseekall))
endfunction

function Trig_banshi_attack_Actions takes nothing returns nothing
    call ForGroupBJ(GetUnitsInRectOfPlayer(gg_rct_hideandseekall, Player(11)), function Trig_banshi_attack_Func001A)
endfunction

//===========================================================================
function InitTrig_banshi_attack takes nothing returns nothing
    set gg_trg_banshi_attack=CreateTrigger()
    call DisableTrigger(gg_trg_banshi_attack)
    call TriggerRegisterTimerEventPeriodic(gg_trg_banshi_attack, 24.00)
    call TriggerAddAction(gg_trg_banshi_attack, function Trig_banshi_attack_Actions)
endfunction

//===========================================================================
// Trigger: parody ini start
//===========================================================================
function Trig_parody_ini_start_Func003A takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'odkt', GetEnumPlayer(), PolarProjectionBJ(GetRectCenter(gg_rct________________081), 256, ( 45.00 * I2R(GetConvertedPlayerId(GetEnumPlayer())) )), ( 180.00 + ( 45.00 * I2R(GetConvertedPlayerId(GetEnumPlayer())) ) ))
    call ClearSelectionForPlayer(GetEnumPlayer())
    call SelectUnitForPlayerSingle(GetLastCreatedUnit(), GetEnumPlayer())
    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct________________081), 0)
    set udg_is_casted[GetConvertedPlayerId(GetEnumPlayer())]=true
endfunction

function Trig_parody_ini_start_Actions takes nothing returns nothing
    call TriggerSleepAction(0.30)
    set udg_parody_game=true
    call ForForce(udg_players_group, function Trig_parody_ini_start_Func003A)
    call CreateNUnitsAtLoc(1, 'odkt', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________082), bj_UNIT_FACING)
    set udg_parody_main=GetLastCreatedUnit()
    set udg_parody_time=5.00
    call TriggerSleepAction(0.30)
    call TriggerExecute(gg_trg_parodys_set_cast)
    call EnableTrigger(gg_trg_parodys_cast)
endfunction

//===========================================================================
function InitTrig_parody_ini_start takes nothing returns nothing
    set gg_trg_parody_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_parody_ini_start, function Trig_parody_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: parodys set cast
//===========================================================================
function Trig_parodys_set_cast_Func002Func001Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_parodys_set_cast_Func002Func001Func003Func001Func001A takes nothing returns nothing
    call KillUnit(GetEnumUnit())
endfunction

function Trig_parodys_set_cast_Func002Func001Func003Func001C takes nothing returns boolean
    if ( not ( udg_is_casted[GetConvertedPlayerId(GetEnumPlayer())] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func003A takes nothing returns nothing
    if ( Trig_parodys_set_cast_Func002Func001Func003Func001C() ) then
        call ForGroupBJ(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'odkt'), function Trig_parodys_set_cast_Func002Func001Func003Func001Func001A)
    else
    endif
    set udg_is_casted[GetConvertedPlayerId(GetEnumPlayer())]=false
endfunction

function Trig_parodys_set_cast_Func002Func001Func006C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func007C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003001001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003001002 takes nothing returns boolean
    return ( IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_players_group) == true )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003001 takes nothing returns boolean
    return GetBooleanAnd(Trig_parodys_set_cast_Func002Func001Func008Func001001003001001(), Trig_parodys_set_cast_Func002Func001Func008Func001001003001002())
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'odkt' )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003 takes nothing returns boolean
    return GetBooleanAnd(Trig_parodys_set_cast_Func002Func001Func008Func001001003001(), Trig_parodys_set_cast_Func002Func001Func008Func001001003002())
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001A takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'hfoo', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRandomLocInRect(gg_rct________________082), bj_UNIT_FACING)
endfunction

function Trig_parodys_set_cast_Func002Func001Func008C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func009C takes nothing returns boolean
    if ( not ( udg_parody_time > 0.30 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001C takes nothing returns boolean
    if ( not ( udg_parody_game == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_parodys_cast)
    set udg_k=1
    loop
        exitwhen udg_k > 100
        if ( Trig_parodys_set_cast_Func002Func001C() ) then
            call TriggerSleepAction(udg_parody_time)
            call ForGroupBJ(GetUnitsOfPlayerAndTypeId(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'hfoo'), function Trig_parodys_set_cast_Func002Func001Func002A)
            call ForForce(udg_players_group, function Trig_parodys_set_cast_Func002Func001Func003A)
            call TriggerExecute(gg_trg_parody_dies)
            set udg_random=GetRandomInt(1, 3)
            if ( Trig_parodys_set_cast_Func002Func001Func006C() ) then
                call IssueImmediateOrderBJ(udg_parody_main, "stomp")
                set udg_parody_spell='A03Q'
            else
            endif
            if ( Trig_parodys_set_cast_Func002Func001Func007C() ) then
                call IssueImmediateOrderBJ(udg_parody_main, "starfall")
                set udg_parody_spell='A03S'
            else
            endif
            if ( Trig_parodys_set_cast_Func002Func001Func008C() ) then
                call ForGroupBJ(GetUnitsInRangeOfLocMatching(999.00, GetRectCenter(gg_rct________________082), Condition(function Trig_parodys_set_cast_Func002Func001Func008Func001001003)), function Trig_parodys_set_cast_Func002Func001Func008Func001A)
                call IssueTargetOrderBJ(udg_parody_main, "chainlightning", GetLastCreatedUnit())
                set udg_parody_spell='A03R'
            else
            endif
            if ( Trig_parodys_set_cast_Func002Func001Func009C() ) then
                set udg_parody_time=( udg_parody_time - 0.30 )
            else
            endif
        else
        endif
        set udg_k=udg_k + 1
    endloop
endfunction

//===========================================================================
function InitTrig_parodys_set_cast takes nothing returns nothing
    set gg_trg_parodys_set_cast=CreateTrigger()
    call DisableTrigger(gg_trg_parodys_set_cast)
    call TriggerAddAction(gg_trg_parodys_set_cast, function Trig_parodys_set_cast_Actions)
endfunction

//===========================================================================
// Trigger: parodys cast
//===========================================================================
function Trig_parodys_cast_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'odkt' ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_cast_Conditions takes nothing returns boolean
    if ( not Trig_parodys_cast_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_cast_Func002C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() != udg_parody_spell ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_cast_Actions takes nothing returns nothing
    if ( Trig_parodys_cast_Func002C() ) then
        call KillUnit(GetSpellAbilityUnit())
    else
        set udg_is_casted[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))]=true
    endif
endfunction

//===========================================================================
function InitTrig_parodys_cast takes nothing returns nothing
    set gg_trg_parodys_cast=CreateTrigger()
    call DisableTrigger(gg_trg_parodys_cast)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_parodys_cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_parodys_cast, Condition(function Trig_parodys_cast_Conditions))
    call TriggerAddAction(gg_trg_parodys_cast, function Trig_parodys_cast_Actions)
endfunction

//===========================================================================
// Trigger: parody dies
//===========================================================================
function Trig_parody_dies_Func001Func001Func005A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_parody_dies_Func001Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) < 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Func001Func002Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetEnumUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) ) ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Func001Func002Func001C takes nothing returns boolean
    if ( not Trig_parody_dies_Func001Func002Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Func001Func002A takes nothing returns nothing
    if ( Trig_parody_dies_Func001Func002Func001C() ) then
        call DisplayTimedTextToForce(GetPlayersAll(), 15.00, ( "Победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] ) ))
        call AdjustPlayerStateBJ(( 400 + ( 40 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD)
        call DisplayTimedTextToForce(GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мини-игре: |cFFFFCD00" + I2S(( 400 + ( 40 * udg_wave ) )) ))
    else
    endif
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_parody_dies_Func001Func006A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_parody_dies_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Actions takes nothing returns nothing
    if ( Trig_parody_dies_Func001C() ) then
        call ForGroupBJ(GetUnitsOfTypeIdAll('odkt'), function Trig_parody_dies_Func001Func002A)
        call GroupClear(udg_wave_units)
        call DisableTrigger(gg_trg_parodys_set_cast)
        call DisableTrigger(gg_trg_parodys_cast)
        call ForGroupBJ(GetUnitsInRectAll(gg_rct________________082), function Trig_parody_dies_Func001Func006A)
        set udg_parody_game=false
    else
        if ( Trig_parody_dies_Func001Func001C() ) then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "TRIGSTR_3768")
            call GroupClear(udg_wave_units)
            call DisableTrigger(gg_trg_parodys_set_cast)
            call DisableTrigger(gg_trg_parodys_cast)
            call ForGroupBJ(GetUnitsInRectAll(gg_rct________________082), function Trig_parody_dies_Func001Func001Func005A)
            set udg_parody_game=false
        else
        endif
    endif
endfunction

//===========================================================================
function InitTrig_parody_dies takes nothing returns nothing
    set gg_trg_parody_dies=CreateTrigger()
    call TriggerAddAction(gg_trg_parody_dies, function Trig_parody_dies_Actions)
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_initialization()
    call InitTrig_ini_id()
    call InitTrig_game_end()
    call InitTrig_cmd_clear()
    call InitTrig_cmd_build()
    call InitTrig_cmd_time()
    call InitTrig_cmd_arena()
    call InitTrig_cmd_mode()
    call InitTrig_cmd_point()
    call InitTrig_cmd_gg()
    call InitTrig_cmd_info()
    call InitTrig_cmd_zoom()
    call InitTrig_scoreboard_ini()
    call InitTrig_scoreboard_update()
    call InitTrig_units_death()
    call InitTrig_unit_dammi()
    call InitTrig_units_leave()
    call InitTrig_unit_resources()
    call InitTrig_upgrade_def_and_dmg()
    call InitTrig_set_wave_start_main()
    call InitTrig_set_wave_timer()
    call InitTrig_set_wave_region_rotate()
    call InitTrig_set_wave_unit_spawn()
    call InitTrig_wave_units()
    call InitTrig_wave_waiting_timer()
    call InitTrig_wave_notification()
    call InitTrig_wave_end_timer()
    call InitTrig_wave_rotation()
    call InitTrig_wave_fast_arena_end()
    call InitTrig_wave_friends_on()
    call InitTrig_wave_friends_off()
    call InitTrig_wave_end_attack()
    call InitTrig_wave_end()
    call InitTrig_wave_result_rotation()
    call InitTrig_wave_castle_destr()
    call InitTrig_wave_leader_owner()
    call InitTrig_inc_ini()
    call InitTrig_inc_rotate()
    call InitTrig_inc_per_second()
    call InitTrig_inc_colour()
    call InitTrig_inc_upg()
    call InitTrig_income_effects()
    call InitTrig_Weather()
    call InitTrig_Blizzard()
    call InitTrig_Storm()
    call InitTrig_Storm_effect()
    call InitTrig_Armageddon()
    call InitTrig_Armageddon_effect()
    call InitTrig_Armageddon_effect_2()
    call InitTrig_faq()
    call InitTrig_faq_death()
    call InitTrig_building_ini()
    call InitTrig_building_selling()
    call InitTrig_building_inf()
    call InitTrig_builder_select()
    call InitTrig_builder_left()
    call InitTrig_mediv_select()
    call InitTrig_change_set()
    call InitTrig_assassin()
    call InitTrig_banshi()
    call InitTrig_ghost()
    call InitTrig_ghost_active()
    call InitTrig_ghost_del_1()
    call InitTrig_rejuvenation()
    call InitTrig_tip()
    call InitTrig_gold_for_gems()
    call InitTrig_gems_for_gold()
    call InitTrig_sea_dragon()
    call InitTrig_boss_ini_start()
    call InitTrig_boss_ini_finish()
    call InitTrig_boss_end_timer()
    call InitTrig_boss_end()
    call InitTrig_spells_check()
    call InitTrig_spell_1()
    call InitTrig_spell_2()
    call InitTrig_spell_3()
    call InitTrig_spell_4()
    call InitTrig_hunter_death()
    call InitTrig_hunter_time()
    call InitTrig_hunter_end()
    call InitTrig_zombie_ini_start()
    call InitTrig_zombie_ini_finish()
    call InitTrig_zombie_death()
    call InitTrig_zombie_spawn()
    call InitTrig_gold_ini_start()
    call InitTrig_gold_bet()
    call InitTrig_gold_result()
    call InitTrig_horse_ini_start()
    call InitTrig_horse_speed()
    call InitTrig_horse_finish()
    call InitTrig_miners_ini_start()
    call InitTrig_miners_death()
    call InitTrig_miners_explosion()
    call InitTrig_miners_set()
    call InitTrig_miners_reward()
    call InitTrig_hide_ini()
    call InitTrig_hide_stop()
    call InitTrig_hide_kill()
    call InitTrig_banshi_ini()
    call InitTrig_banshi_cast()
    call InitTrig_banshi_end()
    call InitTrig_banshi_spawn()
    call InitTrig_banshi_attack()
    call InitTrig_parody_ini_start()
    call InitTrig_parodys_set_cast()
    call InitTrig_parodys_cast()
    call InitTrig_parody_dies()
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_initialization)
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)

    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)

    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)

    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)

    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)

    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_USER)

    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(6), false)
    call SetPlayerController(Player(6), MAP_CONTROL_USER)

    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(7), false)
    call SetPlayerController(Player(7), MAP_CONTROL_USER)

    // Player 11
    call SetPlayerStartLocation(Player(11), 8)
    call ForcePlayerStartLocation(Player(11), 8)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(11), false)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_399
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerTeam(Player(5), 0)
    call SetPlayerTeam(Player(6), 0)
    call SetPlayerTeam(Player(7), 0)

    // Force: TRIGSTR_400
    call SetPlayerTeam(Player(11), 1)

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount(0, 1)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(1, 2)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(2, 2)
    call SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 3, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(3, 2)
    call SetStartLocPrio(3, 0, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 4, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(4, 2)
    call SetStartLocPrio(4, 0, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 5, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(5, 2)
    call SetStartLocPrio(5, 0, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 1, 6, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(6, 2)
    call SetStartLocPrio(6, 0, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 1, 7, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(7, 1)
    call SetStartLocPrio(7, 0, 6, MAP_LOC_PRIO_HIGH)
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 7680.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 8192.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 11776.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 8192.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 7680.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 8192.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 11776.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 8192.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("DalaranDay")
    call SetAmbientNightSound("DalaranNight")
    call SetMapMusic("Music", true, 0)
    call InitSounds()
    call CreateRegions()
    call CreateCameras()
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs658040468")
call ExecuteFunc("MIXLib___MIXLibInit")
call MainInit()

    call InitGlobals()
    call InitCustomTriggers()
    call RunInitializationTriggers()

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName("TRIGSTR_019")
    call SetMapDescription("")
    call SetPlayers(9)
    call SetTeams(9)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)

    call DefineStartLocation(0, - 6656.0, 7168.0)
    call DefineStartLocation(1, - 6656.0, 5120.0)
    call DefineStartLocation(2, - 6656.0, 3072.0)
    call DefineStartLocation(3, - 6656.0, 1024.0)
    call DefineStartLocation(4, - 6656.0, - 1024.0)
    call DefineStartLocation(5, - 6656.0, - 3072.0)
    call DefineStartLocation(6, - 6656.0, - 5120.0)
    call DefineStartLocation(7, - 6656.0, - 7168.0)
    call DefineStartLocation(8, 0.0, 0.0)

    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

//Functions for BigArrays:

function jasshelper__initstructs658040468 takes nothing returns nothing


call ExecuteFunc("s__Revive_ReviveUnit___Init___onInit")



















































call ExecuteFunc("s__RegisterNativeEvent___NativeEvent_RegisterNativeEvent___NativeEventInit___onInit")



call ExecuteFunc("s__UnitRecycler___Initializer_UnitRecycler___Init___onInit")

call ExecuteFunc("s__ResourcePreloader___S_ResourcePreloader___Init___onInit")

    call ExecuteFunc("s__BJObjectId_onInit")
endfunction

