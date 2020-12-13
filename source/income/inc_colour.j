function inc_colour_actions takes nothing returns nothing
    local unit IncomeObjectiveUnit = GetDyingUnit() // IncomeObject
    local player IncomeObjectReceiever = GetOwningPlayer(GetKillingUnit()) // Who gets IncomeObject
    local unit IncomeObjectiveNewUnit // Replace IncomeObject
    local player IncomeObjectOwner = GetOwningPlayer(IncomeObjectiveUnit) // Who loses IncomeObject
    local boolean IsHugeGoldMine = (GetUnitTypeId(IncomeObjectiveUnit) == 'n003')
    local boolean IsSmallGoldMine = (GetUnitTypeId(IncomeObjectiveUnit) == 'n004')
    local boolean IsFlag = (GetUnitTypeId(IncomeObjectiveUnit) == 'n005')
    local boolean IsOwnerTheReceiver = (IncomeObjectOwner == IncomeObjectReceiever)
    local real IncomeObjectiveUnitX = GetUnitX(IncomeObjectiveUnit)
    local real IncomeObjectiveUnitY = GetUnitY(IncomeObjectiveUnit)
    local Color playerColor = Color.create(IncomeObjectReceiever) // Color Struct from NokladrLib.j

    if not (IsHugeGoldMine or IsSmallGoldMine or IsFlag) then
        return // No actions
    endif

    call RemoveUnit(IncomeObjectiveUnit) // Remove old IncomeObject to replace it with a new one
    set IncomeObjectiveNewUnit = CreateUnit(IncomeObjectReceiever, GetUnitTypeId(IncomeObjectiveUnit), IncomeObjectiveUnitX, IncomeObjectiveUnitY, bj_UNIT_FACING)
    call SetUnitVertexColor(IncomeObjectiveNewUnit, playerColor.red, playerColor.green, playerColor.blue, 255) // Adjusts color to match receiver's one

    set IncomeObjectiveUnit = null
    set IncomeObjectReceiever = null
    set IncomeObjectiveNewUnit = null
    set IncomeObjectOwner = null
    call playerColor.destroy()
endfunction

function inc_colour takes nothing returns nothing
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
    call TriggerAddAction(t, function inc_colour_actions)

    set t = null
endfunction