/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     08.11.2020 19:46       =
=============================================

initialization in game Trigger

Sets mini games' waves, players' constants and units.

*/

scope InitInGame

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

    function initialization_in_game_players takes nothing returns nothing
        local player p = GetEnumPlayer()
        local real x = GetPlayerStartLocationX(p)
        local real y = GetPlayerStartLocationY(p)
        
        call CameraSetupApplyForPlayer(true, gg_cam_logic, p, 0)
        if (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER) then
            call SetPlayerState(p, PLAYER_STATE_GIVES_BOUNTY, 1)
            call ForceAddPlayer(udg_players_group, p)
            set udg_players_name[GetConvertedPlayerId(p)] = GetPlayerName(p)
            set udg_info[GetConvertedPlayerId(p)] = true
            set udg_income_gold[GetConvertedPlayerId(p)] = 240
            set udg_income_wood[GetConvertedPlayerId(p)] = 8
            set udg_leader_kf[GetConvertedPlayerId(p)] = 1.00
            set udg_leader_wins[GetConvertedPlayerId(p)] = 0
            set udg_changeSet[GetConvertedPlayerId(p)] = 3
            call CreateUnitEx(p, 'ntav', x, y, bj_UNIT_FACING) // Таверна с расами на выбор
            call CreateUnitEx(p, 'h001', x, y, bj_UNIT_FACING) // Юнит "Выбор героя"
            call CreateUnitEx(p, 'h029', x, y, bj_UNIT_FACING) // Юнит "Не более 1 погодного эффекта в раунде"
            call AddGoldToPlayer(100, p) // Золото на выбор расы в таверне
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_all, true, false)) // Поле битвы
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_minersregion, true, false)) // Миниигра "Минёры"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_fastarena, true, false)) // Миниарена
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_horseregion, true, false)) // Миниигра "Конные бега"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_roulette, true, false)) // Миниигра "Казино"
        endif

        set p = null
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
        debug set udg_gameset_time_first = debugTimeBeforeFirstWave
        
        // Что-то связанное с минииграми
        loop
            exitwhen i > udg_mini_game_max
            if (i != 1) then
                // Если не миниигра с боссом, то
                set udg_random_log = false
                loop // Заполняем wave_mini[] рандомными, неповторяющимися числами (2, 4, 6, ..., 18) - волны, когда будут миниигры. mode = 1 (стандартный режим)
                    exitwhen udg_random_log
                    set udg_r = GetRandomInt(1, (udg_mini_game_max + 1)) // От 1 до 9 (кол-во миниигр)
                    if (initialization_in_game_wave_mini_condition()) then
                        set udg_random_log = true
                        set udg_wave_mini[i] = udg_r * 2
                    endif
                endloop
            endif
            set i = i + 1
        endloop
        
        call ForForce(bj_FORCE_ALL_PLAYERS, function initialization_in_game_players)
        
        call faq_ini() // Starts voting for faq guide

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

        set lastCreatedUnit = null
    endfunction

endscope