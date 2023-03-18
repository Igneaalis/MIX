struct TimeCommand
    static string command = "time"
    implement CommandModule

    static method run takes player p, string str returns string
        local string strValue = SubString(str, 6, StringLength(str))
        local string strResult = null
        local integer value = -1
        local boolean flag = true

        if flag and StringLength(str) == 5 then
            set strResult = GOLD + "-time|r " + GREEN + "#|r, где " + GREEN + "#|r - время перед началом арены. " + "Текущий показатель: " + GREEN + I2S(R2I(relaxArenaWaveTime)) + "|r сек."
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
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-time|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 20 до 60 сек."
            set flag = false
        endif

        if flag and not String.IsRealNumber(strValue) then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-time|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 20 до 60 сек."
            set flag = false
        endif

        if String.IsRealNumber(strValue) then
            set value = S2I(strValue)
        endif

        if flag and (value >= 20 and value <= 60) then
            set relaxArenaWaveTime = value
            set strResult = GOLD + "-time|r " + GREEN + "#|r, где " + GREEN + "#|r - время перед началом арены. " + "Текущий показатель: " + GREEN + I2S(R2I(relaxArenaWaveTime)) + "|r сек."
            set flag = false
        endif

        if flag then
            set strResult = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 20 до 60 сек."
        endif

        return C_DisplayTimedTextToPlayer(p, 0, 0, Commands.GetCmdDisplayTime.evaluate(), strResult)
    endmethod
endstruct