/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     11.12.2020 18:21       =
=============================================

Продажа зданий.

*/

scope BuildingSelling

    private function CreateSellingText takes integer gold, integer gems, unit u returns nothing
        call ShowUnit(u, false)
        call ArcingTextTag.create((GOLD + "+" + I2S(gold) + "|r"), u)
        call TriggerSleepAction(0.1)
        call ArcingTextTag.create((VIOLET + "+" + I2S(gems) + "|r"), u)
        call RemoveUnitEx(u)
    endfunction

    function building_selling_conditions takes nothing returns boolean
        return (GetSpellAbilityId() == 'A002') // Способность "Продать"
    endfunction

    function building_selling_actions takes nothing returns nothing
        local unit u = GetSpellAbilityUnit()
        local player p = GetTriggerPlayer()
        local integer gold = udb[u].GetGold()
        local integer gems = udb[u].GetGems()
        local texttag tt
        call GroupRemoveUnit(buildings, u)

        call AddGoldToPlayer(gold, p)
        call AddGemsToPlayer(gems, p)

        call CreateSellingText.execute(gold, gems, u)
        
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", GetUnitX(u), GetUnitY(u)))

        set u = null
        set p = null
        set tt = null
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
        call UnitStruct.create('h002', 0)       // Пехотинец
        call UnitStruct.create('h004', 'h002')  // Мечник
        call UnitStruct.create('h005', 'h004')  // Гвардеец

        call UnitStruct.create('h003', 0)       // Стрелок
        call UnitStruct.create('h007', 'h003')  // Снайпер
        call UnitStruct.create('h008', 'h007')  // Элитная лучница

        call UnitStruct.create('h009', 0)       // Ученик
        call UnitStruct.create('h00A', 'h009')  // Целитель
        call UnitStruct.create('h00B', 'h00A')  // Высший целитель

        call UnitStruct.create('h00C', 0)       // Рыцарь
        call UnitStruct.create('h00E', 'h00C')  // Элитный рыцарь
        call UnitStruct.create('h00F', 'h00E')  // Генерал

        call UnitStruct.create('h00J', 0)       // Волшебница
        call UnitStruct.create('h00L', 'h00J')  // Магистр магии
        call UnitStruct.create('h00N', 'h00L')  // Архимаг

        call UnitStruct.create('h00P', 0)       // Наёмник
        call UnitStruct.create('h00Q', 'h00P')  // Убийца
        call UnitStruct.create('h00R', 'h00Q')  // Ассасин

        call UnitStruct.create('h00U', 0)       // Вертолёт
        call UnitStruct.create('h00V', 'h00U')  // Укреплённый вертолёт
        call UnitStruct.create('h00W', 'h00V')  // Штурмовой вертолёт

        call UnitStruct.create('h012', 0)       // Паровая машина
        call UnitStruct.create('h013', 'h012')  // Мортира
        call UnitStruct.create('h014', 'h013')  // Паровой танк

        // ---------------------------------Нежить---------------------------------

        call UnitStruct.create('h016', 0)  // Скелет
        call UnitStruct.create('h017', 0)  // Скелет-лучник
        call UnitStruct.create('h018', 0)  // Чумной зомби
        call UnitStruct.create('h019', 0)  // Некромант
        call UnitStruct.create('h01A', 0)  // Вурдалак
        call UnitStruct.create('h01B', 0)  // Слуга неруба
        call UnitStruct.create('h01C', 0)  // Мясник
        call UnitStruct.create('h01D', 0)  // Банши
        call UnitStruct.create('h01E', 0)  // Рыцарь смерти
        call UnitStruct.create('h01F', 0)  // Ледяной змей

        // ------------------------------Ночные эльфы------------------------------

        call UnitStruct.create('h01H', 0)  // Охотница
        call UnitStruct.create('h01I', 0)  // Лучница
        call UnitStruct.create('h01J', 0)  // Дух
        call UnitStruct.create('h01K', 0)  // Друид-ворон
        call UnitStruct.create('h01L', 0)  // Дриада
        call UnitStruct.create('h01M', 0)  // Лесной дракончик
        call UnitStruct.create('h01N', 0)  // Друид-медведь
        call UnitStruct.create('h01P', 0)  // Баллиста
        call UnitStruct.create('h01Q', 0)  // Горный великан
        call UnitStruct.create('h01R', 0)  // Химера

        // ----------------------------------Орда----------------------------------

        call UnitStruct.create('h01S', 0)  // Бугай
        call UnitStruct.create('h01T', 0)  // Охотник за головами
        call UnitStruct.create('h01V', 0)  // Кодой
        call UnitStruct.create('h01W', 0)  // Колдун
        call UnitStruct.create('h01X', 0)  // Рейдер
        call UnitStruct.create('h01Y', 0)  // Берсерк
        call UnitStruct.create('h01Z', 0)  // Виверна
        call UnitStruct.create('h020', 0)  // Шаман
        call UnitStruct.create('h021', 0)  // Минотавр
        call UnitStruct.create('h022', 0)  // Чёрный дракон

        // ----------------------------------Наги----------------------------------

        call UnitStruct.create('h026', 0)  // Нага воин
        call UnitStruct.create('h027', 0)  // Морской дракон
        call UnitStruct.create('h028', 0)  // Дух моря
        call UnitStruct.create('h02A', 0)  // Нага-сирена
        call UnitStruct.create('h02B', 0)  // Нага-гвардеец
        call UnitStruct.create('h02C', 0)  // Великая черепаха
        call UnitStruct.create('h02D', 0)  // Коатль
        call UnitStruct.create('h02E', 0)  // Заклинательница
        call UnitStruct.create('h02F', 0)  // Морское чудовище
        call UnitStruct.create('h02G', 0)  // Высшая гидра

        set t = null
    endfunction

endscope