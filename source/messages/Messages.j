/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:30       =
=============================================

Интерфейс внутриигровых сообщений

*/

scope Messages initializer Init

    private function ForUnits_OnLeave takes nothing returns nothing
        local unit u = GetEnumUnit()

        if (GetUnitTypeId(u) != 'hhdl' and GetUnitTypeId(u) != 'n001') then
            // Opt. begin
            if (IsUnitInGroup(u, waveUnits) == true) then
                call GroupRemoveUnit(waveUnits, u)
            endif
            if (IsUnitInGroup(u, buildings) == true) then
                call GroupRemoveUnit(buildings, u)
            endif
            // Opt. end
            call RemoveUnitEx(u)
        else
            call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
        endif

        set u = null
    endfunction

    private function OnLeave takes nothing returns nothing
        local player p = GetTriggerPlayer()

        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, (C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r " + GOLD + "покидает игру!|r"))
        call SetPlayerTechResearched(p, 'R00J', 0)
        call ForGroup(GetUnitsOfPlayerMatching(p, null), function ForUnits_OnLeave)
        call ForceRemovePlayer(players, p)
        if (p == GameOwner) then
            call GameSetOwner_SetOwner.execute()
        endif

        set mb[p].name = GRAY + GetPlayerName(p) + "|r"
        set mb[p].icon = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNReplay-Loop.blp"

        call defeat.execute(p)

        set p = null
    endfunction

    private function OnInit takes nothing returns nothing
        local string strTestWarning_RU  // Предупреждение к тестовому типу карты
        local string strWarning_RU      // Предупреждение к тестовому типу карты
        local string strVar_RU          // Итоговое сообщение о типе карты
        local string Feedback_RU        // Сообщение об обратной связи с создателями карты

        // Аналогично, но только по-английски.
        local string strTestWarning_EN
        local string strWarning_EN
        local string strVar_EN
        local string Feedback_EN

        local integer i


        static if (not DEBUG_MODE) then
            // Отображает strVar_** в зависимости от типа карты
            set strTestWarning_RU = "В данной версии вы можете увидеть десинхронизацию, баги, неправильную работу способностей и ошиКБи в словах."
            set strWarning_RU = (RED + "Внимание:|r " + "вы играете в " + Version + " версию " + strVersion + ". ")
            set strTestWarning_EN = "In this version you can experience desyncs, bugs, and miTSakes in localization."
            set strWarning_EN = (RED + "Caution:|r " + "you are playing in " + Version + " version " + strVersion + ". ")
            if (Version == "Test") then
                set strVar_RU = strWarning_RU + strTestWarning_RU + "\n "
                set strVar_EN = strWarning_EN + strTestWarning_EN + "\n "
            elseif (Version == "Release") then
                set strVar_RU = "Вы играете в " + GREEN + "стабильную|r " + strVersion + " версию.\n "
                set strVar_EN = "You are playing in " + GREEN + "stable|r " + strVersion + " version.\n "
            endif
            if (Locale.evaluate() == "RU") then
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_RU)
            else
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_EN)
            endif

            // Сообщение об обратной связи
            set Feedback_RU = "Связь со мной: " + strEmail + " и Discord: " + strDiscord + "\n "
            set Feedback_EN = "My contacts: " + strEmail + " and Discord: " + strDiscord + "\n "
            if (Locale.evaluate() == "RU") then
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_RU)
            else
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_EN)
            endif

            // Условие: один из разработчиков в игре?
            for i = 0 to maxNumberOfPlayers - 1
                if (GetPlayerName(Player(i)) == "Nokladr" or GetPlayerName(Player(i)) == "Nokladr#2429") then
                    if (Locale.evaluate() == "RU") then
                        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("С вами играет создатель данной карты, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Критика приветствуется :)\n "))
                    else
                        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("You are playing with author, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Any feedback is welcome :)\n "))
                    endif
                    set IsDevInGame = true
                endif
            endfor
        endif
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerEvent(t, Player(0x00), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x01), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x02), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x03), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x04), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x05), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x06), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x07), EVENT_PLAYER_LEAVE)
        call TriggerAddAction(t, function OnLeave)

        call OnInit.execute()

        set t = null
    endfunction

endscope