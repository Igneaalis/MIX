/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 21:07       =
= Дата изменения:    20.11.2020 21:37       =
=============================================

gameset owner Trigger

*/

//===========================================================================
function gameset_owner takes nothing returns nothing
    local integer i = 0
    set udg_game_owner = null
    loop
        if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) then
            set udg_game_owner = Player(0)
        endif
        exitwhen (udg_game_owner != null or i > 7) // Может вызвать баги, не проверял
        set i = i + 1
    endloop
    call DisplayTimedTextToPlayer(udg_game_owner, 0., 0., 10., "Вы получили права " + GREEN + "владельца игры|r.")
    // Opt. begin
    if  (C_GetTimeInSeconds() < R2I(udg_gameset_time_first)) then
        if (udg_info[GetConvertedPlayerId(udg_game_owner)] == true) then
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "Настройка карты (доступно первые " + ( I2S(R2I(udg_gameset_time_first)) + " сек.)" ) ) )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_gameset_time) ) + " ) " ) + "|cFFFF0000-time xxx|r, где xxx - время перед началом нового раунда (от 20 до 60 сек.)" ) )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_wave_time) ) + " ) " ) + "|cFFFF0000-arena xxx|r. Где xxx - начальное время раунда на арене (от 60 сек. до 150 сек.)" ) )
            if (udg_building_status == true) then
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 1 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
            else
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 0 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
            endif
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( " + ( I2S(udg_const_point[0]) + ( "-" + ( I2S(udg_const_point[1]) + " ) |cFFFF0000-point ##|r." ) ) ) ) )
            call DisplayTextToForce( GetForceOfPlayer(udg_game_owner), "TRIGSTR_3812" )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_mode) ) + " ) " ) + "|cFFFF0000-mode #. |r" ) )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, "TRIGSTR_3813" )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( ( "( " + I2S(udg_gg) ) + " ) " ) + "|cFFFF0000-gg ##|r. Где ## - волна, после которой закончится игра (от 9 до " ) + ( I2S(( ( udg_mini_game_max * 2 ) + 3 )) + " )." ) ) )
        endif
    endif
endfunction

