globals
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
rect gg_rct_HungryHungryKodos= null
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
trigger gg_trg_cmd_clear= null
trigger gg_trg_cmd_zoom= null
trigger gg_trg_damage_system= null
trigger gg_trg_unit_resources= null
trigger gg_trg_upgrade_def_and_dmg= null
trigger gg_trg_set_wave_start_main= null
trigger gg_trg_set_wave_timer= null
trigger gg_trg_wave_notification= null
trigger gg_trg_wave_end_timer= null
trigger gg_trg_wave_end= null
trigger gg_trg_wave_result_rotation= null
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
trigger gg_trg_Armageddon_effects= null
trigger gg_trg_faq= null
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
trigger gg_trg_wave_friends_on= null
trigger gg_trg_wave_friends_off= null
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
trigger gg_trg_gold_ini_start= null
trigger gg_trg_gold_result= null
trigger gg_trg_horse_ini_start= null
trigger gg_trg_horse_speed= null
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


//JASSHelper struct globals:

endglobals


//===========================================================================
// 
// MIX |cffffffff0.0.3|r
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
    call SetSoundDuration(gg_snd_BloodElfMageYesAttack1, 2831)
    call SetSoundChannel(gg_snd_BloodElfMageYesAttack1, 0)
    call SetSoundVolume(gg_snd_BloodElfMageYesAttack1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageYesAttack1, 1.0)
    set gg_snd_BloodElfMageYesAttack3=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageYesAttack3.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageYesAttack3, 3255)
    call SetSoundChannel(gg_snd_BloodElfMageYesAttack3, 0)
    call SetSoundVolume(gg_snd_BloodElfMageYesAttack3, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageYesAttack3, 1.0)
    set gg_snd_BloodElfMageWarcry1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageWarcry1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageWarcry1, 2843)
    call SetSoundChannel(gg_snd_BloodElfMageWarcry1, 0)
    call SetSoundVolume(gg_snd_BloodElfMageWarcry1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageWarcry1, 1.0)
    set gg_snd_BloodElfMageReady1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMageReady1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMageReady1, 3270)
    call SetSoundChannel(gg_snd_BloodElfMageReady1, 0)
    call SetSoundVolume(gg_snd_BloodElfMageReady1, - 1)
    call SetSoundPitch(gg_snd_BloodElfMageReady1, 1.0)
    set gg_snd_BloodElfMagePissed1=CreateSound("Units\\Human\\HeroBloodElf\\BloodElfMagePissed1.wav", false, false, true, 10, 10, "HeroAcksEAX")
    call SetSoundDuration(gg_snd_BloodElfMagePissed1, 6437)
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
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=BlzCreateUnitWithSkin(p, 'n009', - 4029.4, 7316.8, 270.000, 'n009')
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
    call CreateNeutralPassive()
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
    set gg_rct_HungryHungryKodos=Rect(6048.0, - 736.0, 7520.0, 736.0)
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
// Trigger: cmd zoom
//===========================================================================
function Trig_cmd_zoom_Actions takes nothing returns nothing
    call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, S2R(SubString(GetEventPlayerChatString(), 6, 13)), 1)
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
// Trigger: Armageddon effects
//===========================================================================
function Trig_Armageddon_effects_Actions takes nothing returns nothing
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
endfunction

//===========================================================================
function InitTrig_Armageddon_effects takes nothing returns nothing
    set gg_trg_Armageddon_effects=CreateTrigger()
    call TriggerAddAction(gg_trg_Armageddon_effects, function Trig_Armageddon_effects_Actions)
endfunction

//===========================================================================
// Trigger: faq
//===========================================================================
function Trig_faq_Func002A takes nothing returns nothing
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, GetEnumPlayer(), 0)
endfunction

function Trig_faq_Func018A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_centreCENTRE), 1.00)
endfunction

function Trig_faq_Func019A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func032A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_downleft), 1.00)
endfunction

