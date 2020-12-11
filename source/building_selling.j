/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     11.12.2020 18:21       =
=============================================

Продажа зданий.

*/

scope UDBLib
    globals
        UnitDB udb
        private UnitStruct array usarr[128]
        private integer usarrcounter = 1
    endglobals

    struct UnitStruct
        private integer gold
        private integer lumber
        private real gold_raw
        private real lumber_raw

        static method create takes integer unitTypeId, integer gold, integer lumber, integer parentUnitTypeId returns UnitStruct
            local UnitStruct us = UnitStruct.allocate()
            set us.gold_raw = gold * 0.8
            set us.lumber_raw = lumber * 0.8
            if (usarr[table[parentUnitTypeId]] != null) then
                set us.gold = R2I(us.gold_raw + usarr[table[parentUnitTypeId]].GetGoldRaw())
                set us.lumber = R2I(us.lumber_raw + usarr[table[parentUnitTypeId]].GetLumberRaw())
            else
                set us.gold = IMaxBJ(R2I(gold * 0.8), 1)
                set us.lumber = IMaxBJ(R2I(lumber * 0.8), 1)
            endif
            set table[unitTypeId] = usarrcounter
            set usarr[usarrcounter] = us
            set usarrcounter = usarrcounter + 1
            return us
        endmethod

        method GetGold takes nothing returns integer
            return gold
        endmethod
        
        method GetLumber takes nothing returns integer
            return lumber
        endmethod

        method GetGoldRaw takes nothing returns real
            return gold_raw
        endmethod

        method GetLumberRaw takes nothing returns real
            return lumber_raw
        endmethod

    endstruct

    struct UnitDB
        method operator [] takes unit u returns UnitStruct
            return usarr[table[GetUnitTypeId(u)]]
        endmethod
    endstruct

endscope

function building_selling_conditions takes nothing returns boolean
    return (GetSpellAbilityId() == 'A002') // Способность "Продать"
endfunction

function building_selling_actions takes nothing returns nothing
    local unit u = GetSpellAbilityUnit()
    local player p = GetTriggerPlayer()
    call GroupRemoveUnit(udg_buildings, u)
    set udg_sold_gold = udb[u].GetGold()
    set udg_sold_wood = udb[u].GetLumber()

    call AddGoldToPlayer(udg_sold_gold, p)
    call AddLumberToPlayer(udg_sold_wood, p)

    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + I2S(udg_sold_gold) ), GetUnitLoc(GetSpellAbilityUnit()), 0, 11.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 48.00, 90 )

    call CreateTextTagLocBJ( ( "|cFFB23AEE+" + I2S(udg_sold_wood) ), GetUnitLoc(GetSpellAbilityUnit()), 48.00, 11.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 48.00, 90 )

    call RemoveUnit(u)
    set udg_sold_gold = 0
    set udg_sold_wood = 0
    call AddSpecialEffectLocBJ( GetUnitLoc(u), "Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl" )
    call DestroyEffectBJ( GetLastCreatedEffectBJ() )

    set u = null
    set p = null
endfunction

