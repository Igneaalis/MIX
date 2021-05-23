scope Commands initializer Init
    
    globals
        
    endglobals

    private function Command_info takes nothing returns nothing
        local string chatMessage = SubString(GetEventPlayerChatString(), 6, 9)
        local player p = GetTriggerPlayer()
        if chatMessage == "on" then
            set pdb[p].info = true
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-info on|r показывает сообщения о минииграх, штрафах и быстрой битве.")
        elseif chatMessage == "off" then
            set pdb[p].info = false
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-info off|r скрывает сообщения о минииграх, штрафах и быстрой битве.")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GREEN + "on|r" + " и " + GREEN + "off|r")
        endif
        set p = null
    endfunction

    private function Command_time takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 6, 8))
        local player p = GetTriggerPlayer()
        if GetTimeInSeconds() >= R2I(settingsTimerTime) or p != GameOwner then
            set p = null
            return
        endif
        if chatMessage >= 20 and chatMessage <= 60 then
            set relaxWaveTime = chatMessage
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-time ##|r, где ## - время между раундами от 20 до 60 сек. " + "Текущий показатель: " + GREEN + I2S(R2I(relaxWaveTime)) + "|r сек.")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "20|r" + "-" + GREEN + "60|r")
        endif
        set p = null
    endfunction

    private function Command_arena takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 7, 10))
        local player p = GetTriggerPlayer()
        if GetTimeInSeconds() >= R2I(settingsTimerTime) or p != GameOwner then
            set p = null
            return
        endif
        if chatMessage >= 60 and chatMessage <= 300 then
            set arenaTimerTime = chatMessage
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-arena ###|r, где ### - длительность арены от 60 сек. до 300 сек. " + "Текущий показатель: " + GREEN + I2S(R2I(arenaTimerTime)) + "|r сек.")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "60|r" + "-" + GREEN + "300|r")
        endif
        set p = null
    endfunction

    private function Command_build takes nothing returns nothing
        local string chatMessage = SubString(GetEventPlayerChatString(), 7, 10)
        local player p = GetTriggerPlayer()
        if GetTimeInSeconds() >= R2I(settingsTimerTime) or p != GameOwner then
            set p = null
            return
        endif
        if chatMessage == "on" then
            set IsBuildingDuringWavesAllowed = true
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-build ###|r, при # = \"" + GREEN + "on|r" + "\" во время раунда можно строить и улучшать юнитов, при # = \"" + GREEN + "off|r" + "\" - нельзя. " + "Текущий показатель: " + GREEN + "on|r")
        elseif chatMessage == "off" then
            set IsBuildingDuringWavesAllowed = false
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-build ###|r, при # = \"" + GREEN + "on|r" + "\" во время раунда можно строить и улучшать юнитов, при # = \"" + GREEN + "off|r" + "\" - нельзя. " + "Текущий показатель: " + GREEN + "off|r")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GREEN + "on|r" + " и " + GREEN + "off|r")
        endif
        set p = null
    endfunction

    private function Command_point takes nothing returns nothing
        local string chatMessage = SubString(GetEventPlayerChatString(), 7, 10)
        local integer startAmount = S2I(SubString(chatMessage, 0, 1))
        local integer endAmount = S2I(SubString(chatMessage, 2, 3))
        local player p = GetTriggerPlayer()
        if GetTimeInSeconds() >= R2I(settingsTimerTime) or p != GameOwner then
            set p = null
            return
        endif
        if startAmount <= endAmount and startAmount >= 0 and startAmount <= IncomeObjects_MaxAmount and endAmount >= 0 and endAmount <= IncomeObjects_MaxAmount then
            set IncomeObjects_StartAmount = startAmount
            set IncomeObjects_EndAmount = endAmount
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point #-#|r, влияет на число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "-" + I2S(IncomeObjects_EndAmount) + "|r")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "(0-" + I2S(IncomeObjects_MaxAmount) + ")|r" + "-" + GREEN + "(0-" + I2S(IncomeObjects_MaxAmount) + ")|r")
        endif
        set p = null
    endfunction

    private function Command_mgw takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 5, 7))
        local player p = GetTriggerPlayer()
        if GetTimeInSeconds() >= R2I(settingsTimerTime) or p != GameOwner then
            set p = null
            return
        endif
        if chatMessage >= 0 and chatMessage < 100 then
            set minigameWave = chatMessage
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-mgw ##|r, при ## = 1 миниигры будут каждую волну, при ## = 2 мини-игры будут каждые 2 волны, при ## = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "0|r" + "-" + GREEN + "99|r")
        endif
        set p = null
    endfunction

    private function Command_final takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 7, 9))
        local player p = GetTriggerPlayer()
        if GetTimeInSeconds() >= R2I(settingsTimerTime) or p != GameOwner then
            set p = null
            return
        endif
        if chatMessage > 0 and chatMessage < 100 then
            set finalWave = chatMessage
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-final ##|r, где ## - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r")
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "1|r" + "-" + GREEN + "99|r")
        endif
        set p = null
    endfunction

    //! runtextmacro CreateCommand("info")
    //! runtextmacro CreateCommand("time")
    //! runtextmacro CreateCommand("arena")
    //! runtextmacro CreateCommand("build")
    //! runtextmacro CreateCommand("point")
    //! runtextmacro CreateCommand("mgw")
    //! runtextmacro CreateCommand("final")
    
    private function Init takes nothing returns nothing
        call Command_info_Init()
        call Command_time_Init()
        call Command_arena_Init()
        call Command_build_Init()
        call Command_point_Init()
        call Command_mgw_Init()
        call Command_final_Init()
    endfunction
    
endscope