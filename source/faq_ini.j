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

function Trig_faq_ini_Copy_Func014A takes nothing returns nothing
    call DialogDisplayBJ(true, udg_faq_dialog, GetEnumPlayer())
endfunction

//===========================================================================
function faq_ini takes nothing returns nothing
    set udg_faq_status = false
    call SetDayNightModels("", "") // Сделать всю карту чёрной
    set udg_cycle_i = 0
    // Opt. begin
    call CreateTextTagLocBJ( ( "|cFF00FF00\"ЗА\"|r нужно " + I2S(( CountPlayersInForceBJ(udg_players_group) / 2 )) ), GetRectCenter(gg_rct_guideyes), 0, 14.00, 100, 100, 100, 0 )
    set udg_faq_text[0] = GetLastCreatedTextTag()
    call CreateTextTagLocBJ( ( "|cFFFF0000ПРОТИВ|r нужно более " + I2S(( CountPlayersInForceBJ(udg_players_group) / 2 )) ), GetRectCenter(gg_rct_guideno), 0, 14.00, 100, 100, 100, 0 )
    set udg_faq_text[1] = GetLastCreatedTextTag()
    // Opt. end
    set udg_faq_key[0] = DialogAddButton(udg_faq_dialog, "Да", 0)
    set udg_faq_key[1] = DialogAddButton(udg_faq_dialog, "Нет", 0)
    // Opt. begin
    call DialogSetMessageBJ(udg_faq_dialog, ("Просмотреть туториал(" + WHITE + "6 сек.|r)"))
    call TriggerSleepAction(0.10)
    call ForForce(udg_players_group, function Trig_faq_ini_Copy_Func014A)
    call TriggerExecute(gg_trg_faq_stop)
    // Opt. end
endfunction
