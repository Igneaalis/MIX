/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     08.11.2020 20:42       =
= Дата изменения:    03.12.2020 14:51       =
=============================================

Исследования инкома.
!!! - важная информация

*/
function Trig_income_upg_Conditions takes nothing returns boolean
    local integer i = 1
    local integer research_rc = GetResearched()
    loop
        exitwhen i == incSpellrc_count
        if research_rc == incSpellrc[i] then
            return true
        endif
        set i = i + 1
    endloop
    return false
endfunction

// Действие улучшения Развитие ради развития
function Trig_income_upg_actions_evforev takes player p returns nothing
    local real r
    local integer bonus_gold
    local integer bonus_lumber

    set r = evforev_bonus_res_mod * I2R(GetPlayerTechCount(p, evforev_rc, true)) + evforev_bonus_res
    set bonus_gold = R2I(r * I2R(GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)))
    set bonus_lumber = R2I(r * I2R(GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)))

    call AddGoldToPlayer(bonus_gold, p)
    call AddLumberToPlayer(bonus_lumber, p)
    
endfunction

function Aggrgame_conditions takes nothing returns boolean
    return IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON)
endfunction

function Aggrgame_group takes nothing returns nothing
    local unit u = GetEnumUnit()
    if GetUnitAbilityLevel(u, aggrgame_aura_rc) == 0 then
        call UnitAddAbility(u, aggrgame_aura_rc)
    else
        call IncUnitAbilityLevel(u, aggrgame_aura_rc)
    endif
    set u = null
endfunction

// Действие улучшения Агрессивной игры
function Trig_income_upg_actions_aggrgame takes player p returns nothing
    local group gr
    
    set gr = CreateGroup()
    call GroupEnumUnitsOfPlayer(gr, p, Condition(function Aggrgame_conditions)) 
    call ForGroup(gr, function Aggrgame_group)
    
    call DestroyGroup(gr)
    set gr = null
endfunction

// Добавить в группу игроков всех играющих игроков
function AllPlayingPlayers takes force gr_p returns nothing
    local integer i = 1
    local player p

    loop
        exitwhen i > max_players
        set p = Player(i)
        if (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING) and (GetPlayerController(p) == MAP_CONTROL_USER) then
            call ForceAddPlayer(gr_p, p)
        endif
        set i = i + 1
    endloop

    set p = null
endfunction

// Работа таймера Вклад в игрока
function Timer_contr_to_pl_actions takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local player p = hash[StringHash("income")].player[GetHandleId(t)]
    local integer count_research = GetPlayerTechCount(p, contr_to_pl_rc, true)
    local integer gold = contr_to_pl_gold + (contr_to_pl_gold_mod * (count_research - 1))
    local integer lumber = contr_to_pl_lumber + (contr_to_pl_lumber_mod * (count_research - 1))
    local string s1
    local string s2

    set gold = R2I(contr_to_pl_multy * I2R(gold))
    set lumber = R2I(contr_to_pl_multy * I2R(lumber))

    call AddGoldToPlayer(gold, p)
    call AddLumberToPlayer(lumber, p)

    set s1 = "Доход с вложения в игрока: |cFFFFCD00" + I2S(gold)
    set s2 = "Доход с вложения в игрока: |cFFB23AEE" + I2S(lumber)
    
    call DisplayTextToPlayer(p, 0, 0, s1)
    call DisplayTextToPlayer(p, 0, 0, s2)
    // !!! Найти причину, зачем увеличивается лвл улучшения Подождите 5 минут
    call SetPlayerTechResearched(p, wait_five_minutes_rc, count_research)
    // ----------------------------------------------------------------------

    call PauseTimer(t)
    call DestroyTimer(t)
    set p = null
    set t = null
    set s1 = null
    set s2 = null
endfunction

