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
        private integer curMinigame = 0

        private constant real debugMinigameTimerTime = 30.00
        group minigameUnits = CreateGroup()
        integer minigameWave = 2
    endglobals

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
        local timer t = GetExpiredTimer()

        call DestroyTimerDialog(td)
        call PauseTimer(t)
        call DestroyTimer(t)

        call minigamesShuffled[curMinigame].Finish()
        set curMinigame = curMinigame + 1

        call NextWave_Force.execute()

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local timer t = CreateTimer()
        local Minigame minigame

        if curMinigame >= minigames.size then
            set curMinigame = 0
            call Shuffle.execute()
        endif

        set minigame = minigamesShuffled[curMinigame]

        static if DEBUG_MODE then
            call TimerStart(t, debugMinigameTimerTime, false, function Timer_OnExpire)
        else
            call TimerStart(t, minigame.timerTime, false, function Timer_OnExpire)
        endif
        set td = CreateTimerDialog(t)
        call TimerDialogSetTitle(td, minigame.title) // Title of timer dialog
        call TimerDialogDisplay(td, true) // Shows timer dialog

        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, " ")
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, GOLD + "Миниигра:|r " + minigame.title)
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, minigame.description)

        call PanCameraToTimed(minigame.x, minigame.y, 0)

        call minigame.Fire()

        set t = null
    endfunction
    
    private function Init takes nothing returns nothing
        set minigames[0] = HungryHungryKodos.create()

        call Shuffle.execute()
    endfunction
    
endscope