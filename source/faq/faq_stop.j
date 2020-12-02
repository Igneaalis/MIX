/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
= Дата изменения:    02.12.2020 20:56       =
=============================================

faq stop Trigger

Stops voting for faq guide

*/

function faq_get_castle takes nothing returns nothing
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, GetEnumPlayer(), 0) // Resets camera angle
    call PanCameraToTimedLocForPlayer(GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0) // Focuses camera at castle you own
    call SelectUnitForPlayerSingle(GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'ntav')), GetEnumPlayer()) // Selects tavern
endfunction

function faq_stop takes nothing returns nothing
    set IsFaqActive = false // Disables faq_counter() and faq_active()
    call faq_flush() // Destroys all texttags, hides faq_dialog, reveals map
    call ForForce(udg_players_group, function faq_get_castle) // Focuses camera at castle you own
    call faq_start() // Commands and settings
endfunction