//===========================================================================
function building_selling takes nothing returns nothing
    local trigger t = CreateTrigger()

    call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x08), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x09), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x0A), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerRegisterPlayerUnitEvent(t, Player(0x0B), EVENT_PLAYER_UNIT_SPELL_CAST, null)
    call TriggerAddCondition(t, Condition(function building_selling_conditions))
    call TriggerAddAction(t, function building_selling_actions)

    set udb = UnitDB.create()

    // ---------------------------------Альянс---------------------------------
    call UnitStruct.create('h002', 97, 1, 0)        // Пехотинец
    call UnitStruct.create('h004', 56, 1, 'h002')   // Мечник
    call UnitStruct.create('h005', 146, 1, 'h004')  // Гвардеец

    call UnitStruct.create('h003', 144, 1, 0)       // Стрелок
    call UnitStruct.create('h007', 60, 1, 'h003')   // Снайпер
    call UnitStruct.create('h008', 203, 2, 'h007')  // Элитная лучница

    call UnitStruct.create('h009', 174, 1, 0)       // Ученик
    call UnitStruct.create('h00A', 82, 0, 'h009')   // Целитель
    call UnitStruct.create('h00B', 72, 1, 'h00A')   // Высший целитель

    call UnitStruct.create('h00C', 225, 4, 0)       // Рыцарь
    call UnitStruct.create('h00E', 170, 6, 'h00C')  // Элитный рыцарь
    call UnitStruct.create('h00F', 185, 7, 'h00E')  // Генерал

    call UnitStruct.create('h00J', 178, 2, 0)       // Волшебница
    call UnitStruct.create('h00L', 60, 1, 'h00J')   // Магистр магии
    call UnitStruct.create('h00N', 273, 8, 'h00L')  // Архимаг

    call UnitStruct.create('h00P', 238, 3, 0)       // Наёмник
    call UnitStruct.create('h00Q', 188, 4, 'h00P')  // Убийца
    call UnitStruct.create('h00R', 146, 5, 'h00Q')  // Ассасин

    call UnitStruct.create('h00U', 172, 5, 0)       // Вертолёт
    call UnitStruct.create('h00V', 58, 5, 'h00U')   // Укреплённый вертолёт
    call UnitStruct.create('h00W', 762, 5, 'h00V')  // Штурмовой вертолёт

    call UnitStruct.create('h012', 168, 6, 0)       // Паровая машина
    call UnitStruct.create('h013', 335, 6, 'h012')  // Мортира
    call UnitStruct.create('h014', 707, 8, 'h013')  // Паровой танк

    // ---------------------------------Нежить---------------------------------

    call UnitStruct.create('h016', 217, 2, 0)       // Скелет
    call UnitStruct.create('h017', 369, 4, 0)       // Скелет-лучник
    call UnitStruct.create('h018', 341, 3, 0)       // Чумной зомби
    call UnitStruct.create('h019', 977, 24, 0)      // Некромант
    call UnitStruct.create('h01A', 555, 13, 0)      // Вурдалак
    call UnitStruct.create('h01B', 479, 11, 0)      // Слуга неруба
    call UnitStruct.create('h01C', 681, 18, 0)      // Мясник
    call UnitStruct.create('h01D', 447, 10, 0)      // Банши
    call UnitStruct.create('h01E', 1038, 11, 0)     // Рыцарь смерти
    call UnitStruct.create('h01F', 1351, 15, 0)     // Ледяной змей

    // ------------------------------Ночные эльфы------------------------------

    call UnitStruct.create('h01H', 361, 4, 0)       // Охотница
    call UnitStruct.create('h01I', 405, 4, 0)       // Лучница
    call UnitStruct.create('h01J', 377, 4, 0)       // Дух
    call UnitStruct.create('h01K', 551, 19, 0)      // Друид-ворон
    call UnitStruct.create('h01L', 698, 24, 0)      // Дриада
    call UnitStruct.create('h01M', 512, 18, 0)      // Лесной дракончик
    call UnitStruct.create('h01N', 505, 17, 0)      // Друид-медведь
    call UnitStruct.create('h01P', 817, 28, 0)      // Баллиста
    call UnitStruct.create('h01Q', 888, 22, 0)      // Горный великан
    call UnitStruct.create('h01R', 1160, 29, 0)     // Химера

    // ----------------------------------Орда----------------------------------

    call UnitStruct.create('h01S', 375, 3, 0)       // Бугай
    call UnitStruct.create('h01T', 429, 4, 0)       // Охотник за головами
    call UnitStruct.create('h01V', 401, 4, 0)       // Кодой
    call UnitStruct.create('h01W', 752, 16, 0)      // Колдун
    call UnitStruct.create('h01X', 547, 11, 0)      // Рейдер
    call UnitStruct.create('h01Y', 773, 16, 0)      // Берсерк
    call UnitStruct.create('h01Z', 668, 14, 0)      // Виверна
    call UnitStruct.create('h020', 705, 15, 0)      // Шаман
    call UnitStruct.create('h021', 1232, 12, 0)     // Минотавр
    call UnitStruct.create('h022', 1950, 19, 0)     // Чёрный дракон

    // ----------------------------------Наги----------------------------------

    call UnitStruct.create('h026', 290, 1, 0)       // Нага воин
    call UnitStruct.create('h027', 439, 2, 0)       // Морской дракон
    call UnitStruct.create('h028', 284, 3, 0)       // Дух моря
    call UnitStruct.create('h02A', 611, 15, 0)      // Нага-сирена
    call UnitStruct.create('h02B', 537, 13, 0)      // Нага-гвардеец
    call UnitStruct.create('h02C', 502, 12, 0)      // Великая черепаха
    call UnitStruct.create('h02D', 1005, 24, 0)     // Коатль
    call UnitStruct.create('h02E', 681, 17, 0)      // Заклинательница
    call UnitStruct.create('h02F', 929, 10, 0)      // Морское чудовище
    call UnitStruct.create('h02G', 1686, 18, 0)     // Высшая гидра

    set t = null
endfunction
