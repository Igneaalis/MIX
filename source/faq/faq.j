/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 22:46       =
= Дата изменения:    03.12.2020 13:39       =
=============================================

faq library-ish

Globals and common functions for faq

*/

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

function faq_show_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), faq_dialog, true) // Shows voting dialog
endfunction

function faq_hide_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), faq_dialog, false) // Hides voting dialog
endfunction

function faq_flush takes nothing returns nothing
    call UnfadeMap() // Unfades map
    call ForForce(udg_players_group, function faq_hide_dialog) // Hides voting dialog
    call DestroyTextTag(faq_tts[0]) // Уничтожает плавающий текст с голосами "За"
    call DestroyTextTag(faq_tts[1]) // Уничтожает плавающий текст с голосами "За"
    call DestroyTextTag(faq_tts[2]) // Уничтожает плавающий текст с голосами "Против"
    call DestroyTextTag(faq_tts[3]) // Уничтожает плавающий текст с голосами "Против"
endfunction