struct DebugInfoCommand

    static method runTestCases takes Debugging debugging, player p returns nothing
        local String str = String.create()
        local Integer int = Integer.create()
        local Boolean bool = Boolean.create()

        set pdb[p].info = true
        
        call Boolean.quickAssert(pdb[p].info, true)
        set str.str = InfoCommand.run(p, "-info")
        set bool.bool = pdb[p].info
        set str.strToAssert = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + GREEN + "on|r."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#1 -info")
        call debugging.addCase(bool, "#1 -info")

        call Boolean.quickAssert(pdb[p].info, true)
        set str.str = InfoCommand.run(p, "-info off")
        set bool.bool = pdb[p].info
        set str.strToAssert = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + RED + "off|r."
        set bool.boolToAssert = false
        call debugging.addCase(str, "#2 -info off")
        call debugging.addCase(bool, "#2 -info off")

        call Boolean.quickAssert(pdb[p].info, false)
        set str.str = InfoCommand.run(p, "-info")
        set bool.bool = pdb[p].info
        set str.strToAssert = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + RED + "off|r."
        set bool.boolToAssert = false
        call debugging.addCase(str, "#3 -info")
        call debugging.addCase(bool, "#3 -info")

        call Boolean.quickAssert(pdb[p].info, false)
        set str.strToAssert = GOLD + "-info " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Показывает или скрывает сообщения о минииграх, штрафах и быстрой битве. " + GOLD + "Текущее значение: -info " + GREEN + "on|r."
        set bool.boolToAssert = true
        set str.str = InfoCommand.run(p, "-info on")
        set bool.bool = pdb[p].info
        call debugging.addCase(str, "#4 -info on")
        call debugging.addCase(bool, "#4 -info on")

        call Boolean.quickAssert(pdb[p].info, true)
        set str.strToAssert = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-info|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r."
        set bool.boolToAssert = true
        set str.str = InfoCommand.run(p, "-info  on")
        set bool.bool = pdb[p].info
        call debugging.addCase(str, "#5 -info  on")
        call debugging.addCase(bool, "#5 -info  on")

        call Boolean.quickAssert(pdb[p].info, true)
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GREEN + "on|r" + " и " + RED + "off|r."
        set bool.boolToAssert = true
        set str.str = InfoCommand.run(p, "-info onn")
        set bool.bool = pdb[p].info
        call debugging.addCase(str, "#6 -info onn")
        call debugging.addCase(bool, "#6 -info onn")

        call Boolean.quickAssert(pdb[p].info, true)
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GREEN + "on|r" + " и " + RED + "off|r."
        set bool.boolToAssert = true
        set str.str = InfoCommand.run(p, "-info offf")
        set bool.bool = pdb[p].info
        call debugging.addCase(str, "#7 -info offf")
        call debugging.addCase(bool, "#7 -info offf")
    endmethod

endstruct
