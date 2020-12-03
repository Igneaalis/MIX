/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     21.11.2020 21:03       =
= Дата изменения:    03.12.2020 13:39       =
=============================================

faq start Trigger

Shows all available commands and settings.

*/

function faq_start_timer_actions takes nothing returns nothing
    call gameset_end()
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "|cFFFF0000Команда |cFFFFFFFF-info|r |cFFFF0000отключит сообщения о штрафах и мини-арене.|r")
    call DestroyTimerDialog(faq_timerdialog) // Destroys timer dialog for commands and settings
endfunction

function faq_start takes nothing returns nothing
    debug set udg_gameset_time_first = 30.00
    call TimerStart(udg_gameset_timer, udg_gameset_time_first, false, function faq_start_timer_actions) // After settings were set

    set faq_timerdialog = CreateTimerDialog(udg_gameset_timer) // Timer dialog in upper-left corner for commands and settings
    call TimerDialogSetTitle(faq_timerdialog, "Настройка карты") // Title of timer dialog
    call TimerDialogDisplay(faq_timerdialog, true) // Shows timer dialog

    call gameset_owner() // Sets owner of game
    call TriggerExecute(gg_trg_scoreboard_ini) // Shows scoreboard
endfunction

