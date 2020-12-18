globals
    constant integer FA_ArraySize = 8
    group array FA_unitGroup[FA_ArraySize]
    integer array FA_unitsInGroup[FA_ArraySize]
    real array FA_DamageByPlayer[FA_ArraySize]
    integer FA_WinPlayerId
    rect FA_curRect
    real FA_Time = 60.00
    real FA_DebugTime = 10.00
    real FA_TimerTime
    timerdialog FA_TimerDialog
endglobals

function FastArena_Condition takes nothing returns boolean
    return (IsUnitAliveBJ(GetFilterUnit()) == true) and (IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true)
endfunction

function FastArena_AddUnitInGroup takes nothing returns nothing
    call GroupAddUnit(FA_unitGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))], GetEnumUnit())
    set FA_unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] = FA_unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] + 1
    // debug call Log(I2S(FA_unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]) + " " + GetPlayerName(GetOwningPlayer(GetEnumUnit())) + " " + GetUnitName(GetEnumUnit()))
endfunction

function FastArena_MoveUnitsToArena takes nothing returns nothing
    local real x = GetRectCenterX(FA_curRect)
    local real y = GetRectCenterY(FA_curRect)
    call SetUnitPosition(GetEnumUnit(), x, y)
    set x = GetRectCenterX(gg_rct_fastarena)
    set y = GetRectCenterY(gg_rct_fastarena)
    call IssuePointOrder(GetEnumUnit(), "attack", x, y)
endfunction

function FastArena_OnDamage takes nothing returns boolean
    local player sourcePlayer = GetOwningPlayer(GetEventDamageSource())
    local integer sourcePlayerId = GetPlayerId(sourcePlayer)
    local player targetPlayer = GetOwningPlayer(BlzGetEventDamageTarget())

    if (sourcePlayer != targetPlayer) then
        set FA_DamageByPlayer[sourcePlayerId] = FA_DamageByPlayer[sourcePlayerId] + GetEventDamage()
    else
        debug set FA_DamageByPlayer[sourcePlayerId] = FA_DamageByPlayer[sourcePlayerId] + GetEventDamage()
    endif

    set sourcePlayer = null
    set targetPlayer = null
    return false
endfunction

function FastArena_RemoveUnits takes nothing returns nothing
    call GroupRemoveUnit(udg_wave_units, GetEnumUnit())
    call RemoveUnit(GetEnumUnit())
endfunction

function FastArena_FirePit takes nothing returns nothing
    if (GetUnitLifePercent(GetEnumUnit()) > 4.00) then
        call SetUnitLifePercentBJ(GetEnumUnit(),(GetUnitLifePercent(GetEnumUnit()) - 4.00))
    endif
endfunction

function FastArena_SetWinPlayer takes nothing returns nothing
    local integer i = 1
    local integer curPlayerId = 0
    loop
        exitwhen i >= FA_ArraySize
        if FA_DamageByPlayer[i] > FA_DamageByPlayer[curPlayerId] then
            set curPlayerId = i
        endif
        set i = i + 1
    endloop
    set FA_WinPlayerId = curPlayerId
endfunction

function FastArena_Flush takes nothing returns nothing
    local integer i = 0
    loop
        exitwhen i >= FA_ArraySize
        call GroupClear(FA_unitGroup[i])
        set FA_unitsInGroup[i] = 0
        set FA_DamageByPlayer[i] = 0
        set FA_TimerTime = FA_Time
        call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 0)
        set i = i + 1
    endloop
    set FA_TimerTime = FA_Time
endfunction

