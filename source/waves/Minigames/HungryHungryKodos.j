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
        private constant integer prizeGoldInitial = 250
        private constant integer prizeGoldPerWave = 30
        private constant integer prizePointsInitial = 10
        private constant integer prizePointsPerWave = 5
        private real angle
        private boolean IsMinigameFinished
        private timer t = CreateTimer()
        private string playerList = ""
    endglobals

    private function RewardWinner takes player winner returns nothing
        local integer i = 0
        local integer prizeGoldTotal = prizeGoldInitial + prizeGoldPerWave * curWave
        local integer prizePointsTotal = prizePointsInitial + prizePointsPerWave * curWave

        for i = 0 to maxNumberOfPlayers - 1
            call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, "Дольше всех смог прокормить своего кодоя игрок " + C_IntToColor(GetPlayerId(winner)) + GetPlayerName(winner) + "|r. Он получил за это " + GOLD + I2S(prizeGoldTotal) + "|r золота и " + RED + I2S(prizePointsTotal) + "|r очков!")
        endfor
        call AddGoldToPlayer(prizeGoldTotal, winner)
        set pdb[winner].points = pdb[winner].points + prizePointsTotal
    endfunction

    private function RewardAllRemainingPlayers_ForForce takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer prizeGoldTotal = prizeGoldInitial + prizeGoldPerWave * curWave
        local integer prizePointsTotal = prizePointsInitial + prizePointsPerWave * curWave

        set playerList = playerList + C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r "
        call AddGoldToPlayer(prizeGoldTotal / minigameNumberOfActingPlayers, p)
        set pdb[p].points = pdb[p].points + prizePointsTotal / minigameNumberOfActingPlayers

        set p = null
    endfunction

    private function RewardAllRemainingPlayers takes nothing returns nothing
        local integer i = 0
        local integer prizeGoldTotal = prizeGoldInitial + prizeGoldPerWave * curWave
        local integer prizePointsTotal = prizePointsInitial + prizePointsPerWave * curWave
        set playerList = ""

        call ForForce(minigameActingPlayers, function RewardAllRemainingPlayers_ForForce)

        for i = 0 to maxNumberOfPlayers - 1
            call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, "Дольше всех смогли прокормить своего кодоя игроки: " + playerList +  "Они получили за это " + GOLD + I2S(prizeGoldTotal / minigameNumberOfActingPlayers) + "|r золота и " + RED + I2S(prizePointsTotal / minigameNumberOfActingPlayers) + "|r очков!")
        endfor
    endfunction

    private function ForPlayer takes nothing returns nothing
        local real x = X
        local real y = Y
        local player p = GetEnumPlayer()
        local real facing = Atan2BJ(-offsetFromCenter * Sin(angle), -offsetFromCenter * Cos(angle))

        call GroupAddUnit(minigameUnits, CreateUnitEx(p, kodoTypeId, x + offsetFromCenter * Cos(angle), y + offsetFromCenter * Sin(angle), facing))
        set angle = angle + 2*bj_PI / minigameNumberOfActingPlayers

        set p = null
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        local real startX = GetRandomReal(X - offsetFromCenter, X + offsetFromCenter)
        local real startY = GetRandomReal(Y - offsetFromCenter, Y + offsetFromCenter)
        local real finishX = GetRandomReal(X - offsetFromCenter, X + offsetFromCenter)
        local real finishY = GetRandomReal(Y - offsetFromCenter, Y + offsetFromCenter)
        local real facingAtFinishPoint = Atan2BJ(finishY - startY, finishX - startX)
        local unit animal
        if GetRandomInt(1, 3) == 3 then
            set animal = CreateUnitEx(Player(PLAYER_NEUTRAL_AGGRESSIVE), pigTypeId, startX, startY, facingAtFinishPoint)
        else
            set animal = CreateUnitEx(Player(PLAYER_NEUTRAL_AGGRESSIVE), rabbitTypeId, startX, startY, facingAtFinishPoint)
        endif
        call GroupAddUnit(minigameUnits, animal)
        call IssuePointOrder(animal, "patrol", finishX, finishY)
        set animal = null
    endfunction

    private function Kodo_OnTick takes unit u, unit target, real lifeRegeneration returns nothing
        local integer tickRate = 12
        call TriggerSleepAction(0)
        while not IsUnitDeadBJ(target) and not IsMinigameFinished and GetUnitAbilityLevel(u, 'Bdvv') > 0
            call SetWidgetLife(u, GetWidgetLife(u) + lifeRegeneration / tickRate)
            call TriggerSleepAction(1 / tickRate)
        endwhile
    endfunction

    private function Kodo_OnEat takes nothing returns nothing
        local unit kodo = GetTriggerUnit()
        local unit animal = GetSpellTargetUnit()

        if GetUnitTypeId(kodo) != 'o000' then
            set kodo = null
            set animal = null
            return
        endif

        if GetUnitTypeId(animal) == rabbitTypeId then
            call Kodo_OnTick.execute(kodo, animal, 35)
        endif

        if GetUnitTypeId(animal) == pigTypeId then
            call Kodo_OnTick.execute(kodo, animal, 100)
        endif

        set kodo = null
        set animal = null
    endfunction

    private function Kodo_OnDeath takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local unit kodo
        local player kodoOwner
        local player winner

        if GetUnitTypeId(u) != kodoTypeId then
            set kodo = null
            set u = null
            return
        endif

        set kodo = u
        set kodoOwner = GetOwningPlayer(kodo)

        if minigameNumberOfActingPlayers == 1 then  // If player is the last man standing
            set winner = kodoOwner
            set IsMinigameFinished = true
            call RewardWinner(winner)
            call PauseTimer(t)
            call MinigameWaves_FinishMinigame.execute()
            set kodo = null
            set kodoOwner = null
            set winner = null
            return
        endif

        call ForceRemovePlayer(minigameActingPlayers, kodoOwner)
        set minigameNumberOfActingPlayers = minigameNumberOfActingPlayers - 1

        if minigameNumberOfActingPlayers == 1 then
            set winner = ForcePickRandomPlayer(minigameActingPlayers)
            set IsMinigameFinished = true
            call RewardWinner(winner)
            call PauseTimer(t)
            call MinigameWaves_FinishMinigame.execute()
        endif

        set u = null
        set kodo = null
        set kodoOwner = null
        set winner = null
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
        call TriggerAddAction(t, function Kodo_OnEat)

        set t = CreateTrigger()

        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerAddAction(t, function Kodo_OnDeath)
        
        set t = null
    endfunction

    struct HungryHungryKodos extends Minigame
        string title = "Голодные кодо"
        string description = "Победят только живые кодо."
        real timerTime = 60.00
        real debugTimerTime = 40.00
        real x = X
        real y = Y
        
        method Fire takes nothing returns nothing
            set angle = 2*bj_PI / minigameNumberOfActingPlayers

            call ForForce(players, function ForPlayer)
            call TimerStart(t, 3., true, function Timer_OnTick)
            set IsMinigameFinished = false
            call DisableTrigger(DDS)
        endmethod

        method Finish takes nothing returns nothing
            call PauseTimer(t)
            call EnableTrigger(DDS)
            if IsMinigameFinished == false then
                if minigameNumberOfActingPlayers > 1 then
                    call RewardAllRemainingPlayers()
                else
                    call RewardWinner(ForcePickRandomPlayer(minigameActingPlayers))
                endif
            endif
        endmethod
    endstruct

endscope