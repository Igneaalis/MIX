// gg_trg_zombie_ini_start

scope MinigameZombies initializer Init

    globals
        private constant integer peasantTypeId = 'h00I'
        private constant integer barricadeTypeId = 'hhou'
        private constant integer zombieTypeId = 'nzom'
        private constant real X = 0
        private constant real Y = 0
        private integer count = 0
        private group peasants = CreateGroup()
        private timer t = CreateTimer()
    endglobals

    private function ForPlayer_AtStart takes nothing returns nothing
        local player p = GetEnumPlayer()
        local unit peasant = CreateUnitEx(p, peasantTypeId, X + GetRandomInt(-450, 450), Y + GetRandomInt(-450, 450), bj_UNIT_FACING)

        call GroupAddUnit(minigameUnits, peasant)
        call GroupAddUnit(peasants, peasant)

        call ClearSelectionForPlayer(p)
        call SelectUnitForPlayerSingle(peasant, p)

        call SetPlayerTechMaxAllowedSwap(barricadeTypeId, 20, p)

        set p = null
        set peasant = null
    endfunction

    private function ForDeadPlayer_SwitchAllianceOff takes nothing returns nothing
        call SetPlayerAllianceBJ(GetOwningPlayer(GetDyingUnit()), ALLIANCE_PASSIVE, false, GetEnumPlayer())
        call SetPlayerAllianceBJ(GetEnumPlayer(), ALLIANCE_PASSIVE, false, GetOwningPlayer(GetDyingUnit()))
    endfunction

    private function ForPlayer_SwitchAllianceOffTowardPlayer11 takes nothing returns nothing
        call SetPlayerAllianceBJ(Player(11), ALLIANCE_PASSIVE, false, GetEnumPlayer())
        call SetPlayerAllianceBJ(GetEnumPlayer(), ALLIANCE_PASSIVE, false, Player(11))
    endfunction

    private function RewardWinner takes player winner returns nothing
        call AddGoldToPlayer(325 + curWave * 35, winner)
    endfunction

    private function RewardAllWinners takes nothing returns nothing
        call AddGoldToPlayer(235 + curWave * 30, GetEnumPlayer())
    endfunction

    private function RewardAllPlayers takes nothing returns nothing
        call AddGoldToPlayer(150 + curWave * 25, GetEnumPlayer())
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        local unit zombie
        local unit randomPeasant
        set count = count + 1
        if count > 8 - numberOfPlayers then
            set count = 0
            set zombie = CreateUnitEx(Player(11), zombieTypeId, X + GetRandomInt(-4000, 4000), Y + GetRandomInt(-4000, 4000), GetRandomReal(1, 360))
            call GroupAddUnit(minigameUnits, zombie)
            set randomPeasant = GroupPickRandomUnit(peasants)
            call IssuePointOrder(zombie, "attack", GetUnitX(randomPeasant), GetUnitY(randomPeasant))
        endif
        set zombie = null
        set randomPeasant = null
    endfunction

    private function Peasant_OnDeath takes nothing returns nothing
        local unit peasant = GetDyingUnit()
        local unit zombie
        local unit randomPeasant

        if GetUnitTypeId(peasant) != peasantTypeId then
            set peasant = null
            set zombie = null
            set randomPeasant = null
            return
        endif

        call GroupRemoveUnit(peasants, peasant)
        call ForceRemovePlayer(minigameActingPlayers, GetOwningPlayer(peasant))
        set minigameNumberOfActingPlayers = minigameNumberOfActingPlayers - 1

        if CountUnitsInGroup(peasants) == 0 then
            call MinigameWaves_FinishMinigame.execute()
            set peasant = null
            set zombie = null
            set randomPeasant = null
            return
        endif

        call ForForce(players, function ForDeadPlayer_SwitchAllianceOff)
        call SetPlayerAllianceBJ(GetOwningPlayer(peasant), ALLIANCE_PASSIVE, true, Player(11))
        call SetPlayerAllianceBJ(Player(11), ALLIANCE_PASSIVE, true, GetOwningPlayer(peasant))

        set zombie = CreateUnitEx(GetOwningPlayer(peasant), zombieTypeId, GetUnitX(peasant), GetUnitY(peasant), GetRandomReal(1, 360))
        call SetUnitColor(peasant, GetPlayerColor(GetOwningPlayer(peasant)))
        call UnitAddAbility(zombie, 'A00U')  // Свечение (герой)
        call UnitAddAbility(zombie, 'A00V')  // Свечение (нормальное)
        call GroupAddUnit(minigameUnits, zombie)
        set randomPeasant = GroupPickRandomUnit(peasants)
        call IssuePointOrder(zombie, "attack", GetUnitX(randomPeasant), GetUnitY(randomPeasant))

        set peasant = null
        set zombie = null
        set randomPeasant = null
    endfunction

    private function StartZombieSpawn takes nothing returns nothing
        call DestroyTimer(GetExpiredTimer())
        call TimerStart(t, 1, true, function Timer_OnTick)
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        
        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerAddAction(t, function Peasant_OnDeath)
        
        set t = null
    endfunction

    struct Zombies extends Minigame
        string title = "Зомби"
        string description = "На следующей волне вам предстоит выживать против нескончаемых орд зомби."
        real timerTime = 150.00
        real debugTimerTime = 90.00
        real x = 0
        real y = 0

        method Fire takes nothing returns nothing
            call TriggerExecute(gg_trg_wave_friends_on)
            call FadeMap()
            call TriggerExecute(gg_trg_zombie_ini_start)
            call ForForce(players, function ForPlayer_AtStart)
            call TimerStart(CreateTimer(), 30, false, function StartZombieSpawn)
            set count = 0
        endmethod

        method Finish takes nothing returns nothing
            local player winner
            local string message = ""
            local integer i = 0

            call PauseTimer(t)
            call UnfadeMap()
            call TriggerExecute(gg_trg_wave_friends_off)
            call ForForce(players, function ForPlayer_SwitchAllianceOffTowardPlayer11)
            if CountUnitsInGroup(peasants) > 1 then
                call ForForce(minigameActingPlayers, function RewardAllWinners)
                set message = GREEN + "ВЫЖИЛИ!|r\nВсе выжившие получили " + GOLD + I2S(235 + curWave * 30) + "|r золота!"
            elseif CountUnitsInGroup(peasants) == 1 then
                set winner = GetOwningPlayer(FirstOfGroup(peasants))
                call RewardWinner(winner)
                set message = GREEN + "ВЫЖИЛ!|r\nОставшись последним выжившим человеком, " + C_IntToColor(GetPlayerId(winner)) + GetPlayerName(winner) + "|r получает " + GOLD + I2S(325 + curWave * 35) + "|r золота!"
            else
                call ForForce(players, function RewardAllPlayers)
                set message = RED + "ЗОМБИ-АПОКАЛИПСИС!|r\nВсе игроки получили " + GOLD + I2S(150 + curWave * 25) + "|r золота!"
            endif
            call TriggerExecute(gg_trg_zombie_ini_finish)

            for i = 0 to maxNumberOfPlayers - 1
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, message)
            endfor

            call GroupClear(peasants)
            set winner = null
        endmethod
    endstruct
endscope