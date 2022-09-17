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

    private function Command_$name$_Decorator takes nothing returns nothing
        call Command_$name$(GetTriggerPlayer(), GetEventPlayerChatString())
    endfunction

    private function Command_$name$_Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i
        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerChatEvent(t, Player(i), "-$name$", false)
        endfor
        call TriggerAddAction(t, function Command_$name$_Decorator)
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
