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
        private timerdialog td
        private integer curMinigameNumber = 0
        private timer nextWaveTimer
        
        Minigame curMinigame = 0
        force minigameActingPlayers = CreateForce()
        integer minigameNumberOfActingPlayers = 0
        group minigameUnits = CreateGroup()
        integer minigameWave = 2
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

    private function Timer_OnExpire takes nothing returns nothing
        local timer t = nextWaveTimer

        if isMinigameForceStopped == true then
            set t = null
            return
        endif

        call DestroyTimerDialog(td)
        call PauseTimer(t)
        call DestroyTimer(t)

        call minigamesShuffled[curMinigameNumber].Finish()
        set curMinigameNumber = curMinigameNumber + 1

        call ForceClear(minigameActingPlayers)
        set minigameNumberOfActingPlayers = 0
        call NextWave_Force.execute()

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

        call ForceClear(minigameActingPlayers)
        set minigameNumberOfActingPlayers = 0
        call NextWave_Force.execute()
    endfunction

    public function Force takes nothing returns nothing
        local timer t = CreateTimer()
        set isMinigameForceStopped = false
        set nextWaveTimer = t

        set WasItMinigameWave = true

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

        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, " ")
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, GOLD + "Миниигра:|r " + curMinigame.title)
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, curMinigame.description)

        call PanCameraToTimed(curMinigame.x, curMinigame.y, 0)

        call ForceClear(minigameActingPlayers)
        set minigameNumberOfActingPlayers = 0
        call ForForce(players, function AddPlayersInForce)
        call curMinigame.Fire()

        set t = null
    endfunction
    
    private function Init takes nothing returns nothing
        // set minigames[0] = HungryHungryKodos.create()
        set minigames[0] = Casino.create()

        call Shuffle.execute()
    endfunction
    
endscope