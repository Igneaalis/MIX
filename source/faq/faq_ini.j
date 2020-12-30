/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
=============================================

Starts voting for watching FAQ

*/

function faq_voting_timer_counter takes nothing returns nothing
    local timer t = GetExpiredTimer()

    if (faq_voting_duration >= 1.00 and IsFaqActive) then // If voting exists
        call DialogSetMessage(faq_dialog, ("Посмотреть обучение (" + WHITE + R2S(faq_voting_duration) + " сек.|r)"))
        set faq_voting_duration = faq_voting_duration - 1.00
    else
        call PauseTimer(t)
        call DestroyTimer(t)
        if (IsFaqActive) then // If there are not enough votes
            call faq_stop.execute() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
        endif
    endif

    set t = null
endfunction

//===========================================================================
function faq_ini takes nothing returns nothing
    call FadeMap() // Сделать всю карту чёрной

    // ---За---
    // Плавающий текст с требуемым кол-вом голосов "За"
    set faq_tts[0] = NewTextTag((GREEN + "\"ЗА\"|r нужно " + I2S(CountPlayersInForceBJ(players) / 2)), gg_rct_guideyes, 14.00)
    
    // Плавающий текст с кол-вом голосов "За"
    set faq_tts[2] = NewTextTag(I2S(faq_vote_yes), gg_rct_guideyesvote, 10.00)

    // Кнопка подтверждения просмотра обучения
    set faq_buttons[0] = DialogAddButton(faq_dialog, "Да", 0)

    // ---Против---
    // Плавающий текст с требуемым кол-вом голосов "Против"
    set faq_tts[1] = NewTextTag((RED + "\"ПРОТИВ\"|r нужно более " + I2S(CountPlayersInForceBJ(players) / 2)), gg_rct_guideno, 14.00)

    // Плавающий текст с кол-вом голосов "Против"
    set faq_tts[3] = NewTextTag(I2S(faq_vote_no), gg_rct_guidenovote, 10.00)

    // Кнопка отклонения просмотра обучения
    set faq_buttons[1] = DialogAddButton(faq_dialog, "Нет", 0)

    static if DEBUG_MODE then
        call faq_stop.execute() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
    else
        call TimerStart(CreateTimer(), 1.00, true, function faq_voting_timer_counter) // Makes duration of voting visible in faq dialog's title
        call faq_voting_timer_counter() // First tick of timer
        call ForForce(players, function faq_show_dialog) // Shows faq dialog to all players
    endif
endfunction
