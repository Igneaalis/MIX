struct DebugTimeCommand

    static method runTestCases takes Debugging debugging, player p returns nothing
        local String str = String.create()
        local Integer int = Integer.create()
        local Boolean bool = Boolean.create()
        local Real r = Real.create()
        local string case = null
        local integer i = 0
        local player host = Player(0)

        set relaxArenaWaveTime = 30

        set case = "-time"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(p, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = GOLD + "-time|r " + GREEN + "#|r, где " + GREEN + "#|r - время перед началом арены. " + "Текущий показатель: " + GREEN + "30" + "|r сек."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-time  25"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-time|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 20 до 60 сек."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-time 35"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(Player(PLAYER_NEUTRAL_PASSIVE), case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только хосту."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " Player(PLAYER_NEUTRAL_PASSIVE), " + case)
        call debugging.addCase(r, "#" + I2S(i) + " Player(PLAYER_NEUTRAL_PASSIVE), " + case)

        set time[2] = time[2] + 1  // +1 hour
        call Boolean.quickAssert(GetTimeInSeconds() >= R2I(settingsTimerTime), true)
        set case = "-time 35"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = RED + "Внимание, ошибка|r: эта команда доступна только во время настройки игры."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)
        set time[2] = time[2] - 1

        set case = "-time 4O"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-time|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 20 до 60 сек."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-time 19"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 20 до 60 сек."
        set r.rToAssert = 30
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-time 20"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 30)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = GOLD + "-time|r " + GREEN + "#|r, где " + GREEN + "#|r - время перед началом арены. " + "Текущий показатель: " + GREEN + "20" + "|r сек."
        set r.rToAssert = 20
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-time 61"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 20)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 20 до 60 сек."
        set r.rToAssert = 20
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set case = "-time 60"
        set i = i + 1
        call Real.quickAssert(relaxArenaWaveTime, 20)
        set str.str = TimeCommand.run(host, case)
        set r.r = relaxArenaWaveTime
        set str.strToAssert = GOLD + "-time|r " + GREEN + "#|r, где " + GREEN + "#|r - время перед началом арены. " + "Текущий показатель: " + GREEN + "60" + "|r сек."
        set r.rToAssert = 60
        call debugging.addCase(str, "#" + I2S(i) + " " + case)
        call debugging.addCase(r, "#" + I2S(i) + " " + case)

        set host = null
    endmethod

endstruct
