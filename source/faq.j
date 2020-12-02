/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 22:46       =
= Дата изменения:    02.12.2020 21:33       =
=============================================

faq library-ish

Globals and common functions for faq

*/

globals
    boolean IsFaqActive = true // Disables faq_counter() and faq_active() if false
    timerdialog faq_timerdialog // Timer dialog in upper-left corner for commands and settings
    integer faq_vote_yes = 0 // Голосов "За"
    integer faq_vote_no = 0 // Голосов "Против"
endglobals

function faq_show_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), udg_faq_dialog, true) // Shows voting dialog
endfunction

function faq_hide_dialog takes nothing returns nothing
    call DialogDisplay(GetEnumPlayer(), udg_faq_dialog, false) // Hides voting dialog
endfunction

function faq_flush takes nothing returns nothing
    // Unfades map
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")

    call ForForce(udg_players_group, function faq_hide_dialog) // Hides voting dialog
    call DestroyTextTagBJ(udg_faq_text[0]) // Уничтожает плавающий текст с голосами "За"
    call DestroyTextTagBJ(udg_faq_text[1]) // Уничтожает плавающий текст с голосами "За"
    call DestroyTextTagBJ(udg_faq_text[2]) // Уничтожает плавающий текст с голосами "Против"
    call DestroyTextTagBJ(udg_faq_text[3]) // Уничтожает плавающий текст с голосами "Против"
endfunction