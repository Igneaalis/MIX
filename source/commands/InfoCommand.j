struct InfoCommand
    static string command = "info"
    implement CommandModule

    static method run takes player p, string str returns string
        local string strValue = SubString(str, 6, StringLength(str))
        local string strResult = null
        local boolean flag = true

        if flag and StringLength(str) == 5 then
            if pdb[p].info then
                set strResult = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + GREEN + "on|r."
            else
                set strResult = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + RED + "off|r."
            endif
            set flag = false
        endif

        if flag and String.count(str, " ") != 1 then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-info|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r."
            set flag = false
        endif

        if flag and strValue == "on" then
            set pdb[p].info = true
            set strResult = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + GREEN + "on|r."
            set flag = false
        endif
        
        if flag and strValue == "off" then
            set pdb[p].info = false
            set strResult = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + RED + "off|r."
            set flag = false
        endif

        if flag then
            set strResult = RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GREEN + "on|r" + " и " + RED + "off|r."
        endif
        
        return C_DisplayTimedTextToPlayer(p, 0, 0, Commands.GetCmdDisplayTime.evaluate(), strResult)
    endmethod
endstruct