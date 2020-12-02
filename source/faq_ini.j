/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
= Дата изменения:    02.12.2020 21:31       =
=============================================

faq ini Trigger

Starts voting for faq guide

*/

function faq_counter takes nothing returns nothing
    local timer t = GetExpiredTimer()

    if (hash[StringHash("faq")].real[StringHash("counter")] >= 1 and IsFaqActive) then // If voting exists
        call DialogSetMessage(udg_faq_dialog, ("Посмотреть обучение (" + WHITE + R2S(hash[StringHash("faq")].real[StringHash("counter")]) + " сек.|r)"))
        set hash[StringHash("faq")].real[StringHash("counter")] = hash[StringHash("faq")].real[StringHash("counter")] - 1
    else
        call PauseTimer(t)
        call DestroyTimer(t)
        call hash.remove(StringHash("faq"))
        if (IsFaqActive) then // If there are not enough votes
            call faq_stop() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
        endif
    endif

    set t = null
endfunction

//===========================================================================
function faq_ini takes nothing returns nothing
    call SetDayNightModels("", "") // Сделать всю карту чёрной

    // ---За---
    // Плавающий текст с требуемым кол-вом голосов "За"
    set udg_faq_text[0] = NewTextTag((GREEN + "\"ЗА\"|r нужно " + I2S(CountPlayersInForceBJ(udg_players_group) / 2)), gg_rct_guideyes, 14.00)
    
    // Плавающий текст с кол-вом голосов "За"
    set udg_faq_text[2] = NewTextTag(I2S(faq_vote_yes), gg_rct_guideyesvote, 10.00)

    // Кнопка подтверждения просмотра обучения
    set udg_faq_key[0] = DialogAddButton(udg_faq_dialog, "Да", 0)

    // ---Против---
    // Плавающий текст с требуемым кол-вом голосов "Против"
    set udg_faq_text[1] = NewTextTag((RED + "\"ПРОТИВ\"|r нужно более " + I2S(CountPlayersInForceBJ(udg_players_group) / 2)), gg_rct_guideno, 14.00)

    // Плавающий текст с кол-вом голосов "Против"
    set udg_faq_text[3] = NewTextTag(I2S(faq_vote_no), gg_rct_guidenovote, 10.00)

    // Кнопка отклонения просмотра обучения
    set udg_faq_key[1] = DialogAddButton(udg_faq_dialog, "Нет", 0)

    static if DEBUG_MODE then
        call faq_stop() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
    else
        set hash[StringHash("faq")].real[StringHash("counter")] = 6.00 // Duration of voting
        call TimerStart(CreateTimer(), 1.00, true, function faq_counter) // Makes duration of voting visible in faq dialog's title
        call faq_counter() // First tick of counter
        call ForForce(udg_players_group, function faq_show_dialog) // Shows faq dialog to all players
    endif
endfunction
