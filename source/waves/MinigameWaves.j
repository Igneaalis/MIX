/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 22:32       =
=============================================

Реализация Minigame wave

*/

scope MinigameWaves initializer Init
    
    globals
        private Minigame array minigames[1]
        private Minigame array minigamesShuffled[1]
        // private Minigame array minigames[4]
        // private Minigame array minigamesShuffled[4]
        private timerdialog td
        private integer curMinigameNumber = 0
        private timer nextWaveTimer
        
        Minigame curMinigame = 0
        force minigameActingPlayers = CreateForce()
        integer minigameNumberOfActingPlayers = 0
        group minigameUnits = CreateGroup()
        integer minigameWave = 2  // if ModuloInteger(curWaveWithMinigames, minigameWave) == 0 then call MinigameWaves_Force.execute() else call Arena_Force.execute()
        boolean isMinigameForceStopped
    endglobals

    private function AddPlayersInForce takes nothing returns nothing
        call ForceAddPlayer(minigameActingPlayers, GetEnumPlayer())
        set minigameNumberOfActingPlayers = minigameNumberOfActingPlayers + 1
    endfunction

    private function Shuffle takes nothing returns nothing
        local integer i
        local integer j
        local integer random

        for i = 0 to minigames.size - 1
            set random = GetRandomInt(0, minigames.size - 1)

            set j = i - 1
            while j > -1
                if (minigamesShuffled[j] == minigames[random]) then
                    set random = GetRandomInt(0, minigames.size - 1)
                    set j = i - 1
                else
                    set j = j - 1
                endif
            endwhile

            set minigamesShuffled[i] = minigames[random]
        endfor
    endfunction

    public function RemoveMinigameTimer takes nothing returns nothing
        local timer t = nextWaveTimer

        call TimerDialogDisplay(td, false)
        call PauseTimer(t)

        set t = null
    endfunction

    public function FinishMinigame takes nothing returns nothing
        local timer t = nextWaveTimer
        set isMinigameForceStopped = true

        call DestroyTimerDialog(td)
        call PauseTimer(t)
        call DestroyTimer(t)

        call curMinigame.Finish()
        set curMinigameNumber = curMinigameNumber + 1
        set curMinigame = 0

        call ForGroup(minigameUnits, function C_RemoveEnumUnits)
        call GroupClear(minigameUnits)

        call ForceClear(minigameActingPlayers)
        set minigameNumberOfActingPlayers = 0
        call NextWave_Force.execute()
    endfunction

    private function Timer_OnExpire takes nothing returns nothing
        if isMinigameForceStopped == true then
            return
        endif

        call MinigameWaves_FinishMinigame()
    endfunction

    public function Force takes nothing returns nothing
        local timer t = CreateTimer()
        local integer i = 0

        set curWaveWithMinigames = curWaveWithMinigames + 1
        
        set isMinigameForceStopped = false
        set nextWaveTimer = t

        if curMinigameNumber >= minigames.size then
            set curMinigameNumber = 0
            call Shuffle.execute()
        endif

        set curMinigame = minigamesShuffled[curMinigameNumber]

        static if DEBUG_MODE then
            call TimerStart(t, curMinigame.debugTimerTime, false, function Timer_OnExpire)
        else
            call TimerStart(t, curMinigame.timerTime, false, function Timer_OnExpire)
        endif
        set td = CreateTimerDialog(t)
        call TimerDialogSetTitle(td, curMinigame.title) // Title of timer dialog
        call TimerDialogDisplay(td, true) // Shows timer dialog

        for i = 0 to maxNumberOfPlayers - 1
            if pdb[Player(i)].info == true then
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, GOLD + "Миниигра|r: " + curMinigame.title)
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, curMinigame.description)
            endif
        endfor

        call PanCameraToTimed(curMinigame.x, curMinigame.y, 0)

        call ForceClear(minigameActingPlayers)
        set minigameNumberOfActingPlayers = 0
        call ForForce(players, function AddPlayersInForce)
        call curMinigame.Fire()

        set t = null
    endfunction
    
    private function Init takes nothing returns nothing
        set minigames[0] = HungryHungryKodos.create()
        // set minigames[1] = Casino.create()
        // set minigames[2] = Zombies.create()
        // set minigames[3] = HorseRacing.create()

        call Shuffle.execute()
    endfunction
    
endscope