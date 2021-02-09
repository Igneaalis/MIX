/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     29.12.2020 23:58       =
=============================================

Миниигра: "Голодные кодо"

*/

scope MinigameHungryHungryKodos initializer Init

    globals
        private constant real offsetFromCenter = 550
        private constant integer kodoTypeId = 'o000'
        private constant integer pigTypeId = 'n007'
        private constant integer rabbitTypeId = 'n008'
        private constant real X = 6784
        private constant real Y = 0
        private integer playersInForce
        private real angle
        private timer t = CreateTimer()
    endglobals

    private function ForPlayer takes nothing returns nothing
        local real x = X
        local real y = Y
        local player p = GetEnumPlayer()
        local real facing = Atan2BJ(-offsetFromCenter * Sin(angle), -offsetFromCenter * Cos(angle))

        call GroupAddUnit(minigameUnits, CreateUnitEx(p, kodoTypeId, x + offsetFromCenter * Cos(angle), y + offsetFromCenter * Sin(angle), facing))
        set angle = angle + 2*bj_PI / playersInForce

        set p = null
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        local real startX = GetRandomReal(X - offsetFromCenter, X + offsetFromCenter)
        local real startY = GetRandomReal(Y - offsetFromCenter, Y + offsetFromCenter)
        local real finishX = GetRandomReal(X - offsetFromCenter, X + offsetFromCenter)
        local real finishY = GetRandomReal(Y - offsetFromCenter, Y + offsetFromCenter)
        local real facingAtFinishPoint = Atan2BJ(finishY - startY, finishX - startX)
        local unit rabbit = CreateUnitEx(Player(PLAYER_NEUTRAL_AGGRESSIVE), rabbitTypeId, startX, startY, facingAtFinishPoint)
        call GroupAddUnit(minigameUnits, rabbit)
        call IssuePointOrder(rabbit, "patrol", finishX, finishY)
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        
        // call TriggerAddAction(t, function )
        
        set t = null
    endfunction

    struct HungryHungryKodos extends Minigame
        string title = "Голодные кодо"
        string description = "Победит самый сытый кодо."
        real timerTime = 60.00
        real x = X
        real y = Y
        
        method Fire takes nothing returns nothing
            set playersInForce = CountPlayersInForceBJ(players)
            set angle = 2*bj_PI / playersInForce

            call ForForce(players, function ForPlayer)
            call TimerStart(t, 2., true, function Timer_OnTick)
        endmethod

        method Finish takes nothing returns nothing
            call PauseTimer(t)
        endmethod
    endstruct

endscope