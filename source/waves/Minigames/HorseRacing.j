scope MinigameHorseRacing initializer Init

    globals
        private constant integer horseTypeId = 'hhdl'
        private integer curPlaceNumber = 0
        private player array raceWinners[maxNumberOfPlayers]
        private timer t = CreateTimer()
    endglobals

    private function ForPlayer_ResetCamera takes nothing returns nothing
        local player p = GetEnumPlayer()

        call ClearSelectionForPlayer(p)
        call SetCameraTargetControllerNoZForPlayer(p, FirstOfGroup(GetUnitsOfPlayerAndTypeId(p, 'hhdl')), 0, 0, false)
        
        set p = null
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        call ForForce(minigameActingPlayers, function ForPlayer_ResetCamera)
    endfunction

    private function Horse_OnEnterFinish takes nothing returns nothing
        local unit horse = GetEnteringUnit()
        local player horseOwner = GetOwningPlayer(horse)
        local player curWinner
        local integer i = 0
        local integer j = 0
        local integer prize = 0

        if GetUnitTypeId(horse) != horseTypeId then
            set horse = null
            set horseOwner = null
            set curWinner = null
            return
        endif

        set curPlaceNumber = curPlaceNumber + 1
        set raceWinners[curPlaceNumber - 1] = horseOwner
        call GroupRemoveUnit(udg_wave_units, horse)
        call ForceRemovePlayer(minigameActingPlayers, horseOwner)
        set minigameNumberOfActingPlayers = minigameNumberOfActingPlayers - 1

        for i = 0 to maxNumberOfPlayers - 1
            if pdb[Player(i)].info == true then
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, "Игрок " + C_IntToColor(GetPlayerId(horseOwner)) + GetPlayerName(horseOwner) + "|r финишировал со скоростью " + GREEN + I2S(R2I(GetUnitMoveSpeed(horse))) + "|r!")
            endif
        endfor

        if CountUnitsInGroup(udg_wave_units) == 0 then
            for i = 1 to curPlaceNumber
                set curWinner = raceWinners[i - 1]
                for j = 0 to maxNumberOfPlayers - 1
                    if pdb[Player(j)].info == true then
                        call DisplayTimedTextToPlayer(Player(j), 0, 0, 10, "Место #" + GREEN + I2S(i) + "|r занимает игрок " + C_IntToColor(GetPlayerId(curWinner)) + GetPlayerName(curWinner) + "|r.")
                    endif
                endfor
                set prize = 600 - (i-1)*80
                call DisplayTimedTextToPlayer(curWinner, 0, 0, 10, "Вы получили " + GOLD + I2S(prize) + "|r золота за участие в скачках!")
                call AddGoldToPlayer(prize, curWinner)
            endfor
            call MinigameWaves_FinishMinigame.execute()
        endif

        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(horse), GetUnitY(horse)))
        call RemoveUnit(horse)

        set horse = null
        set horseOwner = null
        set curWinner = null
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local region rectRegion = CreateRegion()

        call RegionAddRect(rectRegion, gg_rct_finish)
        call TriggerRegisterEnterRegion(t, rectRegion, null)
        call TriggerAddAction(t, function Horse_OnEnterFinish)
        
        set rectRegion = null
        set t = null
    endfunction

    struct HorseRacing extends Minigame
        string title = "Конные скачки"
        string description = "От вас требуется как можно быстрее жать на клавиши \"" + GREEN + "влево|r\" и \"" + GREEN + "вправо|r\" (стрелочки на клавиатуре). Каждое нажатие увеличивает скорость лошади на 1.5 единиц вплоть до 500.\n\n" + GREEN + "Награда|r: " + GOLD + "600|r золота за первое место " + GOLD + "40|r золота за последнее место соответственно."
        real timerTime = 60.00
        real debugTimerTime = 60.00
        real x = 0
        real y = 0

        method Fire takes nothing returns nothing
            call TimerStart(t, 0.033, true, function Timer_OnTick)
            call TriggerExecute(gg_trg_horse_ini_start)
            call MinigameWaves_RemoveMinigameTimer.execute()
        endmethod

        method Finish takes nothing returns nothing
            local integer i = 0
            
            call PauseTimer(t)
            
            set curPlaceNumber = 0
            for i = 0 to maxNumberOfPlayers
                set raceWinners[i] = null
            endfor
        endmethod
    endstruct
endscope