function Trig_faq_Func034A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func035A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func042A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Func043A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetRectCenter(gg_rct_start3), 1.00)
endfunction

function Trig_faq_Func051A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_faq_Actions takes nothing returns nothing
    call CinematicModeBJ(true, GetPlayersAll())
    call ForForce(GetPlayersAll(), function Trig_faq_Func002A)
    call CreateNUnitsAtLoc(1, 'h01O', Player(0), GetRectCenter(gg_rct________________075), bj_UNIT_FACING)
    call DisplayTimedTextToForce(GetPlayersAll(), 12.00, "TRIGSTR_2638")
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
    call DisplayTimedTextToForce(GetPlayersAll(), 14.00, "TRIGSTR_2639")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2645", null, "TRIGSTR_2633", bj_TIMETYPE_ADD, 7.00, false)
    call TriggerSleepAction(7.00)
    call ForForce(GetPlayersAll(), function Trig_faq_Func018A)
    call ForGroupBJ(GetUnitsInRectAll(gg_rct________________075), function Trig_faq_Func019A)
    call CreateNUnitsAtLoc(1, 'n003', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING)
    set udg_faq_unit[1]=GetLastCreatedUnit()
    call SetUnitLifePercentBJ(GetLastCreatedUnit(), 10.00)
    call CreateNUnitsAtLocFacingLocBJ(1, 'ha1P', Player(0), GetRectCenter(gg_rct_centreUP), GetUnitLoc(GetLastCreatedUnit()))
    set udg_faq_unit[0]=GetLastCreatedUnit()
    call SetUnitColor(GetLastCreatedUnit(), PLAYER_COLOR_RED)
    call DisplayTimedTextToForce(GetPlayersAll(), 20.00, "TRIGSTR_2640")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2646", null, "TRIGSTR_2632", bj_TIMETYPE_ADD, 10.00, false)
    call TriggerSleepAction(2.00)
    call IssueTargetOrderBJ(udg_faq_unit[0], "attack", udg_faq_unit[1])
    call TriggerSleepAction(7.00)
    call CreateNUnitsAtLoc(1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING)
    call ForForce(GetPlayersAll(), function Trig_faq_Func032A)
    call TriggerSleepAction(1.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('n003'), function Trig_faq_Func034A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('ha1P'), function Trig_faq_Func035A)
    call DisplayTimedTextToForce(GetPlayersAll(), 16.00, "TRIGSTR_2641")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2647", null, "TRIGSTR_2634", bj_TIMETYPE_ADD, 8.00, false)
    call TriggerSleepAction(8.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "TRIGSTR_2642")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2648", null, "TRIGSTR_2635", bj_TIMETYPE_ADD, 5.00, false)
    call TriggerSleepAction(5.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('n004'), function Trig_faq_Func042A)
    call ForForce(GetPlayersAll(), function Trig_faq_Func043A)
    call CreateNUnitsAtLoc(1, 'h01O', Player(0), GetRectCenter(gg_rct_start3), bj_UNIT_FACING)
    call DisplayTimedTextToForce(GetPlayersAll(), 12.00, "TRIGSTR_2643")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2649", null, "TRIGSTR_2636", bj_TIMETYPE_ADD, 6.00, false)
    call TriggerSleepAction(6.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 16.00, "TRIGSTR_2644")
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2650", null, "TRIGSTR_2637", bj_TIMETYPE_SET, 8.00, false)
    call TriggerSleepAction(8.00)
    call ForGroupBJ(GetUnitsOfTypeIdAll('h01O'), function Trig_faq_Func051A)
    call CinematicModeBJ(false, GetPlayersAll())
endfunction

//===========================================================================
function InitTrig_faq takes nothing returns nothing
    set gg_trg_faq=CreateTrigger()
    call TriggerAddAction(gg_trg_faq, function Trig_faq_Actions)
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
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'ha0R' ) ) then
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
    return GetBooleanAnd((GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit())), (GetFilterUnit() != GetDyingUnit())) // INLINED!!
