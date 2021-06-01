/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     15.12.2020 23:43       =
=============================================

Реализация FastArena wave

*/

scope FastArena initializer Init

    globals
        private group array unitGroup
        private integer array unitsInGroup
        private integer winPlayerId
        private real array damageByPlayer
        private force actingPlayers = CreateForce()
        private force availablePlayers = CreateForce()
        private integer numberOfActingPlayers = 0
        private integer numberOfAvailablePlayers = 0
        private real timerTime
        private rect curRect
        private timerdialog td

        private player curGoodPlayer
        private integer maxUnits

        private constant real firePitPercentDamage = 10.00
        private real fastArenaTimerTime = 60.00
        private constant real debugFastArenaTimerTime = 10.00

        boolean IsFastArena = false
    endglobals

    private function Conditions takes nothing returns boolean
        return (IsUnitAliveBJ(GetFilterUnit()) == true) and (IsUnitInGroup(GetFilterUnit(), waveUnits) == true)
    endfunction

    private function AddUnitInGroup takes nothing returns nothing
        local unit u = GetEnumUnit()

        call GroupAddUnit(unitGroup[GetPlayerId(GetOwningPlayer(u))], u)
        set unitsInGroup[GetPlayerId(GetOwningPlayer(u))] = unitsInGroup[GetPlayerId(GetOwningPlayer(u))] + 1
        // debug call Log(I2S(unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]) + " " + GetPlayerName(GetOwningPlayer(GetEnumUnit())) + " " + GetUnitName(GetEnumUnit()))

        set u = null
    endfunction

    private function AddPlayersInForce takes nothing returns nothing
        if unitsInGroup[GetPlayerId(GetEnumPlayer())] > 0 then
            call ForceAddPlayer(availablePlayers, GetEnumPlayer())
            set numberOfAvailablePlayers = numberOfAvailablePlayers + 1
        endif
    endfunction

    private function FindGoodPlayerInForce takes nothing returns nothing
        if unitsInGroup[GetPlayerId(GetEnumPlayer())] > maxUnits then
            set curGoodPlayer = GetEnumPlayer()
            set maxUnits = unitsInGroup[GetPlayerId(GetEnumPlayer())]
        endif
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
        local player sourcePlayer
        local integer sourcePlayerId
        local player targetPlayer

        if IsFastArena then
            set sourcePlayer = GetOwningPlayer(GetEventDamageSource())
            set sourcePlayerId = GetPlayerId(sourcePlayer)
            set targetPlayer = GetOwningPlayer(BlzGetEventDamageTarget())
            if (sourcePlayer != targetPlayer and targetPlayer != Player(27) and sourcePlayer != Player(27)) then
                set damageByPlayer[sourcePlayerId] = damageByPlayer[sourcePlayerId] + GetEventDamage()
            else
                debug set damageByPlayer[sourcePlayerId] = damageByPlayer[sourcePlayerId] + GetEventDamage()
            endif
        endif

        set sourcePlayer = null
        set targetPlayer = null
        return false
    endfunction

    private function RemoveUnits takes nothing returns nothing
        call GroupRemoveUnit(waveUnits, GetEnumUnit())
        call C_RemoveEnumUnits()
    endfunction

    private function FirePitDoDamage takes nothing returns nothing
        // TODO: добавить негорящие типы
        call SetUnitLifePercentBJ(GetEnumUnit(),(GetUnitLifePercent(GetEnumUnit()) - firePitPercentDamage))
    endfunction

    private function SetWinPlayer takes nothing returns nothing
        local integer i = 1
        local integer curPlayerId = -1

        if damageByPlayer[0] > 0 then
            set curPlayerId = 0
        endif

        for i = 1 to maxNumberOfPlayers - 1
            if damageByPlayer[i] > damageByPlayer[i - 1] then
                set curPlayerId = i
            endif
        endfor
        set winPlayerId = curPlayerId
    endfunction

    private function Flush takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            call GroupClear(unitGroup[i])
            set unitsInGroup[i] = 0
            set damageByPlayer[i] = 0
            call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 0)
            call ForceClear(actingPlayers)
            call ForceClear(availablePlayers)
            set numberOfActingPlayers = 0
            set numberOfAvailablePlayers = 0
            set curGoodPlayer = null
            set maxUnits = 0
            set i = i + 1
        endloop
        set timerTime = fastArenaTimerTime
    endfunction

    private function ForUnit_IsUnitAlive takes nothing returns boolean
        return IsUnitAliveBJ(GetFilterUnit())
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local group g

        set timerTime = timerTime - 1

        set g = GetUnitsInRectAll(gg_rct_fastarenaFIRE)
        call ForGroup(g, function FirePitDoDamage)

        if timerTime <= 5 and timerTime > 0 then
            call StartSound(gg_snd_BattleNetTick)
        endif

        set g = GetUnitsInRectMatching(gg_rct_fastarena, function ForUnit_IsUnitAlive)
        if timerTime <= 0 or CountUnitsInGroup(g) == 0 then
            call DestroyTimerDialog(td)
            call PauseTimer(t)
            call DestroyTimer(t)
            call FastArena_Finish.execute()
        endif

        set t = null
        call DestroyGroup(g)
        set g = null
    endfunction

    private function Timer_OnExpire takes nothing returns nothing
        local timer t = GetExpiredTimer()

        call DestroyTimerDialog(td)
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
        call UnfadeMap()
        call PanCameraToTimed(GetRectCenterX(gg_rct_fastarena), GetRectCenterY(gg_rct_fastarena), 0.5)

        set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions))
        call ForGroup(g_tmp, function AddUnitInGroup)
        call GroupClear(g_tmp)
        call ForForce(players, function AddPlayersInForce) // Depends on AddUnitInGroup!

        set i = 1
        loop
            exitwhen i > 4 or numberOfAvailablePlayers == 0
            if (i == 1) then
                set curRect = gg_rct_fastarenaSPAWN1
            elseif (i == 2) then
                set curRect = gg_rct_fastarenaSPAWN2
            elseif (i == 3) then
                set curRect = gg_rct_fastarenaSPAWN3
            elseif (i == 4) then
                set curRect = gg_rct_fastarenaSPAWN4
            endif

            call ForForce(availablePlayers, function FindGoodPlayerInForce)

            call ForceAddPlayer(actingPlayers, curGoodPlayer)
            set numberOfActingPlayers = numberOfActingPlayers + 1

            call ForGroup(unitGroup[GetPlayerId(curGoodPlayer)], function MoveUnitsToArena)
            call PanCameraToTimedForPlayer(curGoodPlayer, GetRectCenterX(curRect), GetRectCenterY(curRect), 0)

            call ForceRemovePlayer(availablePlayers, curGoodPlayer)
            set numberOfAvailablePlayers = numberOfAvailablePlayers - 1
            set curGoodPlayer = null
            set maxUnits = 0

            set i = i + 1
        endloop

        for i = 0 to maxNumberOfPlayers - 1
            static if not DEBUG_MODE then
                if (pdb[Player(i)].info == true) then
                    call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "У вас есть " + GOLD + I2S(R2I(fastArenaTimerTime)) + "|r сек.")
                    call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "Были отобраны первые четверо игроков с наибольшим количеством живых юнитов.")
                    call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "По истечении времени игрок, нанёсший наибольшее количество урона, получит бонусные очки арены.")
                endif
            endif
        endfor
        
        set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions))
        call ForGroup(g_tmp, function RemoveUnits)
        call DestroyGroup(g_tmp)
        
        call TimerStart(t, fastArenaTimerTime, false, function Timer_OnExpire)
        set td = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(td, "Быстрая битва") // Title of timer dialog
        call TimerDialogDisplay(td, true) // Shows timer dialog
        
        call TimerStart(CreateTimer(), 1, true, function Timer_OnTick)
        
        set IsFastArena = true
        call EnableTrigger(DDS)

        set g_tmp = null
        set t = null
    endfunction

    public function Finish takes nothing returns nothing
        local integer i

        set IsFastArena = false
        call DisableTrigger(DDS)
        call SetWinPlayer.execute()

        if winPlayerId != -1 then
            for i = 0 to maxNumberOfPlayers - 1
                if (pdb[Player(i)].info == true) then
                    call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, ("Нанеся " + GREEN + I2S(R2I(damageByPlayer[winPlayerId])) + "|r ед. урона на арене, побеждает игрок " + C_IntToColor(winPlayerId) + GetPlayerName(Player(winPlayerId)) + "|r и получает за это " + RED + I2S(50) + "|r очков арены!"))
                endif
            endfor
            set pdb[Player(winPlayerId)].points = pdb[Player(winPlayerId)].points + 50
            set pdb[Player(winPlayerId)].fastArenaWins = pdb[Player(winPlayerId)].fastArenaWins + 1
        else
            for i = 0 to maxNumberOfPlayers - 1
                if (pdb[Player(i)].info == true) then
                    call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, "На арене нет победителей.")
                endif
            endfor
        endif

        call NextWave_Force.execute()
    endfunction

    private function Init takes nothing returns nothing
        local integer i

        debug set fastArenaTimerTime = debugFastArenaTimerTime

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            set unitGroup[i] = CreateGroup()
            set i = i + 1
        endloop
        call AddDamageAction(function OnDamage)
    endfunction

endscope