scope Arena initializer Init

    globals
        private constant integer unitTypeIdOffset = 49 * 256 * 256 // https://xgm.guru/p/wc3/rawcode-to-string
        private rect array startRectForPlayer
        private rect array rectList[8]
        timerdialog Arena_TimerDialog
        
        private real arenaTimerTime = 120.00
        private constant real debugArenaTimerTime = 5.00
    endglobals

    private function Conditions takes nothing returns boolean
        return IsUnitInGroup(GetFilterUnit(), buildings)
    endfunction

    private function ForPlayerUnits takes nothing returns nothing
        local player p = GetEnumPlayer()
        local unit u = GetEnumUnit()
        local real x = GetRectCenterX(startRectForPlayer[GetPlayerId(p)])
        local real y = GetRectCenterY(startRectForPlayer[GetPlayerId(p)])
        // debug call Log(I2S('h008') + " / " + I2S('ha08') + " / " + I2S('ha08' - 'h008') + " / " + I2S(offset))
        call GroupAddUnit(waveUnits, CreateUnitEx(p, (GetUnitTypeId(u) + unitTypeIdOffset), x, y, 270))
        // debug call Log("ForceArena_ForPlayerUnits: unit = " + GetUnitName(u))

        set p = null
        set u = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local group g
        local real x = GetRectCenterX(startRectForPlayer[GetPlayerId(p)])
        local real y = GetRectCenterY(startRectForPlayer[GetPlayerId(p)])

        // debug call Log("ForceArena_ForPlayer: player = " + GetPlayerName(p))

        call GroupAddUnit(castles, CreateUnitEx(p, castleRC, x, y, 270))

        set g = GetUnitsOfPlayerMatching(p, Condition(function Conditions))
        call ForGroup(g, function ForPlayerUnits)

        call PanCameraToTimedForPlayer(p, x, y, 0)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUTIN, 2, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
        
        set p = null
        call DestroyGroup(g)
        set g = null
    endfunction

    private function Flush takes nothing returns nothing
        local integer i

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            set startRectForPlayer[i] = null
            set i = i + 1
        endloop
    endfunction

    private function Timer_OnExpire takes nothing returns nothing
        local timer t = GetExpiredTimer()
        
        call DestroyTimerDialog(Arena_TimerDialog)
        call PauseTimer(t)
        call DestroyTimer(t)
        call FastArena_Force.execute()

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local integer i
        local integer j
        local integer random
        local timer t = CreateTimer()

        call Flush.execute()
        call IncomeObjects_Shuffle.execute()

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers

            if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set random = GetRandomInt(0, rectList.size - 1)
                set startRectForPlayer[i] = rectList[random]

                set j = 0
                loop
                    exitwhen j >= i

                    if startRectForPlayer[j] == rectList[random] then
                        set random = GetRandomInt(0, rectList.size - 1)
                        set startRectForPlayer[i] = rectList[random]
                        set j = 0
                    else
                        set j = j + 1
                    endif
                endloop

                // debug call Log("ForceArena: Rect = " + I2S(random) + " of player = " + GetPlayerName(Player(i)))
            endif

            set i = i + 1
        endloop

        call ForForce(players, function ForPlayer)
        call TimerStart(t, arenaTimerTime, false, function Timer_OnExpire)
        set Arena_TimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(Arena_TimerDialog, "Арена") // Title of timer dialog
        call TimerDialogDisplay(Arena_TimerDialog, true) // Shows timer dialog

        set t = null
    endfunction

    private function Init takes nothing returns nothing
        debug set arenaTimerTime = debugArenaTimerTime
        set rectList[0] = gg_rct_start1
        set rectList[1] = gg_rct_start2
        set rectList[2] = gg_rct_start3
        set rectList[3] = gg_rct_start4
        set rectList[4] = gg_rct_start5
        set rectList[5] = gg_rct_start6
        set rectList[6] = gg_rct_start7
        set rectList[7] = gg_rct_start8
    endfunction

endscope