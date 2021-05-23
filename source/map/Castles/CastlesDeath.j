/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     23.05.2021 11:30       =
=============================================

Castles OnDestroy() event

*/

scope CastlesDeath initializer Init

    globals
        private constant integer unitDebuffId = 'A02G'  // Потеря замка
    endglobals

    private function Castle_OnDestroy takes nothing returns nothing
        local unit castleUnit = GetDyingUnit()  // Castle
        local player castleConqueror  // Who destroyed castle
        local player castleOwner  // Owner of castle
        local boolean IsCastle = (GetUnitTypeId(castleUnit) == castleRC)
        local unit dummyUnit
        local real castleUnitX
        local real castleUnitY
        local integer i = 0
        local string message = ""

        if IsCastle == false then
            set castleUnit = null
            set castleConqueror = null
            set castleOwner = null
            set dummyUnit = null
            return
        endif

        set castleConqueror = GetOwningPlayer(GetKillingUnit())
        set castleOwner = GetOwningPlayer(castleUnit)
        call PlaySoundBJ(gg_snd_Warning)

        if castleOwner == castleConqueror then
            set message = "Игрок " + C_IntToColor(GetPlayerId(castleOwner)) + GetPlayerName(castleOwner) + "|r разрушил свой замок! Он теряет " + RED + I2S(5) + "%|r очков арены."
        else
            set message = "Замок игрока " + C_IntToColor(GetPlayerId(castleOwner)) + GetPlayerName(castleOwner) + "|r был разрушен! " + RED + I2S(10) + "%|r его очков арены достаются завоевателю замка, а все юниты " + C_IntToColor(GetPlayerId(castleOwner)) + GetPlayerName(castleOwner) + "|r теряют " + GREEN + I2S(15) + "%|r скорости боя и передвижения."
            call GroupRemoveUnit(castles, castleUnit)
            set dummyUnit = CreateUnitEx(castleOwner, dummyTypeId, 0, 0, 0)
            call GroupAddUnit(waveDummyUnits, dummyUnit)
            call UnitAddAbility(dummyUnit, unitDebuffId)
            set pdb[castleConqueror].castlesDestroyed = pdb[castleConqueror].castlesDestroyed + 1
            set pdb[castleConqueror].curWaveCastlesDestroyed = pdb[castleConqueror].curWaveCastlesDestroyed + 1
        endif

        for i = 0 to maxNumberOfPlayers - 1
            call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, message)
        endfor

        set castleUnit = null
        set castleConqueror = null
        set castleOwner = null
        set dummyUnit = null
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerAddAction(t, function Castle_OnDestroy)

        set t = null
    endfunction

endscope