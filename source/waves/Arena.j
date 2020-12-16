globals
    constant integer Arena_ArraySize = 8
    rect array Arena_StartRectForPlayer[Arena_ArraySize]
    constant integer Arena_RectListSize = 8
    rect array Arena_RectList[Arena_RectListSize]
    real Arena_Time = 120.00
    constant real Arena_DebugTime = 10.00
    timerdialog Arena_TimerDialog
    constant integer Array_UnitTypeIdOffset = 49 * 256 * 256 // https://xgm.guru/p/wc3/rawcode-to-string
endglobals

function ForceArena_Conditions takes nothing returns boolean
    return IsUnitInGroup(GetFilterUnit(), udg_buildings)
endfunction

function ForceArena_ForPlayerUnits takes nothing returns nothing
    local player p = GetEnumPlayer()
    local unit u = GetEnumUnit()
    local real x = GetRectCenterX(Arena_StartRectForPlayer[GetPlayerId(p)])
    local real y = GetRectCenterY(Arena_StartRectForPlayer[GetPlayerId(p)])
    // debug call Log(I2S('h008') + " / " + I2S('ha08') + " / " + I2S('ha08' - 'h008') + " / " + I2S(offset))
    call GroupAddUnit(udg_wave_units, CreateUnitEx(p, (GetUnitTypeId(u) + Array_UnitTypeIdOffset), x, y, 270))
    // debug call Log("ForceArena_ForPlayerUnits: unit = " + GetUnitName(u))

    set p = null
    set u = null
endfunction

function ForceArena_ForPlayer takes nothing returns nothing
    local player p = GetEnumPlayer()
    local group g
    local real x = GetRectCenterX(Arena_StartRectForPlayer[GetPlayerId(p)])
    local real y = GetRectCenterY(Arena_StartRectForPlayer[GetPlayerId(p)])

    // debug call Log("ForceArena_ForPlayer: player = " + GetPlayerName(p))

    call GroupAddUnit(udg_castle_unit, CreateUnitEx(p, castle_rc, x, y, 270))

    set g = GetUnitsOfPlayerMatching(p, Condition(function ForceArena_Conditions))
    call ForGroup(g, function ForceArena_ForPlayerUnits)

    call PanCameraToTimedForPlayer(p, x, y, 0)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUTIN, 2, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    
    set p = null
    call DestroyGroup(g)
    set g = null
endfunction

function ArenaFlush takes nothing returns nothing
    local integer i

    set i = 0
    loop
        exitwhen i >= Arena_ArraySize
        set Arena_StartRectForPlayer[i] = null
        set i = i + 1
    endloop
endfunction

function Arena_Timer_OnExpire takes nothing returns nothing
    local timer t = GetExpiredTimer()
    
    call DestroyTimerDialog(Arena_TimerDialog)
    call PauseTimer(t)
    call DestroyTimer(t)
    call ForceFastArena.execute()

    set t = null
endfunction

function ForceArena takes nothing returns nothing
    local integer i
    local integer j
    local integer random
    local timer t = CreateTimer()

    call ArenaFlush()

    set i = 0
    loop
        exitwhen i >= Arena_ArraySize

        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            set random = GetRandomInt(0, Arena_RectListSize - 1)
            set Arena_StartRectForPlayer[i] = Arena_RectList[random]

            set j = 0
            loop
                exitwhen j >= i

                if Arena_StartRectForPlayer[j] == Arena_RectList[random] then
                    set random = GetRandomInt(0, Arena_RectListSize - 1)
                    set Arena_StartRectForPlayer[i] = Arena_RectList[random]
                    set j = 0
                else
                    set j = j + 1
                endif
            endloop

            // debug call Log("ForceArena: Rect = " + I2S(random) + " of player = " + GetPlayerName(Player(i)))
        endif

        set i = i + 1
    endloop

    call ForForce(udg_players_group, function ForceArena_ForPlayer)
    call TimerStart(t, Arena_Time, false, function Arena_Timer_OnExpire)
    set Arena_TimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
    call TimerDialogSetTitle(Arena_TimerDialog, "Арена") // Title of timer dialog
    call TimerDialogDisplay(Arena_TimerDialog, true) // Shows timer dialog

    set t = null
endfunction

function ArenaInit takes nothing returns nothing
    debug set Arena_Time = Arena_DebugTime
    set Arena_RectList[0] = gg_rct_start1
    set Arena_RectList[1] = gg_rct_start2
    set Arena_RectList[2] = gg_rct_start3
    set Arena_RectList[3] = gg_rct_start4
    set Arena_RectList[4] = gg_rct_start5
    set Arena_RectList[5] = gg_rct_start6
    set Arena_RectList[6] = gg_rct_start7
    set Arena_RectList[7] = gg_rct_start8
endfunction