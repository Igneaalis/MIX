/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
= Дата изменения:    20.11.2020 16:20       =
=============================================

faq ini Trigger

*/

function faq_counter takes nothing returns nothing
    local timer t = GetExpiredTimer()

    static if DEBUG_MODE then
        if (udg_faq_status) then
            call C_Log("faq_status = true")
        else
            call C_Log("faq_status = false")
        endif
    endif

    if (hash[StringHash("faq")].real[StringHash("counter")] >= 1 and udg_faq_status == false) then
        call DialogSetMessage(udg_faq_dialog, ("Посмотреть обучение (" + WHITE + R2S(hash[StringHash("faq")].real[StringHash("counter")]) + " сек.|r)"))
        set hash[StringHash("faq")].real[StringHash("counter")] = hash[StringHash("faq")].real[StringHash("counter")] - 1
    else
        call ForForce(udg_players_group, function faq_hide_dialog)
        call hash.remove(StringHash("faq"))
        call PauseTimer(t)
        call DestroyTimer(t)
        call faq_stop()
    endif

    set t = null
endfunction

//===========================================================================
function faq_ini takes nothing returns nothing
    local timer t = CreateTimer()

    set udg_faq_status = false
    call SetDayNightModels("", "") // Сделать всю карту чёрной
    set udg_cycle_i = 0
    // Opt. begin
    call CreateTextTagLocBJ((GREEN + "\"ЗА\"|r нужно " + I2S((CountPlayersInForceBJ(udg_players_group) / 2 ))), GetRectCenter(gg_rct_guideyes), 0, 14.00, 100, 100, 100, 0 )
    set udg_faq_text[0] = GetLastCreatedTextTag()
    call CreateTextTagLocBJ((RED + "\"ПРОТИВ\"|r нужно более " + I2S((CountPlayersInForceBJ(udg_players_group) / 2))), GetRectCenter(gg_rct_guideno), 0, 14.00, 100, 100, 100, 0 )
    set udg_faq_text[1] = GetLastCreatedTextTag()
    // Opt. end
    set udg_faq_key[0] = DialogAddButton(udg_faq_dialog, "Да", 0)
    set udg_faq_key[1] = DialogAddButton(udg_faq_dialog, "Нет", 0)
    // Opt. begin
    set hash[StringHash("faq")].real[StringHash("counter")] = 6.00
    call faq_counter()
    call TimerStart(t, 1.00, true, function faq_counter)
    call ForForce(udg_players_group, function faq_show_dialog)
    set t = null
    // Opt. end
endfunction
