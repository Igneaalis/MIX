/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     29.12.2020 23:58       =
=============================================

Миниигра: "Голодные кодо"

*/

scope MinigameHungryHungryKodos

    globals
        private constant real offset = 550
        private constant integer kodoTypeId = 'o000'
        private constant integer pigTypeId = 'n007'
        private constant integer rabbitTypeId = 'n008'
        private integer playersInForce
        private real angle
    endglobals

    private function ForPlayer takes nothing returns nothing
        local real x = 6784
        local real y = 0
        local player p = GetEnumPlayer()
        local real facing = Atan2BJ(-offset * Sin(angle), -offset * Cos(angle))

        call GroupAddUnit(minigameUnits, CreateUnitEx(p, kodoTypeId, x + offset * Cos(angle), y + offset * Sin(angle), facing))
        set angle = angle + 2*bj_PI / playersInForce

        set p = null
    endfunction

    struct HungryHungryKodos extends Minigame
        string title = "Голодные кодо"
        string description = "Постарайтесь прокормить своего кодо как можно дольше."
        real timerTime = 60.00
        real x = 6784
        real y = 0
        
        method Fire takes nothing returns nothing
            set playersInForce = CountPlayersInForceBJ(players)
            set angle = 2*bj_PI / playersInForce

            call ForForce(players, function ForPlayer)
        endmethod

        method Finish takes nothing returns nothing
            
        endmethod
    endstruct

endscope