/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     11.11.2020 20:00       =
= Дата изменения:    11.11.2020 20:00       =
=============================================

Улучшение инкома Мёртвые деньги.
!!! - важная информация

*/

function Trig_income_upgR_Conditions takes nothing returns boolean
    local boolean b1
    local boolean b2
    local boolean b3
    local unit killer = GetKillingUnit()
    local unit victim = GetDyingUnit()
    local player p_k = GetOwningPlayer(killer)
    local player p_v = GetOwningPlayer(victim)
    
    set b1 = GetPlayerTechCountSimple(deadmoney_rc, p_k) > 0
    set b2 = IsUnitInGroup(killer, udg_wave_units)
    set b3 = IsPlayerEnemy(p_v, p_k)
    
    set p_k = null
    set p_v = null
    set killer = null
    set victim = null
    
    if b1 and b2 and b3 then
        return true
    endif
    return false

endfunction

function Trig_income_upgR_Actions takes nothing returns nothing
    local unit killer = GetKillingUnit()
    local player p_k = GetOwningPlayer(killer)
    local integer n = deadmoney_money_for_lvl
    local integer sum

    set sum = n * GetPlayerTechCountSimple(deadmoney_rc, p_k)
    call AdjustPlayerStateBJ(sum, p_k, PLAYER_STATE_RESOURCE_GOLD)

    set killer = null
    set p_k = null
endfunction

//===========================================================================
function InitTrig_income_upgR takes nothing returns nothing
    local trigger trg_income_upgR = CreateTrigger( )
    call TriggerRegisterAnyUnitEventBJ( trg_income_upgR, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( trg_income_upgR, Condition( function Trig_income_upgR_Conditions ) )
    call TriggerAddAction( trg_income_upgR, function Trig_income_upgR_Actions )
    set trg_income_upgR = null
endfunction

