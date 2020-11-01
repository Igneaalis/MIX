/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:30       =
= Дата изменения:    01.11.2020 20:53       =
=============================================

Интерфейс внутриигровых сообщений

*/

function SetLeaveMessages takes nothing returns nothing
    local player p = GetTriggerPlayer()
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0., 0., 10., (C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r " + GOLD + "покидает игру!|r"))
    call SetPlayerTechResearchedSwap('R00J', 0, p)
    call defeat(p)
    set p = null
endfunction

function SetMessagesInit takes nothing returns nothing
	local trigger t = CreateTrigger()

    call TriggerRegisterPlayerEvent(t, Player(0x00), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x01), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x02), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x03), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x04), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x05), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x06), EVENT_PLAYER_LEAVE)
    call TriggerRegisterPlayerEvent(t, Player(0x07), EVENT_PLAYER_LEAVE)
    
    call TriggerAddAction(t, function SetLeaveMessages)
    set t = null
endfunction