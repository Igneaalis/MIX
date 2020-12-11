/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     22.11.2020 18:00       =
=============================================

Улучшение инкома Проклятый рудник.
!!! - важная информация

*/

function Trig_income_upgTQ_Conditions takes nothing returns boolean
    local boolean IsIncomeObjective = false
    local boolean DoesVictimHasUpgrade = false
    local boolean DoesVictimsUpgradeGreaterThanKillers = false
    local unit killer = GetKillingUnit()        // unit who has killed victim
    local unit victim = GetDyingUnit()          // unit who was killed by killer
    local integer v_rc = GetUnitTypeId(victim)  // raw code of victim unit
    local integer k_rc = GetUnitTypeId(killer)  // raw code of killer unit
    local player p_v = GetOwningPlayer(victim)  // owner of victim unit
    local player p_k = GetOwningPlayer(killer)  // owner of killer unit

    // n003 - Gold Mine большой
    // n004 - Gold Mine маленький
    // n005 - Флаг
    set IsIncomeObjective = ((v_rc == 'n003') or (v_rc == 'n004') or (v_rc == 'n005'))

    // Не действует на игроков с уровнем улучшения "Проклятый рудник" ниже вашего на 1 и выше.
    set DoesVictimHasUpgrade = GetPlayerTechCount(p_v, cursed_mine_rc, true) > 0
    set DoesVictimsUpgradeGreaterThanKillers = (GetPlayerTechCount(p_v, cursed_mine_rc, true) - 1) > GetPlayerTechCount(p_k, cursed_mine_rc, true)

    set killer = null
    set victim = null
    set p_v = null
    set p_k = null
    return IsIncomeObjective and DoesVictimHasUpgrade and DoesVictimsUpgradeGreaterThanKillers
endfunction

// !!! Урон юнитам наносит сам рудник, но после смерти он передаётся убийце, проверить, что урон наносится до передачи
// Функция вызывается к каждому юниту около погибшего рудника
// Если юнит принадлежит убившему и юнит находится в группе udg_wave_units(!!! понять, что за группа), ему наносится урон от рудника типа chaos
function Trig_income_upgTQ_Actions_group takes nothing returns nothing
    local unit u = GetEnumUnit()                                                              // сам юнит
    local boolean b1
    local boolean b2
    local player p = GetOwningPlayer(u)                                                       // владелец юнита
    local player p_k = hash[StringHash("income")].player[StringHash("player_killer")]         // владелец убийцы
    local player p_v = hash[StringHash("income")].player[StringHash("player_victim")]         // владелец рудника(жертвы)
    local real damage = cursed_mine_damage_for_lvl                                            // урон за уровень улучшения, переменная устанавливается в Globals.j
    local unit damage_u = hash[StringHash("income")].unit[StringHash("victim")]               // рудник

    set b1 = IsUnitInGroup(u, udg_wave_units)
    set b2 = (p == p_k)
    if b1 and b2 then
        set damage = damage * I2R(GetPlayerTechCount(p_v, cursed_mine_rc, true))              // формула расчёта урона: урон = cursed_mine_damage_for_lvl * уровень улучшения
        // !!!
        call UnitDamageTargetBJ(damage_u, u, damage, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
        // -----
    endif

    set p = null
    set p_k = null
    set p_v = null
    set u = null
endfunction

function Trig_income_upgTQ_Actions takes nothing returns nothing
    local unit killer = GetKillingUnit()
    local unit victim = GetDyingUnit()
    local integer v_rc = GetUnitTypeId(victim)
    local integer k_rc = GetUnitTypeId(killer)
    local integer i = 1
    local player p_v = GetOwningPlayer(victim)
    local player p_k = GetOwningPlayer(killer)
    local integer n_p_v = GetConvertedPlayerId(p_v)
    local integer n_p_k = GetConvertedPlayerId(p_k)
    local string name_ef = "Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl"
    local real x = GetUnitX(victim)
    local real y = GetUnitY(victim)
    local real x_ef
    local real y_ef
    local real range = cursed_mine_cast_range
    local integer count_wave = cursed_mine_count_wave
    local real angle = 360.00 / I2R(count_wave)
    local group gr = CreateGroup()
    local real range_damage = cursed_mine_range_damage
    local integer gold
    local integer lumber
    local integer percent = cursed_mine_percent
    local string s1
    local string s2
    
    loop
        exitwhen i > count_wave
        set x_ef = x + range * Cos(angle * i * bj_DEGTORAD)
        set y_ef = y + range * Sin(angle * i * bj_DEGTORAD)
        call DestroyEffect(AddSpecialEffect(name_ef, x_ef, y_ef))
        set i = i + 1
    endloop

    call GroupEnumUnitsInRange(gr, x, y, range_damage, null)

    set hash[StringHash("income")].player[StringHash("player_killer")] = p_k
    set hash[StringHash("income")].player[StringHash("player_victim")] = p_v
    set hash[StringHash("income")].unit[StringHash("victim")] = victim

    call ForGroup(gr, function Trig_income_upgTQ_Actions_group)

    set gold = GetPlayerState(p_k, PLAYER_STATE_RESOURCE_GOLD) * percent / 100
    set lumber = GetPlayerState(p_k, PLAYER_STATE_RESOURCE_LUMBER) * percent / 100

    call AddGoldToPlayer(gold, p_v)
    call AddGoldToPlayer(-gold, p_k)
    call AddLumberToPlayer(lumber, p_v)
    call AddLumberToPlayer(-lumber, p_k)

    set s1 = "Вы украли |cFFFFCD00" + I2S(gold) + "|r ед. золота и |cFFB23AEE" + I2S(lumber) + "|r ед. самоцветов у игрока " + udg_players_colour[n_p_k] + udg_players_name[n_p_k]
    set s2 = "Вас ограбил игрок " + udg_players_colour[n_p_v] + udg_players_name[n_p_v]
    call DisplayTextToPlayer(p_v, 0, 0, s1)
    call DisplayTextToPlayer(p_k, 0, 0, s2)

    call DestroyGroup(gr)
    set name_ef = null
    set gr = null
    set killer = null
    set victim = null
    set p_v = null
    set p_k = null
    set s1 = null
    set s2 = null
endfunction

//===========================================================================
function InitTrig_income_upgTQ takes nothing returns nothing
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
    call TriggerAddCondition(t, Condition(function Trig_income_upgTQ_Conditions))
    call TriggerAddAction(t, function Trig_income_upgTQ_Actions)

    set t = null
endfunction