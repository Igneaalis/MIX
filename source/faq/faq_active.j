/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     21.11.2020 21:02       =
=============================================

faq active Trigger

Voting for viewing faq guide.

*/

scope FaqActive initializer Init

    private function onFinish takes nothing returns nothing
        // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
        call faq_stop.execute()
    endfunction

    function faq_active_condition takes nothing returns boolean
        // Disables faq_counter() and faq_active() if false
        return IsFaqActive
    endfunction

    function faq_active takes nothing returns nothing
        if (GetClickedButton() == faq_buttons[0]) then // Кнопка "Да"
            set faq_vote_yes = faq_vote_yes + 1 // Голосов "За"
            call SetTextTagText(faq_tts[2], I2S(faq_vote_yes), TextTagSize2Height(10.00)) // Плавающий текст с кол-вом голосов "За"
            if (faq_vote_yes >= (CountPlayersInForceBJ(players) / 2)) then // Если голосов "За" 1/1, 1/2, 1/3, 2/4, 2/5, 3/6, 3/7, 4/8 
                set IsFaqActive = false // Disables faq_counter() and faq_active()
                call faq_flush.execute() // Destroys all texttags, hides faq_dialog, reveals map
                call TriggerAddAction(gg_trg_faq, function onFinish)
                call TriggerExecute(gg_trg_faq)
            endif
        else // Кнопка "Нет"
            set faq_vote_no = faq_vote_no + 1 // Голосов "Против"
            call SetTextTagText(faq_tts[3], I2S(faq_vote_no), TextTagSize2Height(10.00)) // Плавающий текст с кол-вом голосов "Против"
            if (faq_vote_no > (CountPlayersInForceBJ(players) / 2)) then  // Если голосов "За" 1/1, 2/2, 2/3, 3/4, 3/5, 4/6, 4/7, 5/8 
                call onFinish.execute()
            endif
        endif
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        // Triggers if faq_dialog's buttons were clicked
        call TriggerRegisterDialogEvent(t, faq_dialog)
        call TriggerAddAction(t, function faq_active)
        call TriggerAddCondition(t, Condition(function faq_active_condition))

        set t = null
    endfunction

endscope