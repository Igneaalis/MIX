library Commands initializer Init requires String, NokladrLib, Logs, Table

    globals
        private real cmdDisplayTime = 10
    endglobals

    private function Command_point takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local integer dashIndex = -1
        local string strStartAmount = null
        local string strEndAmount = null
        local integer startAmount = -1
        local integer endAmount = -1

        if StringLength(GetEventPlayerChatString()) == 6 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point|r " + GREEN + "#|r-" + GREEN +"#|r, где " + GREEN + "#|r-" + GREEN + "#|r - число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "|r-" + GREEN + I2S(IncomeObjects_EndAmount) + "|r.")
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
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "0-" + I2S(IncomeObjects_MaxAmount) + "|r" + "-" + GREEN + "0-" + I2S(IncomeObjects_MaxAmount) + "|r.")
            set p = null
            return
        endif

        set IncomeObjects_StartAmount = startAmount
        set IncomeObjects_EndAmount = endAmount
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point|r " + GREEN + "#|r-" + GREEN +"#|r, где " + GREEN + "#|r-" + GREEN + "#|r - число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "|r-" + GREEN + I2S(IncomeObjects_EndAmount) + "|r.")

        set p = null
    endfunction

    private function Command_mgw takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local string strValue = null
        local integer value = -1

        if StringLength(GetEventPlayerChatString()) == 4 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-mgw|r " + GREEN + "#|r, при " + GREEN + "#|r = 1 миниигры будут каждую волну, при " + GREEN + "#|r = 2 миниигры будут каждые 2 волны, при " + GREEN + "#|r = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r.")
            set p = null
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            set p = null
            return
        endif
        if p != GameOwner then
            set p = null
            return
        endif
        if String.count(GetEventPlayerChatString(), " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-mgw|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 0 до 100.")
            set p = null
            return
        endif

        set strValue = SubString(GetEventPlayerChatString(), 5, StringLength(GetEventPlayerChatString()))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-mgw|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 0 до 100.")
            set strValue = null
            set p = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null
        
        if value < 0 or value > 100 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 0 до 100.")
            set p = null
            return
        endif

        set minigameWave = value
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-mgw|r " + GREEN + "#|r, при " + GREEN + "#|r = 1 миниигры будут каждую волну, при " + GREEN + "#|r = 2 миниигры будут каждые 2 волны, при " + GREEN + "#|r = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r.")

        set p = null
    endfunction

    private function Command_final takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local string strValue = null
        local integer value = -1

        if StringLength(GetEventPlayerChatString()) == 6 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-final|r " + GREEN + "#|r, где " + GREEN + "#|r - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r.")
            set p = null
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            set p = null
            return
        endif
        if p != GameOwner then
            set p = null
            return
        endif
        if String.count(GetEventPlayerChatString(), " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-final|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 1 до 100.")
            set p = null
            return
        endif

        set strValue = SubString(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 1 до 100.")
            set strValue = null
            set p = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null
        
        if value < 1 or value > 99 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 1 до 100.")
            set p = null
            return
        endif

        set finalWave = value
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-final|r " + GREEN + "#|r, где " + GREEN + "#|r - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r.")

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
        local player p = GetTriggerPlayer()
        local string strValue = null
        local integer value = -1

        if String.count(GetEventPlayerChatString(), " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-zoom|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 300 до 15000")
            set p = null
            return
        endif

        set strValue = SubString(GetEventPlayerChatString(), 6, StringLength(GetEventPlayerChatString()))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: от 300 до 15000")
            set strValue = null
            set p = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null

        if value < 300 or value > 15000 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: от 300 до 15000")
            set p = null
            return
        endif

        call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, value, 0.5)

        set p = null
    endfunction

    private function Command_cam takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local string strValue = null
        local integer value = -1

        if String.count(GetEventPlayerChatString(), " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-zoom|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 300 до 15000")
            set p = null
            return
        endif

        set strValue = SubString(GetEventPlayerChatString(), 5, StringLength(GetEventPlayerChatString()))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: от 300 до 15000")
            set strValue = null
            set p = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null

        if value < 300 or value > 15000 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: от 300 до 15000")
            set p = null
            return
        endif

        call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, value, 0.5)

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

    private function Command_runtestcases takes player p, string eventString returns nothing
        local Debugging debugging = Debugging.create()

        call DebugInfoCommand.runTestCases(debugging, p)
        call DebugBuildCommand.runTestCases(debugging, p)
        call DebugTimeCommand.runTestCases(debugging, p)
        call DebugArenaCommand.runTestCases(debugging, p)
        
        call debugging.getResults()
        call debugging.getFailedResults()

        set p = null
    endfunction

    struct Commands
        static method GetCmdDisplayTime takes nothing returns real
            return cmdDisplayTime
        endmethod

        static method SetCmdDisplayTime takes real time returns nothing
            set cmdDisplayTime = time
        endmethod
    endstruct

    // //! runtextmacro CreateCommand("point")
    // //! runtextmacro CreateCommand("mgw")
    // //! runtextmacro CreateCommand("final")
    // //! runtextmacro CreateCommand("uptime")
    // //! runtextmacro CreateCommand("zoom")
    // //! runtextmacro CreateCommand("cam")
    // //! runtextmacro CreateCommand("c")
    // //! runtextmacro CreateCommand("clear")
    //! runtextmacro CreateCommand("runtestcases")
    
    private function Init takes nothing returns nothing
        // call Command_point_Init()
        // call Command_mgw_Init()
        // call Command_final_Init()
        // call Command_uptime_Init()
        // call Command_zoom_Init()
        // call Command_cam_Init()
        // call Command_c_Init()
        // call Command_clear_Init()
        call Command_runtestcases_Init()
    endfunction
    
endlibrary