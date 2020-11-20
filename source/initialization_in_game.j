/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     08.11.2020 19:46       =
= Дата изменения:    20.11.2020 16:12       =
=============================================

initialization in game Trigger

*/

function initialization_in_game_wave_mini_condition takes nothing returns boolean
    local integer i = 0
    if (udg_random_log == true) then
        return false
    endif
    loop
        exitwhen i > 8
        if (udg_wave_mini[i] == (udg_r * 2)) then
            return false
        endif
        set i = i + 1
    endloop
    return true
endfunction

function not_IsUnitIn_id_group takes nothing returns boolean
    return (not IsUnitInGroup(GetFilterUnit(), udg_id_group))
endfunction

function initialization_in_game_set_unit_id takes nothing returns nothing
    // Opt. begin
    set udg_id = udg_id + 1
    call GroupAddUnitSimple(GetEnumUnit(), udg_id_group)
    call SetUnitUserData(GetEnumUnit(), udg_id)
    // Opt. end
endfunction

function initialization_in_game_players takes nothing returns nothing
    // Opt.begin
    call CameraSetupApplyForPlayer( true, gg_cam_logic, GetEnumPlayer(), 0 )
    if (GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(GetEnumPlayer()) == MAP_CONTROL_USER) then
        call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, GetEnumPlayer() )
        call ForceAddPlayerSimple( GetEnumPlayer(), udg_players_group )
        // TODO: Нижние переменные надо перенести в pdb
        set udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] = GetPlayerName(GetEnumPlayer())
        set udg_info[GetConvertedPlayerId(GetEnumPlayer())] = true
        set udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())] = 240
        set udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())] = 8
        set udg_leader_kf[GetConvertedPlayerId(GetEnumPlayer())] = 1.00
        set udg_leader_wins[GetConvertedPlayerId(GetEnumPlayer())] = 0
        set udg_changeSet[GetConvertedPlayerId(GetEnumPlayer())] = 3
        call CreateNUnitsAtLoc( 1, 'ntav', GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), bj_UNIT_FACING )
        call CreateNUnitsAtLoc( 1, 'h001', GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), bj_UNIT_FACING )
        call CreateNUnitsAtLoc( 1, 'h029', GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), bj_UNIT_FACING )
        call SetPlayerStateBJ( GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD, 100 )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_all )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_minersregion )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_fastarena )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_horseregion )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_roulette )
    endif
    // Opt. end
endfunction

function initialization_in_game takes nothing returns nothing
    local integer i = 0
    local integer j = 0
    local unit lastCreatedUnit = null
    set udg_gg = 15 // Финальная волна
    set udg_mini_game_max = 8 // Максимальное кол-во миниигр за игру
    set udg_wave_mini[1] = 4 // Волна с боссом
    set udg_const_point[0] = 3
    set udg_const_point[1] = 6
    set udg_gameset_time_first = 60.00 // Таймер начала до первой волны
    // Что-то связанное с минииграми
    loop
        exitwhen i > udg_mini_game_max
        if (i != 1) then
            // Если не миниигра с боссом, то
            set udg_random_log = false
            loop // Заполняем wave_mini[] рандомными, неповторяющимися числами (2, 4, 6, ..., 18) - волны, когда будут миниигры. mode = 1 (стандартный режим)
                exitwhen (udg_random_log == true) // Возможны баги
                set udg_r = GetRandomInt(1, (udg_mini_game_max + 1)) // От 1 до 9 (кол-во миниигр)
                if (initialization_in_game_wave_mini_condition()) then
                    set udg_random_log = true
                    set udg_wave_mini[i] = udg_r * 2
                endif
            endloop
        endif
        set i = i + 1
    endloop
    set udg_r = 0
    set i = 1
    loop
        // Opt. begin
        exitwhen i > CountUnitsInGroup(GetUnitsInRectAll(GetPlayableMapRect()))
        call ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function not_IsUnitIn_id_group)), function initialization_in_game_set_unit_id)
        set i = i + 1
        // Opt. end
    endloop
    
    call ForForce(bj_FORCE_ALL_PLAYERS, function initialization_in_game_players)
    
    //faq ini Trigger
    call faq_ini()

    call TriggerSleepAction(1.00)

    // Миниигра казино
    set udg_r = 0
    set i = 1
    loop
        exitwhen i > 3
        set j = 1
        loop
            exitwhen j > 5
            set udg_r = udg_r + 1
            // Opt. begin
            // 'n001' - Circle of Power
            set lastCreatedUnit = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'n001', PolarProjectionBJ(PolarProjectionBJ(GetRectCenter(gg_rct_circle), (-256.00 + (256.00 * I2R(i))), 270.00), (-256.00 + (256.00 * I2R(j))), 0), bj_UNIT_FACING)
            call SetUnitUserData(lastCreatedUnit, udg_r)
            if (ModuloInteger(udg_r, 2) == 1) then
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
            set j = j + 1
        endloop
        set i = i + 1
    endloop
endfunction