endfunction

function Trig_ghost_Func001Func001001002003 takes nothing returns boolean
    return GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), (GetBooleanAnd((GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit())), (GetFilterUnit() != GetDyingUnit())))) // INLINED!!
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
    return GetBooleanAnd((GetFilterUnit() != GetDyingUnit()), (GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit()))) // INLINED!!
endfunction

function Trig_ghost_Func001Func002001001003 takes nothing returns boolean
    return GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), (GetBooleanAnd((GetFilterUnit() != GetDyingUnit()), (GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit()))))) // INLINED!!
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
    return GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), (GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetSpellAbilityUnit()))) // INLINED!!
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
    return GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), (GetUnitTypeId(GetFilterUnit()) == 'h00Z')) // INLINED!!
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
        call DisableTrigger(gg_trg_boss_end_timer)
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
function Trig_zombie_ini_start_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_wave_friends_on)
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
endfunction

//===========================================================================
function InitTrig_zombie_ini_start takes nothing returns nothing
    set gg_trg_zombie_ini_start=CreateTrigger()
    call TriggerAddAction(gg_trg_zombie_ini_start, function Trig_zombie_ini_start_Actions)
endfunction

//===========================================================================
// Trigger: zombie ini finish
//===========================================================================
function Trig_zombie_ini_finish_Func003Func001C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetEnumDestructable()) == 'B008' ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_ini_finish_Func003A takes nothing returns nothing
    if ( Trig_zombie_ini_finish_Func003Func001C() ) then
        call RemoveDestructable(GetEnumDestructable())
    else
    endif
endfunction

function Trig_zombie_ini_finish_Func004A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_zombie_ini_finish_Actions takes nothing returns nothing
    call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    call TriggerExecute(gg_trg_wave_friends_off)
    call EnumDestructablesInRectAll(GetPlayableMapRect(), function Trig_zombie_ini_finish_Func003A)
    call ForGroupBJ(GetUnitsOfTypeIdAll('hhou'), function Trig_zombie_ini_finish_Func004A)
endfunction

//===========================================================================
function InitTrig_zombie_ini_finish takes nothing returns nothing
    set gg_trg_zombie_ini_finish=CreateTrigger()
    call TriggerAddAction(gg_trg_zombie_ini_finish, function Trig_zombie_ini_finish_Actions)
endfunction

//===========================================================================
// Trigger: horse ini start
//===========================================================================
function Trig_horse_ini_start_Func003C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func004C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(1)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func005C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(2)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func006C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(3)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func007C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(4)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func008C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(5)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func009C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(6)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func010C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(7)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func011001001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_horse_ini_start_Func011Func001002001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func011A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetUnitLoc(GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func011Func001002001001002)))), 0)
    call SetCameraTargetControllerNoZForPlayer(GetEnumPlayer(), GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'hhdl')), 0, 0, false)
endfunction

function Trig_horse_ini_start_Func014001001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_horse_ini_start_Func014Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func014Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_491", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
endfunction

function Trig_horse_ini_start_Func014A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func014Func001001002)), function Trig_horse_ini_start_Func014Func001A)
endfunction

function Trig_horse_ini_start_Func017001001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_horse_ini_start_Func017Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func017Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_1032", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
endfunction

function Trig_horse_ini_start_Func017A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func017Func001001002)), function Trig_horse_ini_start_Func017Func001A)
endfunction

function Trig_horse_ini_start_Func020001001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_horse_ini_start_Func020Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func020Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_1033", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
endfunction

function Trig_horse_ini_start_Func020A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func020Func001001002)), function Trig_horse_ini_start_Func020Func001A)
endfunction

function Trig_horse_ini_start_Func022001001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_horse_ini_start_Func022Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func022Func001A takes nothing returns nothing
    call CreateTextTagLocBJ("TRIGSTR_1034", GetUnitLoc(GetEnumUnit()), 0, 20.00, 100, 0.00, 0.00, 0)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 6.00)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 6.00)
