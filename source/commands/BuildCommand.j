struct BuildCommand
    static string command = "build"
    implement CommandModule

    static method run takes player p, string str returns string
        local string strValue = SubString(str, 7, StringLength(str) )
        local string strResult = null
        local boolean flag = true

        if flag and StringLength(str) == 6 then
            if IsBuildingDuringWavesAllowed then
                set strResult = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + GREEN + "on|r."
            else
                set strResult = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + RED + "off|r."
            endif
            set flag = false
        endif

        if flag and p != GameOwner then
            set strResult = RED + "Внимание, ошибка|r: эта команда доступна только хосту."
            set flag = false
        endif

        if flag and String.count(str, " ") != 1 then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-build|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r."
            set flag = false
        endif

        if flag and GetTimeInSeconds() >= R2I(settingsTimerTime) then
            set strResult = RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры."
            set flag = false
        endif

        if flag and strValue == "on" then
            set IsBuildingDuringWavesAllowed = true
            set strResult = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + GREEN + "on|r."
            set flag = false
        endif

        if flag and strValue == "off" then
            set IsBuildingDuringWavesAllowed = false
            set strResult = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + RED + "off|r."
            set flag = false
        endif
        
        if flag then
            set strResult = RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GOLD + "-build|r " + GREEN + "on|r" + " и " + RED + "off|r."
        endif

        return C_DisplayTimedTextToPlayer(p, 0, 0, Commands.GetCmdDisplayTime.evaluate(), strResult)
    endmethod
endstruct