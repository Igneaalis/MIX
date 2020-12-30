/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     24.12.2020 21:14       =
=============================================

Реализация быстрой постройки юнитов и добавления их в buildings

*/

scope Build initializer Init
    
    globals
        group buildings = CreateGroup()
    endglobals

    private function OnBuildingStart takes nothing returns nothing
        local unit u = GetEnteringUnit()
        local integer uTypeId = GetUnitTypeId(u)
        local player p = GetOwningPlayer(u)

        if not IsPlayerInForce(p, players) or not IsUnitType(u, UNIT_TYPE_STRUCTURE) or IsUnitInGroup(u, castles) or IsUnitInGroup(u, IncomeObjects_group) or IsUnitInGroup(u, buildings) then
            return
        endif

        call ShowUnit(u, false)
        call GroupAddUnit(buildings, CreateUnitEx(p, uTypeId, GetUnitX(u), GetUnitY(u), GetUnitFacing(u)))
        call RemoveUnitEx(u)

        set u = null
        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        
        call TriggerRegisterEnterRectSimple(t, bj_mapInitialPlayableArea)
        call TriggerAddAction(t, function OnBuildingStart)
        
        set t = null
    endfunction
    
endscope