// Действие улучшения Вклад в игрока
function Trig_income_upg_actions_contr_to_pl takes player p, integer count_research returns nothing
    local force gr_p
    local player rand_p
    local integer bonus_gold
    local integer bonus_lumber
    local string mes
    local timer t

    set gr_p = CreateForce()
    call AllPlayingPlayers(gr_p)
    call ForceRemovePlayer(gr_p, p)
    set rand_p = ForcePickRandomPlayer(gr_p)

    set bonus_gold = contr_to_pl_gold + (contr_to_pl_gold_mod * (count_research - 1))
    set bonus_lumber = contr_to_pl_lumber + (contr_to_pl_lumber_mod * (count_research - 1))

    call AddGoldToPlayer(bonus_gold, rand_p)
    call AddLumberToPlayer(bonus_lumber, rand_p)

    set mes = "В вас вложились: |cFFFFCD00" + I2S(bonus_gold)
    call DisplayTimedTextToPlayer(rand_p, 0, 0, 10.00, mes)
    set mes = "В вас вложились: |cFFB23AEE" + I2S(bonus_lumber)
    call DisplayTimedTextToPlayer(rand_p, 0, 0, 10.00, mes)

    set t = CreateTimer()
    set hash[StringHash("income")].player[GetHandleId(t)] = rand_p
    call TimerStart(t, contr_to_pl_time, false, function Timer_contr_to_pl_actions)

    call DestroyForce(gr_p)
    set mes = null
    set rand_p = null
    set t = null
    set gr_p = null
endfunction

function Trig_income_upg_actions_goldmining takes player p, integer number_p, integer research_rc returns nothing
    local integer lvl_research = GetPlayerTechCount(p, research_rc, true)

    set udg_income_gold[number_p] = udg_income_gold[number_p] + goldmining_income[lvl_research]
    set udg_income_goldmine_c[number_p] = udg_income_goldmine_c[number_p] + goldmining_main_mine[lvl_research]
    set udg_income_goldmine_l[number_p] = udg_income_goldmine_l[number_p] + goldmining_extra_mine[lvl_research]

endfunction

// Смещает все элементы массива на один вверх, последний пропадает, на первый слот ставится игрок p
function Trig_income_upg_actions_ticket takes player p returns nothing
    local integer i = max_ticket_list - 1
    loop
        exitwhen i < 1
        set ticket_list[i] = ticket_list[i - 1]
        set i = i - 1
    endloop
    set  ticket_list[0] = p
endfunction

// Действие улучшения Драгоценные камни
function Trig_income_upg_actions_jewelry takes integer number_p returns nothing
    set udg_income_wood[number_p] = udg_income_wood[number_p] + jewelry_lumber_for_lvl
endfunction

// Действие улучшения Вклад
function Trig_income_upg_actions_contr takes player p, integer count_research returns nothing
    local string s1
    local string s2 
    local integer gold = contr_gold + ((count_research - 1) * contr_gold_mod)
    local integer lumber = contr_lumber + ((count_research - 1) * contr_lumber_mod)

    set gold = gold * contr_percent / 100
    set lumber = lumber * contr_percent / 100
    set s1 = "Доход с вклада: |cFFFFCD00" + I2S(gold)
    set s2 = "Доход за вклад: |cFFB23AEE" + I2S(lumber)
    
    call AddGoldToPlayer(gold, p)
    call AddLumberToPlayer(lumber, p)
    call DisplayTextToPlayer(p, 0, 0, s1)
    call DisplayTextToPlayer(p, 0, 0, s2)

    set s1 = null
    set s2 = null
endfunction

// Поиск номера таймера
function find_number_timer takes timer t returns integer
    local integer number_timer = 0
    local integer i = 1 

    loop
        exitwhen i > max_players
        if (t == stab_timer_gold[i]) or (t == stab_timer_lumber[i]) then
            set number_timer = i
        endif
        set i = i + 1
    endloop

    return number_timer
endfunction

// Работа таймера stab_timer_gold
function stab_timer_gold_actions takes nothing returns nothing
    local player p
    local integer number_p
    local integer count_research
    local timer t = GetExpiredTimer()

    set number_p = find_number_timer(t)
    set p = Player(number_p - 1)
    set count_research = GetPlayerTechCount(p, stab_rc, true)

    call AddGoldToPlayer(stab_gold[count_research], p)

    set p = null
    set t = null
endfunction

// Работа таймера stab_timer_lumber
function stab_timer_lumber_actions takes nothing returns nothing
    local player p
    local integer number_p
    local integer count_research
    local timer t = GetExpiredTimer()

    set number_p = find_number_timer(t)
    set p = Player(number_p - 1)
    set count_research = GetPlayerTechCount(p, stab_rc, true)

    call AddLumberToPlayer(stab_lumber[count_research], p)

    set p = null
    set t = null
endfunction

// Действие улучшения Стабильность
function Trig_income_upg_actions_stab takes integer number_p, integer count_research returns nothing
    if count_research == 1 then
        set stab_timer_gold[number_p] = CreateTimer()
        set stab_timer_lumber[number_p] = CreateTimer()
    endif

    call TimerStart(stab_timer_gold[number_p], stab_time_gold[count_research], true, function stab_timer_gold_actions)
    call TimerStart(stab_timer_lumber[number_p], stab_time_lumber[count_research], true, function stab_timer_lumber_actions)
