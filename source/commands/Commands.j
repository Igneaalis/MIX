scope Commands initializer Init
    
    globals
        
    endglobals

    private function Command_info takes nothing returns nothing
        local string chatMessage = SubString(GetEventPlayerChatString(), 6, 9)
        local player p = GetTriggerPlayer()
        if chatMessage == "on" then
            set pdb[p].info = true
        elseif chatMessage == "off" then
            set pdb[p].info = false
        else
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED+ "Внимание, ошибка|r: данная команда принимает следующие значения: " + GREEN + "on|r" + " и " + GREEN + "off|r")
        endif
        set p = null
    endfunction

    //! runtextmacro CreateCommand("info")
    
    private function Init takes nothing returns nothing
        call Command_info_Init()
    endfunction
    
endscope