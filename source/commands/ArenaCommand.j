struct ArenaCommand
    static string command = "arena"
    implement CommandModule

    static method run takes player p, string str returns string
        local string strValue = SubString(str, 7, StringLength(str))
        local string strResult = null
        local integer value = -1
        local boolean flag = true

        if flag and StringLength(str) == 6 then
            set strResult = GOLD + "-arena|r " + GREEN + "#|r, где " + GREEN + "#|r - длительность арены. " + "Текущий показатель: " + GREEN + I2S(R2I(arenaTimerTime)) + "|r сек."
            set flag = false
        endif

        if flag and p != GameOwner then
            set strResult = RED + "Внимание, ошибка|r: эта команда доступна только хосту."
            set flag = false
        endif

        if flag and GetTimeInSeconds() >= R2I(settingsTimerTime) then
            set strResult = RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры."
            set flag = false
        endif

        if flag and String.count(str, " ") != 1 then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-arena|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 30 до 600 сек."
            set flag = false
        endif

        if flag and not String.IsRealNumber(strValue) then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-arena|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 30 до 600 сек."
            set flag = false
        endif

        if String.IsRealNumber(strValue) then
            set value = S2I(strValue)
        endif

        if flag and (value >= 30 and value <= 600) then
            set arenaTimerTime = value
            set strResult = GOLD + "-arena|r " + GREEN + "#|r, где " + GREEN + "#|r - длительность арены. " + "Текущий показатель: " + GREEN + I2S(R2I(arenaTimerTime)) + "|r сек."
            set flag = false
        endif

        if flag then
            set strResult = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 30 до 600 сек."
        endif

        return C_DisplayTimedTextToPlayer(p, 0, 0, Commands.GetCmdDisplayTime.evaluate(), strResult)
    endmethod
endstruct