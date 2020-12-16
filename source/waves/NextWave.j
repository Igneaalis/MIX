globals
    constant real relaxWaveTime = 5.00
    timerdialog relaxWaveTimerDialog
endglobals

function NextWave_ForPlayer takes nothing returns nothing
    local player p = GetEnumPlayer()

    call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0)
    call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own

    call AddGoldToPlayer(pdb[p].income_gold, p)
    call AddLumberToPlayer(pdb[p].income_gems, p)

    call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль золота: " + GOLD + I2S(pdb[p].income_gold) + "|r")
    call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль самоцветов: " + VIOLET + I2S(pdb[p].income_gems) + "|r")

    set p = null
endfunction

function NextWave_Timer_OnExprie takes nothing returns nothing
    local timer t = GetExpiredTimer()

    call DestroyTimerDialog(relaxWaveTimerDialog)
    call PauseTimer(t)
    call DestroyTimer(t)
    call ForceArena.execute()

    set t = null
endfunction

function ForceNextWave takes nothing returns nothing
    local timer t = CreateTimer()
    call ForGroup(udg_wave_units, function C_RemoveEnumUnits)
    call GroupClear(udg_wave_units)
    call ForGroup(udg_castle_unit, function C_RemoveEnumUnits)
    call GroupClear(udg_castle_unit)

    call ForForce(udg_players_group, function NextWave_ForPlayer)

    call TimerStart(t, relaxWaveTime, false, function NextWave_Timer_OnExprie)
    set relaxWaveTimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
    call TimerDialogSetTitle(relaxWaveTimerDialog, "Следующая волна") // Title of timer dialog
    call TimerDialogDisplay(relaxWaveTimerDialog, true) // Shows timer dialog
    
    set t = null
endfunction