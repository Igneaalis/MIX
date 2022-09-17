struct DebugBuildCommand

    static method runTestCases takes Debugging debugging, player p returns nothing
        local String str = String.create()
        local Integer int = Integer.create()
        local Boolean bool = Boolean.create()

        set IsBuildingDuringWavesAllowed = true

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(p, "-build")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + GREEN + "on|r."
        set bool.boolToAssert = true
        call debugging.addCase(str,  "#1 -build")
        call debugging.addCase(bool, "#1 -build")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(p, "-build off")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + RED + "off|r."
        set bool.boolToAssert = false
        call debugging.addCase(str, "#2 -build off")
        call debugging.addCase(bool, "#2 -build off")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, false)
        set str.str = BuildCommand.run(p, "-build")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + RED + "off|r."
        set bool.boolToAssert = false
        call debugging.addCase(str, "#3 -build")
        call debugging.addCase(bool, "#3 -build")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, false)
        set str.str = BuildCommand.run(p, "-build on")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + GREEN + "on|r."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#4 -build on")
        call debugging.addCase(bool, "#4 -build on")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(p, "-build")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = GOLD + "-build " + GREEN + "#|r, где " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r. Разрешает или запрещает строить и улучшать юнитов во время раундов. " + GOLD + "Текущее значение: -build " + GREEN + "on|r."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#5 -build")
        call debugging.addCase(bool, "#5 -build")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(p, "-build  on")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-build|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это " + GREEN + "on|r или " + RED + "off|r."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#6 -build  on")
        call debugging.addCase(bool, "#6 -build  on")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(p, "-build onn")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GOLD + "-build|r " + GREEN + "on|r" + " и " + RED + "off|r."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#7 -build onn")
        call debugging.addCase(bool, "#7 -build onn")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(p, "-build offf")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает следующие значения: " + GOLD + "-build|r " + GREEN + "on|r" + " и " + RED + "off|r."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#8 -build offf")
        call debugging.addCase(bool, "#8 -build offf")

        call Boolean.quickAssert(IsBuildingDuringWavesAllowed, true)
        set str.str = BuildCommand.run(Player(PLAYER_NEUTRAL_PASSIVE), "-build off")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только хосту."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#9 Player(PLAYER_NEUTRAL_PASSIVE), -build off")
        call debugging.addCase(bool, "#9 Player(PLAYER_NEUTRAL_PASSIVE), -build off")

        set time[2] = time[2] + 1  // +1 hour
        call Boolean.quickAssert(GetTimeInSeconds() >= R2I(settingsTimerTime), true)
        set str.str = BuildCommand.run(Player(PLAYER_NEUTRAL_PASSIVE), "-build off")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только хосту."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#10 time[2] + 1, Player(PLAYER_NEUTRAL_PASSIVE), -build off")
        call debugging.addCase(bool, "#10 time[2] + 1, Player(PLAYER_NEUTRAL_PASSIVE), -build off")

        call Boolean.quickAssert(GetTimeInSeconds() >= R2I(settingsTimerTime), true)
        set str.str = BuildCommand.run(p, "-build off")
        set bool.bool = IsBuildingDuringWavesAllowed
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры."
        set bool.boolToAssert = true
        call debugging.addCase(str, "#11 time[2] + 1, -build off")
        call debugging.addCase(bool, "#11 time[2] + 1, -build off")

        set time[2] = time[2] - 1
    endmethod

endstruct
