/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:30       =
=============================================

Интерфейс внутриигровых сообщений

*/

function OnLeave takes nothing returns nothing
    local unit u = GetEnumUnit()
    if (GetUnitTypeId(u) != 'hhdl' and GetUnitTypeId(u) != 'n001') then
        // Opt. begin
        if (IsUnitInGroup(u, udg_wave_units) == true) then
            call GroupRemoveUnitSimple(u, udg_wave_units)
        endif
        if (IsUnitInGroup(u, udg_buildings) == true) then
            call GroupRemoveUnitSimple(u, udg_buildings)
        endif
        // Opt. end
        call RemoveUnit(u)
    else
        call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
    endif
    set u = null
endfunction

function SetLeaveMessages takes nothing returns nothing
    local player p = GetTriggerPlayer()
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0., 0., 10., (C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r " + GOLD + "покидает игру!|r"))
    call SetPlayerTechResearchedSwap('R00J', 0, p)
    set pdb[p].scoreboard_result = 0
    // Opt. begin
    call ForGroup(GetUnitsOfPlayerMatching(p, null), function OnLeave)
    call ForceRemovePlayerSimple( GetTriggerPlayer(), udg_players_group )
    if (p == udg_game_owner) then
        call gameset_owner()
    endif
    call MultiboardSetItemValueBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetTriggerPlayer()) ), ( "|cFF9B9B9B" + udg_players_name[GetConvertedPlayerId(GetTriggerPlayer())] ) )
    call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetTriggerPlayer()) ), "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNReplay-Loop.blp" )
    // Opt. end
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