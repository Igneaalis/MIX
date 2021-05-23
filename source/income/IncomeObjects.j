/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 12:03       =
=============================================

Реализация прибыли за каждый Income Object и создание плавающего текста

*/

scope IncomeIncomeObjects initializer Init
    
    globals
        
    endglobals

    private function CreateIncomeObjectText takes integer gold, integer points, unit u returns nothing
        call ArcingTextTag.create((GOLD + "+" + I2S(gold) + "|r"), u)
        call TriggerSleepAction(0.33)
        call ArcingTextTag.create((RED + "+" + I2S(points) + "|r"), u)
    endfunction

    private function ForIncomeObject takes nothing returns nothing
        local player p = GetEnumPlayer()
        local unit u = GetEnumUnit()
        local integer uTypeId = GetUnitTypeId(u)
        local integer gold
        local integer points

        if p != GetOwningPlayer(u) then
            set p = null
            set u = null
            return
        endif

        if uTypeId == bigMineRC then
            set gold = pdb[p].incomeBigMineGold
            set points = pdb[p].incomeBigMinePoints
        elseif uTypeId == smallMineRC then
            set gold = pdb[p].incomeSmallMineGold
            set points = pdb[p].incomeSmallMinePoints
        elseif uTypeId == flagRC then
            set gold = pdb[p].incomeFlagGold
            set points = pdb[p].incomeFlagPoints
        endif

        call AddGoldToPlayer(gold, p)
        set pdb[p].points = pdb[p].points + points
        set pdb[p].incomeObjectsPoints = pdb[p].incomeObjectsPoints + points
        call CreateIncomeObjectText.execute(gold, points, u)

        set p = null
        set u = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local real curPoints = pdb[p].points

        call ForGroup(IncomeObjects_group, function ForIncomeObject)
        set pdb[p].incomePoints = pdb[p].points - curPoints  // For multiboard display

        set p = null
    endfunction

    private function Actions takes nothing returns nothing
        call ForForce(players, function ForPlayer)
    endfunction
    
    private function Init takes nothing returns nothing
        call TimerStart(CreateTimer(), 1, true, function Actions)
    endfunction
    
endscope