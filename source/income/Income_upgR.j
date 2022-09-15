/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     11.11.2020 20:00       =
=============================================

Улучшение инкома Мёртвые деньги.
!!! - важная информация

*/

scope IncomeUpgradeR initializer Init_income_upgR

    function Trig_income_upgR_Conditions takes nothing returns boolean
        local boolean b1
        local boolean b2
        local boolean b3
        local unit killer = GetKillingUnit()
        local unit victim = GetDyingUnit()
        local player p_k = GetOwningPlayer(killer)
        local player p_v = GetOwningPlayer(victim)
        
        set b1 = GetPlayerTechCountSimple(deadmoney_rc, p_k) > 0
        set b2 = IsUnitInGroup(killer, waveUnits)
        set b3 = IsPlayerEnemy(p_v, p_k)
        
        set p_k = null
        set p_v = null
        set killer = null
        set victim = null
        
        return b1 and b2 and b3

    endfunction

    function Trig_income_upgR_Actions takes nothing returns nothing
        local unit killer = GetKillingUnit()
        local player p_k = GetOwningPlayer(killer)
        local integer n = deadmoney_money_for_lvl
        local integer sum

        set sum = n * GetPlayerTechCountSimple(deadmoney_rc, p_k)
        call AddGoldToPlayer(sum, p_k)

        set killer = null
        set p_k = null
    endfunction

    //===========================================================================
    function Init_income_upgR takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i

        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_DEATH, null)
        endfor
        call TriggerAddCondition(t, Condition(function Trig_income_upgR_Conditions))
        call TriggerAddAction(t, function Trig_income_upgR_Actions)
        
        set t = null
    endfunction

endscope