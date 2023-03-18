struct DebugArenaCommand

    static method runTestCases takes Debugging debugging, player p returns nothing
        local String str = String.create()
        local Integer int = Integer.create()
        local Boolean bool = Boolean.create()
        local Real r = Real.create()
        local string case = null
        local integer i = 0
        local player host = Player(0)

        set arenaTimerTime = 120

        set case = "-arena"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(p, case)
        set r.r = arenaTimerTime
        set str.strToAssert = GOLD + "-arena|r " + GREEN + "#|r, где " + GREEN + "#|r - длительность арены. " + "Текущий показатель: " + GREEN + "120" + "|r сек."
        set r.rToAssert = 120
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-arena  33"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-arena|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 30 до 600 сек."
        set r.rToAssert = 120
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-arena 35"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(Player(PLAYER_NEUTRAL_PASSIVE), case)
        set r.r = arenaTimerTime
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только хосту."
        set r.rToAssert = 120
        call debugging.addCase(str, "#" + I2S(i) + " Player(PLAYER_NEUTRAL_PASSIVE), " + case)
        call debugging.addCase(r, "#" + I2S(i) + " Player(PLAYER_NEUTRAL_PASSIVE), " + case)

        set time[2] = time[2] + 1  // +1 hour
        call Boolean.quickAssert(GetTimeInSeconds() >= R2I(settingsTimerTime), true)
        set case = "-arena  33"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры."
        set r.rToAssert = 120
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)
        set time[2] = time[2] - 1

        set case = "-arena 4O"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-arena|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 30 до 600 сек."
        set r.rToAssert = 120
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-arena 29"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 30 до 600 сек."
        set r.rToAssert = 120
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-arena 30"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 120)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = GOLD + "-arena|r " + GREEN + "#|r, где " + GREEN + "#|r - длительность арены. " + "Текущий показатель: " + GREEN + "30" + "|r сек."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-arena 601"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 30)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 30 до 600 сек."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-arena 600"
        set i = i + 1
        call Real.quickAssert(arenaTimerTime, 30)
        set str.str = ArenaCommand.run(host, case)
        set r.r = arenaTimerTime
        set str.strToAssert = GOLD + "-arena|r " + GREEN + "#|r, где " + GREEN + "#|r - длительность арены. " + "Текущий показатель: " + GREEN + "600" + "|r сек."
        set r.rToAssert = 600
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set host = null
    endmethod

endstruct
