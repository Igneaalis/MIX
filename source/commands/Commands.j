library Commands initializer Init requires String, NokladrLib, Logs
    
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
            set relaxArenaWaveTime = chatMessage
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-time ##|r, где ## - время перед началом арены от 20 до 60 сек. " + "Текущий показатель: " + GREEN + I2S(R2I(relaxArenaWaveTime)) + "|r сек.")
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
        local player p = GetTriggerPlayer()
        local integer dashIndex = -1
        local string strStartAmount = null
        local string strEndAmount = null
        local integer startAmount = -1
        local integer endAmount = -1

        if StringLength(GetEventPlayerChatString()) == 6 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point #-#|r, влияет на число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "-" + I2S(IncomeObjects_EndAmount) + "|r")
            set p = null
            return
        endif
        if p != GameOwner then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: эта команда доступна только хосту.")
            set p = null
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры.")
            set p = null
            return
        endif
        if String.count(GetEventPlayerChatString(), "-") == 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            set p = null
            return
        endif
        if String.count(GetEventPlayerChatString(), "-") > 4 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            set p = null
            return
        endif
        if String.count(GetEventPlayerChatString(), " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            set p = null
            return
        endif

        set dashIndex = String.findIndexFrom(GetEventPlayerChatString(), "-", 1)
        if String.IsSpace(SubString(GetEventPlayerChatString(), dashIndex - 1, dashIndex)) then
            set dashIndex = String.findIndexFrom(GetEventPlayerChatString(), "-", dashIndex + 1)
        endif
        set strStartAmount = SubString(GetEventPlayerChatString(), 7, dashIndex)
        set strEndAmount = SubString(GetEventPlayerChatString(), dashIndex + 1, StringLength(GetEventPlayerChatString()))
        if not String.IsRealNumber(strStartAmount) or not String.IsRealNumber(strEndAmount) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            set strStartAmount = null
            set strEndAmount = null
            set p = null
            return
        endif

        set startAmount = S2I(strStartAmount)
        set endAmount = S2I(strEndAmount)
        set strStartAmount = null
        set strEndAmount = null

        if startAmount < 0 and endAmount < 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Первое число и второе число должны быть не меньше 0.")
            set p = null
            return
        endif

        if startAmount < 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Первое число должно быть не меньше 0.")
            set p = null
            return
        endif

        if endAmount < 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Второе число должно быть не меньше 0.")
            set p = null
            return
        endif

        if startAmount > endAmount then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Первое число должно быть не больше второго.")
            set p = null
            return
        endif

        if startAmount > IncomeObjects_MaxAmount or endAmount > IncomeObjects_MaxAmount then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "(0-" + I2S(IncomeObjects_MaxAmount) + ")|r" + "-" + GREEN + "(0-" + I2S(IncomeObjects_MaxAmount) + ")|r")
            set p = null
            return
        endif

        set IncomeObjects_StartAmount = startAmount
        set IncomeObjects_EndAmount = endAmount
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point #-#|r, влияет на число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "-" + I2S(IncomeObjects_EndAmount) + "|r")

        set p = null
    endfunction

    private function Command_mgw takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local string strValue = null
        local integer value = -1

        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            set p = null
            return
        endif

        if p != GameOwner then
            set p = null
            return
        endif

        set strValue = SubString(GetEventPlayerChatString(), 5, StringLength(GetEventPlayerChatString()))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: (" + GREEN + "0|r" + "-" + GREEN + "99|r)")
            set strValue = null
            set p = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null
        
        if value < 0 or value > 99 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: (" + GREEN + "0|r" + "-" + GREEN + "99|r)")
            set p = null
            return
        endif

        set minigameWave = value
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-mgw ##|r, при ## = 1 миниигры будут каждую волну, при ## = 2 мини-игры будут каждые 2 волны, при ## = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r")

        set p = null
    endfunction

    private function Command_final takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 7, 9))
        local player p = GetTriggerPlayer()

        if StringLength(GetEventPlayerChatString()) == 6 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-final ##|r, где ## - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r")
            set p = null
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры.")
            set p = null
            return
        endif
        if p != GameOwner then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: эта команда доступна только хосту.")
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

    private function Command_uptime takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 6, 10))
        local player p = GetTriggerPlayer()
        local string hours = I2S(time[2])
        local string minutes = I2S(time[1])
        local string seconds = I2S(time[0])

        if time[1] < 10 then
            set minutes = "0" + minutes
        endif
        if time[0] < 10 then
            set seconds = "0" + seconds
        endif

        call DisplayTimedTextToPlayer(p, 0, 0, 10, hours + ":" + minutes + ":" + seconds)

        set hours = null
        set minutes = null
        set seconds = null
        set p = null
    endfunction

    private function Command_zoom takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 6, 10))
        local player p = GetTriggerPlayer()

        call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, chatMessage, 0.5)

        set p = null
    endfunction

    private function Command_cam takes nothing returns nothing
        local integer chatMessage = S2I(SubString(GetEventPlayerChatString(), 5, 9))
        local player p = GetTriggerPlayer()

        call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, chatMessage, 0.5)

        set p = null
    endfunction

    private function Command_c takes nothing returns nothing
        local player p = GetTriggerPlayer()

        if (GetLocalPlayer() == p) then
            call ClearTextMessages()
        endif

        set p = null
    endfunction

    private function Command_clear takes nothing returns nothing
        local player p = GetTriggerPlayer()

        if (GetLocalPlayer() == p) then
            call ClearTextMessages()
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
    //! runtextmacro CreateCommand("uptime")
    //! runtextmacro CreateCommand("zoom")
    //! runtextmacro CreateCommand("cam")
    //! runtextmacro CreateCommand("c")
    //! runtextmacro CreateCommand("clear")
    
    private function Init takes nothing returns nothing
        call Command_info_Init()
        call Command_time_Init()
        call Command_arena_Init()
        call Command_build_Init()
        call Command_point_Init()
        call Command_mgw_Init()
        call Command_final_Init()
        call Command_uptime_Init()
        call Command_zoom_Init()
        call Command_cam_Init()
        call Command_c_Init()
        call Command_clear_Init()
    endfunction
    
endlibrary