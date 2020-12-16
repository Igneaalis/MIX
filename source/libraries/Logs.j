library Logs uses Colors

    // Лог сообщений
    function Log takes string s returns nothing
        debug call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, (GOLD + "Log:|r " + GREEN + s + "|r"))
    endfunction

endlibrary