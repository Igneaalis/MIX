/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     16.12.2020 15:06       =
=============================================

Реализация Arena wave

*/

scope Arena initializer Init

    globals
        private constant integer unitTypeIdOffset = 49 * 256 * 256  // https://xgm.guru/p/wc3/rawcode-to-string
        private rect array startRectForPlayer
        private rect array rectList[8]
        timerdialog Arena_TimerDialog
        
        real arenaTimerTime = 120.00
        private constant real debugArenaTimerTime = 30.00

        private constant integer dryadTypeId = 'ha1L'
        private constant integer faerieTypeId = 'ha1M'
        private constant integer wagon1TypeId = 'ha12'
        private constant integer wagon2TypeId = 'ha13'
        private constant integer wagon3TypeId = 'ha14'
        private constant integer ballistaTypeId = 'ha1P'
        private constant integer gyrocopter1TypeId = 'ha0U'
        private constant integer gyrocopter2TypeId = 'ha0V'
        private constant integer gyrocopter3TypeId = 'ha0W'
        private constant integer magicImmunityTechId = 'R02X'
        private constant integer magicImmunityAbilityIconTypeId = 'A041'
        private constant integer magicImmunityAbilityTypeId = 'ACmi'
    endglobals

    private function Conditions takes nothing returns boolean
        return IsUnitInGroup(GetFilterUnit(), buildings)
    endfunction

    private function GiveMagicImmunity takes nothing returns nothing
        local unit u = GetEnumUnit()
        local integer unitTypeId = GetUnitTypeId(u)

        if unitTypeId == dryadTypeId or unitTypeId == faerieTypeId or unitTypeId == wagon1TypeId or unitTypeId == wagon2TypeId or unitTypeId == wagon3TypeId or unitTypeId == ballistaTypeId or unitTypeId == gyrocopter1TypeId or unitTypeId == gyrocopter2TypeId or unitTypeId == gyrocopter3TypeId then
            call UnitRemoveAbility(u, magicImmunityAbilityIconTypeId)
            call UnitAddAbility(u, magicImmunityAbilityTypeId)
        endif
        set u = null
    endfunction

    private function ForPlayerUnits takes nothing returns nothing
        local player p = GetEnumPlayer()
        local unit u = GetEnumUnit()
        local real x = GetRectCenterX(startRectForPlayer[GetPlayerId(p)])
        local real y = GetRectCenterY(startRectForPlayer[GetPlayerId(p)])
        local integer curUnitTypeId = GetUnitTypeId(u) + unitTypeIdOffset
        local unit createdUnit = CreateUnitEx(p, curUnitTypeId, x, y, 270)
        // debug call Log(I2S('h008') + " / " + I2S('ha08') + " / " + I2S('ha08' - 'h008') + " / " + I2S(offset))
        call GroupAddUnit(waveUnits, createdUnit)
        // debug call Log("ForceArena_ForPlayerUnits: unit = " + GetUnitName(u))

        set p = null
        set u = null
        set createdUnit = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local group g = null
        local real x = GetRectCenterX(startRectForPlayer[GetPlayerId(p)])
        local real y = GetRectCenterY(startRectForPlayer[GetPlayerId(p)])
        local unit castle = CreateUnitEx(p, castleRC, x, y, 270)

        call GroupAddUnit(castles, castle)
        call SetPlayerState(p, PLAYER_STATE_GIVES_BOUNTY, 1)

        set g = GetUnitsOfPlayerMatching(p, Condition(function Conditions))
        call ForGroup(g, function ForPlayerUnits)
        if GetPlayerTechCountSimple(magicImmunityTechId, p) > 0 then
            call ForGroup(GetUnitsOfPlayerAll(p), function GiveMagicImmunity)
        endif

        call PanCameraToTimedForPlayer(p, x, y, 1)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUTIN, 2, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
        
        set p = null
        set castle = null
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
        call DisableTrigger(DDS)
        call FastArena_Force.execute()

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local integer i
        local integer j
        local integer random
        local timer t = CreateTimer()

        set curWave = curWave + 1
        set curWaveWithMinigames = curWaveWithMinigames + 1
        call Flush.execute()
        call IncomeObjects_Shuffle.execute()
        call EnableTrigger(DDS)

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
        call weather.ForceWeather()
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