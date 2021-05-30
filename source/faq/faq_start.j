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
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, GOLD + "-info off|r скрывает сообщения о минииграх, штрафах и быстрой битве.")
    
    call NextWave_ForceNextWave.execute()

    set t = null
endfunction

function faq_start takes nothing returns nothing
    local timer t
    
    call StartInitTimer.execute()
    
    static if debugUnitTest then
        debug call Log("Debug unit test enabled!")
    else
        set t = CreateTimer()
        call TimerStart(t, settingsTimerTime, false, function faq_start_timer_actions) // After settings were set

        set faq_timerdialog = CreateTimerDialog(t) // Timer dialog in upper-left corner for commands and settings
        call TimerDialogSetTitle(faq_timerdialog, "Настройка карты") // Title of timer dialog
        call TimerDialogDisplay(faq_timerdialog, true) // Shows timer dialog

        call GameSetOwner_SetOwner.execute() // Sets owner of game
    endif

    set t = null
endfunction

