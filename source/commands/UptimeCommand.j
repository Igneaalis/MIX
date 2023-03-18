struct UptimeCommand
    static string command = "uptime"
    implement CommandModule

    static method run takes player p, string str returns string
        local string hours = I2S(time[2])
        local string minutes = I2S(time[1])
        local string seconds = I2S(time[0])

        if time[1] < 10 then
            set minutes = "0" + minutes
        endif
        if time[0] < 10 then
            set seconds = "0" + seconds
        endif

        return C_DisplayTimedTextToPlayer(p, 0, 0, 10, hours + ":" + minutes + ":" + seconds)
    endmethod
endstruct