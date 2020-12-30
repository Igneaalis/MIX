/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 22:46       =
=============================================

FAQ library-ish

Globals and shared functions for FAQ

*/

library FAQ uses NokladrLib

    globals
        boolean IsFaqActive = true // Disables faq_counter() and faq_active() if false
        timerdialog faq_timerdialog // Timer dialog in upper-left corner for commands and settings
        integer faq_vote_yes = 0 // Голосов "За"
        integer faq_vote_no = 0 // Голосов "Против"
        real faq_voting_duration = 6.00 // Duration of voting
        texttag array faq_tts[4] // Плавающий текст для отображения голосования
        button array faq_buttons[2] // Кнопки в меню голосования
        dialog faq_dialog = DialogCreate() // Меню с голосованием
    endglobals

    function faq_get_castle takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0) // Resets camera angle
        call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own
        call SelectUnitAddForPlayer(GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(p, 'ntav')), p) // Selects tavern
        call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, 100)
        
        set p = null
    endfunction

    function faq_show_dialog takes nothing returns nothing
        call DialogDisplay(GetEnumPlayer(), faq_dialog, true) // Shows voting dialog
    endfunction

    function faq_hide_dialog takes nothing returns nothing
        call DialogDisplay(GetEnumPlayer(), faq_dialog, false) // Hides voting dialog
    endfunction

    function faq_flush takes nothing returns nothing
        call UnfadeMap() // Unfades map
        call ForForce(players, function faq_hide_dialog) // Hides voting dialog
        call DestroyTextTag(faq_tts[0]) // Уничтожает плавающий текст с голосами "За"
        call DestroyTextTag(faq_tts[1]) // Уничтожает плавающий текст с голосами "За"
        call DestroyTextTag(faq_tts[2]) // Уничтожает плавающий текст с голосами "Против"
        call DestroyTextTag(faq_tts[3]) // Уничтожает плавающий текст с голосами "Против"
    endfunction

endlibrary