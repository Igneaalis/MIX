/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     13.12.2020 16:21       =
=============================================

Income Objects OnDestroy() event

*/

scope IncomeObjectsDeath initializer inc_colour

    function inc_colour_actions takes nothing returns nothing
        local integer i
        local unit IncomeObjectiveUnit = GetDyingUnit()  // IncomeObject
        local unit IncomeObjectiveNewUnit  // Replace IncomeObject
        local player IncomeObjectReceiever = GetOwningPlayer(GetKillingUnit())  // Who gets IncomeObject
        local player IncomeObjectOwner = GetOwningPlayer(IncomeObjectiveUnit)  // Who loses IncomeObject
        local boolean IsBigGoldMine = (GetUnitTypeId(IncomeObjectiveUnit) == bigMineRC)
        local boolean IsSmallGoldMine = (GetUnitTypeId(IncomeObjectiveUnit) == smallMineRC)
        local boolean IsFlag = (GetUnitTypeId(IncomeObjectiveUnit) == flagRC)
        local boolean IsOwnerTheReceiver = (IncomeObjectOwner == IncomeObjectReceiever)
        local real IncomeObjectiveUnitX
        local real IncomeObjectiveUnitY
        local Color playerColor  // Color Struct from NokladrLib.j

        if not (IsBigGoldMine or IsSmallGoldMine or IsFlag) then
            set IncomeObjectiveUnit = null
            set IncomeObjectReceiever = null
            set IncomeObjectiveNewUnit = null
            set IncomeObjectOwner = null
            return
        endif

        set IncomeObjectiveUnitX = GetUnitX(IncomeObjectiveUnit)
        set IncomeObjectiveUnitY = GetUnitY(IncomeObjectiveUnit)
        set playerColor = Color.create(IncomeObjectReceiever)

        call ShowUnit(IncomeObjectiveUnit, false)
        call GroupRemoveUnit(IncomeObjects_group, IncomeObjectiveUnit)
        set IncomeObjectiveNewUnit = CreateUnitEx(IncomeObjectReceiever, GetUnitTypeId(IncomeObjectiveUnit), IncomeObjectiveUnitX, IncomeObjectiveUnitY, bj_UNIT_FACING)
        call RemoveUnitEx(IncomeObjectiveUnit) // Remove old IncomeObject to replace it with a new one
        call GroupAddUnit(IncomeObjects_group, IncomeObjectiveNewUnit)
        call SetUnitAnimation(IncomeObjectiveNewUnit, "work")
        call SetUnitVertexColor(IncomeObjectiveNewUnit, playerColor.red, playerColor.green, playerColor.blue, 255) // Adjusts color to match receiver's one

        set pdb[IncomeObjectReceiever].curWaveIncomeObjectsCaptured = pdb[IncomeObjectReceiever].curWaveIncomeObjectsCaptured + 1

        set IncomeObjectiveUnit = null
        set IncomeObjectReceiever = null
        set IncomeObjectiveNewUnit = null
        set IncomeObjectOwner = null
        call playerColor.destroy()
    endfunction

    function inc_colour takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i

        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_DEATH, null)
        endfor
        call TriggerAddAction(t, function inc_colour_actions)

        set t = null
    endfunction

endscope