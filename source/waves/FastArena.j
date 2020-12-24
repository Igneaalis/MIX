scope FastArena initializer Init

    globals
        private group array unitGroup
        private integer array unitsInGroup
        private integer winPlayerId
        private real array damageByPlayer
        private real timerTime
        private rect curRect
        private constant real firePitPercentDamage = 10.00
        
        real FA_Time = 60.00
        real FA_DebugTime = 10.00
        timerdialog FA_TimerDialog
    endglobals

    private function Conditions takes nothing returns boolean
        return (IsUnitAliveBJ(GetFilterUnit()) == true) and (IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true)
    endfunction

    private function AddUnitInGroup takes nothing returns nothing
        call GroupAddUnit(unitGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))], GetEnumUnit())
        set unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] = unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] + 1
        // debug call Log(I2S(unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]) + " " + GetPlayerName(GetOwningPlayer(GetEnumUnit())) + " " + GetUnitName(GetEnumUnit()))
    endfunction

    private function MoveUnitsToArena takes nothing returns nothing
        local real x = GetRectCenterX(curRect)
        local real y = GetRectCenterY(curRect)
        call SetUnitPosition(GetEnumUnit(), x, y)
        set x = GetRectCenterX(gg_rct_fastarena)
        set y = GetRectCenterY(gg_rct_fastarena)
        call IssuePointOrder(GetEnumUnit(), "attack", x, y)
    endfunction

    private function OnDamage takes nothing returns boolean
        local player sourcePlayer = GetOwningPlayer(GetEventDamageSource())
        local integer sourcePlayerId = GetPlayerId(sourcePlayer)
        local player targetPlayer = GetOwningPlayer(BlzGetEventDamageTarget())

        if (sourcePlayer != targetPlayer) then
            set damageByPlayer[sourcePlayerId] = damageByPlayer[sourcePlayerId] + GetEventDamage()
        else
            debug set damageByPlayer[sourcePlayerId] = damageByPlayer[sourcePlayerId] + GetEventDamage()
        endif

        set sourcePlayer = null
        set targetPlayer = null
        return false
    endfunction

    private function RemoveUnits takes nothing returns nothing
        call GroupRemoveUnit(udg_wave_units, GetEnumUnit())
        call C_RemoveEnumUnits()
    endfunction

    private function FirePitDoDamage takes nothing returns nothing
        if (GetUnitLifePercent(GetEnumUnit()) > firePitPercentDamage) then
            call SetUnitLifePercentBJ(GetEnumUnit(),(GetUnitLifePercent(GetEnumUnit()) - firePitPercentDamage))
        endif
    endfunction

    private function SetWinPlayer takes nothing returns nothing
        local integer i = 1
        local integer curPlayerId = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            if damageByPlayer[i] > damageByPlayer[curPlayerId] then
                set curPlayerId = i
            endif
            set i = i + 1
        endloop
        set winPlayerId = curPlayerId
    endfunction

    private function Flush takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            call GroupClear(unitGroup[i])
            set unitsInGroup[i] = 0
            set damageByPlayer[i] = 0
            set timerTime = FA_Time
            call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 0)
            set i = i + 1
        endloop
        set timerTime = FA_Time
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local group g_tmp

        set timerTime = timerTime - 1

        set g_tmp = GetUnitsInRectAll(gg_rct_fastarenaFIRE)
        call ForGroup(g_tmp, function FirePitDoDamage)
        call DestroyGroup(g_tmp)

        if (timerTime <= 5 and timerTime > 0) then
            call StartSound(gg_snd_BattleNetTick)
        endif

        if (timerTime <= 0) then
            call PauseTimer(t)
            call DestroyTimer(t)
            call FastArena_Finish.execute()
        endif

        set t = null
        set g_tmp = null
    endfunction

    private function Timer_OnExpire takes nothing returns nothing
        local timer t = GetExpiredTimer()

        call DestroyTimerDialog(FA_TimerDialog)
        call PauseTimer(t)
        call DestroyTimer(t)

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local integer i
        local integer j
        local integer curPlayerId
        local group g_tmp
        local timer t = CreateTimer()

        // IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true
        // IsUnitType(GetFilterUnit(), UNIT_TYPE_SAPPER) == true
        // call ForGroup(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_end_timer_Func011Func001001002)), function C_RemoveEnumUnits)
        // call DisableTrigger(gg_trg_wave_castle_destr)
        // call DisableTrigger(gg_trg_inc_per_second)
        
        call Flush.execute()
        call PanCameraToTimed(GetRectCenterX(gg_rct_fastarena), GetRectCenterY(gg_rct_fastarena), 0)

        set i = 1
        loop
            exitwhen i > 4
            if (i == 1) then
                set curRect = gg_rct_fastarenaSPAWN1
            elseif (i == 2) then
                set curRect = gg_rct_fastarenaSPAWN2
            elseif (i == 3) then
                set curRect = gg_rct_fastarenaSPAWN3
            elseif (i == 4) then
                set curRect = gg_rct_fastarenaSPAWN4
            endif

            set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions))
            call ForGroup(g_tmp, function AddUnitInGroup)
            call DestroyGroup(g_tmp)

            set j = 1
            set curPlayerId = 0
            loop
                exitwhen j >= maxNumberOfPlayers
                if unitsInGroup[j] > unitsInGroup[curPlayerId] then
                    set curPlayerId = j
                endif
                set j = j + 1
            endloop
            call ForGroup(unitGroup[curPlayerId], function MoveUnitsToArena)
            call PanCameraToTimedForPlayer(Player(curPlayerId), GetRectCenterX(curRect), GetRectCenterY(curRect), 0)
            set unitsInGroup[curPlayerId] = -1
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > 8
            if (udg_info[i+1] == true) then
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "У вас есть " + GOLD + I2S(R2I(FA_Time)) + "|r сек.")
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "Были отобраны первые четверо игроков с наибольшим количеством живых юнитов.")
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "По истечении времени игрок, нанёсший наибольшее количество урона, получит бонусные очки арены.")
            endif
            set i = i + 1
        endloop
        
        set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions))
        call ForGroup(GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions)),function RemoveUnits)
        call DestroyGroup(g_tmp)
        
        call TimerStart(t, FA_Time, false, function Timer_OnExpire)
        set FA_TimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(FA_TimerDialog, "Быстрая битва") // Title of timer dialog
        call TimerDialogDisplay(FA_TimerDialog, true) // Shows timer dialog
        
        call TimerStart(CreateTimer(), 1, true, function Timer_OnTick)
        
        call EnableTrigger(DDS)

        set g_tmp = null
        set t = null
    endfunction

    public function Finish takes nothing returns nothing
        local integer i

        call DisableTrigger(DDS)
        call SetWinPlayer.execute()

        set i = 0
        loop
            exitwhen i > 8
            if (udg_info[i+1] == true) then
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, ("Нанеся " + GOLD + I2S(R2I(damageByPlayer[winPlayerId])) + "|r ед. урона на арене, победил игрок " + C_IntToColor(winPlayerId) + GetPlayerName(Player(winPlayerId)) + "|r"))
            endif
            set i = i + 1
        endloop
        
        // set udg_scoreboard_win[winPlayerId] = (udg_scoreboard_win[winPlayerId] + 50) // Test
        // call MultiboardSetItemValueBJ(udg_scoreboard, 7, winPlayerId, I2S(udg_scoreboard_win[winPlayerId])) // Test
        
        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 1)
            set i = i + 1
        endloop

        call NextWave_Force.execute()
    endfunction

    private function Init takes nothing returns nothing
        local integer i

        debug set FA_Time = FA_DebugTime

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            set unitGroup[i] = CreateGroup()
            set i = i + 1
        endloop
        call AddDamageCondition(Condition(function OnDamage))
    endfunction

endscope