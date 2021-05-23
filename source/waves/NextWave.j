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
        private player curWinner = null

        boolean WasItMinigameWave = false
        real relaxWaveTime = 30.00
        private constant real debugRelaxWaveTime = 5.00
    endglobals

    private function Condition_IsUnitInBuildingsGroup takes nothing returns boolean
        if IsUnitInGroup(GetFilterUnit(), buildings) == true then
            return true
        endif
        return false
    endfunction

    private function ForUnit_Sell takes nothing returns nothing
        call IssueImmediateOrder(GetEnumUnit(), "berserk")
    endfunction

    private function ForPlayer_FindWinner takes nothing returns nothing
        local player p = GetEnumPlayer()

        if pdb[p].result > pdb[curWinner].result then
            set curWinner = p
        endif

        set p = null
    endfunction

    private function SellUnits takes nothing returns nothing
        local unit u = null
        local integer i = 0

        for i = 0 to maxNumberOfPlayers - 1
            set u = FirstOfGroup(GetUnitsOfPlayerMatching(Player(i), function Condition_IsUnitInBuildingsGroup))
            if u != null then
                call IssueImmediateOrder(u, "berserk")
            endif
        endfor

        set u = null
    endfunction

    private function ForPlayer_PanCamera takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0)
        call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own

        set p = null
    endfunction

    private function ForPlayer_CheckPenalties takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer i = 0

        if WasItMinigameWave == false then
            if pdb[p].curWaveIncomeObjectsCaptured == 0 and pdb[p].curWaveCastlesDestroyed == 0 then
                for i = 0 to maxNumberOfPlayers - 1
                    if pdb[Player(i)].info == true then
                        call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, RED + "Штраф|r: игрок " + C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r теряет " + RED + I2S(40) + "|r очков арены, т.к. не захватил ни одной контрольной точки и не разрушил ни одного замка.")
                    endif
                endfor
                set pdb[p].points = RMaxBJ(0, pdb[p].points - 40)
            endif
            set pdb[p].curWaveIncomeObjectsCaptured = 0
            set pdb[p].curWaveCastlesDestroyed = 0
        endif

        set p = null
    endfunction

    private function ForPlayer_AtFinalWave takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer i = 0

        call CreateDestructableLoc('B008', GetPlayerStartLocationLoc(p), GetRandomDirectionDeg(), 2.00, 0)  // Свечение (нормальное)
        for i = 1 to 8
            call CreateDestructableLoc('B008', PolarProjectionBJ(GetPlayerStartLocationLoc(p), 633, 45*i), GetRandomDirectionDeg(), 2.00, 0)  // Свечение (нормальное)
        endfor

        set p = null
    endfunction

    private function ForPlayer_AtArenaWaveEnd takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer i = 0

        call AddGoldToPlayer(pdb[p].incomeGold, p)
        call AddGemsToPlayer(pdb[p].incomeGems, p)

        call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль золота: " + GOLD + I2S(pdb[p].incomeGold) + "|r")
        call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль самоцветов: " + VIOLET + I2S(pdb[p].incomeGems) + "|r")

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
        local integer i = 0

        call ForGroup(waveUnits, function C_RemoveEnumUnits)
        call GroupClear(waveUnits)

        call ForGroup(waveDummyUnits, function C_RemoveEnumUnits)
        call GroupClear(waveDummyUnits)

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

        call ForForce(players, function ForPlayer_PanCamera)
        if curWave == finalWave then
            call CinematicModeBJ(true, players)
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 3000, 1)
            call ClearTextMessages()
            call ForForce(players, function ForPlayer_CheckPenalties)
            
            call TriggerSleepAction(1)
            call FadeMap()

            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 900, "Игра закончится через 10 сек.")
            call ForForce(players, function ForPlayer_AtFinalWave)
            call TimerStart(t, 0.1, true, function SellUnits)

            // call ForGroup(GetUnitsOfTypeIdAll('hbla'), function C_RemoveEnumUnits)  // Юнит "Замок"
            // call ForGroup(GetUnitsOfTypeIdAll('hwtw'), function C_RemoveEnumUnits)  // Юнит "Улучшения"
            // call ForGroup(GetUnitsOfTypeIdAll('ntav'), function C_RemoveEnumUnits)  // Таверна с расами на выбор
            call ForGroup(GetUnitsOfTypeIdAll('h001'), function C_RemoveEnumUnits)  // Юнит "Выбор героя"
            call ForGroup(GetUnitsOfTypeIdAll('h029'), function C_RemoveEnumUnits)  // Юнит "Не более 1 погодного эффекта в раунде"
            call ForGroup(GetUnitsOfTypeIdAll('h02I'), function C_RemoveEnumUnits)  // Работник
            call ForGroup(GetUnitsOfTypeIdAll('h015'), function C_RemoveEnumUnits)  // Послушник
            call ForGroup(GetUnitsOfTypeIdAll('h01G'), function C_RemoveEnumUnits)  // Светлячок
            call ForGroup(GetUnitsOfTypeIdAll('h01U'), function C_RemoveEnumUnits)  // Раб
            call ForGroup(GetUnitsOfTypeIdAll('h025'), function C_RemoveEnumUnits)  // Маргол-раб
            call ForGroup(GetUnitsOfTypeIdAll('h02H'), function C_RemoveEnumUnits)  // Медив

            call TriggerSleepAction(10.00)
            call PauseTimer(t)
            call DestroyTimer(t)
            call CinematicModeBJ(false, players)
            call ClearTextMessages()
            call ForForce(players, function ForPlayer_FindWinner)
            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 900, "Победил игрок " + C_IntToColor(GetPlayerId(curWinner)) + GetPlayerName(curWinner) + "|r со счётом " + RED + I2S(R2I(pdb[curWinner].result)) + "|r!")
            call PlaySoundBJ(gg_snd_ClanInvitation)
            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 900, "Спасибо за прохождение карты |cffff8c99M|cffffbf40I|r|cfffffe00X|r! Возвращайтесь снова!\nDiscord: " + GOLD + "https://discord.gg/kazvQVA2QN" + "|r\nПрисылайте туда свои реплеи!")

            set t = null
            return
        else
            call ForForce(players, function ForPlayer_CheckPenalties)
            if WasItMinigameWave == false then
                call ForForce(players, function ForPlayer_AtArenaWaveEnd)
            endif
        endif

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