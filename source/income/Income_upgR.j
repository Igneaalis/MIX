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
function InitTrig_income_upgR takes nothing returns nothing
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
    call TriggerAddCondition(t, Condition( function Trig_income_upgR_Conditions))
    call TriggerAddAction(t, function Trig_income_upgR_Actions)
    
    set t = null
endfunction

