/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     21.11.2020 21:03       =
=============================================

Shows all available commands and settings.

*/

function faq_start_timer_actions takes nothing returns nothing
    local timer t = GetExpiredTimer()

    call DestroyTimerDialog(faq_timerdialog) // Destroys timer dialog for commands and settings
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "|cFFFF0000Команда |cFFFFFFFF-info|r |cFFFF0000отключит сообщения о штрафах и мини-арене.|r")

    call DisableTrigger(gg_trg_cmd_time)
    call DisableTrigger(gg_trg_cmd_build)
    call DisableTrigger(gg_trg_cmd_mode)
    call DisableTrigger(gg_trg_cmd_point)
    call DisableTrigger(gg_trg_cmd_arena)
    
    set curWave = curWave + 1
    call Arena_Force.execute()

    set t = null
endfunction

function faq_start takes nothing returns nothing
    local timer t = CreateTimer()
    
    call TimerStart(t, settingsTimerTime, false, function faq_start_timer_actions) // After settings were set

    set faq_timerdialog = CreateTimerDialog(t) // Timer dialog in upper-left corner for commands and settings
    call TimerDialogSetTitle(faq_timerdialog, "Настройка карты") // Title of timer dialog
    call TimerDialogDisplay(faq_timerdialog, true) // Shows timer dialog

    call gameset_owner.execute() // Sets owner of game

    set t = null
endfunction

