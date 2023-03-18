library Commands initializer Init requires String, NokladrLib, Logs, Table

    globals
        private real cmdDisplayTime = 10
    endglobals

    private function Command_point takes player p, string eventString returns nothing
        local integer dashIndex = -1
        local string strStartAmount = null
        local string strEndAmount = null
        local integer startAmount = -1
        local integer endAmount = -1

        if StringLength(eventString) == 6 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point|r " + GREEN + "#|r-" + GREEN +"#|r, где " + GREEN + "#|r-" + GREEN + "#|r - число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "|r-" + GREEN + I2S(IncomeObjects_EndAmount) + "|r.")
            return
        endif
        if p != GameOwner then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: эта команда доступна только хосту.")
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры.")
            return
        endif
        if String.count(eventString, "-") == 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            return
        endif
        if String.count(eventString, "-") > 4 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            return
        endif
        if String.count(eventString, " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            return
        endif

        set dashIndex = String.findIndexFrom(eventString, "-", 1)
        if String.IsSpace(SubString(eventString, dashIndex - 1, dashIndex)) then
            set dashIndex = String.findIndexFrom(eventString, "-", dashIndex + 1)
        endif
        set strStartAmount = SubString(eventString, 7, dashIndex)
        set strEndAmount = SubString(eventString, dashIndex + 1, StringLength(eventString))
        if not String.IsRealNumber(strStartAmount) or not String.IsRealNumber(strEndAmount) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-point|r " + GREEN + "#|r-" + GREEN + "#|r\nГде " + GREEN + "#|r - число.")
            set strStartAmount = null
            set strEndAmount = null
            return
        endif

        set startAmount = S2I(strStartAmount)
        set endAmount = S2I(strEndAmount)
        set strStartAmount = null
        set strEndAmount = null

        if startAmount < 0 and endAmount < 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Первое число и второе число должны быть не меньше 0.")
            return
        endif

        if startAmount < 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Первое число должно быть не меньше 0.")
            return
        endif

        if endAmount < 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Второе число должно быть не меньше 0.")
            return
        endif

        if startAmount > endAmount then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Первое число должно быть не больше второго.")
            return
        endif

        if startAmount > IncomeObjects_MaxAmount or endAmount > IncomeObjects_MaxAmount then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает значения из следующего диапазона: " + GREEN + "0-" + I2S(IncomeObjects_MaxAmount) + "|r" + "-" + GREEN + "0-" + I2S(IncomeObjects_MaxAmount) + "|r.")
            return
        endif

        set IncomeObjects_StartAmount = startAmount
        set IncomeObjects_EndAmount = endAmount
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-point|r " + GREEN + "#|r-" + GREEN +"#|r, где " + GREEN + "#|r-" + GREEN + "#|r - число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "|r-" + GREEN + I2S(IncomeObjects_EndAmount) + "|r.")
    endfunction

    private function Command_mgw takes player p, string eventString returns nothing
        local string strValue = null
        local integer value = -1

        if StringLength(eventString) == 4 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-mgw|r " + GREEN + "#|r, при " + GREEN + "#|r = 1 миниигры будут каждую волну, при " + GREEN + "#|r = 2 миниигры будут каждые 2 волны, при " + GREEN + "#|r = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r.")
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            return
        endif
        if p != GameOwner then
            return
        endif
        if String.count(eventString, " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-mgw|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 0 до 100.")
            return
        endif

        set strValue = SubString(eventString, 5, StringLength(eventString))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-mgw|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 0 до 100.")
            set strValue = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null
        
        if value < 0 or value > 100 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 0 до 100.")
            return
        endif

        set minigameWave = value
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-mgw|r " + GREEN + "#|r, при " + GREEN + "#|r = 1 миниигры будут каждую волну, при " + GREEN + "#|r = 2 миниигры будут каждые 2 волны, при " + GREEN + "#|r = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r.")
    endfunction

    private function Command_final takes player p, string eventString returns nothing
        local string strValue = null
        local integer value = -1

        if StringLength(eventString) == 6 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-final|r " + GREEN + "#|r, где " + GREEN + "#|r - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r.")
            return
        endif
        if GetTimeInSeconds() >= R2I(settingsTimerTime) then
            return
        endif
        if p != GameOwner then
            return
        endif
        if String.count(eventString, " ") != 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-final|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 1 до 100.")
            return
        endif

        set strValue = SubString(eventString, 7, StringLength(eventString))
        if not String.IsRealNumber(strValue) then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 1 до 100.")
            set strValue = null
            return
        endif

        set value = S2I(strValue)
        set strValue = null
        
        if value < 1 or value > 99 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 1 до 100.")
            return
        endif

        set finalWave = value
        call DisplayTimedTextToPlayer(p, 0, 0, 10, GOLD + "-final|r " + GREEN + "#|r, где " + GREEN + "#|r - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r.")
    endfunction

    private function Command_runtestcases takes player p, string eventString returns nothing
        local Debugging debugging = Debugging.create()

        call DebugInfoCommand.runTestCases(debugging, p)
        call DebugBuildCommand.runTestCases(debugging, p)
        call DebugTimeCommand.runTestCases(debugging, p)
        call DebugArenaCommand.runTestCases(debugging, p)
        
        call debugging.getResults()
        call debugging.getFailedResults()
    endfunction

    struct Commands
        static method GetCmdDisplayTime takes nothing returns real
            return cmdDisplayTime
        endmethod

        static method SetCmdDisplayTime takes real time returns nothing
            set cmdDisplayTime = time
        endmethod
    endstruct

    //! runtextmacro CreateCommand("point")
    //! runtextmacro CreateCommand("mgw")
    //! runtextmacro CreateCommand("final")
    //! runtextmacro CreateCommand("runtestcases")
    
    private function Init takes nothing returns nothing
        call Command_point_Init()
        call Command_mgw_Init()
        call Command_final_Init()
        call Command_runtestcases_Init()
    endfunction
    
endlibrary