endfunction

// Условие улучшения Лидерство, удалить юнитов Больше всех убийств за прошедший раунд и Или лидерство по очкам арены за пошедший раунд
function Trig_income_upg_actions_leadership_group takes nothing returns nothing
    local unit u = GetEnumUnit()
    local integer u_rc = GetUnitTypeId(u)

    if (u_rc == most_point_kill_last_round) or (u_rc == or_leadership_arena_last_round) then
        call RemoveUnit(u)
    endif

    set u = null
endfunction

// Действие улучшения Лидерство
function Trig_income_upg_actions_leadership takes player p, integer number_p returns nothing
    local group gr = CreateGroup()

    set udg_leader_kf[number_p] = udg_leader_kf[number_p] + leadership_bonus
    call GroupEnumUnitsOfPlayer(gr, p, null)

    // !!! Муторная система с группой, разобраться
    call ForGroup(gr, function Trig_income_upg_actions_leadership_group)
    //----------------------------------------------

    call DestroyGroup(gr)
    set gr = null
endfunction

// Основное тело
function Trig_income_upg_Actions takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local player p = GetOwningPlayer(u)
    local integer number_p = GetConvertedPlayerId(p)
    local integer count_upg = udg_scoreboard_upg[number_p]
    local integer research_rc = GetResearched()
    local integer bonus_gold
    local integer bonus_lumber
    local integer count_research = GetPlayerTechCount(p, research_rc, true)
    local real r

    set count_upg = count_upg + 1
    set udg_scoreboard_upg[number_p] = count_upg

    // Обновление значений кол-ва исследований в таблице
    call MultiboardSetItemValueBJ(udg_scoreboard, 5, (number_p + 1), I2S(count_upg))

    // Кол-во исследований(улучшений)
    if count_upg == count_research_for_t1 then 
        call SetPlayerTechResearched(p, t1_research_rc, 1)
    elseif count_upg == count_research_for_t2 then
        call SetPlayerTechResearched(p, t2_research_rc, 1)
    endif

    // Грабёж
    if research_rc == robbery_rc then 
        if GetPlayerTechCount(p, robbery_rc, true) == 3 then
            call SetPlayerTechResearched(p, robbery_lvl3_rc, 1)
        elseif GetPlayerTechCount(p, robbery_rc, true) == 5 then
            call SetPlayerTechResearched(p, robbery_lvl5_rc, 1)
        endif
    endif
    
    // Развитие ради развития
    if GetPlayerTechCount(p, evforev_rc, true) > 0 then
        call Trig_income_upg_actions_evforev(p)
    endif

    // Агрессивная игра
    // Выделяем всех наших юнитов типа рабочий
    // и даём им ауру на скорость атаки и скорость бега, если
    // её нет, повышаем её уровень
    // !!!стоит переделать, если всего 1 рабочий, проще его в переменные забить и давать способность ему напрямую
    if research_rc == aggrgame_rc then 
        call Trig_income_upg_actions_aggrgame(p)
    endif
        
    // Вклад в игрока
    // !!!добавить удаление улучшения, если игрок один на карте
    if research_rc == contr_to_pl_rc then
        call Trig_income_upg_actions_contr_to_pl(p, count_research)
    endif

    // Золотодобыча
    if research_rc == goldmining_rc then
        call Trig_income_upg_actions_goldmining(p, number_p, research_rc)
    endif

    // Билет
    if research_rc == ticket_rc then
        call Trig_income_upg_actions_ticket(p)
    endif

    // Драгоценные камни
    if research_rc == jewelry_rc then
        call Trig_income_upg_actions_jewelry(number_p)
    endif

    // Вклад
    if research_rc == contr_rc then
        call Trig_income_upg_actions_contr(p, count_research)
    endif

    // Стабильность
    if research_rc == stab_rc then
        call Trig_income_upg_actions_stab(number_p, count_research)
    endif

    // Лидерство
    if research_rc == leadership_rc then
        call Trig_income_upg_actions_leadership(p, number_p)
    endif

    set p = null
    set u = null
endfunction

//===========================================================================
function InitTrig_income_upg takes nothing returns nothing
    local trigger t = CreateTrigger()

    call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x08), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x09), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x0A), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x0B), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    call TriggerAddCondition(t, Condition(function Trig_income_upg_Conditions))
    call TriggerAddAction(t, function Trig_income_upg_Actions)
    
    set t = null
endfunction
