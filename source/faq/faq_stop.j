/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
=============================================

faq stop Trigger

Stops voting for faq guide

*/

function faq_get_castle takes nothing returns nothing
    local player p = GetEnumPlayer()
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0) // Resets camera angle
    call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own
    call SelectUnitForPlayerSingle(GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(p, 'ntav')), p) // Selects tavern
    set p = null
endfunction

function faq_stop takes nothing returns nothing
    set IsFaqActive = false // Disables faq_counter() and faq_active()
    call faq_flush() // Destroys all texttags, hides faq_dialog, reveals map
    call ForForce(udg_players_group, function faq_get_castle) // Focuses camera at castle you own
    call faq_start() // Commands and settings
endfunction