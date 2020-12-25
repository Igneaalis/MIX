/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 21:07       =
=============================================

gameset owner Trigger

Sets owner of game.
Shows all available commands and settings
Owner can modify game settings.

*/

//===========================================================================
function gameset_owner takes nothing returns nothing
    local integer i = 0
    set udg_game_owner = null // Game owner
    loop // Sets game owner to a first available player
        if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) then // Must be playing player
            set udg_game_owner = Player(0)
        endif
        exitwhen (udg_game_owner != null or i > 7) // TODO: test
        set i = i + 1
    endloop

    static if not DEBUG_MODE then
        // Notification for game owner
        call DisplayTimedTextToPlayer(udg_game_owner, 0, 0, 10, "Вы получили права " + GREEN + "владельца игры|r.")
    endif

    // Opt. begin
    if  (GetTimeInSeconds() < R2I(udg_gameset_time_first)) then // Shows commands and settings only at game start
        if (udg_info[GetConvertedPlayerId(udg_game_owner)] == true) then // Checks Info flag of game owner
            static if not DEBUG_MODE then
                // Shows all available commands and settings
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "Настройка карты (доступно первые " + ( I2S(R2I(udg_gameset_time_first)) + " сек.)" ) ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_gameset_time) ) + " ) " ) + "|cFFFF0000-time xxx|r, где xxx - время перед началом нового раунда (от 20 до 60 сек.)" ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_wave_time) ) + " ) " ) + "|cFFFF0000-arena xxx|r. Где xxx - начальное время раунда на арене (от 60 сек. до 150 сек.)" ) )
                if (udg_building_status == true) then
                    call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 1 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
                else
                    call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 0 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
                endif
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( " + ( I2S(udg_const_point[0]) + ( "-" + ( I2S(udg_const_point[1]) + " ) |cFFFF0000-point ##|r." ) ) ) ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, "Первый # - минимальное число контрольных точек, появляющихся на арене. Второй # - максимальное число контрольных точек, оно не может превышать первый номер, а также число 9." )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_mode) ) + " ) " ) + "|cFFFF0000-mode #. |r" ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, "Если # = 1, то мини-игры будут чередоваться каждую вторую волну.\nЕсли # = 2, то мини-игр не будет совсем.\nЕсли # = 3, то мини-игры буду каждые 3 волны." )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( ( "( " + I2S(udg_gg) ) + " ) " ) + "|cFFFF0000-gg ##|r. Где ## - волна, после которой закончится игра (от 9 до " ) + ( I2S(( ( udg_mini_game_max * 2 ) + 3 )) + " )." ) ) )
            endif

        endif
    endif
    // Opt. end
endfunction

