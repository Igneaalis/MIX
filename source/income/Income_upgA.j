/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     22.11.2020 13:00       =
=============================================

Улучшение инкома Грабёж.
!!! - важная информация

*/

function Trig_income_upgA_Conditions takes nothing returns boolean
    local boolean b1
    local boolean b2
    local boolean b3
    local boolean b4
    local unit killer = GetKillingUnit()
    local unit victim = GetDyingUnit()
    local player p_k = GetOwningPlayer(killer)
    local player p_v = GetOwningPlayer(victim)
    
    set b1 = GetPlayerTechCountSimple(robbery_rc, p_k) > 0
    set b2 = IsUnitInGroup(killer, udg_wave_units)
    set b3 = IsPlayerEnemy(p_v, p_k)
    set b4 = GetUnitTypeId(GetDyingUnit()) == castle_rc
    
    set p_k = null
    set p_v = null
    set killer = null
    set victim = null
    
    return b1 and b2 and b3 and b4

endfunction

function Trig_income_upgA_Actions takes nothing returns nothing
    local unit killer = GetKillingUnit()
    local unit victim = GetDyingUnit()
    local player p_k = GetOwningPlayer(killer)
    local player p_v = GetOwningPlayer(victim) 
    local integer gold = GetPlayerState(p_v, PLAYER_STATE_RESOURCE_GOLD)
    local integer lumber = GetPlayerState(p_v, PLAYER_STATE_RESOURCE_LUMBER)
    local integer lvl_research = GetPlayerTechCountSimple(robbery_rc, p_k)
    local integer p_k_n = GetConvertedPlayerId(p_k)
    local integer p_v_n = GetConvertedPlayerId(p_v)
    local real multy = robbery_pr_f[lvl_research] * 0.01
    local string killer_mes
    local string victim_mes
    local string color_k = udg_players_colour[p_k_n]
    local string color_v = udg_players_colour[p_v_n]
    local string name_k = udg_players_name[p_k_n]
    local string name_v = udg_players_name[p_v_n]

    set gold = R2I(I2R(gold) * multy)
    set lumber = R2I(I2R(lumber) * multy)
    
    call AddGoldToPlayer(gold, p_k)
    call AddGoldToPlayer(-gold, p_v)
    call AddLumberToPlayer(lumber, p_k)
    call AddLumberToPlayer(-lumber, p_v)

    set killer_mes = "Вы украли |cFFFFCD00" + I2S(gold) + "|r ед. золота и |cFFB23AEE" + I2S(lumber) + "|r ед. самоцветов у игрока " + color_v + name_v
    set victim_mes = "Вас ограбил игрок " + color_k + name_k
    call DisplayTextToPlayer(p_k, 0, 0, killer_mes)
    call DisplayTextToPlayer(p_v, 0, 0, victim_mes)

    set p_k = null
    set p_v = null
    set killer = null
    set victim = null
    set killer_mes = null
    set victim_mes = null
    set color_k = null
    set color_v = null
    set name_k = null
    set name_v = null
endfunction

//===========================================================================
function InitTrig_income_upgA takes nothing returns nothing
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
    call TriggerAddCondition(t, Condition( function Trig_income_upgA_Conditions))
    call TriggerAddAction(t, function Trig_income_upgA_Actions)
    
    set t = null
endfunction