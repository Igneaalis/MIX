/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 15:04       =
=============================================

Объявление group waveUnits
Реализация OnDie() event

*/

scope Units initializer Init
    
    globals
        group waveUnits = CreateGroup()
        group waveDummyUnits = CreateGroup()
        constant integer dummyTypeId = 'eRez'
    endglobals

    private function OnDie takes nothing returns nothing
        local unit dyingUnit = GetDyingUnit()
        local unit killerUnit = GetKillingUnit()
        local player ownerOfDyingUnit = GetOwningPlayer(dyingUnit)
        local player ownerOfKillerUnit = GetOwningPlayer(killerUnit)
        local integer dyingUnitTypeId = GetUnitTypeId(dyingUnit)

        if ownerOfDyingUnit == ownerOfKillerUnit or dyingUnitTypeId == castleRC or dyingUnitTypeId == bigMineRC or dyingUnitTypeId == smallMineRC or dyingUnitTypeId == flagRC then
            set dyingUnit = null
            set killerUnit = null
            set ownerOfDyingUnit = null
            set ownerOfKillerUnit = null
            return
        endif

        if IsPlayerInForce(ownerOfDyingUnit, players) then
            if IsUnitInGroup(dyingUnit, waveUnits) then
                call GroupRemoveUnit(waveUnits, dyingUnit)
            endif
            set pdb[ownerOfKillerUnit].kills = pdb[ownerOfKillerUnit].kills + 1
        endif

        set dyingUnit = null
        set killerUnit = null
        set ownerOfDyingUnit = null
        set ownerOfKillerUnit = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i
        
        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_DEATH, null)
        endfor
        call TriggerAddAction(t, function OnDie)

        set t = null
    endfunction
    
endscope