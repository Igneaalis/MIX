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
    endglobals

    private function OnDie takes nothing returns nothing
        local unit dyingUnit = GetDyingUnit()
        local unit killerUnit = GetKillingUnit()
        local player ownerOfDyingUnit = GetOwningPlayer(dyingUnit)
        local player ownerOfKillerUnit = GetOwningPlayer(killerUnit)
        local integer dyingUnitTypeId = GetUnitTypeId(dyingUnit)

        static if not DEBUG_MODE then
            if ownerOfDyingUnit == ownerOfKillerUnit then
                set dyingUnit = null
                set killerUnit = null
                set ownerOfDyingUnit = null
                set ownerOfKillerUnit = null
                return
            endif
        endif

        if IsPlayerInForce(ownerOfDyingUnit, players) then
            if dyingUnitTypeId == castleRC then
                call GroupRemoveUnit(castles, dyingUnit)
                set pdb[ownerOfKillerUnit].castlesDestroyed = pdb[ownerOfKillerUnit].castlesDestroyed + 1
            else
                call GroupRemoveUnit(waveUnits, dyingUnit)
                set pdb[ownerOfKillerUnit].kills = pdb[ownerOfKillerUnit].kills + 1
            endif
        endif

        set dyingUnit = null
        set killerUnit = null
        set ownerOfDyingUnit = null
        set ownerOfKillerUnit = null
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
        call TriggerRegisterPlayerUnitEvent(t, Player(0x08), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x09), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0A), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0B), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0C), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0D), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0E), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0F), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x10), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x11), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x12), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x13), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x14), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x15), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x16), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x17), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x18), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x19), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x1A), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x1B), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerAddAction(t, function OnDie)

        set t = null
    endfunction
    
endscope