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

    function AddGemsToPlayer takes integer gems, player p returns nothing
        local integer lumber = gems
        call AddLumberToPlayer(lumber, p)
    endfunction

    private function Init takes nothing returns nothing
        
    endfunction

endlibrary