function FinishFastArena takes nothing returns nothing
    local integer i

    call DisableTrigger(DDS)
    call FastArena_SetWinPlayer()

    set i = 0
    loop
        exitwhen i > 8
        if (udg_info[i+1] == true) then
            call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, ("Нанеся " + GOLD + I2S(R2I(FA_DamageByPlayer[FA_WinPlayerId])) + "|r ед. урона на арене, победил игрок " + C_IntToColor(FA_WinPlayerId) + GetPlayerName(Player(FA_WinPlayerId)) + "|r"))
        endif
        set i = i + 1
    endloop
    
    // set udg_scoreboard_win[FA_WinPlayerId] = (udg_scoreboard_win[FA_WinPlayerId] + 50) // Test
    // call MultiboardSetItemValueBJ(udg_scoreboard, 7, FA_WinPlayerId, I2S(udg_scoreboard_win[FA_WinPlayerId])) // Test
    
    set i = 0
    loop
        exitwhen i >= FA_ArraySize
        call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 1)
        set i = i + 1
    endloop

    call ForceNextWave.execute()
endfunction

function FastArena_TimerTick takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local group g_tmp

    set FA_TimerTime = FA_TimerTime - 1

    set g_tmp = GetUnitsInRectAll(gg_rct_fastarenaFIRE)
    call ForGroup(g_tmp, function FastArena_FirePit)
    call DestroyGroup(g_tmp)

    if (FA_TimerTime <= 5 and FA_TimerTime > 0) then
        call StartSound(gg_snd_BattleNetTick)
    endif

    if (FA_TimerTime <= 0) then
        call PauseTimer(t)
        call DestroyTimer(t)
        call FinishFastArena()
    endif

    set t = null
    set g_tmp = null
endfunction

function FastArena_Timer_OnExpire takes nothing returns nothing
    local timer t = GetExpiredTimer()

    call DestroyTimerDialog(FA_TimerDialog)
    call PauseTimer(t)
    call DestroyTimer(t)

    set t = null
endfunction

function ForceFastArena takes nothing returns nothing
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
    
    call FastArena_Flush()
    call PanCameraToTimed(GetRectCenterX(gg_rct_fastarena), GetRectCenterY(gg_rct_fastarena), 0)

    set i = 1
    loop
        exitwhen i > 4
        if (i == 1) then
            set FA_curRect = gg_rct_fastarenaSPAWN1
        elseif (i == 2) then
            set FA_curRect = gg_rct_fastarenaSPAWN2
        elseif (i == 3) then
            set FA_curRect = gg_rct_fastarenaSPAWN3
        elseif (i == 4) then
            set FA_curRect = gg_rct_fastarenaSPAWN4
        endif

        set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function FastArena_Condition))
        call ForGroup(g_tmp, function FastArena_AddUnitInGroup)
        call DestroyGroup(g_tmp)

        set j = 1
        set curPlayerId = 0
        loop
            exitwhen j >= FA_ArraySize
            if FA_unitsInGroup[j] > FA_unitsInGroup[curPlayerId] then
                set curPlayerId = j
            endif
            set j = j + 1
        endloop
        call ForGroup(FA_unitGroup[curPlayerId], function FastArena_MoveUnitsToArena)
        call PanCameraToTimedForPlayer(Player(curPlayerId), GetRectCenterX(FA_curRect), GetRectCenterY(FA_curRect), 0)
        set FA_unitsInGroup[curPlayerId] = -1
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
    
    set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function FastArena_Condition))
    call ForGroup(GetUnitsInRectMatching(gg_rct_all, Condition(function FastArena_Condition)),function FastArena_RemoveUnits)
    call DestroyGroup(g_tmp)
    
    call TimerStart(t, FA_Time, false, function FastArena_Timer_OnExpire)
    set FA_TimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
    call TimerDialogSetTitle(FA_TimerDialog, "Быстрая битва") // Title of timer dialog
    call TimerDialogDisplay(FA_TimerDialog, true) // Shows timer dialog
    
    call TimerStart(CreateTimer(), 1, true, function FastArena_TimerTick)
    
    call EnableTrigger(DDS)

    set g_tmp = null
    set t = null
endfunction

function FastArenaInit takes nothing returns nothing
    local integer i = 0
    debug set FA_Time = FA_DebugTime
    loop
        exitwhen i >= FA_ArraySize
        set FA_unitGroup[i] = CreateGroup()
        set i = i + 1
    endloop
    call AddDamageCondition(Condition(function FastArena_OnDamage))
endfunction