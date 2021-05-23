/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 18:37       =
=============================================

Расширение функционала NokladrLib

*/

library MIXLib initializer Init requires NokladrLib

    globals
        
    endglobals

    //! textmacro CreateCommand takes name
    private function Command_$name$_Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(0x00), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x01), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x02), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x03), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x04), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x05), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x06), "-$name$", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x07), "-$name$", false)
        call TriggerAddAction(t, function Command_$name$)
        set t = null
    endfunction
    //! endtextmacro

    function AddGemsToPlayer takes integer gems, player p returns nothing
        local integer lumber = gems
        call AddLumberToPlayer(lumber, p)
    endfunction

    private function Init takes nothing returns nothing
        
    endfunction

endlibrary
