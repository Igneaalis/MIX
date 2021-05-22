/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     16.12.2020 17:54       =
=============================================

Реализация NextWave_Force()

*/

scope NextWave initializer Init

    globals
        private timerdialog relaxWaveTimerDialog

        boolean WasItMinigameWave
        real relaxWaveTime = 30.00
        private constant real debugRelaxWaveTime = 5.00
    endglobals

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0)
        call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own

        if WasItMinigameWave == false then
            call AddGoldToPlayer(pdb[p].incomeGold, p)
            call AddGemsToPlayer(pdb[p].incomeGems, p)

            call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль золота: " + GOLD + I2S(pdb[p].incomeGold) + "|r")
            call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль самоцветов: " + VIOLET + I2S(pdb[p].incomeGems) + "|r")
        endif

        set p = null
    endfunction

    private function Timer_OnExprie takes nothing returns nothing
        local timer t = GetExpiredTimer()

        call DestroyTimerDialog(relaxWaveTimerDialog)
        call PauseTimer(t)
        call DestroyTimer(t)

        if ModuloInteger(curWaveWithMinigames, minigameWave) == minigameWave - 1 then
            set WasItMinigameWave = true
            call MinigameWaves_Force.execute()
        else
            set WasItMinigameWave = false
            call Arena_Force.execute()
        endif

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local timer t = CreateTimer()
        local integer i

        call ForGroup(waveUnits, function C_RemoveEnumUnits)
        call GroupClear(waveUnits)

        call ForGroup(castles, function C_RemoveEnumUnits)
        call GroupClear(castles)

        call ForGroup(IncomeObjects_group, function C_RemoveEnumUnits)
        call GroupClear(IncomeObjects_group)

        // for i = 1 to IncomeObjects_MaxAmount
        //     if IncomeObjects_minimapicons[i] != null then
        //         call DestroyMinimapIcon(IncomeObjects_minimapicons[i])
        //         set IncomeObjects_minimapicons[i] = null
        //     endif
        // endfor

        call ForForce(players, function ForPlayer)

        call TimerStart(t, relaxWaveTime, false, function Timer_OnExprie)
        set relaxWaveTimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(relaxWaveTimerDialog, "Следующая волна") // Title of timer dialog
        call TimerDialogDisplay(relaxWaveTimerDialog, true) // Shows timer dialog
        
        set t = null
    endfunction

    private function Init takes nothing returns nothing
        debug set relaxWaveTime = debugRelaxWaveTime
    endfunction

endscope