endfunction

function Trig_horse_ini_start_Func022A takes nothing returns nothing
    call ForGroupBJ(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func022Func001001002)), function Trig_horse_ini_start_Func022Func001A)
endfunction

function Trig_horse_ini_start_Func024A takes nothing returns nothing
    call IssuePointOrderLocBJ(GetEnumUnit(), "move", PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 5568.00, 0))
endfunction

function Trig_horse_ini_start_Actions takes nothing returns nothing
    set udg_r=0
    // Я без понятия чего редактор так активно создаёт дессинхрон при цикличном спавне лошадок, посему каждому персонально. мдя.
    if ( Trig_horse_ini_start_Func003C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(0), GetRectCenter(gg_rct_horse1), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(0)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(1), GetRectCenter(gg_rct_horse2), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(1)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func005C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(2), GetRectCenter(gg_rct_horse3), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(2)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func006C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(3), GetRectCenter(gg_rct_horse4), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(3)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func007C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(4), GetRectCenter(gg_rct_horse5), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(4)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func008C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(5), GetRectCenter(gg_rct_horse6), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(5)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func009C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(6), GetRectCenter(gg_rct_horse7), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(6)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    if ( Trig_horse_ini_start_Func010C() ) then
        call CreateNUnitsAtLoc(1, 'hhdl', Player(7), GetRectCenter(gg_rct_horse8), 0.00)
        call SetUnitColor(GetLastCreatedUnit(), GetPlayerColor(Player(7)))
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_wave_units)
    else
    endif
    call ForForce(GetPlayersMatching(Condition(function Trig_horse_ini_start_Func011001001)), function Trig_horse_ini_start_Func011A)
    call TriggerSleepAction(2.00)
    call PlaySoundBJ(gg_snd_BattleNetTick)
    call ForForce(GetPlayersMatching(Condition(function Trig_horse_ini_start_Func014001001)), function Trig_horse_ini_start_Func014A)
    call TriggerSleepAction(1.00)
    call PlaySoundBJ(gg_snd_BattleNetTick)
    call ForForce(GetPlayersMatching(Condition(function Trig_horse_ini_start_Func017001001)), function Trig_horse_ini_start_Func017A)
    call TriggerSleepAction(1.00)
    call PlaySoundBJ(gg_snd_BattleNetTick)
    call ForForce(GetPlayersMatching(Condition(function Trig_horse_ini_start_Func020001001)), function Trig_horse_ini_start_Func020A)
    call TriggerSleepAction(1.00)
    call ForForce(GetPlayersMatching(Condition(function Trig_horse_ini_start_Func022001001)), function Trig_horse_ini_start_Func022A)
    call EnableTrigger(gg_trg_horse_speed)
    call ForGroupBJ(GetUnitsOfTypeIdAll('hhdl'), function Trig_horse_ini_start_Func024A)
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
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(1), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(1), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(2), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(2), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(3), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(3), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(4), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(4), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(5), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(5), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(6), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(6), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(7), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_horse_speed, Player(7), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerAddAction(gg_trg_horse_speed, function Trig_horse_speed_Actions)
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
    return GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), (IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_players_group) == true)) // INLINED!!
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'odkt' )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003 takes nothing returns boolean
    return GetBooleanAnd((GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), (IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_players_group) == true))), (GetUnitTypeId(GetFilterUnit()) == 'odkt')) // INLINED!!
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
    call InitTrig_cmd_clear()
    call InitTrig_cmd_zoom()
    call InitTrig_unit_resources()
    call InitTrig_upgrade_def_and_dmg()
    call InitTrig_income_effects()
    call InitTrig_Armageddon_effects()
    call InitTrig_faq()
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
    call InitTrig_wave_friends_on()
    call InitTrig_wave_friends_off()
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
    call InitTrig_horse_ini_start()
    call InitTrig_horse_speed()
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


    call InitGlobals()
    call InitCustomTriggers()

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

