/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
=============================================

Stops voting for watching FAQ

*/

function faq_stop takes nothing returns nothing
    set IsFaqActive = false // Disables faq_counter() and faq_active()
    call faq_flush.execute() // Destroys all texttags, hides faq_dialog, reveals map
    call ForForce(players, function faq_get_castle) // Focuses camera at castle you own
    call faq_start.execute() // Commands and settings
endfunction