scope Build initializer Init
    
    globals
        group buildings = CreateGroup()
    endglobals

    private function OnBuildingStart takes nothing returns nothing
        local unit u = GetEnteringUnit()
        local integer uTypeId = GetUnitTypeId(u)
        local player p = GetOwningPlayer(u)

        if not IsPlayerInForce(p, players) or not IsUnitType(u, UNIT_TYPE_STRUCTURE) or IsUnitInGroup(u, IncomeObjects_group) or IsUnitInGroup(u, buildings) then
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
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     11.12.2020 15:00       =
=============================================

builder select Trigger

Реализация выбора расы

*/

scope BuilderSelect initializer builder_select

    globals
        integer array peonsId[12]
        debug constant integer debugGold = 12000
        debug constant integer debugGems = 12000
    endglobals

    function builder_select_IsDummy takes nothing returns boolean
        return (GetUnitTypeId(GetFilterUnit()) == 'h001') or (GetUnitTypeId(GetFilterUnit()) == 'ntav')
    endfunction

    function builder_select_actions takes nothing returns nothing
        local unit peon
        local player owner_of_peon
        local group group_of_dummies
        local real x
        local real y
        local integer peonId

        local integer column
        local integer row
        local multiboarditem mbitem
        local string iconFileName

        if not IsUnitType(GetSoldUnit(), UNIT_TYPE_PEON) then
            set peon = null
            set owner_of_peon = null
            set group_of_dummies = null
            set mbitem = null
            set iconFileName = null
            return
        endif

        set peon = GetSoldUnit()
        set owner_of_peon = GetTriggerPlayer()
        set group_of_dummies = GetUnitsOfPlayerMatching(owner_of_peon, Condition(function builder_select_IsDummy))
        set x = GetPlayerStartLocationX(owner_of_peon)
        set y = GetPlayerStartLocationY(owner_of_peon)
        set peonId = GetUnitTypeId(peon)

        set column = 0
        set row = GetPlayerId(owner_of_peon) + 1
        set mbitem = MultiboardGetItem(udg_scoreboard, row, column)

        call SelectUnitForPlayerSingle(peon, owner_of_peon) // Selects peon for player
        call ForGroup(group_of_dummies, function C_RemoveEnumUnits) // Remove dummies

        call CreateUnitEx(owner_of_peon, 'hbla', x, y, bj_UNIT_FACING) // Юнит "Замок"
        call CreateUnitEx(owner_of_peon, 'hwtw', x-450, y+640, bj_UNIT_FACING) // Юнит "Улучшения"
        call SetUnitPosition(peon, x, y-250) // Peon's position
        call SetUnitFacing(peon, bj_UNIT_FACING) // Peon's facing
        call PanCameraToForPlayer(owner_of_peon, x, y)

        if (peonId == peonsId[0]) then
            set iconFileName = "ReplaceableTextures\\CommandButtons\\BTNPeasant.blp"
            call SetPlayerTechResearched(owner_of_peon, 'R02G', 1) // Улучшение "Играть за людей"
        elseif (peonId == peonsId[1]) then
            set iconFileName = "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp"
        elseif (peonId == peonsId[2]) then
            set iconFileName = "ReplaceableTextures\\CommandButtons\\BTNWisp.blp"
            call SetPlayerTechResearched(owner_of_peon, 'R00H', 2) // Улучшение "Драгоценные камни"
            call SetPlayerTechResearched(owner_of_peon, 'R02F', 1) // Улучшение "Играть за эльфов"
            set udg_scoreboard_upg[row] = 2
        elseif (peonId == peonsId[3]) then
            set iconFileName = "ReplaceableTextures\\CommandButtons\\BTNPeon.blp"
            call AddGoldToPlayer(150, owner_of_peon)
            call SetPlayerTechResearched(owner_of_peon, 'R00H', 1) // Улучшение "Играть за орду"
        elseif (peonId == peonsId[4]) then
            set iconFileName = "ReplaceableTextures\\CommandButtons\\BTNMurgalSlave.blp"
        elseif (peonId == peonsId[5]) then
            set iconFileName = "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp"
            set udg_mediv = owner_of_peon
            call TriggerExecute(gg_trg_mediv_select)
        endif

        set mb[owner_of_peon].icon = iconFileName

        static if DEBUG_MODE then
            call AddGoldToPlayer(debugGold, owner_of_peon)
            call AddLumberToPlayer(debugGems, owner_of_peon)
            call SetPlayerTechResearched(owner_of_peon, 'R018', 1) // Улучшение "12 исследований"
            call SetPlayerTechResearched(owner_of_peon, 'R019', 1) // Улучшение "20 исследований"
            else
            call AddGoldToPlayer(base_gold, owner_of_peon) // Check Globals.j
            call AddLumberToPlayer(base_gems, owner_of_peon) // Check Globals.j
        endif

        set peon = null
        set owner_of_peon = null
        call DestroyGroup(group_of_dummies)
        set group_of_dummies = null
        set mbitem = null
        set iconFileName = null
    endfunction

    //===========================================================================
    function builder_select takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x08), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x09), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0A), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0B), EVENT_PLAYER_UNIT_SELL, null)
        call TriggerAddAction(t, function builder_select_actions)

        set peonsId[0] = 'h02I' // Работник
        set peonsId[1] = 'h015' // Послушник
        set peonsId[2] = 'h01G' // Светлячок
        set peonsId[3] = 'h01U' // Раб
        set peonsId[4] = 'h025' // Маргол-раб
        set peonsId[5] = 'h02H' // Медив

        set t = null
    endfunction

endscope
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     11.12.2020 18:21       =
=============================================

Продажа зданий.

*/

scope UnitDatabase
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

        static method create takes integer unitTypeId, integer parentUnitTypeId returns UnitStruct
            local UnitStruct us = UnitStruct.allocate()
            set us.gold_raw = GetUnitGoldCost(unitTypeId) * 0.8
            set us.lumber_raw = GetUnitWoodCost(unitTypeId) * 0.8
            if (usarr[table[parentUnitTypeId]] != null) then
                set us.gold = R2I(us.gold_raw + usarr[table[parentUnitTypeId]].GetGoldRaw())
                set us.lumber = R2I(us.lumber_raw + usarr[table[parentUnitTypeId]].GetLumberRaw())
            else
                set us.gold = IMaxBJ(R2I(GetUnitGoldCost(unitTypeId) * 0.8), 1)
                set us.lumber = IMaxBJ(R2I(GetUnitWoodCost(unitTypeId) * 0.8), 1)
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

scope BuildingSelling

    function building_selling_conditions takes nothing returns boolean
        return (GetSpellAbilityId() == 'A002') // Способность "Продать"
    endfunction

    function building_selling_actions takes nothing returns nothing
        local unit u = GetSpellAbilityUnit()
        local player p = GetTriggerPlayer()
        local integer gold = udb[u].GetGold()
        local integer lumber = udb[u].GetLumber()
        local texttag tt
        call GroupRemoveUnit(buildings, u)

        call AddGoldToPlayer(gold, p)
        call AddLumberToPlayer(lumber, p)

        set tt = NewTextTagAtUnit(GOLD + "+" + I2S(gold), u, 70.00, 11.00)
        call SetTextTagVisibility(tt, false)
        if (GetLocalPlayer() == p) then
            call SetTextTagVisibility(tt, true)
        endif
        call SetTextTagPermanent(tt, false)
        call SetTextTagLifespan(tt, 2.00)
        call SetTextTagFadepoint(tt, 1.30)
        call SetTextTagVelocity(tt, 0, 0.03)

        set tt = NewTextTagAtUnit(VIOLET + "+" + I2S(lumber), u, 0.00, 11.00)
        call SetTextTagVisibility(tt, false)
        if (GetLocalPlayer() == p) then
            call SetTextTagVisibility(tt, true)
        endif
        call SetTextTagPermanent(tt, false)
        call SetTextTagLifespan(tt, 2.00)
        call SetTextTagFadepoint(tt, 1.30)
        call SetTextTagVelocity(tt, 0, 0.03)

        call RemoveUnitEx(u)
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
scope Debug initializer Init

    private function Init takes nothing returns nothing
        debug local trigger t = CreateTrigger()
        debug local integer i

        static if DEBUG_MODE then
            // call Log("Hello world!")
            
            // call Log(I2S(PLAYER_NEUTRAL_AGGRESSIVE)) - 24
            // call Log(I2S(bj_PLAYER_NEUTRAL_VICTIM)) - 25
            // call Log(I2S(bj_PLAYER_NEUTRAL_EXTRA)) - 26
            // call Log(I2S(PLAYER_NEUTRAL_PASSIVE)) - 27

            // call Log(I2S(bj_MAX_PLAYERS)) - 24
            // call Log(I2S(bj_MAX_PLAYER_SLOTS)) - 28
        endif
        
        debug set t = null
    endfunction

endscope
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 22:46       =
=============================================

faq library-ish

Globals and common functions for faq

*/

library FAQ uses NokladrLib

    globals
        boolean IsFaqActive = true // Disables faq_counter() and faq_active() if false
        timerdialog faq_timerdialog // Timer dialog in upper-left corner for commands and settings
        integer faq_vote_yes = 0 // Голосов "За"
        integer faq_vote_no = 0 // Голосов "Против"
        real faq_voting_duration = 6.00 // Duration of voting
        texttag array faq_tts[4] // Плавающий текст для отображения голосования
        button array faq_buttons[2] // Кнопки в меню голосования
        dialog faq_dialog = DialogCreate() // Меню с голосованием
    endglobals

    function faq_get_castle takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0) // Resets camera angle
        call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own
        call SelectUnitForPlayerSingle(GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(p, 'ntav')), p) // Selects tavern
        
        set p = null
    endfunction

    function faq_show_dialog takes nothing returns nothing
        call DialogDisplay(GetEnumPlayer(), faq_dialog, true) // Shows voting dialog
    endfunction

    function faq_hide_dialog takes nothing returns nothing
        call DialogDisplay(GetEnumPlayer(), faq_dialog, false) // Hides voting dialog
    endfunction

    function faq_flush takes nothing returns nothing
        call UnfadeMap() // Unfades map
        call ForForce(players, function faq_hide_dialog) // Hides voting dialog
        call DestroyTextTag(faq_tts[0]) // Уничтожает плавающий текст с голосами "За"
        call DestroyTextTag(faq_tts[1]) // Уничтожает плавающий текст с голосами "За"
        call DestroyTextTag(faq_tts[2]) // Уничтожает плавающий текст с голосами "Против"
        call DestroyTextTag(faq_tts[3]) // Уничтожает плавающий текст с голосами "Против"
    endfunction

endlibrary
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     21.11.2020 21:02       =
=============================================

faq active Trigger

Voting for viewing faq guide.

*/

scope FaqActive initializer Init

    function faq_active_condition takes nothing returns boolean
        // Disables faq_counter() and faq_active() if false
        return IsFaqActive
    endfunction

    function faq_active takes nothing returns nothing
        if (GetClickedButton() == faq_buttons[0]) then // Кнопка "Да"
            set faq_vote_yes = faq_vote_yes + 1 // Голосов "За"
            call SetTextTagText(faq_tts[2], I2S(faq_vote_yes), TextTagSize2Height(10.00)) // Плавающий текст с кол-вом голосов "За"
            if (faq_vote_yes >= (CountPlayersInForceBJ(players) / 2)) then // Если голосов "За" 1/1, 1/2, 1/3, 2/4, 2/5, 3/6, 3/7, 4/8 
                set IsFaqActive = false // Disables faq_counter() and faq_active()
                call faq_flush.execute() // Destroys all texttags, hides faq_dialog, reveals map
                call TriggerExecute(gg_trg_faq) // Enables faq guide
                call TriggerSleepAction(51.8) // Duration of faq guide
                call ForForce(players, function faq_get_castle) // Focuses camera at castle you own
                call faq_start.execute() // Commands and settings
            endif
        else // Кнопка "Нет"
            set faq_vote_no = faq_vote_no + 1 // Голосов "Против"
            call SetTextTagText(faq_tts[3], I2S(faq_vote_no), TextTagSize2Height(10.00)) // Плавающий текст с кол-вом голосов "Против"
            if (faq_vote_no > (CountPlayersInForceBJ(players) / 2)) then  // Если голосов "За" 1/1, 2/2, 2/3, 3/4, 3/5, 4/6, 4/7, 5/8 
                call faq_stop.execute() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
            endif
        endif
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        // Triggers if faq_dialog's buttons were clicked
        call TriggerRegisterDialogEvent(t, faq_dialog)
        call TriggerAddAction(t, function faq_active)
        call TriggerAddCondition(t, Condition(function faq_active_condition))

        set t = null
    endfunction

endscope
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
=============================================

faq ini Trigger

Starts voting for faq guide

*/

function faq_voting_timer_counter takes nothing returns nothing
    local timer t = GetExpiredTimer()

    if (faq_voting_duration >= 1.00 and IsFaqActive) then // If voting exists
        call DialogSetMessage(faq_dialog, ("Посмотреть обучение (" + WHITE + R2S(faq_voting_duration) + " сек.|r)"))
        set faq_voting_duration = faq_voting_duration - 1.00
    else
        call PauseTimer(t)
        call DestroyTimer(t)
        if (IsFaqActive) then // If there are not enough votes
            call faq_stop.execute() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
        endif
    endif

    set t = null
endfunction

//===========================================================================
function faq_ini takes nothing returns nothing
    call FadeMap() // Сделать всю карту чёрной

    // ---За---
    // Плавающий текст с требуемым кол-вом голосов "За"
    set faq_tts[0] = NewTextTag((GREEN + "\"ЗА\"|r нужно " + I2S(CountPlayersInForceBJ(players) / 2)), gg_rct_guideyes, 14.00)
    
    // Плавающий текст с кол-вом голосов "За"
    set faq_tts[2] = NewTextTag(I2S(faq_vote_yes), gg_rct_guideyesvote, 10.00)

    // Кнопка подтверждения просмотра обучения
    set faq_buttons[0] = DialogAddButton(faq_dialog, "Да", 0)

    // ---Против---
    // Плавающий текст с требуемым кол-вом голосов "Против"
    set faq_tts[1] = NewTextTag((RED + "\"ПРОТИВ\"|r нужно более " + I2S(CountPlayersInForceBJ(players) / 2)), gg_rct_guideno, 14.00)

    // Плавающий текст с кол-вом голосов "Против"
    set faq_tts[3] = NewTextTag(I2S(faq_vote_no), gg_rct_guidenovote, 10.00)

    // Кнопка отклонения просмотра обучения
    set faq_buttons[1] = DialogAddButton(faq_dialog, "Нет", 0)

    static if DEBUG_MODE then
        call faq_stop.execute() // Destroys all texttags, hides faq_dialog, reveals map. Focuses camera at castle you own. Commands and settings
    else
        call TimerStart(CreateTimer(), 1.00, true, function faq_voting_timer_counter) // Makes duration of voting visible in faq dialog's title
        call faq_voting_timer_counter() // First tick of timer
        call ForForce(players, function faq_show_dialog) // Shows faq dialog to all players
    endif
endfunction
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     21.11.2020 21:03       =
=============================================

faq start Trigger

Shows all available commands and settings.

*/

function faq_start_timer_actions takes nothing returns nothing
    local timer t = GetExpiredTimer()

    call DestroyTimerDialog(faq_timerdialog) // Destroys timer dialog for commands and settings
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "|cFFFF0000Команда |cFFFFFFFF-info|r |cFFFF0000отключит сообщения о штрафах и мини-арене.|r")

    call DisableTrigger(gg_trg_cmd_time)
    call DisableTrigger(gg_trg_cmd_build)
    call DisableTrigger(gg_trg_cmd_mode)
    call DisableTrigger(gg_trg_cmd_point)
    call DisableTrigger(gg_trg_cmd_arena)
    
    set curWave = curWave + 1
    call Arena_Force.execute()

    set t = null
endfunction

function faq_start takes nothing returns nothing
    local timer t = CreateTimer()
    
    call TimerStart(t, timeBeforeFirstWave, false, function faq_start_timer_actions) // After settings were set

    set faq_timerdialog = CreateTimerDialog(t) // Timer dialog in upper-left corner for commands and settings
    call TimerDialogSetTitle(faq_timerdialog, "Настройка карты") // Title of timer dialog
    call TimerDialogDisplay(faq_timerdialog, true) // Shows timer dialog

    call gameset_owner.execute() // Sets owner of game

    set t = null
endfunction

/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 16:00       =
=============================================

faq stop Trigger

Stops voting for faq guide

*/

function faq_stop takes nothing returns nothing
    set IsFaqActive = false // Disables faq_counter() and faq_active()
    call faq_flush.execute() // Destroys all texttags, hides faq_dialog, reveals map
    call ForForce(players, function faq_get_castle) // Focuses camera at castle you own
    call faq_start.execute() // Commands and settings
endfunction
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 21:07       =
=============================================

gameset owner Trigger

Sets owner of game.
Shows all available commands and settings
Owner can modify game settings.

*/

//===========================================================================
function gameset_owner takes nothing returns nothing
    local integer i = 0
    set udg_game_owner = null // Game owner
    loop // Sets game owner to a first available player
        if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) then // Must be playing player
            set udg_game_owner = Player(0)
        endif
        exitwhen (udg_game_owner != null or i > 7) // TODO: test
        set i = i + 1
    endloop

    static if (not DEBUG_MODE) then
        // Notification for game owner
        call DisplayTimedTextToPlayer(udg_game_owner, 0., 0., 10., "Вы получили права " + GREEN + "владельца игры|r.")
    endif

    // Opt. begin
    if  (GetTimeInSeconds() < R2I(udg_gameset_time_first)) then // Shows commands and settings only at game start
        if (udg_info[GetConvertedPlayerId(udg_game_owner)] == true) then // Checks Info flag of game owner
            static if (not DEBUG_MODE) then
                // Shows all available commands and settings
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "Настройка карты (доступно первые " + ( I2S(R2I(udg_gameset_time_first)) + " сек.)" ) ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_gameset_time) ) + " ) " ) + "|cFFFF0000-time xxx|r, где xxx - время перед началом нового раунда (от 20 до 60 сек.)" ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_wave_time) ) + " ) " ) + "|cFFFF0000-arena xxx|r. Где xxx - начальное время раунда на арене (от 60 сек. до 150 сек.)" ) )
                if (udg_building_status == true) then
                    call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 1 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
                else
                    call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( 0 ) " + "|cFFFF0000-build x|r, при x=0 - во время раунда можно строить/улучшать юнитов при x=1 - нельзя" ) )
                endif
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( "( " + ( I2S(udg_const_point[0]) + ( "-" + ( I2S(udg_const_point[1]) + " ) |cFFFF0000-point ##|r." ) ) ) ) )
                call DisplayTextToForce( GetForceOfPlayer(udg_game_owner), "Первый # - минимальное число контрольных точек, появляющихся на арене. Второй # - максимальное число контрольных точек, оно не может превышать первый номер, а также число 9." )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( "( " + I2S(udg_mode) ) + " ) " ) + "|cFFFF0000-mode #. |r" ) )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, "Если # = 1, то мини-игры будут чередоваться каждую вторую волну.\nЕсли # = 2, то мини-игр не будет совсем.\nЕсли # = 3, то мини-игры буду каждые 3 волны." )
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_game_owner), udg_gameset_time_first, ( ( ( ( "( " + I2S(udg_gg) ) + " ) " ) + "|cFFFF0000-gg ##|r. Где ## - волна, после которой закончится игра (от 9 до " ) + ( I2S(( ( udg_mini_game_max * 2 ) + 3 )) + " )." ) ) )
            endif

        endif
    endif
    // Opt. end
endfunction

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
        call CreateIncomeObjectText.execute(gold, points, u)

        set p = null
        set u = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local real curPoints = pdb[p].points

        call ForGroup(IncomeObjects_group, function ForIncomeObject)
        set pdb[p].incomePoints = pdb[p].points - curPoints

        set p = null
    endfunction

    private function Actions takes nothing returns nothing
        call ForForce(players, function ForPlayer)
    endfunction
    
    private function Init takes nothing returns nothing
        call TimerStart(CreateTimer(), 1, true, function Actions)
    endfunction
    
endscope
/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     08.11.2020 20:42       =
=============================================

Исследования инкома.
!!! - важная информация

*/

scope IncomeUpgrade initializer Init

    globals
        private integer array incSpellRC
        private constant integer incSpellRCSize = 13
        private real array stabilityTimeGold
        private real array stabilityTimeGems
        private integer array stabilityGold
        private integer array stabilityGems
        private timer array stabilityTimerGold
        private timer array stabilityTimerGems
        private integer array goldmining_main_mine
        private integer array goldmining_extra_mine
        private integer array goldmining_income
    endglobals

    public function Conditions takes nothing returns boolean
        local integer i
        local integer researchRC = GetResearched()

        for i = 1 to incSpellRCSize
            if researchRC == incSpellRC[i] then
                return true
            endif
        endfor

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
        local integer i = 0
        local player p

        loop
            exitwhen i > maxNumberOfPlayers
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
        set gr_p = null
        set rand_p = null
        set mes = null
        set t = null
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
            exitwhen i > maxNumberOfPlayers
            if (t == stabilityTimerGold[i]) or (t == stabilityTimerGems[i]) then
                set number_timer = i
            endif
            set i = i + 1
        endloop

        return number_timer
    endfunction

    // Работа таймера stabilityTimerGold
    function stabilityTimerGold_actions takes nothing returns nothing
        local player p
        local integer number_p
        local integer count_research
        local timer t = GetExpiredTimer()

        set number_p = find_number_timer(t)
        set p = Player(number_p - 1)
        set count_research = GetPlayerTechCount(p, stab_rc, true)

        call AddGoldToPlayer(stabilityGold[count_research], p)

        set p = null
        set t = null
    endfunction

    // Работа таймера stabilityTimerGems
    function stabilityTimerGems_actions takes nothing returns nothing
        local player p
        local integer number_p
        local integer count_research
        local timer t = GetExpiredTimer()

        set number_p = find_number_timer(t)
        set p = Player(number_p - 1)
        set count_research = GetPlayerTechCount(p, stab_rc, true)

        call AddLumberToPlayer(stabilityGems[count_research], p)

        set p = null
        set t = null
    endfunction

    // Действие улучшения Стабильность
    function Trig_income_upg_actions_stab takes integer number_p, integer count_research returns nothing
        if count_research == 1 then
            set stabilityTimerGold[number_p] = CreateTimer()
            set stabilityTimerGems[number_p] = CreateTimer()
        endif

        call TimerStart(stabilityTimerGold[number_p], stabilityTimeGold[count_research], true, function stabilityTimerGold_actions)
        call TimerStart(stabilityTimerGems[number_p], stabilityTimeGems[count_research], true, function stabilityTimerGems_actions)
    endfunction

    // Условие улучшения Лидерство, удалить юнитов Больше всех убийств за прошедший раунд и Или лидерство по очкам арены за пошедший раунд
    function Trig_income_upg_actions_leadership_group takes nothing returns nothing
        local unit u = GetEnumUnit()
        local integer u_rc = GetUnitTypeId(u)

        if (u_rc == most_point_kill_last_round) or (u_rc == or_leadership_arena_last_round) then
            call RemoveUnitEx(u)
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
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        // Заполнение массива incSpellrc равкодами инкам способностей
        set incSpellRC[1] = 'R00F'
        set incSpellRC[2] = 'R00G'
        set incSpellRC[3] = 'R00H'
        set incSpellRC[4] = 'R00I'
        set incSpellRC[5] = 'R00J'
        set incSpellRC[6] = 'R00Q'
        set incSpellRC[7] = 'R00R'
        set incSpellRC[8] = 'R00S'
        set incSpellRC[9] = 'R027'
        set incSpellRC[10] = 'R029'
        set incSpellRC[11] = 'R02I'
        set incSpellRC[12] = 'R02J'
        set incSpellRC[13] = 'R02K'

        // Заполнение массивов stabilityTimeGold и stabilityTimeGems периодом инкама
        set stabilityTimeGold[1] = 3
        set stabilityTimeGold[2] = 3
        set stabilityTimeGold[3] = 3
        set stabilityTimeGold[4] = 3
        set stabilityTimeGold[5] = 3
        set stabilityTimeGold[6] = 3

        set stabilityTimeGems[1] = 40
        set stabilityTimeGems[2] = 40
        set stabilityTimeGems[3] = 30
        set stabilityTimeGems[4] = 20
        set stabilityTimeGems[5] = 15
        set stabilityTimeGems[6] = 12

        // Заполнение массивов stabilityGold и stabilityGems кол-вом инкама
        set stabilityGold[1] = 1
        set stabilityGold[2] = 1
        set stabilityGold[3] = 2
        set stabilityGold[4] = 2
        set stabilityGold[5] = 3
        set stabilityGold[6] = 4
                
        set stabilityGems[1] = 0
        set stabilityGems[2] = 1
        set stabilityGems[3] = 1
        set stabilityGems[4] = 1
        set stabilityGems[5] = 1
        set stabilityGems[6] = 1

        // Заполнение массивов goldmining_main_mine, goldmining_extra_mine, goldmining_income кол-вом увеличения инкама
        set goldmining_main_mine[1] = 1
        set goldmining_main_mine[2] = 1
        set goldmining_main_mine[3] = 1
        set goldmining_main_mine[4] = 1
        set goldmining_main_mine[5] = 1
        set goldmining_main_mine[6] = 1

        set goldmining_extra_mine[1] = 0
        set goldmining_extra_mine[2] = 0
        set goldmining_extra_mine[3] = 1
        set goldmining_extra_mine[4] = 0
        set goldmining_extra_mine[5] = 1
        set goldmining_extra_mine[6] = 1
        
        set goldmining_income[1] = 10
        set goldmining_income[2] = 10
        set goldmining_income[3] = 10
        set goldmining_income[4] = 10
        set goldmining_income[5] = 10
        set goldmining_income[6] = 10

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
        call TriggerAddCondition(t, Condition(function IncomeUpgrade_Conditions))
        call TriggerAddAction(t, function Trig_income_upg_Actions)
        
        set t = null
    endfunction

endscope
/*

=============================================
= Файл создал:       Glady                  =
= Discord:           ! ! Gladiator#3635     =
= E-Mail:            glady007rus@gmail.com  =
= Дата создания:     22.11.2020 13:00       =
=============================================

Улучшение инкома Грабёж.
!!! - важная информация

TODO: В конце волны, вы получаете 5-10% от ресурсов случайного игрока.

*/

scope IncomeUpgradeA initializer Init

    globals
        private real array robberyPercentCastle
        private real array robberyPercentRandom
    endglobals

    private function Conditions takes nothing returns boolean
        local boolean b1
        local boolean b2
        local boolean b3
        local boolean b4
        local unit killer = GetKillingUnit()
        local unit victim = GetDyingUnit()
        local player p_k = GetOwningPlayer(killer)
        local player p_v = GetOwningPlayer(victim)
        
        set b1 = GetPlayerTechCountSimple(robbery_rc, p_k) > 0
        set b2 = IsUnitInGroup(killer, waveUnits)
        set b3 = IsPlayerEnemy(p_v, p_k)
        set b4 = GetUnitTypeId(GetDyingUnit()) == castle_rc
        
        set p_k = null
        set p_v = null
        set killer = null
        set victim = null
        
        return b1 and b2 and b3 and b4

    endfunction

    private function Actions takes nothing returns nothing
        local unit killer = GetKillingUnit()
        local unit victim = GetDyingUnit()
        local player p_k = GetOwningPlayer(killer)
        local player p_v = GetOwningPlayer(victim) 
        local integer gold = GetPlayerState(p_v, PLAYER_STATE_RESOURCE_GOLD)
        local integer lumber = GetPlayerState(p_v, PLAYER_STATE_RESOURCE_LUMBER)
        local integer lvl_research = GetPlayerTechCountSimple(robbery_rc, p_k)
        local integer p_k_n = GetConvertedPlayerId(p_k)
        local integer p_v_n = GetConvertedPlayerId(p_v)
        local string killer_mes
        local string victim_mes
        local string color_k = udg_players_colour[p_k_n]
        local string color_v = udg_players_colour[p_v_n]
        local string name_k = udg_players_name[p_k_n]
        local string name_v = udg_players_name[p_v_n]

        set gold = R2I(gold * robberyPercentCastle[lvl_research])
        set lumber = R2I(lumber * robberyPercentCastle[lvl_research])
        
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
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        set robberyPercentCastle[1] = 0.05
        set robberyPercentCastle[2] = 0.10
        set robberyPercentCastle[3] = 0.15
        set robberyPercentCastle[4] = 0.20
        set robberyPercentCastle[5] = 0.30
        set robberyPercentCastle[6] = 0.40

        set robberyPercentRandom[1] = 0.05
        set robberyPercentRandom[2] = 0.06
        set robberyPercentRandom[3] = 0.07
        set robberyPercentRandom[4] = 0.08
        set robberyPercentRandom[5] = 0.09
        set robberyPercentRandom[6] = 0.10

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
        call TriggerAddCondition(t, Condition( function Conditions))
        call TriggerAddAction(t, function Actions)
        
        set t = null
    endfunction

endscope
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

endscope
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

scope IncomeUpgradeTQ initializer Init_income_upgTQ

    function Trig_income_upgTQ_Conditions takes nothing returns boolean
        local boolean IsIncomeObjective = false
        local boolean DoesVictimHasUpgrade = false
        local boolean DoesVictimsUpgradeGreaterThanKillers = false
        local unit killer = GetKillingUnit()        // unit who has killed victim
        local unit victim = GetDyingUnit()          // unit who was killed by killer
        local integer v_rc = GetUnitTypeId(victim)  // raw code of victim unit
        local integer k_rc = GetUnitTypeId(killer)  // raw code of killer unit
        local player playerVictim = GetOwningPlayer(victim)  // owner of victim unit
        local player playerKiller = GetOwningPlayer(killer)  // owner of killer unit

        // n003 - Gold Mine большой
        // n004 - Gold Mine маленький
        // n005 - Флаг
        set IsIncomeObjective = ((v_rc == 'n003') or (v_rc == 'n004') or (v_rc == 'n005'))

        // Не действует на игроков с уровнем улучшения "Проклятый рудник" ниже вашего на 1 и выше.
        set DoesVictimHasUpgrade = GetPlayerTechCount(playerVictim, cursed_mine_rc, true) > 0
        set DoesVictimsUpgradeGreaterThanKillers = GetPlayerTechCount(playerVictim, cursed_mine_rc, true) > GetPlayerTechCount(playerKiller, cursed_mine_rc, true)

        set killer = null
        set victim = null
        set playerVictim = null
        set playerKiller = null
        return IsIncomeObjective and DoesVictimHasUpgrade and DoesVictimsUpgradeGreaterThanKillers
    endfunction

    // !!! Урон юнитам наносит сам рудник, но после смерти он передаётся убийце, проверить, что урон наносится до передачи
    // Функция вызывается к каждому юниту около погибшего рудника
    // Если юнит принадлежит убившему и юнит находится в группе waveUnits(!!! понять, что за группа), ему наносится урон от рудника типа chaos
    function Trig_income_upgTQ_Actions_group takes nothing returns nothing
        local unit u = GetEnumUnit() // сам юнит
        local boolean b1
        local boolean b2
        local player p = GetOwningPlayer(u) // владелец юнита
        local player p_k = hash[StringHash("income")].player[StringHash("player_killer")] // владелец убийцы
        local player p_v = hash[StringHash("income")].player[StringHash("player_victim")] // владелец рудника(жертвы)
        local unit damage_u = hash[StringHash("income")].unit[StringHash("victim")]       // рудник
        local real damage

        set b1 = IsUnitInGroup(u, waveUnits)
        set b2 = (p == p_k)
        if b1 and b2 then
            set damage = cursed_mine_damage_for_lvl * GetPlayerTechCount(p_v, cursed_mine_rc, true) // формула расчёта урона: урон = cursed_mine_damage_for_lvl * уровень улучшения
            // !!!
            call UnitDamageTargetBJ(damage_u, u, damage, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL) // DAMAGE_TYPE_UNIVERSAL - чистый урон без armor reduction
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
        local real angle = 360.00 / cursed_mine_count_wave
        local group gr = CreateGroup()
        local integer gold
        local integer lumber
        local string s1
        local string s2
        
        loop
            exitwhen i > cursed_mine_count_wave
            set x_ef = x + range * Cos(angle * i * bj_DEGTORAD)
            set y_ef = y + range * Sin(angle * i * bj_DEGTORAD)
            call DestroyEffect(AddSpecialEffect(name_ef, x_ef, y_ef))
            set i = i + 1
        endloop

        call GroupEnumUnitsInRange(gr, x, y, cursed_mine_range_damage, null)

        set hash[StringHash("income")].player[StringHash("player_killer")] = p_k
        set hash[StringHash("income")].player[StringHash("player_victim")] = p_v
        set hash[StringHash("income")].unit[StringHash("victim")] = victim

        call ForGroup(gr, function Trig_income_upgTQ_Actions_group)

        set gold = GetPlayerState(p_k, PLAYER_STATE_RESOURCE_GOLD) * cursed_mine_percent / 100
        set lumber = GetPlayerState(p_k, PLAYER_STATE_RESOURCE_LUMBER) * cursed_mine_percent / 100

        call AddGoldToPlayer(gold, p_v)
        call AddGoldToPlayer(-gold, p_k)
        call AddLumberToPlayer(lumber, p_v)
        call AddLumberToPlayer(-lumber, p_k)

        set s1 = "Вы украли |cFFFFCD00" + I2S(gold) + "|r ед. золота и |cFFB23AEE" + I2S(lumber) + "|r ед. самоцветов у игрока " + udg_players_colour[n_p_k] + udg_players_name[n_p_k]
        set s2 = "Вас ограбил игрок " + udg_players_colour[n_p_v] + udg_players_name[n_p_v]
        call DisplayTextToPlayer(p_v, 0, 0, s1)
        call DisplayTextToPlayer(p_k, 0, 0, s2)

        set killer = null
        set victim = null
        call DestroyGroup(gr)
        set name_ef = null
        set gr = null
        set p_v = null
        set p_k = null
        set s1 = null
        set s2 = null
    endfunction

    //===========================================================================
    function Init_income_upgTQ takes nothing returns nothing
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

endscope

library ArcingTextTag  // Arcing Text Tag v1.0.0.3 by Maker https://www.hiveworkshop.com/threads/228710/
    globals
        private constant    real    SIZE_MIN        = 0.018         // Minimum size of text
        private constant    real    SIZE_BONUS      = 0.006         // Text size increase
        private constant    real    TIME_LIFE       = 1.0           // How long the text lasts
        private constant    real    TIME_FADE       = 0.8           // When does the text start to fade
        private constant    real    Z_OFFSET        = 50            // Height above unit
        private constant    real    Z_OFFSET_BON    = 50            // How much extra height the text gains
        private constant    real    VELOCITY        = 2             // How fast the text move in x/y plane
        private constant    real    ANGLE           = bj_PI/2       // Movement angle of the text. Does not apply if
                                                                    // ANGLE_RND is true
        private constant    boolean ANGLE_RND       = true          // Is the angle random or fixed
        private             timer   TMR             = CreateTimer()
    endglobals
   
    struct ArcingTextTag extends array
        private texttag tt
        private real as         // angle, sin component
        private real ac         // angle, cos component
        private real ah         // arc height
        private real t          // time
        private real x          // origin x
        private real y          // origin y
        private string s        // text
        private static integer array next
        private static integer array prev
        private static integer array rn
        private static integer ic = 0  // Instance count  
       
        private static method update takes nothing returns nothing
            local thistype this=next[0]
            local real p
            loop
                set p = Sin(bj_PI*.t)
                set .t = .t - 0.03125
                set .x = .x + .ac
                set .y = .y + .as
                call SetTextTagPos(.tt, .x, .y, Z_OFFSET + Z_OFFSET_BON * p)
                call SetTextTagText(.tt, .s, SIZE_MIN + SIZE_BONUS * p)
                if .t <= 0 then
                    set .tt = null
                    set next[prev[this]] = next[this]
                    set prev[next[this]] = prev[this]
                    set rn[this] = rn[0]
                    set rn[0] = this
                    if next[0]==0 then
                        call PauseTimer(TMR)
                    endif
                endif
                set this = next[this]
                exitwhen this == 0
            endloop
        endmethod
       
        public static method create takes string s, unit u returns thistype
            local thistype this = rn[0]
            static if ANGLE_RND then
                local real a = GetRandomReal(0, 2*bj_PI)
            else
                local real a = ANGLE
            endif
            if this == 0 then
                set ic = ic + 1
                set this = ic
            else
                set rn[0] = rn[this]
            endif
           
            set next[this] = 0
            set prev[this] = prev[0]
            set next[prev[0]] = this
            set prev[0] = this
           
            set .s = s
            set .x = GetUnitX(u)
            set .y = GetUnitY(u)
            set .t = TIME_LIFE
            set .as = Sin(a)*VELOCITY
            set .ac = Cos(a)*VELOCITY
            set .ah = 0.
           
            if IsUnitVisible(u, GetLocalPlayer()) then
                set .tt = CreateTextTag()
                call SetTextTagPermanent(.tt, false)
                call SetTextTagLifespan(.tt, TIME_LIFE)
                call SetTextTagFadepoint(.tt, TIME_FADE)
                call SetTextTagText(.tt, s, SIZE_MIN)
                call SetTextTagPos(.tt, .x, .y, Z_OFFSET)
            endif
           
            if prev[this] == 0 then
                call TimerStart(TMR, 0.03125, true, function thistype.update)
            endif
           
            return this
        endmethod
    endstruct
endlibrary
library Colors

    globals
        constant string GOLD =      "|cffffcc00"
        constant string WHITE =     "|cffffffff"

        constant string RED =       "|cffff0202"    // Player(0)  Player(0x00)
        constant string BLUE =      "|cff0041ff"    // Player(1)  Player(0x01)
        constant string TEAL =      "|cff1be5b8"    // Player(2)  Player(0x02)
        constant string PURPLE =    "|cff530080"    // Player(3)  Player(0x03)
        constant string YELLOW =    "|cffffff00"    // Player(4)  Player(0x04)
        constant string ORANGE =    "|cfffe890D"    // Player(5)  Player(0x05)
        constant string GREEN =     "|cff1fbf00"    // Player(6)  Player(0x06)
        constant string PINK =      "|cffe45aaa"    // Player(7)  Player(0x07)
        constant string GRAY =      "|cff949596"    // Player(8)  Player(0x08)
        constant string LB =        "|cff7dbef1"    // Player(9)  Player(0x09)
        constant string DG =        "|cff0f6145"    // Player(10) Player(0x0A)
        constant string BROWN =     "|cff4d2903"    // Player(11) Player(0x0B)

        constant string MAROON =    "|cff9c0000"    // Player(12) Player(0x0C)
        constant string NAVY =      "|cff0000c3"    // Player(13) Player(0x0D)
        constant string TURQUOISE = "|cff00ebff"    // Player(14) Player(0x0E)
        constant string VIOLET =    "|cffbd00ff"    // Player(15) Player(0x0F)
        constant string WHEAT =     "|cffecce87"    // Player(16) Player(0x10)
        constant string PEACH =     "|cfff7a58b"    // Player(17) Player(0x11)
        constant string MINT =      "|cffbfff81"    // Player(18) Player(0x12)
        constant string LAVENDER =  "|cffdbb8eb"    // Player(19) Player(0x13)
        constant string COAL =      "|cff4f5055"    // Player(20) Player(0x14)
        constant string SNOW =      "|cffecf0ff"    // Player(21) Player(0x15)
        constant string EMERALD =   "|cff00781e"    // Player(22) Player(0x16)
        constant string PEANUT =    "|cffa56f34"    // Player(23) Player(0x17)
        constant string BLACK =     "|cff2e2d2e"    // Player(24) Player(0x18)
    endglobals

    // Возвращает цвет игрока взависимости от его ID.
    function C_IntToColor takes integer i returns string
        if i == 0 then
            return RED
        elseif i == 1 then
            return BLUE
        elseif i == 2 then
            return TEAL
        elseif i == 3 then
            return PURPLE
        elseif i == 4 then
            return YELLOW
        elseif i == 5 then
            return ORANGE
        elseif i == 6 then
            return GREEN
        elseif i == 7 then
            return PINK
        elseif i == 8 then
            return GRAY
        elseif i == 9 then
            return LB
        elseif i == 10 then
            return DG
        elseif i == 11 then
            return BROWN
        elseif i == 12 then
            return MAROON
        elseif i == 13 then
            return NAVY
        elseif i == 14 then
            return TURQUOISE
        elseif i == 15 then
            return VIOLET
        elseif i == 16 then
            return WHEAT
        elseif i == 17 then
            return PEACH
        elseif i == 18 then
            return MINT
        elseif i == 19 then
            return LAVENDER
        elseif i == 20 then
            return COAL
        elseif i == 21 then
            return SNOW
        elseif i == 22 then
            return EMERALD
        elseif i == 23 then
            return PEANUT
        elseif i == 24 then
            return BLACK
        else
            return WHITE
        endif
    endfunction

    struct Color
        integer red
        integer blue
        integer green

        // Takes player and returns Color struct with red, green, blue integer fields in 0-255 range
        static method create takes player p returns Color
            local Color color = Color.allocate()
            local integer i = GetPlayerId(p)

            if i == 0 then
                set color.red = 0xff
                set color.green = 0x02
                set color.blue = 0x02
            elseif i == 1 then
                set color.red = 0x00
                set color.green = 0xff
                set color.blue = 0x41
            elseif i == 2 then
                set color.red = 0x1b
                set color.green = 0xe5
                set color.blue = 0xb8
            elseif i == 3 then
                set color.red = 0x53
                set color.green = 0x00
                set color.blue = 0x80
            elseif i == 4 then
                set color.red = 0xff
                set color.green = 0xff
                set color.blue = 0x00
            elseif i == 5 then
                set color.red = 0xfe
                set color.green = 0x89
                set color.blue = 0x0d
            elseif i == 6 then
                set color.red = 0x1f
                set color.green = 0xbf
                set color.blue = 0x00
            elseif i == 7 then
                set color.red = 0xe4
                set color.green = 0x5a
                set color.blue = 0xaa
            elseif i == 8 then
                set color.red = 0x94
                set color.green = 0x95
                set color.blue = 0x96
            elseif i == 9 then
                set color.red = 0x7d
                set color.green = 0xbe
                set color.blue = 0xf1
            elseif i == 10 then
                set color.red = 0x0f
                set color.green = 0x61
                set color.blue = 0x45
            elseif i == 11 then
                set color.red = 0x4d
                set color.green = 0x29
                set color.blue = 0x03
            elseif i == 12 then
                set color.red = 0x9c
                set color.green = 0x00
                set color.blue = 0x00
            elseif i == 13 then
                set color.red = 0x00
                set color.green = 0x00
                set color.blue = 0xc3
            elseif i == 14 then
                set color.red = 0x00
                set color.green = 0xeb
                set color.blue = 0xff
            elseif i == 15 then
                set color.red = 0xbd
                set color.green = 0x00
                set color.blue = 0xff
            elseif i == 16 then
                set color.red = 0xec
                set color.green = 0xce
                set color.blue = 0x87
            elseif i == 17 then
                set color.red = 0xf7
                set color.green = 0xa5
                set color.blue = 0x8b
            elseif i == 18 then
                set color.red = 0xbf
                set color.green = 0xff
                set color.blue = 0x81
            elseif i == 19 then
                set color.red = 0xdb
                set color.green = 0xb8
                set color.blue = 0xeb
            elseif i == 20 then
                set color.red = 0x4f
                set color.green = 0x50
                set color.blue = 0x55
            elseif i == 21 then
                set color.red = 0xec
                set color.green = 0xf0
                set color.blue = 0xff
            elseif i == 22 then
                set color.red = 0x00
                set color.green = 0x78
                set color.blue = 0x1e
            elseif i == 23 then
                set color.red = 0xa5
                set color.green = 0x6f
                set color.blue = 0x34
            elseif i == 24 then
                set color.red = 0x2e
                set color.green = 0x2d
                set color.blue = 0x2e
            else
                set color.red = 0xff
                set color.green = 0xff
                set color.blue = 0xff
            endif
            return color
        endmethod
    endstruct

endlibrary
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:30       =
=============================================

*/

library Locales

    function Locale takes nothing returns string
        local string s = GetLocalizedString("CHEATENABLED")
        if (s == "Чит включен!") then
            set s = "RU"
        else
            set s = "EN"
        endif
        return s

    endfunction

endlibrary
library Logs uses Colors

    // Лог сообщений
    function Log takes string s returns nothing
        debug call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, (GOLD + "Log:|r " + GREEN + s + "|r"))
    endfunction

endlibrary
library Multiboard /* v2.0.0.1
    *************************************************************************************
    *
    *   Multiboard Struct API that actually works and is actually easy to use.
    *
    *************************************************************************************
    *
    *   */uses/*
    *
    *       */ Table /*         hiveworkshop.com/forums/jass-functions-413/snippet-new-table-188084/
    *
    ************************************************************************************
    *
    *   struct Multiboard
    *
    *       string title
    *       boolean display
    *       boolean minimize
    *       boolean suppress
    *
    *       real width=  (set only)
    *       string icon= (set only)
    *       string text= (set only)
    *
    *       readonly MultiboardRow row
    *       readonly MultiboardColumn column
    *
    *       this[row][column] -> MultiboardItem
    *
    *       static method create takes integer rowCount, integer columnCount returns Multiboard
    *       method destroy takes nothing returns nothing
    *
    *       method clear takes nothing returns nothing
    *
    *       method setTitleColor takes integer red, integer green, integer blue, integer alpha returns nothing
    *       method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
    *       method setStyle takes boolean showValues, boolean showIcons returns nothing
    *
    ************************************************************************************
    *
    *   struct MultiboardRow extends array
    *   struct MultiboardColumn extends array
    *
    *       integer count
    *           -   row.count
    *
    *       string text
    *       string icon=
    *       real width=
    *           -   row[0].width
    *
    *       method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
    *       method setStyle takes boolean showValue, boolean showIcon returns nothing
    *           -   row[0].setStyle
    *
    ************************************************************************************
    *
    *   struct MultiboardItem extends array
    *
    *       string text= (set only)
    *       string icon= (set only)
    *       real width=  (set only)
    *
    *       method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
    *       method setStyle takes boolean showValue, boolean showIcon returns nothing
    *
    ************************************************************************************/
    globals
        private Table table
        private Table table2
        private integer array r
        private integer ic = 0
        private multiboard array boardp
        private integer array rc
        private integer array cc
        private boolean array suppressed
    endglobals
    
    private module Init

        private static method onInit takes nothing returns nothing
            set table = Table.create()
            set table2 = Table.create()
        endmethod

    endmodule
    
    struct MultiboardItem extends array

        method operator text= takes string value returns nothing
            call MultiboardSetItemValue(table.multiboarditem[this], value)
        endmethod
        method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
            call MultiboardSetItemValueColor(table.multiboarditem[this], red, green, blue, alpha)
        endmethod
        method setStyle takes boolean showValue, boolean showIcon returns nothing
            call MultiboardSetItemStyle(table.multiboarditem[this], showValue, showIcon)
        endmethod
        method operator icon= takes string str returns nothing
            call MultiboardSetItemIcon(table.multiboarditem[this], str)
        endmethod
        method operator width= takes real percent returns nothing
            call MultiboardSetItemWidth(table.multiboarditem[this], percent)
        endmethod
    
        implement Init

    endstruct
    
    //! textmacro MULTIBOARD_LOOPER takes ROW, TABLE, CODE
        local multiboarditem mbi
        loop
            exitwhen 0 == $ROW$
            set mbi = $TABLE$.multiboarditem[this]
            call $CODE$
            set this = this + 1
            set $ROW$ = $ROW$ - 1
        endloop
        
        set mbi = null
    //! endtextmacro
    
    private keyword Multiboard2D
    private keyword getItems
    private keyword clearItems

    struct Multiboard extends array

        method getItems takes nothing returns nothing
            local integer row = rc[this]
            local integer column
            local multiboarditem mbi
            loop
                set column = cc[this]
                loop
                    set mbi = MultiboardGetItem(boardp[this], row, column)
                    set table.multiboarditem[(this*500+row)*500+column] = mbi
                    set table2.multiboarditem[(this*500+column)*500+row] = mbi
                    exitwhen 0 == column
                    set column = column - 1
                endloop
                exitwhen 0 == row
                set row = row - 1
            endloop
            set mbi = null
        endmethod
        method clearItems takes nothing returns nothing
            local integer row = rc[this]
            local integer column
            loop
                set column = cc[this]
                loop
                    call MultiboardReleaseItem(table.multiboarditem[(this*500+row)*500+column])
                    call table.handle.remove((this*500+row)*500+column)
                    call table2.handle.remove((this*500+column)*500+row)
                    exitwhen 0 == column
                    set column = column - 1
                endloop
                exitwhen 0 == row
                set row = row - 1
            endloop
        endmethod
        
        static method create takes integer rowCount, integer columnCount returns thistype
            local thistype this = r[0]
            
            if (0 == this) then
                set this = ic + 1
                set ic = this
            else
                set suppressed[this] = false
                set r[0] = r[this]
            endif
            
            set boardp[this] = CreateMultiboard()
            call MultiboardSetColumnCount(boardp[this], columnCount)
            call MultiboardSetRowCount(boardp[this], rowCount)
            
            set rc[this] = rowCount
            set cc[this] = columnCount
            
            call getItems()
            
            return this
        endmethod
        
        method destroy takes nothing returns nothing
            set r[this] = r[0]
            set r[0] = this
            
            call clearItems()
            
            call DestroyMultiboard(boardp[this])
            set boardp[this] = null
        endmethod
        
        method clear takes nothing returns nothing
            call MultiboardClear(boardp[this])
        endmethod
        
        method operator display takes nothing returns boolean
            return IsMultiboardDisplayed(boardp[this])
        endmethod
        method operator display= takes boolean b returns nothing
            call MultiboardDisplay(boardp[this], b)
        endmethod
        method operator minimize takes nothing returns boolean
            return IsMultiboardMinimized(boardp[this])
        endmethod
        method operator minimize= takes boolean b returns nothing
            call MultiboardMinimize(boardp[this], b)
        endmethod
        method operator title takes nothing returns string
            return MultiboardGetTitleText(boardp[this])
        endmethod
        method operator title= takes string txt returns nothing
            call MultiboardSetTitleText(boardp[this], txt)
        endmethod
        method setTitleColor takes integer red, integer green, integer blue, integer alpha returns nothing
            call MultiboardSetTitleTextColor(boardp[this], red, green, blue, alpha)
        endmethod
        method operator suppress takes nothing returns boolean
            return suppressed[this]
        endmethod
        method operator suppress= takes boolean b returns nothing
            set suppressed[this] = b
            call MultiboardSuppressDisplay(b)
        endmethod
        method operator width= takes real percent returns nothing
            call MultiboardSetItemsWidth(boardp[this], percent)
        endmethod
        method operator row takes nothing returns MultiboardRow
            return this
        endmethod
        method operator column takes nothing returns MultiboardColumn
            return this
        endmethod
        method operator [] takes integer row returns Multiboard2D
            return this*500+row
        endmethod
        method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
            call MultiboardSetItemsValueColor(boardp[this], red, green, blue, alpha)
        endmethod
        method setStyle takes boolean showValues, boolean showIcons returns nothing
            call MultiboardSetItemsStyle(boardp[this], showValues, showIcons)
        endmethod
        method operator icon= takes string txt returns nothing
            call MultiboardSetItemsIcon(boardp[this], txt)
        endmethod
        method operator text= takes string txt returns nothing
            call MultiboardSetItemsValue(boardp[this], txt)
        endmethod

    endstruct
    
    private struct MultiboardSet extends array

        method text takes string v, integer c, Table t returns nothing
            //! runtextmacro MULTIBOARD_LOOPER("c", "t", "MultiboardSetItemValue(mbi, v)")
        endmethod
        method color takes integer red, integer green, integer blue, integer alpha, integer c, Table t returns nothing
            //! runtextmacro MULTIBOARD_LOOPER("c", "t", "MultiboardSetItemValueColor(mbi, red, green, blue, alpha)")
        endmethod
        method style takes boolean v, boolean i, integer c, Table t returns nothing
            //! runtextmacro MULTIBOARD_LOOPER("c", "t", "MultiboardSetItemStyle(mbi, v, i)")
        endmethod
        method icon takes string s, integer c, Table t returns nothing
            //! runtextmacro MULTIBOARD_LOOPER("c", "t", "MultiboardSetItemIcon(mbi, s)")
        endmethod
        method width takes real p, integer c, Table t returns nothing
            //! runtextmacro MULTIBOARD_LOOPER("c", "t", "MultiboardSetItemWidth(mbi, p)")
        endmethod

    endstruct

    struct MultiboardColumn extends array

        method operator count takes nothing returns integer
            return MultiboardGetColumnCount(boardp[this])
        endmethod
        method operator count= takes integer columns returns nothing
            call Multiboard(this).clearItems()
            call MultiboardSetColumnCount(boardp[this], columns)
            set cc[this] = columns
            call Multiboard(this).getItems()
        endmethod
        method operator text= takes string value returns nothing
            call MultiboardSet(this).text(value, rc[this/250000], table2)
        endmethod
        method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
            call MultiboardSet(this).color(red, green, blue, alpha, rc[this/250000], table2)
        endmethod
        method setStyle takes boolean showValue, boolean showIcon returns nothing
            call MultiboardSet(this).style(showValue, showIcon, rc[this/250000], table2)
        endmethod
        method operator icon= takes string str returns nothing
            call MultiboardSet(this).icon(str, rc[this/250000], table2)
        endmethod
        method operator width= takes real percent returns nothing
            call MultiboardSet(this).width(percent, rc[this/250000], table2)
        endmethod
        method operator [] takes integer column returns thistype
            return (this*500+column)*500
        endmethod

    endstruct

    struct MultiboardRow extends array

        method operator count takes nothing returns integer
            return MultiboardGetRowCount(boardp[this])
        endmethod
        method operator count= takes integer rows returns nothing
            call Multiboard(this).clearItems()
            call MultiboardSetRowCount(boardp[this], rows)
            set rc[this] = rows
            call Multiboard(this).getItems()
        endmethod
        method operator text= takes string value returns nothing
            call MultiboardSet(this).text(value, cc[this/250000], table)
        endmethod
        method setColor takes integer red, integer green, integer blue, integer alpha returns nothing
            call MultiboardSet(this).color(red, green, blue, alpha, cc[this/250000], table)
        endmethod
        method setStyle takes boolean showValue, boolean showIcon returns nothing
            call MultiboardSet(this).style(showValue, showIcon, cc[this/250000], table)
        endmethod
        method operator icon= takes string str returns nothing
            call MultiboardSet(this).icon(str, cc[this/250000], table)
        endmethod
        method operator width= takes real percent returns nothing
            call MultiboardSet(this).width(percent,cc[this/250000], table)
        endmethod
        method operator [] takes integer row returns thistype
            return (this*500+row)*500
        endmethod

    endstruct

    private struct Multiboard2D extends array

        method operator [] takes integer column returns MultiboardItem
            return this*500+column
        endmethod

    endstruct

endlibrary
library NokladrLib uses Colors, Logs, optional UnitRecycler  // Library by Nokladr https://github.com/Igneaalis/MIX
    globals
        integer array time[3] // time[0] - секунды, time[1] - минуты, time[2] - часы
    endglobals

    // Отображает сообщение об ошибке
    function C_ErrorMsg takes string s returns nothing
        debug call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, (RED + "Ошибка: " + s + "|r"))
    endfunction

    // Устанавливает всем компьютерным игрокам соответствующее имя
    function C_SetComputers takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen (i > 27)
            if (GetPlayerController(Player(i)) == MAP_CONTROL_COMPUTER) then
                call SetPlayerName(Player(i), "Компьютер")
                call SetPlayerOnScoreScreen(Player(i), false)
            endif
            set i = i + 1
        endloop
    endfunction

    // Пересобирает таблицу лидеров. Если есть пустые строки, то удаляет их.
    function C_ResizeTable takes leaderboard l returns nothing
        local integer size = LeaderboardGetItemCount(l)
        if (LeaderboardGetLabelText(l) == "") then
            set size = size - 1
        endif
        call LeaderboardSetSizeByItemCount(l, size)
    endfunction

    // Удаляет i-ую строку из таблицы лидеров
    function C_RemoveTableRow takes leaderboard l, integer row returns nothing
        call LeaderboardRemoveItem(l, row)
        call C_ResizeTable(l)
    endfunction

    // Добавляет строку в таблицу лидеров
    function C_AddTableRow takes leaderboard l, string label, integer value, boolean flag returns nothing
        local integer i = 0
        local boolean complete = false
        loop
            exitwhen(i > 14)
            if (not LeaderboardHasPlayerItem(l, Player(i))) then
                call LeaderboardAddItem(l, label, value, Player(i))
                if (label == "" and value == 0) then
                    call LeaderboardSetItemStyle(l, i, false, false, false)
                elseif (value == 0 and not flag) then
                    call LeaderboardSetItemStyle(l, i, true, false, false)
                endif
                set complete = true
            endif
            if (complete) then
                call C_ResizeTable(l)
                exitwhen true
            endif
            set i = i + 1
        endloop
        if (not complete) then
            call C_ErrorMsg("невозможно создать строку в таблице. Освободите место.")
        endif
    endfunction

    // Счётчик времени
    private function C_StartCount takes nothing returns nothing
        set time[0] = time[0] + 1
        if (time[0] > 59) then
            set time[0] = 0
            set time[1] = time[1] + 1
            if (time[1] > 59) then
                set time[1] = 0
                set time[2] = time[2] + 1
                if (time[2] > 24) then
                    set time[0] = 0 //Секунды
                    set time[1] = 0 //Минуты
                    set time[2] = 0 //Часы
                endif
            endif
        endif
    endfunction

    // Инициализация счётчика времени
    function StartInitTimer takes nothing returns nothing
        local timer t = CreateTimer()
        call TimerStart(t, 1., true, function C_StartCount)
    endfunction

    // Возвращает состояние счётчика времени в секундах
    function GetTimeInSeconds takes nothing returns integer
        return time[0] + time[1]*60 + time[2]*3600
    endfunction

    // Создаёт и возвращает таблицу лидеров
    function C_CreateTable takes string label, boolean IsVisible returns leaderboard
        local leaderboard l = CreateLeaderboard()
        local integer i = 0
        loop
            exitwhen (i > 14)
            call PlayerSetLeaderboard(Player(i), l)
            set i = i + 1
        endloop
        call LeaderboardSetLabel(l, label)
        call LeaderboardDisplay(l, IsVisible)
        return l
    endfunction

    // Удаляет выделенных юнитов
    function C_RemoveEnumUnits takes nothing returns nothing
        static if LIBRARY_UnitRecycler then
            call RemoveUnitEx(GetEnumUnit())
        else
            call RemoveUnit(GetEnumUnit())
        endif
    endfunction

    // Добавляет золото игроку
    function AddGoldToPlayer takes integer value, player p returns nothing
        call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + value)
    endfunction

    // Добавляет дерево игроку
    function AddLumberToPlayer takes integer value, player p returns nothing
        call SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) + value)
    endfunction

    // Принимает rect, возвращает location
    function RectToLoc takes rect r returns location
        return Location(GetRectCenterX(r), GetRectCenterY(r))
    endfunction

    // Условие: юнит имеет предмет с itemId?
    function C_DoesUnitHasItemOfType takes unit u, integer itemId returns boolean
        local integer i = 0
        local item indexItem
        loop
            exitwhen (i > 5)
            set indexItem = UnitItemInSlot(u,i)
            if (indexItem != null and GetItemTypeId(indexItem) == itemId) then
                return true
            endif
            set i = i + 1
        endloop
        return false
    endfunction

    // Условие: юнит находится в rect?
    function C_IsUnitInRect takes unit u, rect r returns boolean
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        return ((GetRectMinX(r)-32 <= x) and (x <= GetRectMaxX(r)+32) and (GetRectMinY(r)-32 <= y) and (y <= GetRectMaxY(r)+32))
    endfunction

    // Создаёт texttag, упрощённая и оптимизированная версия CreateTextTagLocBJ
    function NewTextTag takes string s, rect rct, real size returns texttag
        local texttag tt = CreateTextTag()
        // SetTextTagTextBJ
        call SetTextTagText(tt, s, TextTagSize2Height(size))
        // SetTextTagPosBJ
        call SetTextTagPos(tt, GetRectCenterX(rct), GetRectCenterY(rct), 0)
        // SetTextTagColorBJ
        call SetTextTagColor(tt, 255, 255, 255, 255)
        return tt
    endfunction

    // Создаёт texttag по координатам юнита, упрощённая и оптимизированная версия CreateTextTagLocBJ
    function NewTextTagAtUnit takes string s, unit u, real zOffset, real size returns texttag
        local texttag tt = CreateTextTag()
        // SetTextTagTextBJ
        call SetTextTagText(tt, s, TextTagSize2Height(size))
        // SetTextTagPosBJ
        call SetTextTagPos(tt, GetUnitX(u), GetUnitY(u), zOffset)
        // SetTextTagColorBJ
        call SetTextTagColor(tt, 255, 255, 255, 255)
        return tt
    endfunction

    // Makes map normal in opposite to FadeMap()
    function UnfadeMap takes nothing returns nothing
        call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    endfunction
    
    // Makes map absolute black
    function FadeMap takes nothing returns nothing
        call SetDayNightModels("", "")
    endfunction

endlibrary
library Table  // made by Bribe, special thanks to Vexorian & Nestharus, version 4.1.0.1. http://www.hiveworkshop.com/threads/188084/
   
    // One map, one hashtable. Welcome to NewTable 4.1.0.1
   
    // This newest iteration of Table introduces the new HashTable struct.
    // You can now instantiate HashTables which enables the use of large
    // parent and large child keys, just like a standard hashtable. Previously,
    // the user would have to instantiate a Table to do this on their own which -
    // while doable - is something the user should not have to do if I can add it
    // to this resource myself (especially if they are inexperienced).
   
    // This library was originally called NewTable so it didn't conflict with
    // the API of Table by Vexorian. However, the damage is done and it's too
    // late to change the library name now. To help with damage control, I
    // have provided an extension library called TableBC, which bridges all
    // the functionality of Vexorian's Table except for 2-D string arrays &
    // the ".flush(integer)" method. I use ".flush()" to flush a child hash-
    // table, because I wanted the API in NewTable to reflect the API of real
    // hashtables (I thought this would be more intuitive).
   
    // API
   
    // ------------
    // struct Table
    // | static method create takes nothing returns Table
    // |     create a new Table
    // |    
    // | method destroy takes nothing returns nothing
    // |     destroy it
    // |    
    // | method flush takes nothing returns nothing
    // |     flush all stored values inside of it
    // |    
    // | method remove takes integer key returns nothing
    // |     remove the value at index "key"
    // |    
    // | method operator []= takes integer key, $TYPE$ value returns nothing
    // |     assign "value" to index "key"
    // |    
    // | method operator [] takes integer key returns $TYPE$
    // |     load the value at index "key"
    // |    
    // | method has takes integer key returns boolean
    // |     whether or not the key was assigned
    // |
    // ----------------
    // struct TableArray
    // | static method operator [] takes integer array_size returns TableArray
    // |     create a new array of Tables of size "array_size"
    // |
    // | method destroy takes nothing returns nothing
    // |     destroy it
    // |
    // | method flush takes nothing returns nothing
    // |     flush and destroy it
    // |
    // | method operator size takes nothing returns integer
    // |     returns the size of the TableArray
    // |
    // | method operator [] takes integer key returns Table
    // |     returns a Table accessible exclusively to index "key"
   
    globals
        private integer less = 0    //Index generation for TableArrays (below 0).
        private integer more = 8190 //Index generation for Tables.
        //Configure it if you use more than 8190 "key" variables in your map (this will never happen though).
    
        private hashtable ht = InitHashtable()
        private key sizeK
        private key listK
    endglobals
    
    private struct dex extends array
        static method operator size takes nothing returns Table
            return sizeK
        endmethod

        static method operator list takes nothing returns Table
            return listK
        endmethod
    endstruct
   
    private struct handles extends array
        method has takes integer key returns boolean
            return HaveSavedHandle(ht, this, key)
        endmethod

        method remove takes integer key returns nothing
            call RemoveSavedHandle(ht, this, key)
        endmethod
    endstruct
   
    private struct agents extends array
        method operator []= takes integer key, agent value returns nothing
            call SaveAgentHandle(ht, this, key, value)
        endmethod
    endstruct
   
    //! textmacro NEW_ARRAY_BASIC takes SUPER, FUNC, TYPE
    private struct $TYPE$s extends array
        method operator [] takes integer key returns $TYPE$
            return Load$FUNC$(ht, this, key)
        endmethod

        method operator []= takes integer key, $TYPE$ value returns nothing
            call Save$FUNC$(ht, this, key, value)
        endmethod

        method has takes integer key returns boolean
            return HaveSaved$SUPER$(ht, this, key)
        endmethod

        method remove takes integer key returns nothing
            call RemoveSaved$SUPER$(ht, this, key)
        endmethod
    endstruct

    private module $TYPE$m
        method operator $TYPE$ takes nothing returns $TYPE$s
            return this
        endmethod
    endmodule
    //! endtextmacro
   
    //! textmacro NEW_ARRAY takes FUNC, TYPE
    private struct $TYPE$s extends array
        method operator [] takes integer key returns $TYPE$
            return Load$FUNC$Handle(ht, this, key)
        endmethod

        method operator []= takes integer key, $TYPE$ value returns nothing
            call Save$FUNC$Handle(ht, this, key, value)
        endmethod

        method has takes integer key returns boolean
            return HaveSavedHandle(ht, this, key)
        endmethod

        method remove takes integer key returns nothing
            call RemoveSavedHandle(ht, this, key)
        endmethod
    endstruct

    private module $TYPE$m
        method operator $TYPE$ takes nothing returns $TYPE$s
            return this
        endmethod
    endmodule
    //! endtextmacro
   
//Run these textmacros to include the entire hashtable API as wrappers.
//Don't be intimidated by the number of macros - Vexorian's map optimizer is
//supposed to kill functions which inline (all of these functions inline).
//! runtextmacro NEW_ARRAY_BASIC("Real", "Real", "real")
//! runtextmacro NEW_ARRAY_BASIC("Boolean", "Boolean", "boolean")
//! runtextmacro NEW_ARRAY_BASIC("String", "Str", "string")
//New textmacro to allow table.integer[] syntax for compatibility with textmacros that might desire it.
//! runtextmacro NEW_ARRAY_BASIC("Integer", "Integer", "integer")
   
//! runtextmacro NEW_ARRAY("Player", "player")
//! runtextmacro NEW_ARRAY("Widget", "widget")
//! runtextmacro NEW_ARRAY("Destructable", "destructable")
//! runtextmacro NEW_ARRAY("Item", "item")
//! runtextmacro NEW_ARRAY("Unit", "unit")
//! runtextmacro NEW_ARRAY("Ability", "ability")
//! runtextmacro NEW_ARRAY("Timer", "timer")
//! runtextmacro NEW_ARRAY("Trigger", "trigger")
//! runtextmacro NEW_ARRAY("TriggerCondition", "triggercondition")
//! runtextmacro NEW_ARRAY("TriggerAction", "triggeraction")
//! runtextmacro NEW_ARRAY("TriggerEvent", "event")
//! runtextmacro NEW_ARRAY("Force", "force")
//! runtextmacro NEW_ARRAY("Group", "group")
//! runtextmacro NEW_ARRAY("Location", "location")
//! runtextmacro NEW_ARRAY("Rect", "rect")
//! runtextmacro NEW_ARRAY("BooleanExpr", "boolexpr")
//! runtextmacro NEW_ARRAY("Sound", "sound")
//! runtextmacro NEW_ARRAY("Effect", "effect")
//! runtextmacro NEW_ARRAY("UnitPool", "unitpool")
//! runtextmacro NEW_ARRAY("ItemPool", "itempool")
//! runtextmacro NEW_ARRAY("Quest", "quest")
//! runtextmacro NEW_ARRAY("QuestItem", "questitem")
//! runtextmacro NEW_ARRAY("DefeatCondition", "defeatcondition")
//! runtextmacro NEW_ARRAY("TimerDialog", "timerdialog")
//! runtextmacro NEW_ARRAY("Leaderboard", "leaderboard")
//! runtextmacro NEW_ARRAY("Multiboard", "multiboard")
//! runtextmacro NEW_ARRAY("MultiboardItem", "multiboarditem")
//! runtextmacro NEW_ARRAY("Trackable", "trackable")
//! runtextmacro NEW_ARRAY("Dialog", "dialog")
//! runtextmacro NEW_ARRAY("Button", "button")
//! runtextmacro NEW_ARRAY("TextTag", "texttag")
//! runtextmacro NEW_ARRAY("Lightning", "lightning")
//! runtextmacro NEW_ARRAY("Image", "image")
//! runtextmacro NEW_ARRAY("Ubersplat", "ubersplat")
//! runtextmacro NEW_ARRAY("Region", "region")
//! runtextmacro NEW_ARRAY("FogState", "fogstate")
//! runtextmacro NEW_ARRAY("FogModifier", "fogmodifier")
//! runtextmacro NEW_ARRAY("Hashtable", "hashtable")
   
    struct Table extends array
    
        // Implement modules for intuitive syntax (tb.handle; tb.unit; etc.)
        implement realm
        implement integerm
        implement booleanm
        implement stringm
        implement playerm
        implement widgetm
        implement destructablem
        implement itemm
        implement unitm
        implement abilitym
        implement timerm
        implement triggerm
        implement triggerconditionm
        implement triggeractionm
        implement eventm
        implement forcem
        implement groupm
        implement locationm
        implement rectm
        implement boolexprm
        implement soundm
        implement effectm
        implement unitpoolm
        implement itempoolm
        implement questm
        implement questitemm
        implement defeatconditionm
        implement timerdialogm
        implement leaderboardm
        implement multiboardm
        implement multiboarditemm
        implement trackablem
        implement dialogm
        implement buttonm
        implement texttagm
        implement lightningm
        implement imagem
        implement ubersplatm
        implement regionm
        implement fogstatem
        implement fogmodifierm
        implement hashtablem
    
        method operator handle takes nothing returns handles
            return this
        endmethod
    
        method operator agent takes nothing returns agents
            return this
        endmethod
    
        //set this = tb[GetSpellAbilityId()]
        method operator [] takes integer key returns Table
            return LoadInteger(ht, this, key) //return this.integer[key]
        endmethod
    
        //set tb[389034] = 8192
        method operator []= takes integer key, Table tb returns nothing
            call SaveInteger(ht, this, key, tb) //set this.integer[key] = tb
        endmethod
    
        //set b = tb.has(2493223)
        method has takes integer key returns boolean
            return HaveSavedInteger(ht, this, key) //return this.integer.has(key)
        endmethod
    
        //call tb.remove(294080)
        method remove takes integer key returns nothing
            call RemoveSavedInteger(ht, this, key) //call this.integer.remove(key)
        endmethod
    
        //Remove all data from a Table instance
        method flush takes nothing returns nothing
            call FlushChildHashtable(ht, this)
        endmethod
    
        //local Table tb = Table.create()
        static method create takes nothing returns Table
            local Table this = dex.list[0]
        
            if this == 0 then
                set this = more + 1
                set more = this
            else
                set dex.list[0] = dex.list[this]
                call dex.list.remove(this) //Clear hashed memory
            endif
        
            debug set dex.list[this] = -1
            return this
        endmethod
    
        // Removes all data from a Table instance and recycles its index.
        //
        //     call tb.destroy()
        //
        method destroy takes nothing returns nothing
            debug if dex.list[this] != -1 then
                debug call BJDebugMsg("Table Error: Tried to double-free instance: " + I2S(this))
                debug return
            debug endif
        
            call this.flush()
        
            set dex.list[this] = dex.list[0]
            set dex.list[0] = this
        endmethod
    
        //! runtextmacro optional TABLE_BC_METHODS()
    endstruct
   
    //! runtextmacro optional TABLE_BC_STRUCTS()
    
    struct TableArray extends array
    
        //Returns a new TableArray to do your bidding. Simply use:
        //
        //    local TableArray ta = TableArray[array_size]
        //
        static method operator [] takes integer array_size returns TableArray
            local Table tb = dex.size[array_size] //Get the unique recycle list for this array size
            local TableArray this = tb[0]         //The last-destroyed TableArray that had this array size
        
            debug if array_size <= 0 then
                debug call BJDebugMsg("TypeError: Invalid specified TableArray size: " + I2S(array_size))
                debug return 0
            debug endif
        
            if this == 0 then
                set this = less - array_size
                set less = this
            else
                set tb[0] = tb[this]  //Set the last destroyed to the last-last destroyed
                call tb.remove(this)  //Clear hashed memory
            endif
        
            set dex.size[this] = array_size //This remembers the array size
            return this
        endmethod
    
        //Returns the size of the TableArray
        method operator size takes nothing returns integer
            return dex.size[this]
        endmethod
    
        //This magic method enables two-dimensional[array][syntax] for Tables,
        //similar to the two-dimensional utility provided by hashtables them-
        //selves.
        //
        //ta[integer a].unit[integer b] = unit u
        //ta[integer a][integer c] = integer d
        //
        //Inline-friendly when not running in debug mode
        //
        method operator [] takes integer key returns Table
            static if DEBUG_MODE then
                local integer i = this.size
                if i == 0 then
                    call BJDebugMsg("IndexError: Tried to get key from invalid TableArray instance: " + I2S(this))
                    return 0
                elseif key < 0 or key >= i then
                    call BJDebugMsg("IndexError: Tried to get key [" + I2S(key) + "] from outside TableArray bounds: " + I2S(i))
                    return 0
                endif
            endif
            return this + key
        endmethod
    
        //Destroys a TableArray without flushing it; I assume you call .flush()
        //if you want it flushed too. This is a public method so that you don't
        //have to loop through all TableArray indices to flush them if you don't
        //need to (ie. if you were flushing all child-keys as you used them).
        //
        method destroy takes nothing returns nothing
            local Table tb = dex.size[this.size]
        
            debug if this.size == 0 then
                debug call BJDebugMsg("TypeError: Tried to destroy an invalid TableArray: " + I2S(this))
                debug return
            debug endif
        
            if tb == 0 then
                //Create a Table to index recycled instances with their array size
                set tb = Table.create()
                set dex.size[this.size] = tb
            endif
        
            call dex.size.remove(this) //Clear the array size from hash memory
        
            set tb[this] = tb[0]
            set tb[0] = this
        endmethod
    
        private static Table tempTable
        private static integer tempEnd
    
        //Avoids hitting the op limit
        private static method clean takes nothing returns nothing
            local Table tb = .tempTable
            local integer end = tb + 0x1000
            if end < .tempEnd then
                set .tempTable = end
                call ForForce(bj_FORCE_PLAYER[0], function thistype.clean)
            else
                set end = .tempEnd
            endif
            loop
                call tb.flush()
                set tb = tb + 1
                exitwhen tb == end
            endloop
        endmethod
    
        //Flushes the TableArray and also destroys it. Doesn't get any more
        //similar to the FlushParentHashtable native than this.
        //
        method flush takes nothing returns nothing
            debug if this.size == 0 then
                debug call BJDebugMsg("TypeError: Tried to flush an invalid TableArray instance: " + I2S(this))
                debug return
            debug endif
            set .tempTable = this
            set .tempEnd = this + this.size
            call ForForce(bj_FORCE_PLAYER[0], function thistype.clean)
            call this.destroy()
        endmethod
    
    endstruct
   
    //NEW: Added in Table 4.0. A fairly simple struct but allows you to do more
    //than that which was previously possible.
    struct HashTable extends array

        //Enables myHash[parentKey][childKey] syntax.
        //Basically, it creates a Table in the place of the parent key if
        //it didn't already get created earlier.
        method operator [] takes integer index returns Table
            local Table t = Table(this)[index]
            if t == 0 then
                set t = Table.create()
                set Table(this)[index] = t //whoops! Forgot that line. I'm out of practice!
            endif
            return t
        endmethod

        //You need to call this on each parent key that you used if you
        //intend to destroy the HashTable or simply no longer need that key.
        method remove takes integer index returns nothing
            local Table t = Table(this)[index]
            if t != 0 then
                call t.destroy()
                call Table(this).remove(index)
            endif
        endmethod
    
        //Added in version 4.1
        method has takes integer index returns boolean
            return Table(this).has(index)
        endmethod
    
        //HashTables are just fancy Table indices.
        method destroy takes nothing returns nothing
            call Table(this).destroy()
        endmethod
    
        //Like I said above...
        static method create takes nothing returns thistype
            return Table.create()
        endmethod

    endstruct

endlibrary
library UnitRecycler initializer UnitRecyclerInit uses Colors, ArcingTextTag, Logs  // https://wc3modding.info/4529/system-unit-recycler-simple-damage-detection-system/
    //
    // Unit Recycler
    // By moyack. 2017
    //
    // ============================================================================
    // Credits to Litany, DioD, Captain Griffen, Troll Brain and other nice guys  
    // for their suggestions, comments and ideas.                                 
    // ============================================================================
    //
    // This library allows to your map to reuse died units, which saves memory.
    // It's very useful in AoS or footies games, where the unit spawning is a
    // common task.
    //
    // How it works?
    // =============
    //
    // The script detects if a unit reach the dying point (defined by the MIN_LIFE
    // constant), and if the damage can kill the unit, then it is sent to the dump
    // for further recycling. For custom situations like summoning or when a unit
    // enters to the map, you just have to use the functions provided by this 
    // library.
    //
    // Functions
    // =========
    // 
    // in order to recycle a unit, you can use these function:
    //
    //  => RecycleUnit(<unit variable>) returns unit
    //     -----------------------------------------
    //     This function takes as argument a unit, and returns the unit recycled.
    //     if there's a unit of the same typeid in the dump, it will use this unit
    //     instead of the one from the function input, removing it immediately, 
    //     otherwise this script will return the same unit.
    // 
    //  => CreateUnitEx(player, unitid, x, y, angle) returns unit
    //     ------------------------------------------------------
    //     Like the native function but tries to recycle the unit if avaliable in the dump
    //
    //  => KillUnitEx(<unit variable>) returns nothing
    //     -------------------------------------------
    //     Like the native function but it recycles the unit before killing it.
    //
    //  => RemoveUnitEx(<unit variable>) returns nothing
    //     ---------------------------------------------
    //     Like the native function but it recycles the unit.
    //
    //  => IsUnitDead(<unit variable>) returns boolean
    //     -------------------------------------------
    //     This function returns a boolean argument that indicates if the unit is dead or not.
    //     Remember that a unit is dead if it's in the Heaven group.
    //
    //  => ReplaceDummy(<unit variable>) returns unit
    //     -------------------------------------------
    //     This function returns a replacement unit without killing the output unit.
    //
    //  => CreateDummy(player, unitid, x, y, angle) returns unit
    //     ------------------------------------------------------
    //     Like the CreateUnit function but the returned unit won't be affected by the damage
    //     detection nor will be recycled automatically
    //
    //  => TriggerRegisterAnyUnitRecycleEvent(trigger t) returns nothing
    //     -------------------------------------------------------------
    //     All the trigger registered in this way will activate when a unit is about to be recycled
    //     (in other words, it triggers before it dies). You can use this functions to retrieve the
    //     the units involved in this event:
    //
    //      # GetRecycledUnit() returns the units that is going to be recycled
    //      # GetRecycleDummyUnit() returns the dummy unit which will die instead of the recycled unit
    //      # GetRecycleAttacker() returns the unit that "kills" the recycled unit
    //
    //  => IsUnitDummy(unit u) returns boolean
    //     -----------------------------------
    //     Checks if a unit can be recycled or not. Dummy units are not recycled, they're used as 
    //     placeholder of the unit about to die...
    //
    //  => GetUnitsInHeaven() returns group 
    //     --------------------------------
    //     Returns the group which contains the units in the heaven. Useful to do checks and
    //     operations on them.
    //
    //
    // For Damage detection, you just need to use these functions:
    //
    //  => AddDamageCondition(<Boolexpr variable>) returns nothing
    //     -------------------------------------------------------
    //     Just add a condition function which manage the damaged unit and the script
    //     will use it with all the the units in the DD.D group.
    //
    //  => DoNonDetectableDamage(unit, widget, damage, boolean_attack, boolean_ranged, attacktype, damagetype, weapontype) returns boolean
    //     -------------------------------------------------------------------------------------------------------------------------------
    //     Like the UnitDamageTarget function, but it can be used inside condition functions.
    //     How to know if you need to use it? if you use UnitDamageTarget() inside a DD function and 
    //     it freezes the game until it kills the attacked unit(s), then you have to replace that
    //     function by this custom one.
    //
    // CONFIGURATION PART
    globals
        private constant real     MIN_LIFE = 0.405          // the experimental death value that will be used to activate
                                                            // the fake death of units. units that reach this value or less
                                                            // won't die and they will be recycled.
        private constant boolean  AUTO_LOC = false          // If it's set to true, it will place automatically the heaven in one
                                                            // non visible corner of the map, else, it will use the HEAVEN_POS
                                                            // as a heaven location
        private constant player   DUMMY_PLAYER = Player(0) // sets the player owner of the unit's heaven
        private constant real     MANA_FACTOR = 1           // sets the initial mana amount (as percentage of maximum mana)
                                                            // to recycled units when they are just placed in the game.
                                                            // This constant is used only by CreateUnitEx function.
        
        private location HEAVEN_POS = Location(7500, -6150) // Indicates the heaven's location.

        trigger DDS
    endglobals
    // END CONFIGURATION PART
    
    globals
        private group Heaven // where worthy units go when they die...
    endglobals
    
    // this is a key functions part just to make homogeneus the unit management, please don't edit this unless
    // you know what are you doing, ok??
    private keyword Kill
    
    private function PrepareUnit takes unit u returns nothing
        call SelectUnit(u, false)
        call UnitRemoveBuffs(u, true, true)
        call UnitResetCooldown(u)
        call SetUnitInvulnerable(u, true)
        call SetWidgetLife(u, GetUnitState(u, UNIT_STATE_MAX_LIFE))
        call PauseUnit(u, true)
        call GroupAddUnit(Heaven, u)
    endfunction
    
    private function MoveUnit takes unit u returns nothing
        call SetUnitOwner(u, DUMMY_PLAYER, true)
        call SetUnitX(u, GetLocationX(HEAVEN_POS))
        call SetUnitY(u, GetLocationY(HEAVEN_POS))
    endfunction
    
    private function PlaceDummy takes unit d, unit u returns nothing
        call GroupAddUnit(Kill.corpse, d)
        call SetUnitUseFood(d, false)
        call SetUnitState(d, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA))
        call SetUnitFlyHeight(d, GetUnitFlyHeight(u), 0.)
        //call SetCSData(d, GetCSData(u)) //used to pass attached data via CSData to the corpse...
        call SetUnitPathing(d, false)
        call SetUnitX(d, GetUnitX(u))
        call SetUnitY(d, GetUnitY(u))
    endfunction
    // end key functions...
    
    private struct Trigger // struct to manage the EventRecycleUnit
        private static integer i = 0
        static unit R = null // recycled unit
        static unit D = null // dummy unit
        static unit A = null // attacker unit
        trigger t
        
        static method AddTrigger takes trigger t returns nothing
            local thistype T = thistype.allocate()
            set T.t = t
            set thistype.i = integer(T)
        endmethod
        
        static method evaluate takes unit r, unit d, unit a returns nothing
            local integer i = 1
            local Trigger T
            set thistype.R = r
            set thistype.D = d
            set thistype.A = a
            loop
                exitwhen i > Trigger.i
                set T =thistype(i)
                if T.t != null and TriggerEvaluate(T.t) then
                    call TriggerExecute(T.t)
                endif
                set i = i + 1
            endloop
        endmethod
    endstruct
    
    private struct Kill // struct used to manage the killed units...
        static group corpse // group of units that won't be touched by the damage detection (corpses and dummy units for instance)
        
        static method Do takes unit u, unit killer returns nothing
            local unit d = CreateUnit(GetOwningPlayer(u), GetUnitTypeId(u), GetUnitX(u), GetUnitY(u), GetUnitFacing(u))
            call SetUnitInvulnerable(u, true)
            call PlaceDummy(d, u)
            call SetWidgetLife(d, 1.)
            call Trigger.evaluate(u, d, killer)
            call UnitDamageTarget(killer, d, 2., true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
            call PrepareUnit(u)
            call MoveUnit(u)
            set d = null
        endmethod
        
        private static method ManageSummoned takes nothing returns nothing
            if IsUnitInGroup(GetSummonedUnit(), Kill.corpse) then
                // this part will run when a corpse is resurrected, so this units are suitable to
                // be controlled by the damage detection.
                call GroupRemoveUnit(Kill.corpse, GetSummonedUnit())
                call SetUnitPathing(GetSummonedUnit(), true)
            endif
        endmethod
        
        private static method onInit takes nothing returns nothing
            local trigger t = CreateTrigger()
            call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SUMMON)
            call TriggerAddAction(t, function Kill.ManageSummoned)
            set Kill.corpse = CreateGroup()
            set t = null
        endmethod
    endstruct
    
    private struct DD // damage detection struct, because damage detection can be so easy...
        static group D // group of unit that will have damage detection
        static trigger T
        static timer Tm = CreateTimer() // used to control the infinite looping when is used UnitDamageTarget over the same triggering unit 
        
        // Add the attacked unit to the damage detection if the unit is not in the unit group
        private static method AddUnit takes unit d returns nothing
            if not IsUnitInGroup(d, thistype.D) and not IsUnitInGroup(d, Kill.corpse) then
                // debug call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,2,"Added " + GetUnitName(d) + " to the DD")
                call TriggerRegisterUnitEvent(thistype.T, d, EVENT_UNIT_DAMAGED)
                call GroupAddUnit(thistype.D, d)
            endif
        endmethod
        
        private static method Attacked takes nothing returns nothing
            call thistype.AddUnit(GetTriggerUnit())
        endmethod
        
        private static method Spelled takes nothing returns nothing
            if GetSpellTargetUnit() != null then
                call thistype.AddUnit(GetSpellTargetUnit())
            endif
        endmethod
        
        static method AntiLoop takes nothing returns nothing
            call EnableTrigger(thistype.T)
        endmethod
        
        private static method onInit takes nothing returns nothing
            set thistype.T = CreateTrigger()
            set thistype.D = CreateGroup()
            call TriggerRegisterAnyUnitEventBJ(thistype.T, EVENT_PLAYER_UNIT_ATTACKED)
            call TriggerAddAction(thistype.T, function thistype.Attacked)
            set thistype.T = CreateTrigger()
            call TriggerRegisterAnyUnitEventBJ(thistype.T, EVENT_PLAYER_UNIT_SPELL_EFFECT)
            call TriggerAddAction(thistype.T, function thistype.Spelled)
            set thistype.T = CreateTrigger()
        endmethod
    
    endstruct  // you see, it's not bigger than this :)
    
    private struct UR  // unit recycling struct
        static group Temp = CreateGroup()
        static unit U = null
        
        static method FromDump takes nothing returns boolean
            if IsUnitInGroup(GetFilterUnit(), Heaven) and IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false then
                set thistype.U = GetFilterUnit()
            endif
            return false
        endmethod
        
        static method UseRecycled takes unit u returns unit
            local real x = GetUnitX(u)
            local real y = GetUnitY(u)
            local real f = GetUnitFacing(u)
            local real m = GetUnitState(u, UNIT_STATE_MANA)
            local player p = GetOwningPlayer(u)
            set thistype.U = null
            call GroupEnumUnitsOfTypeCounted(thistype.Temp, UnitId2String(GetUnitTypeId(u)), Condition(function thistype.FromDump), 1)
            if thistype.U != null then
                // debug call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 2, GetUnitName(thistype.U) + " is being reused...")
                call SetUnitInvulnerable(thistype.U, false)
                call GroupRemoveUnit(Heaven, thistype.U)
                call PauseUnit(thistype.U, true)
                call SetUnitPosition(thistype.U, x, y)
                call SetUnitFacing(thistype.U, f)
                call SetUnitOwner(thistype.U, p, true)
                call SetUnitState(thistype.U, UNIT_STATE_MANA, m)
                call SetUnitPathing(thistype.U, true)
                call PauseUnit(thistype.U, false)
                call RemoveUnit(u)
                set u = null
                return thistype.U
            else
                return u
            endif
        endmethod
        
        private static method onRecycle takes nothing returns boolean
            local unit u = GetTriggerUnit()
            if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and IsUnitType(u, UNIT_TYPE_SUMMONED) == false and GetWidgetLife(u) - GetEventDamage() <= MIN_LIFE then
                call Kill.Do(u, GetEventDamageSource())  // place a dummy to replace the unit
                                                         // and returns the corpse
                // debug call DisplayTimedTextFromPlayer(Player(15),0,0,2, GetUnitName(u) + " has been sent to the dump...")
            endif
            set u = null
            return false
        endmethod
        
        private static method onInit takes nothing returns nothing
            local rect r = GetWorldBounds()
            set Heaven = CreateGroup()
            call TriggerAddCondition(DD.T, Condition(function thistype.onRecycle))
            if AUTO_LOC then
                call MoveLocation(HEAVEN_POS, GetRectMinX(r), GetRectMinY(r))
            endif
            call RemoveRect(r)
            set r = null
        endmethod
    endstruct
    
    //===================
    // User functions... 
    //===================
    function RecycleUnit takes unit u returns unit
        return UR.UseRecycled(u)
    endfunction
    
    function CreateUnitEx takes player p, integer id, real x, real y, real f returns unit
        set UR.U = null
        call GroupEnumUnitsOfTypeCounted(UR.Temp, UnitId2String(id), Condition(function UR.FromDump), 1)
        if UR.U != null then
            // debug call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,2, GetUnitName(UR.U) + " is being reused...")
            call SetUnitInvulnerable(UR.U, false)
            call GroupRemoveUnit(Heaven, UR.U)
            call PauseUnit(UR.U, true)
            call SetUnitPosition(UR.U, x, y)
            call SetUnitFacing(UR.U, f)
            call SetUnitOwner(UR.U, p, true)
            call SetUnitState(UR.U, UNIT_STATE_MANA, GetUnitState(UR.U, UNIT_STATE_MAX_MANA) * MANA_FACTOR)
            call SetUnitPathing(UR.U, true)
            call PauseUnit(UR.U, false)
            return UR.U
        endif
        return CreateUnit(p, id, x, y, f)
    endfunction
    
    function KillUnitEx takes unit u returns nothing
        local unit d
        if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            set d = CreateUnit(GetOwningPlayer(u), GetUnitTypeId(u), GetUnitX(u), GetUnitY(u), GetUnitFacing(u))
            call Trigger.evaluate(u, d, null)
            call PrepareUnit(u)
            call PlaceDummy(d, u)
            call KillUnit(d)
            call MoveUnit(u)
        else
            call KillUnit(u)
        endif
        set d = null
    endfunction
    
    function RemoveUnitEx takes unit u returns nothing
        if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            call Trigger.evaluate(u, null, null)
            call PrepareUnit(u)
            call MoveUnit(u)
            // debug call Log("RemoveUnitEx: unit = " + GetUnitName(u))
        else
            call RemoveUnit(u)
        endif
    endfunction
    
    function IsUnitDead takes unit u returns boolean
        return IsUnitInGroup(u, Heaven)
    endfunction
    
    function ReplaceDummy takes unit u returns unit 
        local unit d
        if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            set d = CreateUnit(GetOwningPlayer(u), GetUnitTypeId(u), GetUnitX(u), GetUnitY(u), GetUnitFacing(u))
            call PlaceDummy(d, u)
            call SetWidgetLife(d, GetWidgetLife(u))
            call PrepareUnit(u)
            call MoveUnit(u)
            call SetUnitPathing(d, true)
        else
            set d = null
        endif
        return d
    endfunction
    
    function CreateDummy takes player p, integer id, real x, real y, real f returns unit
        local unit u = CreateUnit(p, id, x, y, f)
        call GroupAddUnit(Kill.corpse, u)
        return u
    endfunction
    
    // TriggerRecyclefunctions. this trigger happens before the triggered unit is going to die...
    function TriggerRegisterAnyUnitRecycleEvent takes trigger t returns nothing
        call Trigger.AddTrigger(t)
    endfunction
    
    constant function GetRecycledUnit takes nothing returns unit 
        // returns the recycled unit...
        return Trigger.R
    endfunction
    
    constant function GetRecycleDummyUnit takes nothing returns unit 
        // returns the dummy unit...
        return Trigger.D
    endfunction
    
    constant function GetRecycleAttacker takes nothing returns unit 
        // returns the attacker who "kills" the recycled unit...
        return Trigger.A
    endfunction
    
    constant function IsUnitDummy takes unit u returns boolean
        // Checks if a unit can be recycled or not. Dummy units are not recycled, they're used as placeholder...
        return IsUnitInGroup(u, Kill.corpse)
    endfunction
    
    constant function GetUnitsInHeaven takes nothing returns group
        // Checks if a unit can be recycled or not. Dummy units are not recycled, they're used as placeholder...
        return Heaven
    endfunction
    
    // Damage detection system functions...
    function AddDamageCondition takes boolexpr b returns nothing
        call TriggerAddCondition(DD.T, b)
    endfunction
    
    function DoNonDetectableDamage takes unit u, widget t, real damage, boolean attack, boolean ranged, attacktype AT, damagetype DT, weapontype WT returns boolean
        call DisableTrigger(DD.T)
        call TimerStart(DD.Tm, 0., false, function DD.AntiLoop)
        return UnitDamageTarget(u, t, damage, attack, ranged, AT, DT, WT)
    endfunction

    private function ShowDamage takes nothing returns boolean
        // This function is added with the AddDamageCondition() function in order to add a script that manages
        // the damaged units, in this case, it will show the damage received, just in the attack impact...
        // debug call Log((GOLD + I2S(R2I(GetEventDamage())) + "|r"))
        call ArcingTextTag.create((GOLD + I2S(R2I(GetEventDamage())) + "|r"), GetTriggerUnit())
        return false
    endfunction

    function UnitRecyclerInit takes nothing returns nothing
        set DDS = DD.T
        call AddDamageCondition(Condition(function ShowDamage))
    endfunction
    
endlibrary
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 21:19       =
=============================================

Реализация окна победы/поражения.

*/


function defeat_quit takes nothing returns nothing
    call EndGame(true)
endfunction

function win takes player p returns nothing
    local trigger t = CreateTrigger()
    local dialog  d = DialogCreate()
    call RemovePlayer(p, PLAYER_GAME_RESULT_VICTORY)
    if (GetPlayerController(p) == MAP_CONTROL_USER) then
        call DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE"), GetLocalizedHotkey("GAMEOVER_CONTINUE")))
        call TriggerAddAction(t, function defeat_quit)
        set t = CreateTrigger()
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
        call TriggerAddAction(t, function defeat_quit)
        if (GetLocalPlayer() == p) then
            call EnableUserControl(true)
            call EnableUserUI(false)
        endif
        call DialogDisplay(p, d, true)
        if (GetLocalPlayer() == p) then
            call VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, 1.)
            call StartSound(bj_victoryDialogSound)
        endif
    endif
    set t = null
    set d = null
endfunction

function defeat takes player p returns nothing
    local trigger t = CreateTrigger()
    local dialog  d = DialogCreate()
    call RemovePlayer(p, PLAYER_GAME_RESULT_DEFEAT)
    if (GetPlayerController(p) == MAP_CONTROL_USER) then
        if (Locale.evaluate() == "RU") then
            call DialogSetMessage(d, "Вы проиграли!")
        else
            call DialogSetMessage(d, "You was defeated!")
        endif
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
        call TriggerAddAction(t, function defeat_quit)
        if (GetLocalPlayer() == p) then
            call EnableUserControl(true)
            call EnableUserUI(false)
        endif
        call DialogDisplay(p, d, true)
        if (GetLocalPlayer() == p) then
            call VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, 1.)
            call StartSound(bj_defeatDialogSound)
        endif
    endif
    set t = null
    set d = null
endfunction
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:41       =
=============================================

Объявление глобальных переменных

*/

globals
    boolean IsDevInGame = false                                                                 // Условие: один из разработчиков в игре?
    Table table                                                                                 // Инициализация таблицы
    HashTable hash                                                                              // Инициализация хэш-таблицы
    constant string strVersion = "0.0.2"                                                        // Версия карты, семантическое версионирование: (Major, Minor, Patch)
    constant string Version = "Test"                                                            // Тип версии {Test, Release}
    constant string strEmail = (LB + "Nostaleal.ru|r" + GOLD + "@|r" + LB + "yandex.ru|r")      // E-Mail адрес
    constant string strDiscord = (LB + "! ! Nokladr|r" + GOLD + "#|r" + LB + "2205|r")          // Discord тэг
    constant string strBuild_Time = "13 December 2020"                                          // Время создания билда карты

    constant integer maxNumberOfPlayers = 8

    constant integer count_research_for_t1 = 12                                                 // Кол-во улучшений для доступа к т1
    constant integer count_research_for_t2 = 20                                                 // Кол-во улучшений для доступа к т2      

    player array ticket_list[max_ticket_list]

    // Равкоды инкам улучшений и связанных с ними способностей
    constant integer t1_research_rc = 'R018'                                                    // 12 исследований (т2 юниты Медива)
    constant integer t2_research_rc = 'R019'                                                    // 20 исследований (т3 юниты Медива)
    constant integer robbery_lvl3_rc = 'R023'                                                   // Грабёж(3 уровень)
    constant integer robbery_lvl5_rc = 'R024'                                                   // Грабёж(5 уровень)
    constant integer robbery_rc = 'R00J'                                                        // Грабёж
    constant integer evforev_rc = 'R00R'                                                        // Развитие ради развития
    constant integer aggrgame_rc = 'R02K'                                                       // Агрессивная игра
    constant integer aggrgame_aura_rc = 'S000'                                                  // Аура Агрессивной игры
    constant integer contr_to_pl_rc = 'R027'                                                    // Вклад в игрока
    constant integer goldmining_rc = 'R00F'                                                     // Золотодобыча
    constant integer ticket_rc = 'R00G'                                                         // Билет
    constant integer jewelry_rc = 'R00H'                                                        // Драгоценные камни
    constant integer deadmoney_rc = 'R00I'                                                      // Мёртвые деньги
    constant integer contr_rc = 'R00Q'                                                          // Вклад
    constant integer stab_rc = 'R00S'                                                           // Стабильность
    constant integer wait_five_minutes_rc = 'R028'                                              // Подождите 5 минут, дополнительное улучшение для Вклада в игрока
    constant integer leadership_rc = 'R029'                                                     // Лидерство
    constant integer cursed_mine_rc = 'R02I'                                                    // Проклятый рудник
    constant integer pointsForKillsRC = 'R02J'                                                  // Очки за убийства

    // Равкоды
    constant integer castle_rc = 'h01O'
    constant integer castleRC = 'h01O'
    constant integer most_point_kill_last_round = 'h023'
    constant integer or_leadership_arena_last_round = 'h024'
    constant integer big_mine_rc = 'n003'
    constant integer small_mine_rc = 'n004'
    constant integer flag_rc = 'n005'

    // Настройки улучшения Вклад в игрока
    constant integer contr_to_pl_gold = 300
    constant integer contr_to_pl_gold_mod = 100
    constant integer contr_to_pl_lumber = 10
    constant integer contr_to_pl_lumber_mod = 5
    constant real contr_to_pl_time = 300 // в секундах
    constant real contr_to_pl_multy = 2
    
    // Настройки улучшения Вклад
    constant integer contr_gold = 200
    constant integer contr_gold_mod = 100
    constant integer contr_lumber = 8
    constant integer contr_lumber_mod = 6
    constant integer contr_percent = 150 // процент

    // Настройки улучшения Лидерство
    constant real leadership_bonus = 0.2

    // Настройки улучшения Проклятый рудник
    constant integer cursed_mine_percent = 3
    constant real cursed_mine_range_damage = 700
    constant integer cursed_mine_count_wave = 8
    constant real cursed_mine_cast_range = 468
    constant real cursed_mine_damage_for_lvl = 100

    // Настройки улучшения Мёртвые деньги
    constant integer deadmoney_money_for_lvl = 8

    // Настройки улучшения Драгоценные камни
    constant integer jewelry_lumber_for_lvl = 1

    // Настройки улучшения Билет
    constant integer max_ticket_list = 5

    // Настройки улучшения Развитие ради развития
    constant real evforev_bonus_res = 0.01
    constant real evforev_bonus_res_mod = 0.01

    // Настройки улучшения Агрессивная игра
    // Аура - aggrgame_aura_rc, внутри неё менять скорость боя и перемещения
endglobals
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:28       =
=============================================

Главный и входной интерфейс карты.

*/

native GetUnitGoldCost takes integer unitid returns integer
native GetUnitWoodCost takes integer unitid returns integer

scope Main initializer Init

    private function PostInit takes nothing returns nothing

        // NokladrLib.j
        call C_SetComputers.execute()
        call StartInitTimer.execute()

        call building_selling.execute()
        
        // Disable Damage Detection System until Fast Arena begins
        call DisableTrigger(DDS)
        
        call Players_Init.execute()
        call MIXMultiboard_Init.execute()
        call faq_ini.execute() // Starts voting for faq guide

        debug call Log("Post initialization complete!")
        
    endfunction

    //-------------------------The very first function-------------------------
    // Starts map initialization
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        // Инициализируем хэш-таблицу
        set hash = HashTable.create()
        set table = Table.create()

        call TriggerRegisterTimerEventSingle(t, 0)
        call TriggerAddAction(t, function PostInit)

        set t = null
    endfunction

endscope
scope Settings initializer Init

    globals
        integer finalWave = 15
        integer numberOfMinigames = 8
        
        constant integer base_gold = 755  // Кол-во золота в начале игры
        constant integer base_gems = 22   // Кол-во гемов в начале игры

        real timeBeforeFirstWave = 60.00
        debug constant real debugTimeBeforeFirstWave = 10.00
    endglobals

    private function Init takes nothing returns nothing
        debug set timeBeforeFirstWave = debugTimeBeforeFirstWave
    endfunction

endscope
// function Trig_inc_rotate_Copy_Func012Func002Func002Func001Func013A takes nothing returns nothing
    //     call ShowUnitShow(GetEnumUnit())
// endfunction

scope IncomeObjects initializer Init

    globals
        constant integer bigMineRC = 'n003'
        constant integer smallMineRC = 'n004'
        constant integer flagRC = 'n005'
        private rect array rectList
        private integer rectListSize = 9
        private rect array filledRectList
        group IncomeObjects_group = CreateGroup()
        minimapicon array IncomeObjects_minimapicons
        integer IncomeObjects_StartAmount = 3
        integer IncomeObjects_EndAmount = 6
    endglobals

    public function Shuffle takes nothing returns nothing
        local integer i
        local integer j
        local real x
        local real y
        local integer numberOfObjects
        local integer random
        local rect curRect
        local unit u

        set numberOfObjects = GetRandomInt(IncomeObjects_StartAmount, IncomeObjects_EndAmount)
        // debug set numberOfObjects = IncomeObjects_EndAmount

        for i = 1 to numberOfObjects
            set random = GetRandomInt(1, rectListSize)

            set j = i - 1
            while j > 0
                if (filledRectList[j] == rectList[random]) then
                    set random = GetRandomInt(1, rectListSize)
                    set j = i - 1
                else
                    set j = j - 1
                endif
            endwhile

            set filledRectList[i] = rectList[random]
            set curRect = filledRectList[i]
            set x = GetRectCenterX(curRect)
            set y = GetRectCenterY(curRect)

            if curRect == rectList[1] then
                set u = CreateUnitEx(Player(27), bigMineRC, x, y, 270)
                set IncomeObjects_minimapicons[i] = CreateMinimapIcon(x, y, 0xff, 0xff, 0xff, "UI\\Minimap\\MiniMap-Goldmine.mdl", FOG_OF_WAR_VISIBLE)
                // call UnitSetUsesAltIcon(u, true)
            else
                if ModuloInteger(random, 2) == 1 then
                    set u = CreateUnitEx(Player(27), smallMineRC, x, y, 270)
                    set IncomeObjects_minimapicons[i] = CreateMinimapIcon(x, y, 0xcc, 0x00, 0xff, "UI\\Minimap\\MiniMap-Hero.mdl", FOG_OF_WAR_VISIBLE)
                else
                    set u = CreateUnitEx(Player(27), flagRC, x, y, 270)
                    set IncomeObjects_minimapicons[i] = CreateMinimapIcon(x, y, 0xff, 0x00, 0x00, "UI\\Minimap\\MiniMap-Goldmine.mdl", FOG_OF_WAR_VISIBLE)
                endif
            endif

            call GroupAddUnit(IncomeObjects_group, u)

        endfor

        // call ForGroupBJ(udg_light[( udg_cycle_i - 1 )],function Trig_inc_rotate_Copy_Func012Func002Func002Func001Func013A)

        set curRect = null
        set u = null
    endfunction

    private function Init takes nothing returns nothing
        set rectList[1] = gg_rct_centreCENTRE
        // Clockwise
        set rectList[2] = gg_rct_upmid
        set rectList[3] = gg_rct_upright
        set rectList[4] = gg_rct_rightmid
        set rectList[5] = gg_rct_downright
        set rectList[6] = gg_rct_downmid
        set rectList[7] = gg_rct_downleft
        set rectList[8] = gg_rct_leftmid
        set rectList[9] = gg_rct_upleft

        // call SetAltMinimapIcon("UI\\Minimap\\minimap-gold.blp")
    endfunction

endscope
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     13.12.2020 16:21       =
=============================================

inc_colour Trigger

Income Objective OnDestroy()

*/

scope IncomeObjectsColor initializer inc_colour

    function inc_colour_actions takes nothing returns nothing
        local unit IncomeObjectiveUnit = GetDyingUnit() // IncomeObject
        local player IncomeObjectReceiever = GetOwningPlayer(GetKillingUnit()) // Who gets IncomeObject
        local unit IncomeObjectiveNewUnit // Replace IncomeObject
        local player IncomeObjectOwner = GetOwningPlayer(IncomeObjectiveUnit) // Who loses IncomeObject
        local boolean IsBigGoldMine = (GetUnitTypeId(IncomeObjectiveUnit) == bigMineRC)
        local boolean IsSmallGoldMine = (GetUnitTypeId(IncomeObjectiveUnit) == smallMineRC)
        local boolean IsFlag = (GetUnitTypeId(IncomeObjectiveUnit) == flagRC)
        local boolean IsOwnerTheReceiver = (IncomeObjectOwner == IncomeObjectReceiever)
        local real IncomeObjectiveUnitX = GetUnitX(IncomeObjectiveUnit)
        local real IncomeObjectiveUnitY = GetUnitY(IncomeObjectiveUnit)
        local Color playerColor = Color.create(IncomeObjectReceiever) // Color Struct from NokladrLib.j

        if not (IsBigGoldMine or IsSmallGoldMine or IsFlag) then
            return // No actions
        endif

        call ShowUnit(IncomeObjectiveUnit, false)

        if IncomeObjectReceiever != IncomeObjectOwner then
            // set pdb[IncomeObjectReceiever] = pdb[IncomeObjectReceiever] +
            // set pdb[IncomeObjectOwner] = pdb[IncomeObjectOwner] -
        endif

        call GroupRemoveUnit(IncomeObjects_group, IncomeObjectiveUnit)
        set IncomeObjectiveNewUnit = CreateUnitEx(IncomeObjectReceiever, GetUnitTypeId(IncomeObjectiveUnit), IncomeObjectiveUnitX, IncomeObjectiveUnitY, bj_UNIT_FACING)
        call RemoveUnitEx(IncomeObjectiveUnit) // Remove old IncomeObject to replace it with a new one
        call GroupAddUnit(IncomeObjects_group, IncomeObjectiveNewUnit)
        call SetUnitVertexColor(IncomeObjectiveNewUnit, playerColor.red, playerColor.green, playerColor.blue, 255) // Adjusts color to match receiver's one

        set IncomeObjectiveUnit = null
        set IncomeObjectReceiever = null
        set IncomeObjectiveNewUnit = null
        set IncomeObjectOwner = null
        call playerColor.destroy()
    endfunction

    function inc_colour takes nothing returns nothing
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
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0C), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0D), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0E), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0F), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x10), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x11), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x12), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x13), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x14), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x15), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x16), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x17), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x18), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x19), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x1A), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x1B), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerAddAction(t, function inc_colour_actions)

        set t = null
    endfunction

endscope
scope Units initializer Init
    
    globals
        group waveUnits = CreateGroup()
    endglobals

    private function OnDie takes nothing returns nothing
        local unit dyingUnit = GetDyingUnit()
        local unit killerUnit = GetKillingUnit()
        local player ownerOfDyingUnit = GetOwningPlayer(dyingUnit)
        local player ownerOfKillerUnit = GetOwningPlayer(killerUnit)
        local integer dyingUnitTypeId = GetUnitTypeId(dyingUnit)

        static if not DEBUG_MODE then
            if ownerOfDyingUnit == ownerOfKillerUnit then
                set dyingUnit = null
                set killerUnit = null
                set ownerOfDyingUnit = null
                set ownerOfKillerUnit = null
                return
            endif
        endif

        if IsPlayerInForce(ownerOfDyingUnit, players) then
            if dyingUnitTypeId == castleRC then
                set pdb[ownerOfKillerUnit].castlesDestroyed = pdb[ownerOfKillerUnit].castlesDestroyed + 1
            else
                call GroupRemoveUnit(waveUnits, dyingUnit)
                set pdb[ownerOfKillerUnit].kills = pdb[ownerOfKillerUnit].kills + 1
            endif
        endif

        set dyingUnit = null
        set killerUnit = null
        set ownerOfDyingUnit = null
        set ownerOfKillerUnit = null
    endfunction
    
    private function Init takes nothing returns nothing
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
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0C), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0D), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0E), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x0F), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x10), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x11), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x12), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x13), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x14), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x15), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x16), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x17), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x18), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x19), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x1A), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x1B), EVENT_PLAYER_UNIT_DEATH, null)
        call TriggerAddAction(t, function OnDie)

        set t = null
    endfunction
    
endscope
/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:30       =
=============================================

Интерфейс внутриигровых сообщений

TODO: Multiboard

*/

scope Messages initializer Init

    private function ForUnits_OnLeave takes nothing returns nothing
        local unit u = GetEnumUnit()

        if (GetUnitTypeId(u) != 'hhdl' and GetUnitTypeId(u) != 'n001') then
            // Opt. begin
            if (IsUnitInGroup(u, waveUnits) == true) then
                call GroupRemoveUnit(waveUnits, u)
            endif
            if (IsUnitInGroup(u, buildings) == true) then
                call GroupRemoveUnit(buildings, u)
            endif
            // Opt. end
            call RemoveUnitEx(u)
        else
            call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
        endif

        set u = null
    endfunction

    private function OnLeave takes nothing returns nothing
        local player p = GetTriggerPlayer()

        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, (C_IntToColor(GetPlayerId(p)) + GetPlayerName(p) + "|r " + GOLD + "покидает игру!|r"))
        call SetPlayerTechResearchedSwap('R00J', 0, p)
        // Opt. begin
        call ForGroup(GetUnitsOfPlayerMatching(p, null), function ForUnits_OnLeave)
        call ForceRemovePlayer(players, p)
        if (p == udg_game_owner) then
            call gameset_owner.execute()
        endif
        // call MultiboardSetItemValueBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetTriggerPlayer()) ), ( "|cFF9B9B9B" + udg_players_name[GetConvertedPlayerId(GetTriggerPlayer())] ) )
        // call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetTriggerPlayer()) ), "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNReplay-Loop.blp" )
        // Opt. end
        call defeat.execute(p)

        set p = null
    endfunction

    private function OnInit takes nothing returns nothing
        local string strTestWarning_RU  // Предупреждение к тестовому типу карты
        local string strWarning_RU      // Предупреждение к тестовому типу карты
        local string strVar_RU          // Итоговое сообщение о типе карты
        local string Feedback_RU        // Сообщение об обратной связи с создателями карты

        // Аналогично, но только по-английски.
        local string strTestWarning_EN
        local string strWarning_EN
        local string strVar_EN
        local string Feedback_EN

        local integer i


        static if (not DEBUG_MODE) then
            // Отображает strVar_** в зависимости от типа карты
            set strTestWarning_RU = "В данной версии вы можете увидеть десинхронизацию, баги, неправильную работу способностей и ошиКБи в словах."
            set strWarning_RU = (RED + "Внимание:|r " + "вы играете в " + Version + " версию " + strVersion + ". ")
            set strTestWarning_EN = "In this version you can experience desyncs, bugs, and miTSakes in localization."
            set strWarning_EN = (RED + "Caution:|r " + "you are playing in " + Version + " version " + strVersion + ". ")
            if (Version == "Test") then
                set strVar_RU = strWarning_RU + strTestWarning_RU + "\n "
                set strVar_EN = strWarning_EN + strTestWarning_EN + "\n "
            elseif (Version == "Release") then
                set strVar_RU = "Вы играете в " + GREEN + "стабильную|r " + strVersion + " версию.\n "
                set strVar_EN = "You are playing in " + GREEN + "stable|r " + strVersion + " version.\n "
            endif
            if (Locale.evaluate() == "RU") then
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_RU)
            else
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_EN)
            endif

            // Сообщение об обратной связи
            set Feedback_RU = "Связь со мной: " + strEmail + " и Discord: " + strDiscord + "\n "
            set Feedback_EN = "My contacts: " + strEmail + " and Discord: " + strDiscord + "\n "
            if (Locale.evaluate() == "RU") then
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_RU)
            else
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_EN)
            endif

            // Условие: один из разработчиков в игре?
            for i = 0 to maxNumberOfPlayers - 1
                if (GetPlayerName(Player(i)) == "Nokladr" or GetPlayerName(Player(i)) == "Nokladr#2429") then
                    if (Locale.evaluate() == "RU") then
                        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("С вами играет создатель данной карты, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Критика приветствуется :)\n "))
                    else
                        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("You are playing with author, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Any feedback is welcome :)\n "))
                    endif
                    set IsDevInGame = true
                endif
            endfor
        endif

        set strTestWarning_RU = null
        set strWarning_RU = null
        set strVar_RU = null
        set Feedback_RU = null
        set strTestWarning_EN = null
        set strWarning_EN = null
        set strVar_EN = null
        set Feedback_EN = null
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerEvent(t, Player(0x00), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x01), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x02), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x03), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x04), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x05), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x06), EVENT_PLAYER_LEAVE)
        call TriggerRegisterPlayerEvent(t, Player(0x07), EVENT_PLAYER_LEAVE)
        call TriggerAddAction(t, function OnLeave)

        call OnInit.execute()

        set t = null
    endfunction

endscope
scope Casino initializer Init

    globals
        
    endglobals

    private function Init takes nothing returns nothing
        local integer i
        local integer j
        local unit lastCreatedUnit = null

        // Миниигра казино
        set udg_r = 0
        set i = 1
        loop
            exitwhen i > 3
            set j = 1
            loop
                exitwhen j > 5
                set udg_r = udg_r + 1
                // Opt. begin
                // 'n001' - Circle of Power
                set lastCreatedUnit = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'n001', PolarProjectionBJ(PolarProjectionBJ(GetRectCenter(gg_rct_circle), (-256.00 + (256.00 * I2R(i))), 270.00), (-256.00 + (256.00 * I2R(j))), 0), bj_UNIT_FACING)
                call SetUnitUserData(lastCreatedUnit, udg_r)
                if (ModuloInteger(udg_r, 2) == 1) then
                    // Z offset = 0
                    // Font size = 11
                    // Red =    100%
                    // Green =  10%
                    // Blue =   10%
                    // Transparency = 0%
                    call CreateTextTagUnitBJ(I2S(udg_r), lastCreatedUnit, 0, 11.00, 100, 10.00, 10.00, 0)
                    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), players)
                    call SetUnitColor(lastCreatedUnit, PLAYER_COLOR_RED)
                else
                    call CreateTextTagUnitBJ(I2S(udg_r), lastCreatedUnit, 0, 11.00, 10.00, 10.00, 10.00, 0)
                    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), players)
                    call SetUnitColor(lastCreatedUnit, PLAYER_COLOR_MAROON)
                endif
                // Opt. end
                set j = j + 1
            endloop
            set i = i + 1
        endloop

        set lastCreatedUnit = null
    endfunction

endscope
scope Minigames initializer Init

    globals
        
    endglobals

    private function Conditions takes nothing returns boolean
        local integer i = 0
        if (udg_random_log == true) then
            return false
        endif
        loop
            exitwhen i > 8
            if (udg_wave_mini[i] == (udg_r * 2)) then
                return false
            endif
            set i = i + 1
        endloop
        return true
    endfunction

    private function Init takes nothing returns nothing
        local integer i

        // Что-то связанное с минииграми
        set i = 0
        loop
            exitwhen i > udg_mini_game_max
            if (i != 1) then
                // Если не миниигра с боссом, то
                set udg_random_log = false
                loop // Заполняем wave_mini[] рандомными, неповторяющимися числами (2, 4, 6, ..., 18) - волны, когда будут миниигры. mode = 1 (стандартный режим)
                    exitwhen udg_random_log
                    set udg_r = GetRandomInt(1, (udg_mini_game_max + 1)) // От 1 до 9 (кол-во миниигр)
                    if (Conditions()) then
                        set udg_random_log = true
                        set udg_wave_mini[i] = udg_r * 2
                    endif
                endloop
            endif
            set i = i + 1
        endloop
    endfunction

endscope
scope MIXMultiboard

    globals
        Multiboard mbstruct
        MIXMB mb
        MIXMBRow playerMIXMBRow
        private integer curRow = 0
    endglobals

    struct MIXMB
        MIXMBRow array playerMIXMBRow[8]

        method operator [] takes player p returns MIXMBRow
            local integer playerId = GetPlayerId(p)
            return playerMIXMBRow[playerId]
        endmethod
    endstruct

    struct MIXMBRow
        integer row

        static method create takes integer playerRow returns MIXMBRow
            local MIXMBRow mmbrow = MIXMBRow.allocate()
            set mmbrow.row = playerRow
            return mmbrow
        endmethod

        method operator icon= takes string icon returns nothing
            set mbstruct[this.row][0].icon = icon
        endmethod

        method operator name= takes string name returns nothing
            set mbstruct[this.row][0].text = name
        endmethod

        method operator kills= takes integer kills returns nothing
            set mbstruct[this.row][1].text = I2S(kills)
        endmethod

        method operator upgrades= takes integer upgrades returns nothing
            set mbstruct[this.row][2].text = I2S(upgrades)
        endmethod
        
        method operator castlesDestroyed= takes integer castlesDestroyed returns nothing
            set mbstruct[this.row][3].text = I2S(castlesDestroyed)
        endmethod

        method operator points= takes string points returns nothing
            set mbstruct[this.row][4].text = points
        endmethod

        method operator result= takes real result returns nothing
            set mbstruct[this.row][5].text = I2S(R2I(result))
        endmethod

    endstruct

    private function CreateMIXMBRows takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer playerId = GetPlayerId(p)

        set curRow = curRow + 1
        set mb.playerMIXMBRow[playerId] = MIXMBRow.create(curRow)

        set p = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer playerId = GetPlayerId(p)

        set mb[p].name = C_IntToColor(playerId) + GetPlayerName(p) + "|r"

        set p = null
    endfunction

    private function Timer_ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        
        set mbstruct.title = "Волна #" + I2S(curWave)
        set mb[p].kills = pdb[p].kills
        set mb[p].upgrades = pdb[p].upgrades
        set mb[p].castlesDestroyed = pdb[p].castlesDestroyed
        if pdb[p].incomePoints > 0 then
            set mb[p].points = I2S(R2I(pdb[p].points)) + " (" + GREEN + I2S(R2I(pdb[p].incomePoints)) + ")|r"
        else
            set mb[p].points = I2S(R2I(pdb[p].points))
        endif
        set mb[p].result = pdb[p].result

        set p = null
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        call ForForce(players, function Timer_ForPlayer)
    endfunction

    public function Init takes nothing returns nothing
        local integer i
        local integer numberofPlayers = CountPlayersInForceBJ(players)

        set mbstruct = Multiboard.create(1 + numberofPlayers, 6)
        set mb = MIXMB.create()

        call mbstruct.setStyle(true, false)

        set mbstruct.title = "Волна #" + I2S(curWave)
        call mbstruct.row[0].setStyle(true, true)
        call mbstruct.column[0].setStyle(true, true)
        set mbstruct[0][0].text = "Имя игрока"
        call mbstruct[0][0].setStyle(true, false)
        set mbstruct.column[0].width = 0.12
        set mbstruct.column[1].width = 0.05
        set mbstruct.column[2].width = 0.05
        set mbstruct.column[3].width = 0.05
        set mbstruct.column[4].width = 0.05
        set mbstruct.column[5].width = 0.05
        set mbstruct.column[0].icon = "ReplaceableTextures\\CommandButtons\\BTNRallyPoint.blp"
        set mbstruct[0][1].icon = "ReplaceableTextures\\CommandButtons\\BTNAttack.blp"
        set mbstruct[0][2].icon = "ReplaceableTextures\\CommandButtons\\BTNSpy.blp"
        set mbstruct[0][3].icon = "ReplaceableTextures\\CommandButtons\\BTNCastle.blp"
        set mbstruct[0][4].icon = "ReplaceableTextures\\CommandButtons\\BTNOrcCaptureFlag.blp"
        set mbstruct[0][5].icon = "ReplaceableTextures\\CommandButtons\\BTNTransmute.blp"
        
        call ForForce(players, function CreateMIXMBRows)
        call ForForce(players, function ForPlayer)
        
        set mbstruct.display = true

        call TimerStart(CreateTimer(), 0.033, true, function Timer_OnTick)
    endfunction

endscope
library PlayerDBLib initializer Init requires NokladrLib  // Library by Nokladr special for MIX Community https://github.com/Igneaalis/MIX
    globals
        Playerdb pdb
        private DB array dbarr[8]
    endglobals

    struct DB
        private player p
        real leaderCoeff = 1.00
        integer leaderWins = 0
        integer arenaWins = 1
        integer changeSet = 3
        integer incomeGold = 240
        integer incomeGems = 8
        integer incomeBigMineGold = 3
        integer incomeBigMinePoints = 2
        integer incomeSmallMineGold = 1
        integer incomeSmallMinePoints = 1
        integer incomeFlagGold = 1
        integer incomeFlagPoints = 1
        real incomePoints = 0
        boolean info = true // показывать команды/полезную инфу
        integer kills = 0
        integer upgrades = 0
        integer castlesDestroyed = 0
        real points = 0

        static method create takes player p returns DB
            local DB db = DB.allocate()
                set db.p = p
            return db
        endmethod

        method operator result takes nothing returns real
            local real result = 0
            set result = result + GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) / 250
            set result = result + GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) / 5
            set result = result + kills / 5 * (10 + GetPlayerTechCount(p, pointsForKillsRC, true))
            set result = result + upgrades * 2
            set result = result + castlesDestroyed * 12.5
            set result = result + points * 0.07 * leaderCoeff
            return result
        endmethod
    endstruct

    struct Playerdb
        method operator [] takes player p returns DB
            return dbarr[GetPlayerId(p)]
        endmethod
    endstruct

    private function fill_dbarr takes nothing returns nothing
        set pdb = Playerdb.create()
        set dbarr[0] = DB.create(Player(0x00))
        set dbarr[1] = DB.create(Player(0x01))
        set dbarr[2] = DB.create(Player(0x02))
        set dbarr[3] = DB.create(Player(0x03))
        set dbarr[4] = DB.create(Player(0x04))
        set dbarr[5] = DB.create(Player(0x05))
        set dbarr[6] = DB.create(Player(0x06))
        set dbarr[7] = DB.create(Player(0x07))
    endfunction

    private function Init takes nothing returns nothing
        call fill_dbarr()
    endfunction
endlibrary
scope Players

    globals
        force players = CreateForce()
    endglobals
    
    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local real x = GetPlayerStartLocationX(p)
        local real y = GetPlayerStartLocationY(p)
        
        call CameraSetupApplyForPlayer(true, gg_cam_logic, p, 0)

        if (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER) then
            call SetPlayerState(p, PLAYER_STATE_GIVES_BOUNTY, 1)

            call ForceAddPlayer(players, p)

            call CreateUnitEx(p, 'ntav', x, y, bj_UNIT_FACING) // Таверна с расами на выбор
            call CreateUnitEx(p, 'h001', x, y, bj_UNIT_FACING) // Юнит "Выбор героя"
            call CreateUnitEx(p, 'h029', x, y, bj_UNIT_FACING) // Юнит "Не более 1 погодного эффекта в раунде"

            call AddGoldToPlayer(100, p) // Золото на выбор расы в таверне

            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_all, true, false)) // Поле битвы
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_minersregion, true, false)) // Миниигра "Минёры"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_fastarena, true, false)) // Миниарена
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_horseregion, true, false)) // Миниигра "Конные бега"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_roulette, true, false)) // Миниигра "Казино"
        endif

        set p = null
    endfunction

    public function Init takes nothing returns nothing
        call ForForce(bj_FORCE_ALL_PLAYERS, function ForPlayer)
    endfunction

endscope
scope CastleUpgradeBlank initializer Init
    
    globals
        private constant integer upgradeRC = '0000'
    endglobals

    private function Actions takes nothing returns nothing
        local integer researchRC = GetResearched()
        local player p = GetTriggerPlayer()
        local integer lvl = GetPlayerTechCount(p, researchRC, true)

        if researchRC != upgradeRC then
            set p = null
            return
        endif

        

        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        
        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerAddAction(t, function Actions)
        
        set t = null
    endfunction
    
endscope
// Улучшение: "Золотодобыча"

scope CastleUpgradeQ initializer Init
    
    globals
        private constant integer upgradeRC = 'R00F'
        private integer array s_incomeBigMineGold
        private integer array s_incomeSmallMineGold
        private integer array s_incomeFlagGold
        private integer array s_incomeGold
    endglobals

    private function Actions takes nothing returns nothing
        local integer researchRC = GetResearched()
        local player p = GetTriggerPlayer()
        local integer lvl = GetPlayerTechCount(p, researchRC, true)

        if researchRC != upgradeRC then
            set p = null
            return
        endif

        set pdb[p].incomeBigMineGold = pdb[p].incomeBigMineGold + s_incomeBigMineGold[lvl]
        set pdb[p].incomeSmallMineGold = pdb[p].incomeSmallMineGold + s_incomeSmallMineGold[lvl]
        set pdb[p].incomeFlagGold = pdb[p].incomeFlagGold + s_incomeFlagGold[lvl]
        set pdb[p].incomeGold = pdb[p].incomeGold + s_incomeGold[lvl]

        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        set s_incomeBigMineGold[1] = 1
        set s_incomeBigMineGold[2] = 1
        set s_incomeBigMineGold[3] = 1
        set s_incomeBigMineGold[4] = 1
        set s_incomeBigMineGold[5] = 1
        set s_incomeBigMineGold[6] = 1

        set s_incomeSmallMineGold[1] = 0
        set s_incomeSmallMineGold[2] = 0
        set s_incomeSmallMineGold[3] = 1
        set s_incomeSmallMineGold[4] = 0
        set s_incomeSmallMineGold[5] = 1
        set s_incomeSmallMineGold[6] = 1

        set s_incomeFlagGold[1] = 0
        set s_incomeFlagGold[2] = 0
        set s_incomeFlagGold[3] = 1
        set s_incomeFlagGold[4] = 0
        set s_incomeFlagGold[5] = 1
        set s_incomeFlagGold[6] = 1
        
        set s_incomeGold[1] = 10
        set s_incomeGold[2] = 10
        set s_incomeGold[3] = 10
        set s_incomeGold[4] = 10
        set s_incomeGold[5] = 10
        set s_incomeGold[6] = 10
        
        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerAddAction(t, function Actions)
        
        set t = null
    endfunction
    
endscope
scope Upgrades initializer Init
    
    globals
        
    endglobals

    private function OnResearchFinish takes nothing returns nothing
        local player p = GetTriggerPlayer()

        if (IncomeUpgrade_Conditions.evaluate()) then
            set pdb[p].upgrades = pdb[p].upgrades + 1
        endif

        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerAddAction(t, function OnResearchFinish)

        set t = null
    endfunction
    
endscope
scope Arena initializer Init

    globals
        private constant integer rectListSize = 8
        private constant integer unitTypeIdOffset = 49 * 256 * 256 // https://xgm.guru/p/wc3/rawcode-to-string
        private constant real debugTime = 30.00
        private rect array startRectForPlayer
        private rect array rectList

        real Arena_Time = 120.00
        timerdialog Arena_TimerDialog
    endglobals

    private function Conditions takes nothing returns boolean
        return IsUnitInGroup(GetFilterUnit(), buildings)
    endfunction

    private function ForPlayerUnits takes nothing returns nothing
        local player p = GetEnumPlayer()
        local unit u = GetEnumUnit()
        local real x = GetRectCenterX(startRectForPlayer[GetPlayerId(p)])
        local real y = GetRectCenterY(startRectForPlayer[GetPlayerId(p)])
        // debug call Log(I2S('h008') + " / " + I2S('ha08') + " / " + I2S('ha08' - 'h008') + " / " + I2S(offset))
        call GroupAddUnit(waveUnits, CreateUnitEx(p, (GetUnitTypeId(u) + unitTypeIdOffset), x, y, 270))
        // debug call Log("ForceArena_ForPlayerUnits: unit = " + GetUnitName(u))

        set p = null
        set u = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local group g
        local real x = GetRectCenterX(startRectForPlayer[GetPlayerId(p)])
        local real y = GetRectCenterY(startRectForPlayer[GetPlayerId(p)])

        // debug call Log("ForceArena_ForPlayer: player = " + GetPlayerName(p))

        call GroupAddUnit(udg_castle_unit, CreateUnitEx(p, castle_rc, x, y, 270))

        set g = GetUnitsOfPlayerMatching(p, Condition(function Conditions))
        call ForGroup(g, function ForPlayerUnits)

        call PanCameraToTimedForPlayer(p, x, y, 0)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUTIN, 2, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
        
        set p = null
        call DestroyGroup(g)
        set g = null
    endfunction

    private function Flush takes nothing returns nothing
        local integer i

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            set startRectForPlayer[i] = null
            set i = i + 1
        endloop
    endfunction

    private function Timer_OnExpire takes nothing returns nothing
        local timer t = GetExpiredTimer()
        
        call DestroyTimerDialog(Arena_TimerDialog)
        call PauseTimer(t)
        call DestroyTimer(t)
        call FastArena_Force.execute()

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local integer i
        local integer j
        local integer random
        local timer t = CreateTimer()

        call Flush.execute()
        call IncomeObjects_Shuffle.execute()

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers

            if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set random = GetRandomInt(0, rectListSize - 1)
                set startRectForPlayer[i] = rectList[random]

                set j = 0
                loop
                    exitwhen j >= i

                    if startRectForPlayer[j] == rectList[random] then
                        set random = GetRandomInt(0, rectListSize - 1)
                        set startRectForPlayer[i] = rectList[random]
                        set j = 0
                    else
                        set j = j + 1
                    endif
                endloop

                // debug call Log("ForceArena: Rect = " + I2S(random) + " of player = " + GetPlayerName(Player(i)))
            endif

            set i = i + 1
        endloop

        call ForForce(players, function ForPlayer)
        call TimerStart(t, Arena_Time, false, function Timer_OnExpire)
        set Arena_TimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(Arena_TimerDialog, "Арена") // Title of timer dialog
        call TimerDialogDisplay(Arena_TimerDialog, true) // Shows timer dialog

        set t = null
    endfunction

    private function Init takes nothing returns nothing
        debug set Arena_Time = debugTime
        set rectList[0] = gg_rct_start1
        set rectList[1] = gg_rct_start2
        set rectList[2] = gg_rct_start3
        set rectList[3] = gg_rct_start4
        set rectList[4] = gg_rct_start5
        set rectList[5] = gg_rct_start6
        set rectList[6] = gg_rct_start7
        set rectList[7] = gg_rct_start8
    endfunction

endscope
scope FastArena initializer Init

    globals
        private group array unitGroup
        private integer array unitsInGroup
        private integer winPlayerId
        private real array damageByPlayer
        private real timerTime
        private rect curRect
        private constant real firePitPercentDamage = 10.00
        
        real FA_Time = 60.00
        real FA_DebugTime = 10.00
        timerdialog FA_TimerDialog
    endglobals

    private function Conditions takes nothing returns boolean
        return (IsUnitAliveBJ(GetFilterUnit()) == true) and (IsUnitInGroup(GetFilterUnit(), waveUnits) == true)
    endfunction

    private function AddUnitInGroup takes nothing returns nothing
        call GroupAddUnit(unitGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))], GetEnumUnit())
        set unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] = unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] + 1
        // debug call Log(I2S(unitsInGroup[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]) + " " + GetPlayerName(GetOwningPlayer(GetEnumUnit())) + " " + GetUnitName(GetEnumUnit()))
    endfunction

    private function MoveUnitsToArena takes nothing returns nothing
        local real x = GetRectCenterX(curRect)
        local real y = GetRectCenterY(curRect)
        call SetUnitPosition(GetEnumUnit(), x, y)
        set x = GetRectCenterX(gg_rct_fastarena)
        set y = GetRectCenterY(gg_rct_fastarena)
        call IssuePointOrder(GetEnumUnit(), "attack", x, y)
    endfunction

    private function OnDamage takes nothing returns boolean
        local player sourcePlayer = GetOwningPlayer(GetEventDamageSource())
        local integer sourcePlayerId = GetPlayerId(sourcePlayer)
        local player targetPlayer = GetOwningPlayer(BlzGetEventDamageTarget())

        if (sourcePlayer != targetPlayer) then
            set damageByPlayer[sourcePlayerId] = damageByPlayer[sourcePlayerId] + GetEventDamage()
        else
            debug set damageByPlayer[sourcePlayerId] = damageByPlayer[sourcePlayerId] + GetEventDamage()
        endif

        set sourcePlayer = null
        set targetPlayer = null
        return false
    endfunction

    private function RemoveUnits takes nothing returns nothing
        call GroupRemoveUnit(waveUnits, GetEnumUnit())
        call C_RemoveEnumUnits()
    endfunction

    private function FirePitDoDamage takes nothing returns nothing
        if (GetUnitLifePercent(GetEnumUnit()) > firePitPercentDamage) then
            call SetUnitLifePercentBJ(GetEnumUnit(),(GetUnitLifePercent(GetEnumUnit()) - firePitPercentDamage))
        endif
    endfunction

    private function SetWinPlayer takes nothing returns nothing
        local integer i = 1
        local integer curPlayerId = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            if damageByPlayer[i] > damageByPlayer[curPlayerId] then
                set curPlayerId = i
            endif
            set i = i + 1
        endloop
        set winPlayerId = curPlayerId
    endfunction

    private function Flush takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            call GroupClear(unitGroup[i])
            set unitsInGroup[i] = 0
            set damageByPlayer[i] = 0
            set timerTime = FA_Time
            call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 0)
            set i = i + 1
        endloop
        set timerTime = FA_Time
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local group g_tmp

        set timerTime = timerTime - 1

        set g_tmp = GetUnitsInRectAll(gg_rct_fastarenaFIRE)
        call ForGroup(g_tmp, function FirePitDoDamage)
        call DestroyGroup(g_tmp)

        if (timerTime <= 5 and timerTime > 0) then
            call StartSound(gg_snd_BattleNetTick)
        endif

        if (timerTime <= 0) then
            call PauseTimer(t)
            call DestroyTimer(t)
            call FastArena_Finish.execute()
        endif

        set t = null
        set g_tmp = null
    endfunction

    private function Timer_OnExpire takes nothing returns nothing
        local timer t = GetExpiredTimer()

        call DestroyTimerDialog(FA_TimerDialog)
        call PauseTimer(t)
        call DestroyTimer(t)

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local integer i
        local integer j
        local integer curPlayerId
        local group g_tmp
        local timer t = CreateTimer()

        // IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true
        // IsUnitType(GetFilterUnit(), UNIT_TYPE_SAPPER) == true
        // call ForGroup(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_wave_end_timer_Func011Func001001002)), function C_RemoveEnumUnits)
        // call DisableTrigger(gg_trg_wave_castle_destr)
        // call DisableTrigger(gg_trg_inc_per_second)
        
        call Flush.execute()
        call PanCameraToTimed(GetRectCenterX(gg_rct_fastarena), GetRectCenterY(gg_rct_fastarena), 0)

        set i = 1
        loop
            exitwhen i > 4
            if (i == 1) then
                set curRect = gg_rct_fastarenaSPAWN1
            elseif (i == 2) then
                set curRect = gg_rct_fastarenaSPAWN2
            elseif (i == 3) then
                set curRect = gg_rct_fastarenaSPAWN3
            elseif (i == 4) then
                set curRect = gg_rct_fastarenaSPAWN4
            endif

            set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions))
            call ForGroup(g_tmp, function AddUnitInGroup)
            call DestroyGroup(g_tmp)

            set j = 1
            set curPlayerId = 0
            loop
                exitwhen j >= maxNumberOfPlayers
                if unitsInGroup[j] > unitsInGroup[curPlayerId] then
                    set curPlayerId = j
                endif
                set j = j + 1
            endloop
            call ForGroup(unitGroup[curPlayerId], function MoveUnitsToArena)
            call PanCameraToTimedForPlayer(Player(curPlayerId), GetRectCenterX(curRect), GetRectCenterY(curRect), 0)
            set unitsInGroup[curPlayerId] = -1
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > 8
            if (udg_info[i+1] == true) then
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "У вас есть " + GOLD + I2S(R2I(FA_Time)) + "|r сек.")
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "Были отобраны первые четверо игроков с наибольшим количеством живых юнитов.")
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 15, "По истечении времени игрок, нанёсший наибольшее количество урона, получит бонусные очки арены.")
            endif
            set i = i + 1
        endloop
        
        set g_tmp = GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions))
        call ForGroup(GetUnitsInRectMatching(gg_rct_all, Condition(function Conditions)),function RemoveUnits)
        call DestroyGroup(g_tmp)
        
        call TimerStart(t, FA_Time, false, function Timer_OnExpire)
        set FA_TimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(FA_TimerDialog, "Быстрая битва") // Title of timer dialog
        call TimerDialogDisplay(FA_TimerDialog, true) // Shows timer dialog
        
        call TimerStart(CreateTimer(), 1, true, function Timer_OnTick)
        
        call EnableTrigger(DDS)

        set g_tmp = null
        set t = null
    endfunction

    public function Finish takes nothing returns nothing
        local integer i

        call DisableTrigger(DDS)
        call SetWinPlayer.execute()

        set i = 0
        loop
            exitwhen i > 8
            if (udg_info[i+1] == true) then
                call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, ("Нанеся " + GOLD + I2S(R2I(damageByPlayer[winPlayerId])) + "|r ед. урона на арене, победил игрок " + C_IntToColor(winPlayerId) + GetPlayerName(Player(winPlayerId)) + "|r"))
            endif
            set i = i + 1
        endloop
        
        // set udg_scoreboard_win[winPlayerId] = (udg_scoreboard_win[winPlayerId] + 50) // Test
        // call MultiboardSetItemValueBJ(udg_scoreboard, 7, winPlayerId, I2S(udg_scoreboard_win[winPlayerId])) // Test
        
        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            call SetPlayerState(Player(i), PLAYER_STATE_GIVES_BOUNTY, 1)
            set i = i + 1
        endloop

        call NextWave_Force.execute()
    endfunction

    private function Init takes nothing returns nothing
        local integer i

        debug set FA_Time = FA_DebugTime

        set i = 0
        loop
            exitwhen i >= maxNumberOfPlayers
            set unitGroup[i] = CreateGroup()
            set i = i + 1
        endloop
        call AddDamageCondition(Condition(function OnDamage))
    endfunction

endscope
scope NextWave

    globals
        constant real relaxWaveTime = 5.00
        timerdialog relaxWaveTimerDialog
    endglobals

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CameraSetupApplyForPlayer(true, gg_cam_Camera_003, p, 0)
        call PanCameraToTimedLocForPlayer(p, GetPlayerStartLocationLoc(p), 0) // Focuses camera at castle you own

        call AddGoldToPlayer(pdb[p].incomeGold, p)
        call AddLumberToPlayer(pdb[p].incomeGems, p)

        call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль золота: " + GOLD + I2S(pdb[p].incomeGold) + "|r")
        call DisplayTimedTextToPlayer(p, 0, 0, 10, "Прибыль самоцветов: " + VIOLET + I2S(pdb[p].incomeGems) + "|r")

        set p = null
    endfunction

    private function Timer_OnExprie takes nothing returns nothing
        local timer t = GetExpiredTimer()

        call DestroyTimerDialog(relaxWaveTimerDialog)
        call PauseTimer(t)
        call DestroyTimer(t)
        call Arena_Force.execute()

        set t = null
    endfunction

    public function Force takes nothing returns nothing
        local timer t = CreateTimer()
        local integer i

        set curWave = curWave + 1

        call ForGroup(waveUnits, function C_RemoveEnumUnits)
        call GroupClear(waveUnits)
        call ForGroup(udg_castle_unit, function C_RemoveEnumUnits)
        call GroupClear(udg_castle_unit)
        call ForGroup(IncomeObjects_group, function C_RemoveEnumUnits)
        call GroupClear(IncomeObjects_group)

        for i = 1 to IncomeObjects_EndAmount
            if IncomeObjects_minimapicons[i] != null then
                call DestroyMinimapIcon(IncomeObjects_minimapicons[i])
                set IncomeObjects_minimapicons[i] = null
            endif
        endfor

        call ForForce(players, function ForPlayer)

        call TimerStart(t, relaxWaveTime, false, function Timer_OnExprie)
        set relaxWaveTimerDialog = CreateTimerDialog(t) // Timer dialog in upper-left corner
        call TimerDialogSetTitle(relaxWaveTimerDialog, "Следующая волна") // Title of timer dialog
        call TimerDialogDisplay(relaxWaveTimerDialog, true) // Shows timer dialog
        
        set t = null
    endfunction

endscope
scope Waves initializer Init
    
    globals
        integer curWave = 0
    endglobals
    
    private function Init takes nothing returns nothing
        
    endfunction
    
endscope
//===========================================================================
// 
// MIX |cffffffff0.0.2|r
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Map Author: MIX community
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************

globals
    // User-defined
    real array              udg_dmg_player_inflicted
    real array              udg_dmg_player_taken
    string array            udg_players_colour
    real                    udg_dmg                    = 0
    force                   udg_players_group          = null
    string array            udg_players_name
    integer                 udg_i                      = 0
    integer array           udg_time
    group array             udg_light
    group                   udg_footrmans              = null
    unit array              udg_footman_participant
    group                   udg_buildings              = null
    integer                 udg_id                     = 0
    string                  udg_id_save
    timer                   udg_wave_timer             = null
    boolean array           udg_region_status
    integer                 udg_random                 = 0
    boolean array           udg_region_player_status
    integer                 udg_j                      = 0
    rect array              udg_region_spawn
    integer                 udg_k                      = 0
    integer                 udg_goldmine_colour        = 0
    player                  udg_game_owner             = null
    integer                 udg_gameset_time           = 0
    timer                   udg_gameset_timer          = null
    timer                   udg_wave_end_timer         = null
    integer                 udg_wave_time              = 0
    group                   udg_wave_units             = null
    integer                 udg_wave                   = 0
    boolean                 udg_wave_status            = false
    integer array           udg_income_gold
    integer array           udg_income_wood
    integer                 udg_r                      = 0
    integer                 udg_g                      = 0
    integer                 udg_sold_gold              = 0
    integer                 udg_sold_wood              = 0
    boolean                 udg_boss_wave              = false
    real                    udg_boss_time              = 0
    timer                   udg_boss_end_timer         = null
    unit                    udg_boss                   = null
    group                   udg_id_group               = null
    real                    udg_boss_hp                = 0
    integer                 udg_boss_spell_integer     = 0
    boolean array           udg_boss_phase
    boolean                 udg_building_status        = false
    integer array           udg_wave_mini
    boolean                 udg_random_log             = false
    player array            udg_horse_winners
    boolean                 udg_miners_log             = false
    multiboard              udg_scoreboard             = null
    integer array           udg_income_goldmine_c
    integer array           udg_income_goldmine_l
    player array            udg_ticket_players
    integer                 udg_ticket_resources       = 0
    real                    udg_ticket_gold            = 0
    real                    udg_ticket_lumber          = 0
    integer                 udg_pillage_resources      = 0
    player                  udg_pillage_player         = null
    real                    udg_pillage_lumber         = 0
    real                    udg_pillage_gold           = 0
    integer                 udg_scoreboard_limit       = 0
    integer                 udg_scoreboard_coloumns    = 0
    integer array           udg_scoreboard_win
    integer array           udg_scoreboard_mini
    integer array           udg_scoreboard_upg
    integer array           udg_scoreboard_kills
    real array              udg_scoreboard_result
    boolean                 udg_wave_winner            = false
    boolean                 udg_ticket                 = false
    integer                 udg_p                      = 0
    integer array           udg_hide
    player                  udg_hide_hunter            = null
    integer array           udg_roulette_gold
    integer array           udg_roulette_gems
    force                   udg_roulette_winners       = null
    integer                 udg_mini_game_max          = 0
    real array              udg_end_result
    group array             udg_fastarena_group
    integer array           udg_fastarena_value
    integer array           udg_fastarena_player
    integer                 udg_fastarena_time         = 0
    rect                    udg_FFF                    = null
    integer                 udg_cycle_i                = 0
    integer                 udg_rot_P                  = 0
    integer                 udg_cycle_j                = 0
    integer                 udg_rotation_value         = 0
    integer array           udg_income_limit
    force                   udg_income_group           = null
    integer                 udg_income_max             = 0
    group                   udg_castle_unit            = null
    real                    udg_point                  = 0
    real array              udg_fastarena_hp
    real array              udg_fastarena_hp_start
    force                   udg_fastarena_players      = null
    player                  udg_vkad                   = null
    integer array           udg_vklad_timer
    integer array           udg_inc_max
    integer array           udg_inc_all
    boolean                 udg_inc_status             = false
    integer                 udg_mode                   = 0
    integer array           udg_const_point
    integer array           udg_inc_ps
    integer array           udg_inc_pp
    integer                 udg_gg                     = 0
    real array              udg_leader_kf
    integer array           udg_leader_point
    integer array           udg_leader_kills
    player array            udg_leader_player
    boolean                 udg_leader_bool            = false
    integer                 udg_leader_num             = 0
    integer array           udg_leader_wins
    integer array           udg_leader_owner
    real                    udg_gameset_time_first     = 0
    unit array              udg_faq_unit
    boolean array           udg_info
    real                    udg_incometemp             = 0
    integer array           udg_weather
    effect                  udg_stormeff_eff           = null
    integer                 udg_parody_spell           = 0
    unit                    udg_parody_main            = null
    real                    udg_parody_time            = 0
    boolean array           udg_is_casted
    boolean                 udg_parody_game            = false
    player                  udg_mediv                  = null
    integer array           udg_changeSet

    // Generated
    rect                    gg_rct_centreUP            = null
    rect                    gg_rct_centreDOWN          = null
    rect                    gg_rct_centreRIGHT         = null
    rect                    gg_rct_centreLEFT          = null
    rect                    gg_rct_centreCENTRE        = null
    rect                    gg_rct_player1             = null
    rect                    gg_rct_player2             = null
    rect                    gg_rct_player3             = null
    rect                    gg_rct_player4             = null
    rect                    gg_rct_player5             = null
    rect                    gg_rct_player6             = null
    rect                    gg_rct_player7             = null
    rect                    gg_rct_player8             = null
    rect                    gg_rct_start1              = null
    rect                    gg_rct_start2              = null
    rect                    gg_rct_start3              = null
    rect                    gg_rct_start4              = null
    rect                    gg_rct_start5              = null
    rect                    gg_rct_start6              = null
    rect                    gg_rct_start7              = null
    rect                    gg_rct_start8              = null
    rect                    gg_rct_upright             = null
    rect                    gg_rct_downright           = null
    rect                    gg_rct_downleft            = null
    rect                    gg_rct_upleft              = null
    rect                    gg_rct_waveunitsCENTRE     = null
    rect                    gg_rct_waveunitsRIGHT      = null
    rect                    gg_rct_waveunitsLEFT       = null
    rect                    gg_rct_waveunitsDOWN       = null
    rect                    gg_rct_waveunitsUP         = null
    rect                    gg_rct_teleport1           = null
    rect                    gg_rct_teleport2           = null
    rect                    gg_rct_finish              = null
    rect                    gg_rct_horse1              = null
    rect                    gg_rct_miner1              = null
    rect                    gg_rct_miner2              = null
    rect                    gg_rct_miner3              = null
    rect                    gg_rct_miner4              = null
    rect                    gg_rct_miner5              = null
    rect                    gg_rct_miner6              = null
    rect                    gg_rct_miner7              = null
    rect                    gg_rct_miner8              = null
    rect                    gg_rct_minersregion        = null
    rect                    gg_rct_horseregion         = null
    rect                    gg_rct_horse2              = null
    rect                    gg_rct_horse3              = null
    rect                    gg_rct_horse4              = null
    rect                    gg_rct_horse5              = null
    rect                    gg_rct_horse6              = null
    rect                    gg_rct_horse7              = null
    rect                    gg_rct_horse8              = null
    rect                    gg_rct_hideandseek         = null
    rect                    gg_rct_hideandseekcam      = null
    rect                    gg_rct_roulettespawn       = null
    rect                    gg_rct_roulette            = null
    rect                    gg_rct_circle              = null
    rect                    gg_rct_roulettegame        = null
    rect                    gg_rct_fastarena           = null
    rect                    gg_rct_fastarenaSPAWN1     = null
    rect                    gg_rct_fastarenaSPAWN2     = null
    rect                    gg_rct_fastarenaSPAWN3     = null
    rect                    gg_rct_fastarenaSPAWN4     = null
    rect                    gg_rct_fastarenaFIRE       = null
    rect                    gg_rct_guideyes            = null
    rect                    gg_rct_banshispawn         = null
    rect                    gg_rct_all                 = null
    rect                    gg_rct_downmid             = null
    rect                    gg_rct_upmid               = null
    rect                    gg_rct_rightmid            = null
    rect                    gg_rct_leftmid             = null
    rect                    gg_rct_guideno             = null
    rect                    gg_rct_guideyesvote        = null
    rect                    gg_rct_guidenovote         = null
    rect                    gg_rct________________075  = null
    rect                    gg_rct________________075_____________________u = null
    rect                    gg_rct________________075______________________2 = null
    rect                    gg_rct________________075______________________3 = null
    rect                    gg_rct________________075______________________4 = null
    rect                    gg_rct_stormeff            = null
    rect                    gg_rct________________081  = null
    rect                    gg_rct________________082  = null
    rect                    gg_rct_hideandseekall      = null
    rect                    gg_rct_inc                 = null
    camerasetup             gg_cam_hide_and_seek       = null
    camerasetup             gg_cam_logic               = null
    camerasetup             gg_cam_Camera_003          = null
    sound                   gg_snd_BattleNetTick       = null
    sound                   gg_snd_Warning             = null
    sound                   gg_snd_QuestNew            = null
    sound                   gg_snd_QuestCompleted      = null
    sound                   gg_snd_BloodElfMageYesAttack1 = null
    sound                   gg_snd_BloodElfMageYesAttack3 = null
    sound                   gg_snd_BloodElfMageWarcry1 = null
    sound                   gg_snd_BloodElfMageReady1  = null
    sound                   gg_snd_BloodElfMagePissed1 = null
    sound                   gg_snd_BattleNetTick01     = null
    sound                   gg_snd_ClanInvitation      = null
    trigger                 gg_trg_initialization      = null
    trigger                 gg_trg_ini_id              = null
    trigger                 gg_trg_game_end            = null
    trigger                 gg_trg_cmd_clear           = null
    trigger                 gg_trg_cmd_build           = null
    trigger                 gg_trg_cmd_time            = null
    trigger                 gg_trg_cmd_arena           = null
    trigger                 gg_trg_cmd_mode            = null
    trigger                 gg_trg_cmd_point           = null
    trigger                 gg_trg_cmd_gg              = null
    trigger                 gg_trg_cmd_info            = null
    trigger                 gg_trg_cmd_zoom            = null
    trigger                 gg_trg_damage_system_initialization = null
    trigger                 gg_trg_damage_system       = null
    trigger                 gg_trg_scoreboard_ini      = null
    trigger                 gg_trg_scoreboard_update   = null
    trigger                 gg_trg_unit_resources      = null
    trigger                 gg_trg_upgrade_def_and_dmg = null
    trigger                 gg_trg_set_wave_start_main = null
    trigger                 gg_trg_set_wave_timer      = null
    trigger                 gg_trg_wave_notification   = null
    trigger                 gg_trg_wave_end_timer      = null
    trigger                 gg_trg_wave_end            = null
    trigger                 gg_trg_wave_result_rotation = null
    trigger                 gg_trg_wave_castle_destr   = null
    trigger                 gg_trg_inc_ini             = null
    trigger                 gg_trg_inc_per_second      = null
    trigger                 gg_trg_inc_upg             = null
    trigger                 gg_trg_income_upg          = null
    trigger                 gg_trg_income_upgQ         = null
    trigger                 gg_trg_income_upgW         = null
    trigger                 gg_trg_income_upgE         = null
    trigger                 gg_trg_income_upgR         = null
    trigger                 gg_trg_income_upgA         = null
    trigger                 gg_trg_income_upgS         = null
    trigger                 gg_trg_income_upgFa        = null
    trigger                 gg_trg_income_upgFb        = null
    trigger                 gg_trg_income_upgFc        = null
    trigger                 gg_trg_income_upgFd        = null
    trigger                 gg_trg_income_upgFe        = null
    trigger                 gg_trg_income_upgFf        = null
    trigger                 gg_trg_income_upgZ         = null
    trigger                 gg_trg_income_upgX         = null
    trigger                 gg_trg_Income_T_upgQ       = null
    trigger                 gg_trg_income_effects      = null
    trigger                 gg_trg_Weather             = null
    trigger                 gg_trg_Blizzard            = null
    trigger                 gg_trg_Storm               = null
    trigger                 gg_trg_Storm_effect        = null
    trigger                 gg_trg_Armageddon          = null
    trigger                 gg_trg_Armageddon_effect   = null
    trigger                 gg_trg_Armageddon_effect_2 = null
    trigger                 gg_trg_faq                 = null
    trigger                 gg_trg_faq_death           = null
    trigger                 gg_trg_building_inf        = null
    trigger                 gg_trg_builder_left        = null
    trigger                 gg_trg_mediv_select        = null
    trigger                 gg_trg_change_set          = null
    trigger                 gg_trg_footman_activate    = null
    trigger                 gg_trg_foorman_delete      = null
    trigger                 gg_trg_footman_effect      = null
    trigger                 gg_trg_assassin            = null
    trigger                 gg_trg_banshi              = null
    trigger                 gg_trg_ghost               = null
    trigger                 gg_trg_ghost_active        = null
    trigger                 gg_trg_ghost_del_1         = null
    trigger                 gg_trg_rejuvenation        = null
    trigger                 gg_trg_tip                 = null
    trigger                 gg_trg_gold_for_gems       = null
    trigger                 gg_trg_gems_for_gold       = null
    trigger                 gg_trg_sea_dragon          = null
    trigger                 gg_trg_boss_ini_start      = null
    trigger                 gg_trg_boss_ini_finish     = null
    trigger                 gg_trg_boss_end_timer      = null
    trigger                 gg_trg_boss_end            = null
    trigger                 gg_trg_spells_check        = null
    trigger                 gg_trg_spell_1             = null
    trigger                 gg_trg_spell_2             = null
    trigger                 gg_trg_spell_3             = null
    trigger                 gg_trg_spell_4             = null
    trigger                 gg_trg_hunter_death        = null
    trigger                 gg_trg_hunter_time         = null
    trigger                 gg_trg_hunter_end          = null
    trigger                 gg_trg_zombie_ini_start    = null
    trigger                 gg_trg_zombie_ini_finish   = null
    trigger                 gg_trg_zombie_death        = null
    trigger                 gg_trg_zombie_spawn        = null
    trigger                 gg_trg_gold_ini_start      = null
    trigger                 gg_trg_gold_bet            = null
    trigger                 gg_trg_gold_result         = null
    trigger                 gg_trg_horse_ini_start     = null
    trigger                 gg_trg_horse_speed         = null
    trigger                 gg_trg_horse_finish        = null
    trigger                 gg_trg_miners_ini_start    = null
    trigger                 gg_trg_miners_death        = null
    trigger                 gg_trg_miners_explosion    = null
    trigger                 gg_trg_miners_set          = null
    trigger                 gg_trg_miners_reward       = null
    trigger                 gg_trg_hide_ini            = null
    trigger                 gg_trg_hide_stop           = null
    trigger                 gg_trg_hide_kill           = null
    trigger                 gg_trg_banshi_ini          = null
    trigger                 gg_trg_banshi_cast         = null
    trigger                 gg_trg_banshi_end          = null
    trigger                 gg_trg_banshi_spawn        = null
    trigger                 gg_trg_banshi_attack       = null
    trigger                 gg_trg_parody_ini_start    = null
    trigger                 gg_trg_parodys_set_cast    = null
    trigger                 gg_trg_parodys_cast        = null
    trigger                 gg_trg_parody_dies         = null
endglobals

function InitGlobals takes nothing returns nothing
    local integer i = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_dmg_player_inflicted[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_dmg_player_taken[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_players_colour[i] = ""
        set i = i + 1
    endloop

    set udg_dmg = 0
    set udg_players_group = CreateForce()
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_players_name[i] = ""
        set i = i + 1
    endloop

    set udg_i = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_time[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 8)
        set udg_light[i] = CreateGroup()
        set i = i + 1
    endloop

    set udg_footrmans = CreateGroup()
    set udg_buildings = CreateGroup()
    set udg_id = 0
    set udg_id_save = ""
    set udg_wave_timer = CreateTimer()
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_region_status[i] = false
        set i = i + 1
    endloop

    set udg_random = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_region_player_status[i] = false
        set i = i + 1
    endloop

    set udg_j = 0
    set udg_k = 0
    set udg_goldmine_colour = 0
    set udg_gameset_time = 0
    set udg_gameset_timer = CreateTimer()
    set udg_wave_end_timer = CreateTimer()
    set udg_wave_time = 0
    set udg_wave_units = CreateGroup()
    set udg_wave = 0
    set udg_wave_status = false
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_income_gold[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_income_wood[i] = 0
        set i = i + 1
    endloop

    set udg_r = 0
    set udg_g = 0
    set udg_sold_gold = 0
    set udg_sold_wood = 0
    set udg_boss_wave = false
    set udg_boss_time = 0
    set udg_boss_end_timer = CreateTimer()
    set udg_id_group = CreateGroup()
    set udg_boss_hp = 0
    set udg_boss_spell_integer = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_boss_phase[i] = false
        set i = i + 1
    endloop

    set udg_building_status = false
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_wave_mini[i] = 0
        set i = i + 1
    endloop

    set udg_random_log = false
    set udg_miners_log = false
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_income_goldmine_c[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_income_goldmine_l[i] = 0
        set i = i + 1
    endloop

    set udg_ticket_resources = 0
    set udg_ticket_gold = 0
    set udg_ticket_lumber = 0
    set udg_pillage_resources = 0
    set udg_pillage_lumber = 0
    set udg_pillage_gold = 0
    set udg_scoreboard_limit = 0
    set udg_scoreboard_coloumns = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_scoreboard_win[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_scoreboard_mini[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_scoreboard_upg[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_scoreboard_kills[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_scoreboard_result[i] = 0
        set i = i + 1
    endloop

    set udg_wave_winner = false
    set udg_ticket = false
    set udg_p = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_hide[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_roulette_gold[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_roulette_gems[i] = 0
        set i = i + 1
    endloop

    set udg_roulette_winners = CreateForce()
    set udg_mini_game_max = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_end_result[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 8)
        set udg_fastarena_group[i] = CreateGroup()
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_fastarena_value[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_fastarena_player[i] = 0
        set i = i + 1
    endloop

    set udg_fastarena_time = 0
    set udg_cycle_i = 0
    set udg_rot_P = 0
    set udg_cycle_j = 0
    set udg_rotation_value = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_income_limit[i] = 0
        set i = i + 1
    endloop

    set udg_income_group = CreateForce()
    set udg_income_max = 0
    set udg_castle_unit = CreateGroup()
    set udg_point = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_fastarena_hp[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_fastarena_hp_start[i] = 0
        set i = i + 1
    endloop

    set udg_fastarena_players = CreateForce()
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_vklad_timer[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_inc_max[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_inc_all[i] = 0
        set i = i + 1
    endloop

    set udg_inc_status = false
    set udg_mode = 1
    set i = 0
    loop
        exitwhen (i > 2)
        set udg_const_point[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 9)
        set udg_inc_ps[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 1)
        set udg_inc_pp[i] = 0
        set i = i + 1
    endloop

    set udg_gg = 0
    set i = 0
    loop
        exitwhen (i > 8)
        set udg_leader_kf[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 8)
        set udg_leader_point[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 8)
        set udg_leader_kills[i] = 0
        set i = i + 1
    endloop

    set udg_leader_bool = false
    set udg_leader_num = 0
    set i = 0
    loop
        exitwhen (i > 8)
        set udg_leader_wins[i] = 0
        set i = i + 1
    endloop

    set i = 0
    loop
        exitwhen (i > 8)
        set udg_leader_owner[i] = 0
        set i = i + 1
    endloop

    set udg_gameset_time_first = 0
    set i = 0
    loop
        exitwhen (i > 8)
        set udg_info[i] = false
        set i = i + 1
    endloop

    set udg_incometemp = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_weather[i] = 0
        set i = i + 1
    endloop

    set udg_parody_time = 0
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_is_casted[i] = false
        set i = i + 1
    endloop

    set udg_parody_game = false
    set i = 0
    loop
        exitwhen (i > 1)
        set udg_changeSet[i] = 0
        set i = i + 1
    endloop

endfunction

//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************

//***************************************************************************
//*
//*  Sound Assets
//*
//***************************************************************************

function InitSounds takes nothing returns nothing
    set gg_snd_BattleNetTick = CreateSound( "Sound\\Interface\\BattleNetTick.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundDuration( gg_snd_BattleNetTick, 476 )
    call SetSoundChannel( gg_snd_BattleNetTick, 0 )
    call SetSoundVolume( gg_snd_BattleNetTick, -1 )
    call SetSoundPitch( gg_snd_BattleNetTick, 1.0 )
    set gg_snd_Warning = CreateSound( "Sound\\Interface\\Warning.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundDuration( gg_snd_Warning, 1903 )
    call SetSoundChannel( gg_snd_Warning, 0 )
    call SetSoundVolume( gg_snd_Warning, -1 )
    call SetSoundPitch( gg_snd_Warning, 1.0 )
    set gg_snd_QuestNew = CreateSound( "Sound\\Interface\\QuestNew.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundDuration( gg_snd_QuestNew, 3750 )
    call SetSoundChannel( gg_snd_QuestNew, 0 )
    call SetSoundVolume( gg_snd_QuestNew, -1 )
    call SetSoundPitch( gg_snd_QuestNew, 1.0 )
    set gg_snd_QuestCompleted = CreateSound( "Sound\\Interface\\QuestCompleted.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundDuration( gg_snd_QuestCompleted, 5154 )
    call SetSoundChannel( gg_snd_QuestCompleted, 0 )
    call SetSoundVolume( gg_snd_QuestCompleted, -1 )
    call SetSoundPitch( gg_snd_QuestCompleted, 1.0 )
    set gg_snd_BloodElfMageYesAttack1 = CreateSound( "Units\\Human\\HeroBloodElf\\BloodElfMageYesAttack1.wav", false, false, true, 10, 10, "HeroAcksEAX" )
    call SetSoundDuration( gg_snd_BloodElfMageYesAttack1, 1718 )
    call SetSoundChannel( gg_snd_BloodElfMageYesAttack1, 0 )
    call SetSoundVolume( gg_snd_BloodElfMageYesAttack1, -1 )
    call SetSoundPitch( gg_snd_BloodElfMageYesAttack1, 1.0 )
    set gg_snd_BloodElfMageYesAttack3 = CreateSound( "Units\\Human\\HeroBloodElf\\BloodElfMageYesAttack3.wav", false, false, true, 10, 10, "HeroAcksEAX" )
    call SetSoundDuration( gg_snd_BloodElfMageYesAttack3, 1938 )
    call SetSoundChannel( gg_snd_BloodElfMageYesAttack3, 0 )
    call SetSoundVolume( gg_snd_BloodElfMageYesAttack3, -1 )
    call SetSoundPitch( gg_snd_BloodElfMageYesAttack3, 1.0 )
    set gg_snd_BloodElfMageWarcry1 = CreateSound( "Units\\Human\\HeroBloodElf\\BloodElfMageWarcry1.wav", false, false, true, 10, 10, "HeroAcksEAX" )
    call SetSoundDuration( gg_snd_BloodElfMageWarcry1, 2002 )
    call SetSoundChannel( gg_snd_BloodElfMageWarcry1, 0 )
    call SetSoundVolume( gg_snd_BloodElfMageWarcry1, -1 )
    call SetSoundPitch( gg_snd_BloodElfMageWarcry1, 1.0 )
    set gg_snd_BloodElfMageReady1 = CreateSound( "Units\\Human\\HeroBloodElf\\BloodElfMageReady1.wav", false, false, true, 10, 10, "HeroAcksEAX" )
    call SetSoundDuration( gg_snd_BloodElfMageReady1, 2012 )
    call SetSoundChannel( gg_snd_BloodElfMageReady1, 0 )
    call SetSoundVolume( gg_snd_BloodElfMageReady1, -1 )
    call SetSoundPitch( gg_snd_BloodElfMageReady1, 1.0 )
    set gg_snd_BloodElfMagePissed1 = CreateSound( "Units\\Human\\HeroBloodElf\\BloodElfMagePissed1.wav", false, false, true, 10, 10, "HeroAcksEAX" )
    call SetSoundDuration( gg_snd_BloodElfMagePissed1, 2948 )
    call SetSoundChannel( gg_snd_BloodElfMagePissed1, 0 )
    call SetSoundVolume( gg_snd_BloodElfMagePissed1, -1 )
    call SetSoundPitch( gg_snd_BloodElfMagePissed1, 1.0 )
    set gg_snd_BattleNetTick01 = CreateSound( "Sound\\Interface\\BattleNetTick.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundDuration( gg_snd_BattleNetTick01, 476 )
    call SetSoundChannel( gg_snd_BattleNetTick01, 0 )
    call SetSoundVolume( gg_snd_BattleNetTick01, -1 )
    call SetSoundPitch( gg_snd_BattleNetTick01, 1.0 )
    set gg_snd_ClanInvitation = CreateSound( "Sound\\Interface\\ClanInvitation.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundDuration( gg_snd_ClanInvitation, 4295 )
    call SetSoundChannel( gg_snd_ClanInvitation, 0 )
    call SetSoundVolume( gg_snd_ClanInvitation, -1 )
    call SetSoundPitch( gg_snd_ClanInvitation, 1.0 )
endfunction

//***************************************************************************
//*
//*  Items
//*
//***************************************************************************

function CreateAllItems takes nothing returns nothing
    local integer itemID

    call BlzCreateItemWithSkin( 'I001', 9411.5, 6208.3, 'I001' )
    call BlzCreateItemWithSkin( 'I001', 9415.8, 7100.5, 'I001' )
    call BlzCreateItemWithSkin( 'I001', 8515.9, 7102.1, 'I001' )
    call BlzCreateItemWithSkin( 'I001', 8516.7, 6187.6, 'I001' )
    call BlzCreateItemWithSkin( 'I001', 8951.7, 6656.9, 'I001' )
endfunction

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = BlzCreateUnitWithSkin( p, 'nwgt', -832.0, -768.0, 270.000, 'nwgt' )
    call WaygateSetDestination( u, GetRectCenterX(gg_rct_teleport1), GetRectCenterY(gg_rct_teleport1) )
    call WaygateActivate( u, true )
    call SetUnitColor( u, ConvertPlayerColor(2) )
    set u = BlzCreateUnitWithSkin( p, 'nwgt', 2176.0, 4096.0, 270.000, 'nwgt' )
    call WaygateSetDestination( u, GetRectCenterX(gg_rct_teleport2), GetRectCenterY(gg_rct_teleport2) )
    call WaygateActivate( u, true )
    call SetUnitColor( u, ConvertPlayerColor(6) )
    set u = BlzCreateUnitWithSkin( p, 'nwgt', 2432.0, 1152.0, 270.000, 'nwgt' )
    set u = BlzCreateUnitWithSkin( p, 'nwgt', -1216.0, -64.0, 270.000, 'nwgt' )
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings(  )
    call CreatePlayerBuildings(  )
    call CreatePlayerUnits(  )
endfunction

//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************

function CreateRegions takes nothing returns nothing
    local weathereffect we

    set gg_rct_centreUP = Rect( -32.0, 608.0, 32.0, 672.0 )
    set gg_rct_centreDOWN = Rect( -32.0, -672.0, 32.0, -608.0 )
    set gg_rct_centreRIGHT = Rect( 608.0, -32.0, 672.0, 32.0 )
    set gg_rct_centreLEFT = Rect( -672.0, -32.0, -608.0, 32.0 )
    set gg_rct_centreCENTRE = Rect( -32.0, -32.0, 32.0, 32.0 )
    set gg_rct_player1 = Rect( -7392.0, 6400.0, -5856.0, 7936.0 )
    set gg_rct_player2 = Rect( -7424.0, 4352.0, -5888.0, 5888.0 )
    set gg_rct_player3 = Rect( -7424.0, 2304.0, -5888.0, 3840.0 )
    set gg_rct_player4 = Rect( -7424.0, 224.0, -5888.0, 1760.0 )
    set gg_rct_player5 = Rect( -7424.0, -1824.0, -5888.0, -288.0 )
    set gg_rct_player6 = Rect( -7424.0, -3840.0, -5888.0, -2304.0 )
    set gg_rct_player7 = Rect( -7424.0, -5888.0, -5888.0, -4352.0 )
    set gg_rct_player8 = Rect( -7424.0, -7936.0, -5888.0, -6400.0 )
    set gg_rct_start1 = Rect( -256.0, 4352.0, 256.0, 4864.0 )
    set gg_rct_start2 = Rect( 3072.0, 3072.0, 3584.0, 3584.0 )
    set gg_rct_start3 = Rect( 4352.0, -256.0, 4864.0, 256.0 )
    set gg_rct_start4 = Rect( 3072.0, -3584.0, 3584.0, -3072.0 )
    set gg_rct_start5 = Rect( -256.0, -4864.0, 256.0, -4352.0 )
    set gg_rct_start6 = Rect( -3584.0, -3584.0, -3072.0, -3072.0 )
    set gg_rct_start7 = Rect( -4864.0, -256.0, -4352.0, 256.0 )
    set gg_rct_start8 = Rect( -3584.0, 3072.0, -3072.0, 3584.0 )
    set gg_rct_upright = Rect( 1760.0, 1760.0, 1824.0, 1824.0 )
    set gg_rct_downright = Rect( 1760.0, -1824.0, 1824.0, -1760.0 )
    set gg_rct_downleft = Rect( -1824.0, -1824.0, -1760.0, -1760.0 )
    set gg_rct_upleft = Rect( -1824.0, 1760.0, -1760.0, 1824.0 )
    set gg_rct_waveunitsCENTRE = Rect( -3968.0, -4224.0, 3968.0, 4224.0 )
    set gg_rct_waveunitsRIGHT = Rect( 3968.0, -3712.0, 5120.0, 3712.0 )
    set gg_rct_waveunitsLEFT = Rect( -5120.0, -3712.0, -3968.0, 3712.0 )
    set gg_rct_waveunitsDOWN = Rect( -3328.0, -5120.0, 3328.0, -4224.0 )
    set gg_rct_waveunitsUP = Rect( -3328.0, 4224.0, 3328.0, 5120.0 )
    set gg_rct_teleport1 = Rect( -1312.0, -160.0, -1120.0, 32.0 )
    set gg_rct_teleport2 = Rect( 2336.0, 1056.0, 2528.0, 1248.0 )
    set gg_rct_finish = Rect( 2752.0, 6144.0, 2944.0, 7808.0 )
    set gg_rct_horse1 = Rect( -2816.0, 7584.0, -2560.0, 7776.0 )
    set gg_rct_miner1 = Rect( 7808.0, 7552.0, 8064.0, 7808.0 )
    set gg_rct_miner2 = Rect( 8832.0, 7552.0, 9088.0, 7808.0 )
    set gg_rct_miner3 = Rect( 9856.0, 7552.0, 10112.0, 7808.0 )
    set gg_rct_miner4 = Rect( 9856.0, 6528.0, 10112.0, 6784.0 )
    set gg_rct_miner5 = Rect( 9856.0, 5504.0, 10112.0, 5760.0 )
    set gg_rct_miner6 = Rect( 8832.0, 5504.0, 9088.0, 5760.0 )
    set gg_rct_miner7 = Rect( 7808.0, 5504.0, 8064.0, 5760.0 )
    set gg_rct_miner8 = Rect( 7808.0, 6528.0, 8064.0, 6784.0 )
    set gg_rct_minersregion = Rect( 7808.0, 5504.0, 10112.0, 7808.0 )
    set gg_rct_horseregion = Rect( -2816.0, 6144.0, 3072.0, 7808.0 )
    set gg_rct_horse2 = Rect( -2816.0, 7392.0, -2560.0, 7584.0 )
    set gg_rct_horse3 = Rect( -2816.0, 7200.0, -2560.0, 7392.0 )
    set gg_rct_horse4 = Rect( -2816.0, 7008.0, -2560.0, 7200.0 )
    set gg_rct_horse5 = Rect( -2816.0, 6752.0, -2560.0, 6944.0 )
    set gg_rct_horse6 = Rect( -2816.0, 6560.0, -2560.0, 6752.0 )
    set gg_rct_horse7 = Rect( -2816.0, 6368.0, -2560.0, 6560.0 )
    set gg_rct_horse8 = Rect( -2816.0, 6176.0, -2560.0, 6368.0 )
    set gg_rct_hideandseek = Rect( 5312.0, 5504.0, 6080.0, 6208.0 )
    set gg_rct_hideandseekcam = Rect( 8608.0, -4096.0, 10464.0, -2432.0 )
    set we = AddWeatherEffect( gg_rct_hideandseekcam, 'SNhs' )
    call EnableWeatherEffect( we, true )
    set gg_rct_roulettespawn = Rect( -4736.0, 6176.0, -3328.0, 6368.0 )
    set gg_rct_roulette = Rect( -4864.0, 6144.0, -3200.0, 7424.0 )
    set gg_rct_circle = Rect( -4608.0, 7040.0, -4480.0, 7168.0 )
    set gg_rct_roulettegame = Rect( -4768.0, 6400.0, -3328.0, 7296.0 )
    set gg_rct_fastarena = Rect( 8576.0, 896.0, 11392.0, 3712.0 )
    set gg_rct_fastarenaSPAWN1 = Rect( 8960.0, 2816.0, 9472.0, 3328.0 )
    set gg_rct_fastarenaSPAWN2 = Rect( 10496.0, 2816.0, 11008.0, 3328.0 )
    set gg_rct_fastarenaSPAWN3 = Rect( 10496.0, 1280.0, 11008.0, 1792.0 )
    set gg_rct_fastarenaSPAWN4 = Rect( 8960.0, 1280.0, 9472.0, 1792.0 )
    set gg_rct_fastarenaFIRE = Rect( 9824.0, 2144.0, 10144.0, 2464.0 )
    set gg_rct_guideyes = Rect( 6400.0, 2432.0, 6528.0, 2560.0 )
    set gg_rct_banshispawn = Rect( 3968.0, 4992.0, 6912.0, 7680.0 )
    set gg_rct_all = Rect( -5120.0, -5120.0, 5120.0, 5120.0 )
    set gg_rct_downmid = Rect( -32.0, -2976.0, 32.0, -2912.0 )
    set gg_rct_upmid = Rect( -160.0, 2528.0, -96.0, 2592.0 )
    set gg_rct_rightmid = Rect( 2784.0, -32.0, 2848.0, 32.0 )
    set gg_rct_leftmid = Rect( -2720.0, -32.0, -2656.0, 32.0 )
    set gg_rct_guideno = Rect( 7040.0, 2432.0, 7168.0, 2560.0 )
    set gg_rct_guideyesvote = Rect( 6400.0, 2304.0, 6528.0, 2432.0 )
    set gg_rct_guidenovote = Rect( 7040.0, 2304.0, 7168.0, 2432.0 )
    set gg_rct________________075 = Rect( 6272.0, 1792.0, 7296.0, 2816.0 )
    set gg_rct________________075_____________________u = Rect( 6432.0, 1920.0, 6560.0, 2048.0 )
    set gg_rct________________075______________________2 = Rect( 6624.0, 1856.0, 6752.0, 1984.0 )
    set gg_rct________________075______________________3 = Rect( 6816.0, 1856.0, 6944.0, 1984.0 )
    set gg_rct________________075______________________4 = Rect( 7008.0, 1920.0, 7136.0, 2048.0 )
    set gg_rct_stormeff = Rect( 5216.0, -4480.0, 5568.0, -4160.0 )
    set gg_rct________________081 = Rect( 6720.0, -64.0, 6848.0, 64.0 )
    set gg_rct________________082 = Rect( 6272.0, -512.0, 7296.0, 512.0 )
    set gg_rct_hideandseekall = Rect( 3456.0, 4224.0, 7040.0, 7808.0 )
    set we = AddWeatherEffect( gg_rct_hideandseekall, 'RLlr' )
    call EnableWeatherEffect( we, true )
    set gg_rct_inc = Rect( -384.0, 0.0, -288.0, 96.0 )
endfunction

//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************

function CreateCameras takes nothing returns nothing

    set gg_cam_hide_and_seek = CreateCameraSetup(  )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_ZOFFSET, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_ROTATION, 90.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_ROLL, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_FARZ, 5000.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_NEARZ, 100.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_hide_and_seek, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0 )
    call CameraSetupSetDestPosition( gg_cam_hide_and_seek, 9536.0, -3264.0, 0.0 )

    set gg_cam_logic = CreateCameraSetup(  )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_ZOFFSET, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_ROTATION, 90.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_ANGLE_OF_ATTACK, 280.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_TARGET_DISTANCE, 2000.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_ROLL, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_FIELD_OF_VIEW, 60.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_FARZ, 5000.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_NEARZ, 100.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_logic, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0 )
    call CameraSetupSetDestPosition( gg_cam_logic, 6778.2, 2306.0, 0.0 )

    set gg_cam_Camera_003 = CreateCameraSetup(  )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_ZOFFSET, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_ROTATION, 90.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_ROLL, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_FARZ, 5000.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_NEARZ, 100.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0 )
    call CameraSetupSetField( gg_cam_Camera_003, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0 )
    call CameraSetupSetDestPosition( gg_cam_Camera_003, 6782.3, 2310.4, 0.0 )

endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: unit resources
//===========================================================================
function Trig_unit_resources_Func001C takes nothing returns boolean
    if ( ( GetResearched() == 'R01S' ) ) then
        return true
    endif
    if ( ( GetResearched() == 'R01T' ) ) then
        return true
    endif
    return false
endfunction

function Trig_unit_resources_Conditions takes nothing returns boolean
    if ( not Trig_unit_resources_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_unit_resources_Func003C takes nothing returns boolean
    if ( not ( GetResearched() == 'R01T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_unit_resources_Actions takes nothing returns nothing
    if ( Trig_unit_resources_Func003C() ) then
        call SetPlayerTechResearchedSwap( 'R01T', 0, GetOwningPlayer(GetTriggerUnit()) )
        call AdjustPlayerStateBJ( 250, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    else
        call AdjustPlayerStateBJ( 5, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_LUMBER )
        call SetPlayerTechResearchedSwap( 'R01S', 0, GetOwningPlayer(GetTriggerUnit()) )
    endif
endfunction

//===========================================================================
function InitTrig_unit_resources takes nothing returns nothing
    set gg_trg_unit_resources = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_unit_resources, EVENT_PLAYER_UNIT_RESEARCH_FINISH )
    call TriggerAddCondition( gg_trg_unit_resources, Condition( function Trig_unit_resources_Conditions ) )
    call TriggerAddAction( gg_trg_unit_resources, function Trig_unit_resources_Actions )
endfunction

//===========================================================================
// Trigger: upgrade def and dmg
//===========================================================================
function Trig_upgrade_def_and_dmg_Func002C takes nothing returns boolean
    if ( ( GetResearched() == 'Rhme' ) ) then
        return true
    endif
    if ( ( GetResearched() == 'Rhar' ) ) then
        return true
    endif
    return false
endfunction

function Trig_upgrade_def_and_dmg_Conditions takes nothing returns boolean
    if ( not Trig_upgrade_def_and_dmg_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_upgrade_def_and_dmg_Func001Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A036', GetEnumUnit()) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001Func001Func002C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A035', GetEnumUnit()) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001Func001C takes nothing returns boolean
    if ( not ( GetResearched() == 'Rhar' ) ) then
        return false
    endif
    return true
endfunction

function Trig_upgrade_def_and_dmg_Func001A takes nothing returns nothing
    if ( Trig_upgrade_def_and_dmg_Func001Func001C() ) then
        if ( Trig_upgrade_def_and_dmg_Func001Func001Func002C() ) then
            call UnitAddAbilityBJ( 'A035', GetEnumUnit() )
        else
            call IncUnitAbilityLevelSwapped( 'A035', GetEnumUnit() )
        endif
    else
        if ( Trig_upgrade_def_and_dmg_Func001Func001Func001C() ) then
            call UnitAddAbilityBJ( 'A036', GetEnumUnit() )
        else
            call IncUnitAbilityLevelSwapped( 'A036', GetEnumUnit() )
        endif
    endif
endfunction

function Trig_upgrade_def_and_dmg_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerMatching(GetOwningPlayer(GetTriggerUnit()), Condition(function Trig_upgrade_def_and_dmg_Func001001002)), function Trig_upgrade_def_and_dmg_Func001A )
endfunction

//===========================================================================
function InitTrig_upgrade_def_and_dmg takes nothing returns nothing
    set gg_trg_upgrade_def_and_dmg = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_upgrade_def_and_dmg, EVENT_PLAYER_UNIT_RESEARCH_FINISH )
    call TriggerAddCondition( gg_trg_upgrade_def_and_dmg, Condition( function Trig_upgrade_def_and_dmg_Conditions ) )
    call TriggerAddAction( gg_trg_upgrade_def_and_dmg, function Trig_upgrade_def_and_dmg_Actions )
endfunction

//===========================================================================
// Trigger: inc ini
//===========================================================================
function Trig_inc_ini_Func003A takes nothing returns nothing
    set udg_income_goldmine_c[GetConvertedPlayerId(GetEnumPlayer())] = 3
    set udg_income_goldmine_l[GetConvertedPlayerId(GetEnumPlayer())] = 1
endfunction

function Trig_inc_ini_Actions takes nothing returns nothing
    set udg_inc_pp[0] = 2
    set udg_inc_pp[1] = 1
    call ForForce( udg_players_group, function Trig_inc_ini_Func003A )
endfunction

//===========================================================================
function InitTrig_inc_ini takes nothing returns nothing
    set gg_trg_inc_ini = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_inc_ini, 1.00 )
    call TriggerAddAction( gg_trg_inc_ini, function Trig_inc_ini_Actions )
endfunction

//===========================================================================
// Trigger: inc per second
//
// inc_ps, scoreboard_win, icometemp, inc_pp[], income_goldmine_c, wave, inc_max[]
//===========================================================================
function Trig_inc_per_second_Func002001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n003' )
endfunction

function Trig_inc_per_second_Func002001002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) )
endfunction

function Trig_inc_per_second_Func002001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_inc_per_second_Func002001002001(), Trig_inc_per_second_Func002001002002() )
endfunction

function Trig_inc_per_second_Func002A takes nothing returns nothing
    set udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = ( udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[0] )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = ( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[0] )
    set udg_incometemp = ( ( 1 - ( 0.10 * I2R(GetPlayerTechCountSimple('R02K', GetOwningPlayer(GetEnumUnit()))) ) ) * ( ( ( I2R(udg_wave) + 4.00 ) / 5.00 ) * I2R(udg_income_goldmine_c[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]) ) )
    call AdjustPlayerStateBJ( R2I(udg_incometemp), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + I2S(R2I(udg_incometemp)) ), GetUnitLoc(GetEnumUnit()), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(udg_inc_pp[0]) ), PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
endfunction

function Trig_inc_per_second_Func003001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n004' )
endfunction

function Trig_inc_per_second_Func003001002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) )
endfunction

function Trig_inc_per_second_Func003001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_inc_per_second_Func003001002001(), Trig_inc_per_second_Func003001002002() )
endfunction

function Trig_inc_per_second_Func003A takes nothing returns nothing
    set udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = ( udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = ( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_incometemp = ( ( 1 - ( 0.10 * I2R(GetPlayerTechCountSimple('R02K', GetOwningPlayer(GetEnumUnit()))) ) ) * ( ( ( I2R(udg_wave) + 4.00 ) / 5.00 ) * I2R(udg_income_goldmine_l[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]) ) )
    call AdjustPlayerStateBJ( R2I(udg_incometemp), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + I2S(R2I(udg_incometemp)) ), GetUnitLoc(GetEnumUnit()), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(udg_inc_pp[1]) ), PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
endfunction

function Trig_inc_per_second_Func004001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n005' )
endfunction

function Trig_inc_per_second_Func004001002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) )
endfunction

function Trig_inc_per_second_Func004001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_inc_per_second_Func004001002001(), Trig_inc_per_second_Func004001002002() )
endfunction

function Trig_inc_per_second_Func004A takes nothing returns nothing
    set udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = ( udg_inc_ps[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = ( udg_scoreboard_win[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_inc_pp[1] )
    set udg_incometemp = ( ( 1 - ( 0.10 * I2R(GetPlayerTechCountSimple('R02K', GetOwningPlayer(GetEnumUnit()))) ) ) * ( ( ( I2R(udg_wave) + 4.00 ) / 5.00 ) * I2R(udg_income_goldmine_l[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]) ) )
    call AdjustPlayerStateBJ( R2I(udg_incometemp), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + I2S(R2I(udg_incometemp)) ), GetUnitLoc(GetEnumUnit()), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(udg_inc_pp[1]) ), PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
endfunction

function Trig_inc_per_second_Func006Func001C takes nothing returns boolean
    if ( not ( udg_inc_ps[GetConvertedPlayerId(GetEnumPlayer())] != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func006Func005C takes nothing returns boolean
    if ( not ( udg_inc_max[0] < udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func006A takes nothing returns nothing
    if ( Trig_inc_per_second_Func006Func001C() ) then
        call MultiboardSetItemValueBJ( udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), ( I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]) + ( " (|cFF00FF00" + ( I2S(udg_inc_ps[GetConvertedPlayerId(GetEnumPlayer())]) + "|r)" ) ) ) )
    else
        call MultiboardSetItemValueBJ( udg_scoreboard, 7, ( GetConvertedPlayerId(GetEnumPlayer()) + 1 ), I2S(udg_scoreboard_win[GetConvertedPlayerId(GetEnumPlayer())]) )
    endif
    set udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] = CountUnitsInGroup(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'n003'))
    set udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] = ( udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] + CountLivingPlayerUnitsOfTypeId('n004', GetEnumPlayer()) )
    set udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] = ( udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())] + CountLivingPlayerUnitsOfTypeId('n005', GetEnumPlayer()) )
    if ( Trig_inc_per_second_Func006Func005C() ) then
        set udg_inc_max[0] = udg_inc_max[GetConvertedPlayerId(GetEnumPlayer())]
    else
    endif
    set udg_inc_ps[GetConvertedPlayerId(GetEnumPlayer())] = 0
endfunction

function Trig_inc_per_second_Func007Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitLifePercent(GetEnumUnit()) > 20.00 ) ) then
        return false
    endif
    if ( not ( udg_inc_max[0] > udg_inc_max[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] ) ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func007Func001C takes nothing returns boolean
    if ( not Trig_inc_per_second_Func007Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_inc_per_second_Func007A takes nothing returns nothing
    if ( Trig_inc_per_second_Func007Func001C() ) then
        call SetUnitLifePercentBJ( GetEnumUnit(), ( GetUnitLifePercent(GetEnumUnit()) - 0.80 ) )
    else
    endif
endfunction

function Trig_inc_per_second_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_inc_per_second_Func002001002)), function Trig_inc_per_second_Func002A )
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_inc_per_second_Func003001002)), function Trig_inc_per_second_Func003A )
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_inc_per_second_Func004001002)), function Trig_inc_per_second_Func004A )
    set udg_inc_max[0] = 0
    call ForForce( udg_players_group, function Trig_inc_per_second_Func006A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h01O'), function Trig_inc_per_second_Func007A )
endfunction

//===========================================================================
function InitTrig_inc_per_second takes nothing returns nothing
    set gg_trg_inc_per_second = CreateTrigger(  )
    call DisableTrigger( gg_trg_inc_per_second )
    call TriggerRegisterTimerEventPeriodic( gg_trg_inc_per_second, 1.00 )
    call TriggerAddAction( gg_trg_inc_per_second, function Trig_inc_per_second_Actions )
endfunction

//===========================================================================
// Trigger: inc upg
//===========================================================================
function Trig_inc_upg_Actions takes nothing returns nothing
    set udg_inc_pp[0] = ( udg_inc_pp[0] + 2 )
    set udg_inc_pp[1] = ( udg_inc_pp[1] + 1 )
endfunction

//===========================================================================
function InitTrig_inc_upg takes nothing returns nothing
    set gg_trg_inc_upg = CreateTrigger(  )
    call TriggerAddAction( gg_trg_inc_upg, function Trig_inc_upg_Actions )
endfunction

//===========================================================================
// Trigger: income effects
//===========================================================================
function Trig_income_effects_Func004Func005C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(udg_ticket_players[GetForLoopIndexB()])] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_wave == ( 3 * GetForLoopIndexB() ) ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R00H', GetEnumPlayer()) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006Func001Func001Func003C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(GetEnumPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006Func001Func001C takes nothing returns boolean
    if ( not Trig_income_effects_Func006Func001Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func006A takes nothing returns nothing
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 20
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        if ( Trig_income_effects_Func006Func001Func001C() ) then
            call AdjustPlayerStateBJ( ( 3 * GetPlayerTechCountSimple('R00H', GetEnumPlayer()) ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER )
            if ( Trig_income_effects_Func006Func001Func001Func003C() ) then
                call DisplayTimedTextToForce( GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход от драгоценных камней: |cFFB23AEE" + I2S(( 3 * GetPlayerTechCountSimple('R00H', GetEnumPlayer()) )) ) )
            else
            endif
        else
        endif
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
endfunction

function Trig_income_effects_Func008Func001Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p)) > 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerSlotState(ConvertedPlayer(udg_p)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func004Func001C takes nothing returns boolean
    if ( not ( udg_pillage_player == ConvertedPlayer(udg_p) ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func010Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p)) == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func010C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p)) == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func013C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(ConvertedPlayer(udg_p))] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001Func014C takes nothing returns boolean
    if ( not ( udg_info[GetConvertedPlayerId(udg_pillage_player)] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Func008Func001C takes nothing returns boolean
    if ( not Trig_income_effects_Func008Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_income_effects_Actions takes nothing returns nothing
    // 2
    set udg_ticket_resources = 0
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 8
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_ticket_resources = ( udg_ticket_resources + ( GetPlayerState(ConvertedPlayer(GetForLoopIndexB()), PLAYER_STATE_RESOURCE_GOLD) + ( GetPlayerState(ConvertedPlayer(GetForLoopIndexB()), PLAYER_STATE_RESOURCE_LUMBER) * 10 ) ) )
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 5
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_ticket_gold = ( ( I2R(udg_ticket_resources) * 0.90 ) * ( 0.06 - ( 0.01 * I2R(GetForLoopIndexB()) ) ) )
        set udg_ticket_lumber = ( ( I2R(udg_ticket_resources) * 0.01 ) * ( 0.06 - ( 0.01 * I2R(GetForLoopIndexB()) ) ) )
        call AdjustPlayerStateBJ( R2I(udg_ticket_gold), udg_ticket_players[GetForLoopIndexB()], PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( R2I(udg_ticket_lumber), udg_ticket_players[GetForLoopIndexB()], PLAYER_STATE_RESOURCE_LUMBER )
        if ( Trig_income_effects_Func004Func005C() ) then
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_ticket_players[GetForLoopIndexB()]), 10.00, ( "Доход от билетов: |cFFFFCD00" + I2S(R2I(udg_ticket_gold)) ) )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_ticket_players[GetForLoopIndexB()]), 10.00, ( "Доход от билетов: |cFFB23AEE" + I2S(R2I(udg_ticket_lumber)) ) )
        else
        endif
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    // 3
    call ForForce( udg_players_group, function Trig_income_effects_Func006A )
    // 5
    set udg_p = 1
    loop
        exitwhen udg_p > 8
        if ( Trig_income_effects_Func008Func001C() ) then
            set udg_pillage_player = ConvertedPlayer(udg_p)
            set udg_pillage_resources = 0
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 10
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                if ( Trig_income_effects_Func008Func001Func004Func001C() ) then
                    set udg_pillage_player = ForcePickRandomPlayer(udg_players_group)
                else
                endif
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set udg_pillage_resources = ( udg_pillage_resources + ( GetPlayerState(udg_pillage_player, PLAYER_STATE_RESOURCE_GOLD) + ( GetPlayerState(udg_pillage_player, PLAYER_STATE_RESOURCE_LUMBER) * 10 ) ) )
            set udg_pillage_gold = ( ( I2R(udg_pillage_resources) * 0.90 ) * ( 0.04 + ( 0.01 * I2R(GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p))) ) ) )
            set udg_pillage_lumber = ( ( I2R(udg_pillage_resources) * 0.01 ) * ( 0.04 + ( 0.01 * I2R(GetPlayerTechCountSimple('R00J', ConvertedPlayer(udg_p))) ) ) )
            call AdjustPlayerStateBJ( ( -1 * R2I(udg_pillage_gold) ), udg_pillage_player, PLAYER_STATE_RESOURCE_GOLD )
            call AdjustPlayerStateBJ( ( -1 * R2I(udg_pillage_lumber) ), udg_pillage_player, PLAYER_STATE_RESOURCE_LUMBER )
            if ( Trig_income_effects_Func008Func001Func010C() ) then
                set udg_pillage_lumber = ( udg_pillage_lumber + 1.00 )
            else
                if ( Trig_income_effects_Func008Func001Func010Func001C() ) then
                    set udg_pillage_lumber = ( udg_pillage_lumber + 2.00 )
                else
                endif
            endif
            call AdjustPlayerStateBJ( R2I(udg_pillage_gold), ConvertedPlayer(udg_p), PLAYER_STATE_RESOURCE_GOLD )
            call AdjustPlayerStateBJ( R2I(udg_pillage_lumber), ConvertedPlayer(udg_p), PLAYER_STATE_RESOURCE_LUMBER )
            if ( Trig_income_effects_Func008Func001Func013C() ) then
                call DisplayTimedTextToForce( GetForceOfPlayer(ConvertedPlayer(udg_p)), 10.00, ( "Вы украли |cFFFFCD00" + ( I2S(R2I(udg_pillage_gold)) + ( "|r ед. золота и |cFFB23AEE" + ( I2S(R2I(udg_pillage_lumber)) + ( "|r ед. самоцветов у игрока " + ( udg_players_colour[GetConvertedPlayerId(udg_pillage_player)] + udg_players_name[GetConvertedPlayerId(udg_pillage_player)] ) ) ) ) ) ) )
            else
            endif
            if ( Trig_income_effects_Func008Func001Func014C() ) then
                call DisplayTimedTextToForce( GetForceOfPlayer(udg_pillage_player), 10.00, ( "Вас ограбил игрок " + ( udg_players_colour[GetConvertedPlayerId(ConvertedPlayer(udg_p))] + udg_players_name[GetConvertedPlayerId(ConvertedPlayer(udg_p))] ) ) )
            else
            endif
        else
        endif
        set udg_p = udg_p + 1
    endloop
endfunction

//===========================================================================
function InitTrig_income_effects takes nothing returns nothing
    set gg_trg_income_effects = CreateTrigger(  )
    call TriggerAddAction( gg_trg_income_effects, function Trig_income_effects_Actions )
endfunction

//===========================================================================
// Trigger: Weather
//===========================================================================
function Trig_Weather_Func007A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())] = 0
    call CreateNUnitsAtLoc( 1, 'h029', GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), bj_UNIT_FACING )
endfunction

function Trig_Weather_Func008A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_Weather_Func010Func001C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetEnumDestructable()) == 'B008' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Weather_Func010A takes nothing returns nothing
    if ( Trig_Weather_Func010Func001C() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
    endif
endfunction

function Trig_Weather_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_Storm_effect )
    call DisableTrigger( gg_trg_Armageddon_effect )
    call DisableTrigger( gg_trg_Armageddon_effect_2 )
    call ResetTerrainFogBJ(  )
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), false )
    call RemoveWeatherEffectBJ( GetLastCreatedWeatherEffect() )
    call ForForce( udg_players_group, function Trig_Weather_Func007A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('ninf'), function Trig_Weather_Func008A )
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl" , "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call EnumDestructablesInRectAll( GetPlayableMapRect(), function Trig_Weather_Func010A )
endfunction

//===========================================================================
function InitTrig_Weather takes nothing returns nothing
    set gg_trg_Weather = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Weather, function Trig_Weather_Actions )
endfunction

//===========================================================================
// Trigger: Blizzard
//===========================================================================
function Trig_Blizzard_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R02L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blizzard_Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_Blizzard_Func003A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())] = 0
endfunction

function Trig_Blizzard_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfTypeIdAll('h029'), function Trig_Blizzard_Func002A )
    call ForForce( udg_players_group, function Trig_Blizzard_Func003A )
    set udg_weather[GetConvertedPlayerId(GetTriggerPlayer())] = 1
endfunction

//===========================================================================
function InitTrig_Blizzard takes nothing returns nothing
    set gg_trg_Blizzard = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Blizzard, EVENT_PLAYER_UNIT_RESEARCH_FINISH )
    call TriggerAddCondition( gg_trg_Blizzard, Condition( function Trig_Blizzard_Conditions ) )
    call TriggerAddAction( gg_trg_Blizzard, function Trig_Blizzard_Actions )
endfunction

//===========================================================================
// Trigger: Storm
//===========================================================================
function Trig_Storm_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R02M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Storm_Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_Storm_Func003A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())] = 0
endfunction

function Trig_Storm_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfTypeIdAll('h029'), function Trig_Storm_Func002A )
    call ForForce( udg_players_group, function Trig_Storm_Func003A )
    set udg_weather[GetConvertedPlayerId(GetTriggerPlayer())] = 2
endfunction

//===========================================================================
function InitTrig_Storm takes nothing returns nothing
    set gg_trg_Storm = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Storm, EVENT_PLAYER_UNIT_RESEARCH_FINISH )
    call TriggerAddCondition( gg_trg_Storm, Condition( function Trig_Storm_Conditions ) )
    call TriggerAddAction( gg_trg_Storm, function Trig_Storm_Actions )
endfunction

//===========================================================================
// Trigger: Storm effect
//===========================================================================
function Trig_Storm_effect_Func006001002001 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_Storm_effect_Func006001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Storm_effect_Func006001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_Storm_effect_Func006001002001(), Trig_Storm_effect_Func006001002002() )
endfunction

function Trig_Storm_effect_Func006A takes nothing returns nothing
    call UnitDamageTargetBJ( GroupPickRandomUnit(GetRandomSubGroup(1, GetUnitsInRectAll(gg_rct_all))), GetEnumUnit(), 500, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
endfunction

function Trig_Storm_effect_Actions takes nothing returns nothing
    call MoveRectToLoc( gg_rct_stormeff, GetRandomLocInRect(gg_rct_all) )
    call AddSpecialEffectLocBJ( GetRectCenter(gg_rct_stormeff), "Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl" )
    set udg_stormeff_eff = GetLastCreatedEffectBJ()
    call AddSpecialEffectLocBJ( GetRectCenter(gg_rct_stormeff), "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl" )
    call DestroyEffectBJ( GetLastCreatedEffectBJ() )
    call ForGroupBJ( GetUnitsInRectMatching(gg_rct_stormeff, Condition(function Trig_Storm_effect_Func006001002)), function Trig_Storm_effect_Func006A )
    call TriggerSleepAction( 0.35 )
    call DestroyEffectBJ( udg_stormeff_eff )
endfunction

//===========================================================================
function InitTrig_Storm_effect takes nothing returns nothing
    set gg_trg_Storm_effect = CreateTrigger(  )
    call DisableTrigger( gg_trg_Storm_effect )
    call TriggerRegisterTimerEventPeriodic( gg_trg_Storm_effect, 4.00 )
    call TriggerAddAction( gg_trg_Storm_effect, function Trig_Storm_effect_Actions )
endfunction

//===========================================================================
// Trigger: Armageddon
//===========================================================================
function Trig_Armageddon_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R02N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Armageddon_Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_Armageddon_Func003A takes nothing returns nothing
    set udg_weather[GetConvertedPlayerId(GetEnumPlayer())] = 0
endfunction

function Trig_Armageddon_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfTypeIdAll('h029'), function Trig_Armageddon_Func002A )
    call ForForce( udg_players_group, function Trig_Armageddon_Func003A )
    set udg_weather[GetConvertedPlayerId(GetTriggerPlayer())] = 3
endfunction

//===========================================================================
function InitTrig_Armageddon takes nothing returns nothing
    set gg_trg_Armageddon = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Armageddon, EVENT_PLAYER_UNIT_RESEARCH_FINISH )
    call TriggerAddCondition( gg_trg_Armageddon, Condition( function Trig_Armageddon_Conditions ) )
    call TriggerAddAction( gg_trg_Armageddon, function Trig_Armageddon_Actions )
endfunction

//===========================================================================
// Trigger: Armageddon effect
//===========================================================================
function Trig_Armageddon_effect_Func005Func001003001001002001 takes nothing returns boolean
    return ( IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), Player(PLAYER_NEUTRAL_AGGRESSIVE)) == true )
endfunction

function Trig_Armageddon_effect_Func005Func001003001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Armageddon_effect_Func005Func001003001001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_Armageddon_effect_Func005Func001003001001002001(), Trig_Armageddon_effect_Func005Func001003001001002002() )
endfunction

function Trig_Armageddon_effect_Func005A takes nothing returns nothing
    call IssuePointOrderLocBJ( GetEnumUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_Armageddon_effect_Func005Func001003001001002)))) )
endfunction

function Trig_Armageddon_effect_Actions takes nothing returns nothing
    call CreateNUnitsAtLoc( 1, 'h00G', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(GetPlayableMapRect()), bj_UNIT_FACING )
    call UnitApplyTimedLifeBJ( 5.00, 'BTLF', GetLastCreatedUnit() )
    call UnitAddAbilityBJ( 'A03B', GetLastCreatedUnit() )
    call IssuePointOrderLocBJ( GetLastCreatedUnit(), "dreadlordinferno", GetRandomLocInRect(gg_rct_all) )
    call ForGroupBJ( GetUnitsOfTypeIdAll('ninf'), function Trig_Armageddon_effect_Func005A )
endfunction

//===========================================================================
function InitTrig_Armageddon_effect takes nothing returns nothing
    set gg_trg_Armageddon_effect = CreateTrigger(  )
    call DisableTrigger( gg_trg_Armageddon_effect )
    call TriggerRegisterTimerEventPeriodic( gg_trg_Armageddon_effect, 10.00 )
    call TriggerAddAction( gg_trg_Armageddon_effect, function Trig_Armageddon_effect_Actions )
endfunction

//===========================================================================
// Trigger: Armageddon effect 2
//===========================================================================
function Trig_Armageddon_effect_2_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'ninf' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Armageddon_effect_2_Func001003001001002001 takes nothing returns boolean
    return ( IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), Player(PLAYER_NEUTRAL_AGGRESSIVE)) == true )
endfunction

function Trig_Armageddon_effect_2_Func001003001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Armageddon_effect_2_Func001003001001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_Armageddon_effect_2_Func001003001001002001(), Trig_Armageddon_effect_2_Func001003001001002002() )
endfunction

function Trig_Armageddon_effect_2_Actions takes nothing returns nothing
    call IssuePointOrderLocBJ( GetEnteringUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_all, Condition(function Trig_Armageddon_effect_2_Func001003001001002)))) )
endfunction

//===========================================================================
function InitTrig_Armageddon_effect_2 takes nothing returns nothing
    set gg_trg_Armageddon_effect_2 = CreateTrigger(  )
    call DisableTrigger( gg_trg_Armageddon_effect_2 )
    call TriggerRegisterEnterRectSimple( gg_trg_Armageddon_effect_2, gg_rct_all )
    call TriggerAddCondition( gg_trg_Armageddon_effect_2, Condition( function Trig_Armageddon_effect_2_Conditions ) )
    call TriggerAddAction( gg_trg_Armageddon_effect_2, function Trig_Armageddon_effect_2_Actions )
endfunction

//===========================================================================
// Trigger: faq
//
// 6 + 7 + 0.8 + 11 + 8 + 5 + 6 + 8
//===========================================================================
function Trig_faq_Func002A takes nothing returns nothing
    call CameraSetupApplyForPlayer( true, gg_cam_Camera_003, GetEnumPlayer(), 0 )
endfunction

function Trig_faq_Func019A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetRectCenter(gg_rct_centreCENTRE), 1.00 )
endfunction

function Trig_faq_Func020A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func034A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func035A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func036A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func037A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetRectCenter(gg_rct_downleft), 1.00 )
endfunction

function Trig_faq_Func038A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100, 100.00, 100.00, 0 )
endfunction

function Trig_faq_Func048A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func049A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func050A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetRectCenter(gg_rct_start3), 1.00 )
endfunction

function Trig_faq_Func059A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_Func061A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0 )
    call SelectUnitForPlayerSingle( GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'ntav')), GetEnumPlayer() )
endfunction

function Trig_faq_Actions takes nothing returns nothing
    call CinematicModeBJ( true, GetPlayersAll() )
    call ForForce( udg_players_group, function Trig_faq_Func002A )
    call CreateNUnitsAtLoc( 1, 'h01O', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075), bj_UNIT_FACING )
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2638" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2630", null, "TRIGSTR_2631", bj_TIMETYPE_ADD, 6.00, false )
    call TriggerSleepAction( 6.00 )
    call CreateNUnitsAtLoc( 1, 'h01S', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075_____________________u), bj_UNIT_FACING )
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call CreateNUnitsAtLoc( 1, 'h01T', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075______________________2), bj_UNIT_FACING )
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call CreateNUnitsAtLoc( 1, 'h01V', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075______________________3), bj_UNIT_FACING )
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call CreateNUnitsAtLoc( 1, 'h01W', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________075______________________4), bj_UNIT_FACING )
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2639" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2645", null, "TRIGSTR_2633", bj_TIMETYPE_ADD, 7.00, false )
    call TriggerSleepAction( 7.00 )
    call ForForce( udg_players_group, function Trig_faq_Func019A )
    call ForGroupBJ( GetUnitsInRectAll(gg_rct________________075), function Trig_faq_Func020A )
    call TriggerSleepAction( 0.80 )
    call EnableTrigger( gg_trg_faq_death )
    call CreateNUnitsAtLoc( 1, 'n003', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING )
    set udg_faq_unit[1] = GetLastCreatedUnit()
    call SetUnitLifePercentBJ( GetLastCreatedUnit(), 40.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'ebal', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreUP), GetUnitLoc(GetLastCreatedUnit()) )
    set udg_faq_unit[0] = GetLastCreatedUnit()
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call IssuePointOrderLocBJ( udg_faq_unit[0], "attackground", GetRectCenter(gg_rct_centreCENTRE) )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2640" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2646", null, "TRIGSTR_2632", bj_TIMETYPE_ADD, 11.00, false )
    call TriggerSleepAction( 11.00 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('n006'), function Trig_faq_Func034A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('n003'), function Trig_faq_Func035A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('ebal'), function Trig_faq_Func036A )
    call ForForce( udg_players_group, function Trig_faq_Func037A )
    call ForGroupBJ( udg_light[0], function Trig_faq_Func038A )
    call SetUnitScalePercent( GetLastCreatedUnit(), 230.00, 230.00, 230.00 )
    call CreateNUnitsAtLoc( 1, 'n004', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_downleft), bj_UNIT_FACING )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2641" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2647", null, "TRIGSTR_2634", bj_TIMETYPE_ADD, 8.00, false )
    call TriggerSleepAction( 8.00 )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2642" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2648", null, "TRIGSTR_2635", bj_TIMETYPE_ADD, 5.00, false )
    call TriggerSleepAction( 5.00 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('n006'), function Trig_faq_Func048A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('n004'), function Trig_faq_Func049A )
    call ForForce( udg_players_group, function Trig_faq_Func050A )
    call CreateNUnitsAtLoc( 1, 'h01O', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_start3), bj_UNIT_FACING )
    call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2643" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2649", null, "TRIGSTR_2636", bj_TIMETYPE_ADD, 6.00, false )
    call TriggerSleepAction( 6.00 )
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, "TRIGSTR_2644" )
    call TransmissionFromUnitWithNameBJ( GetPlayersAll(), GetLastCreatedUnit(), "TRIGSTR_2650", null, "TRIGSTR_2637", bj_TIMETYPE_ADD, 8.00, false )
    call TriggerSleepAction( 8.00 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h01O'), function Trig_faq_Func059A )
    call CinematicModeBJ( false, GetPlayersAll() )
    call ForForce( udg_players_group, function Trig_faq_Func061A )
endfunction

//===========================================================================
function InitTrig_faq takes nothing returns nothing
    set gg_trg_faq = CreateTrigger(  )
    call TriggerAddAction( gg_trg_faq, function Trig_faq_Actions )
endfunction

//===========================================================================
// Trigger: faq death
//===========================================================================
function Trig_faq_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_death_Func001A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_faq_death_Func003A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100, 0.00, 0.00, 0 )
endfunction

function Trig_faq_death_Func007A takes nothing returns nothing
    call SetUnitColor( GetEnumUnit(), PLAYER_COLOR_RED )
endfunction

function Trig_faq_death_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfTypeIdAll('ebal'), function Trig_faq_death_Func001A )
    call DisableTrigger( GetTriggeringTrigger() )
    call ForGroupBJ( udg_light[0], function Trig_faq_death_Func003A )
    call CreateNUnitsAtLoc( 1, GetUnitTypeId(GetDyingUnit()), Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct_centreCENTRE), bj_UNIT_FACING )
    set udg_faq_unit[1] = GetLastCreatedUnit()
    call RemoveUnit( GetDyingUnit() )
    call ForGroupBJ( GetUnitsOfTypeIdAll('n006'), function Trig_faq_death_Func007A )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + "6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call TriggerSleepAction( 0.60 )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + "6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call TriggerSleepAction( 0.60 )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + "6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call TriggerSleepAction( 0.60 )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + "6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call TriggerSleepAction( 1.20 )
    call CreateTextTagLocBJ( ( "|cFFFFCD00+" + "6" ), GetUnitRallyPoint(udg_faq_unit[1]), 0, 12.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call CreateTextTagLocBJ( ( "|cFFFF0000+" + I2S(2) ), PolarProjectionBJ(GetUnitLoc(udg_faq_unit[1]), 64.00, 315.00), -64.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetPlayersAll() )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 2.00 )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.30 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
endfunction

//===========================================================================
function InitTrig_faq_death takes nothing returns nothing
    set gg_trg_faq_death = CreateTrigger(  )
    call DisableTrigger( gg_trg_faq_death )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_faq_death, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_faq_death, Condition( function Trig_faq_death_Conditions ) )
    call TriggerAddAction( gg_trg_faq_death, function Trig_faq_death_Actions )
endfunction

//===========================================================================
// Trigger: building inf
//===========================================================================
function Trig_building_inf_Conditions takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_building_inf_Func002A takes nothing returns nothing
    call SetUnitInvulnerable( GetEnumUnit(), true )
endfunction

function Trig_building_inf_Actions takes nothing returns nothing
    call ForGroupBJ( udg_buildings, function Trig_building_inf_Func002A )
endfunction

//===========================================================================
function InitTrig_building_inf takes nothing returns nothing
    set gg_trg_building_inf = CreateTrigger(  )
    call DisableTrigger( gg_trg_building_inf )
    call TriggerRegisterTimerEventPeriodic( gg_trg_building_inf, 1.00 )
    call TriggerAddCondition( gg_trg_building_inf, Condition( function Trig_building_inf_Conditions ) )
    call TriggerAddAction( gg_trg_building_inf, function Trig_building_inf_Actions )
endfunction

//===========================================================================
// Trigger: builder left
//===========================================================================
function Trig_builder_left_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetLeavingUnit(), UNIT_TYPE_PEON) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_builder_left_Actions takes nothing returns nothing
    call SetUnitPositionLoc( GetLeavingUnit(), GetPlayerStartLocationLoc(GetOwningPlayer(GetLeavingUnit())) )
endfunction

//===========================================================================
function InitTrig_builder_left takes nothing returns nothing
    set gg_trg_builder_left = CreateTrigger(  )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player1 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player2 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player3 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player4 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player5 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player6 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player7 )
    call TriggerRegisterLeaveRectSimple( gg_trg_builder_left, gg_rct_player8 )
    call TriggerAddCondition( gg_trg_builder_left, Condition( function Trig_builder_left_Conditions ) )
    call TriggerAddAction( gg_trg_builder_left, function Trig_builder_left_Actions )
endfunction

//===========================================================================
// Trigger: mediv select
//===========================================================================
function Trig_mediv_select_Func056C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func057C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func058C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func059C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func060C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func063C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func064C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func065C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func066C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func067C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func070C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func071C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func072C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func073C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func074C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func077C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func078C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func079C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func080C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func081C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func084C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func085C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func086C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func087C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func088C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func091C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func092C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func093C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func094C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func095C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func098C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func099C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func100C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func101C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func102C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func105C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func106C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func107C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func108C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func109C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func112C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func113C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func114C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func115C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func118C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func119C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func120C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Func121C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_mediv_select_Actions takes nothing returns nothing
    // Альянс
    call SetPlayerUnitAvailableBJ( 'h002', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h003', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h009', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h00C', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h00J', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h00P', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h00U', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h012', false, udg_mediv )
    // Нежить
    call SetPlayerUnitAvailableBJ( 'h016', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h017', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h018', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h019', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01A', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01B', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01C', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01D', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01E', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01F', false, udg_mediv )
    // Ночные эльфы
    call SetPlayerUnitAvailableBJ( 'h01H', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01I', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01J', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01K', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01L', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01M', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01N', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01P', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01Q', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01R', false, udg_mediv )
    // Орда
    call SetPlayerUnitAvailableBJ( 'h01S', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01T', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01V', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01W', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01X', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01Y', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h01Z', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h020', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h021', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h022', false, udg_mediv )
    // Наги
    call SetPlayerUnitAvailableBJ( 'h026', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h027', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h028', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02A', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02B', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02C', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02D', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02E', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02F', false, udg_mediv )
    call SetPlayerUnitAvailableBJ( 'h02G', false, udg_mediv )
    // Q
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func056C() ) then
        call SetPlayerUnitAvailableBJ( 'h002', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func057C() ) then
        call SetPlayerUnitAvailableBJ( 'h016', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func058C() ) then
        call SetPlayerUnitAvailableBJ( 'h01H', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func059C() ) then
        call SetPlayerUnitAvailableBJ( 'h01S', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func060C() ) then
        call SetPlayerUnitAvailableBJ( 'h026', true, udg_mediv )
    else
    endif
    // W
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func063C() ) then
        call SetPlayerUnitAvailableBJ( 'h003', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func064C() ) then
        call SetPlayerUnitAvailableBJ( 'h017', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func065C() ) then
        call SetPlayerUnitAvailableBJ( 'h01I', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func066C() ) then
        call SetPlayerUnitAvailableBJ( 'h01T', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func067C() ) then
        call SetPlayerUnitAvailableBJ( 'h027', true, udg_mediv )
    else
    endif
    // E
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func070C() ) then
        call SetPlayerUnitAvailableBJ( 'h009', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func071C() ) then
        call SetPlayerUnitAvailableBJ( 'h018', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func072C() ) then
        call SetPlayerUnitAvailableBJ( 'h01J', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func073C() ) then
        call SetPlayerUnitAvailableBJ( 'h01V', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func074C() ) then
        call SetPlayerUnitAvailableBJ( 'h028', true, udg_mediv )
    else
    endif
    // R
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func077C() ) then
        call SetPlayerUnitAvailableBJ( 'h00C', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func078C() ) then
        call SetPlayerUnitAvailableBJ( 'h019', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func079C() ) then
        call SetPlayerUnitAvailableBJ( 'h01K', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func080C() ) then
        call SetPlayerUnitAvailableBJ( 'h01W', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func081C() ) then
        call SetPlayerUnitAvailableBJ( 'h02A', true, udg_mediv )
    else
    endif
    // A
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func084C() ) then
        call SetPlayerUnitAvailableBJ( 'h00J', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func085C() ) then
        call SetPlayerUnitAvailableBJ( 'h01A', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func086C() ) then
        call SetPlayerUnitAvailableBJ( 'h01L', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func087C() ) then
        call SetPlayerUnitAvailableBJ( 'h01X', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func088C() ) then
        call SetPlayerUnitAvailableBJ( 'h02B', true, udg_mediv )
    else
    endif
    // S
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func091C() ) then
        call SetPlayerUnitAvailableBJ( 'h00P', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func092C() ) then
        call SetPlayerUnitAvailableBJ( 'h01B', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func093C() ) then
        call SetPlayerUnitAvailableBJ( 'h01M', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func094C() ) then
        call SetPlayerUnitAvailableBJ( 'h01Y', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func095C() ) then
        call SetPlayerUnitAvailableBJ( 'h02C', true, udg_mediv )
    else
    endif
    // D
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func098C() ) then
        call SetPlayerUnitAvailableBJ( 'h00U', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func099C() ) then
        call SetPlayerUnitAvailableBJ( 'h01C', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func100C() ) then
        call SetPlayerUnitAvailableBJ( 'h01N', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func101C() ) then
        call SetPlayerUnitAvailableBJ( 'h01Z', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func102C() ) then
        call SetPlayerUnitAvailableBJ( 'h02D', true, udg_mediv )
    else
    endif
    // F
    set udg_random = GetRandomInt(1, 5)
    if ( Trig_mediv_select_Func105C() ) then
        call SetPlayerUnitAvailableBJ( 'h012', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func106C() ) then
        call SetPlayerUnitAvailableBJ( 'h01D', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func107C() ) then
        call SetPlayerUnitAvailableBJ( 'h01P', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func108C() ) then
        call SetPlayerUnitAvailableBJ( 'h020', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func109C() ) then
        call SetPlayerUnitAvailableBJ( 'h02E', true, udg_mediv )
    else
    endif
    // Z
    set udg_random = GetRandomInt(1, 4)
    if ( Trig_mediv_select_Func112C() ) then
        call SetPlayerUnitAvailableBJ( 'h01E', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func113C() ) then
        call SetPlayerUnitAvailableBJ( 'h01Q', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func114C() ) then
        call SetPlayerUnitAvailableBJ( 'h021', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func115C() ) then
        call SetPlayerUnitAvailableBJ( 'h02F', true, udg_mediv )
    else
    endif
    // X
    set udg_random = GetRandomInt(1, 4)
    if ( Trig_mediv_select_Func118C() ) then
        call SetPlayerUnitAvailableBJ( 'h01F', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func119C() ) then
        call SetPlayerUnitAvailableBJ( 'h01R', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func120C() ) then
        call SetPlayerUnitAvailableBJ( 'h022', true, udg_mediv )
    else
    endif
    if ( Trig_mediv_select_Func121C() ) then
        call SetPlayerUnitAvailableBJ( 'h02G', true, udg_mediv )
    else
    endif
endfunction

//===========================================================================
function InitTrig_mediv_select takes nothing returns nothing
    set gg_trg_mediv_select = CreateTrigger(  )
    call TriggerAddAction( gg_trg_mediv_select, function Trig_mediv_select_Actions )
endfunction

//===========================================================================
// Trigger: change set
//===========================================================================
function Trig_change_set_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004Func004Func004C takes nothing returns boolean
    if ( not ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] == 1 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 400 ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004Func004C takes nothing returns boolean
    if ( not Trig_change_set_Func001Func004Func004Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004Func006C takes nothing returns boolean
    if ( not ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] == 2 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func004C takes nothing returns boolean
    if ( not Trig_change_set_Func001Func004Func006C() ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001Func006C takes nothing returns boolean
    if ( not ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] == 3 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 50 ) ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Func001C takes nothing returns boolean
    if ( not Trig_change_set_Func001Func006C() ) then
        return false
    endif
    return true
endfunction

function Trig_change_set_Actions takes nothing returns nothing
    if ( Trig_change_set_Func001C() ) then
        call IncUnitAbilityLevelSwapped( 'A03T', GetSpellAbilityUnit() )
        call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl" )
        call DestroyEffectBJ( GetLastCreatedEffectBJ() )
        call AdjustPlayerStateBJ( -50, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD )
        set udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] - 1 )
        set udg_mediv = GetOwningPlayer(GetSpellAbilityUnit())
        call TriggerExecute( gg_trg_mediv_select )
    else
        if ( Trig_change_set_Func001Func004C() ) then
            call IncUnitAbilityLevelSwapped( 'A03T', GetSpellAbilityUnit() )
            call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl" )
            call DestroyEffectBJ( GetLastCreatedEffectBJ() )
            call AdjustPlayerStateBJ( -200, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD )
            set udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] - 1 )
            set udg_mediv = GetOwningPlayer(GetSpellAbilityUnit())
            call TriggerExecute( gg_trg_mediv_select )
        else
            if ( Trig_change_set_Func001Func004Func004C() ) then
                call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl" )
                call DestroyEffectBJ( GetLastCreatedEffectBJ() )
                call AdjustPlayerStateBJ( -400, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD )
                set udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = ( udg_changeSet[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] - 1 )
                set udg_mediv = GetOwningPlayer(GetSpellAbilityUnit())
                call TriggerExecute( gg_trg_mediv_select )
                call UnitRemoveAbilityBJ( 'A03T', GetSpellAbilityUnit() )
            else
            endif
        endif
    endif
endfunction

//===========================================================================
function InitTrig_change_set takes nothing returns nothing
    set gg_trg_change_set = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_change_set, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_change_set, Condition( function Trig_change_set_Conditions ) )
    call TriggerAddAction( gg_trg_change_set, function Trig_change_set_Actions )
endfunction

//===========================================================================
// Trigger: assassin
//
// Можно не трогать
//===========================================================================
function Trig_assassin_Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A013', GetEnteringUnit()) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R00M', GetOwningPlayer(GetEnteringUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_assassin_Conditions takes nothing returns boolean
    if ( not Trig_assassin_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_assassin_Actions takes nothing returns nothing
    call UnitAddAbilityBJ( 'A013', GetEnteringUnit() )
endfunction

//===========================================================================
function InitTrig_assassin takes nothing returns nothing
    set gg_trg_assassin = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_assassin, GetEntireMapRect() )
    call TriggerAddCondition( gg_trg_assassin, Condition( function Trig_assassin_Conditions ) )
    call TriggerAddAction( gg_trg_assassin, function Trig_assassin_Actions )
endfunction

//===========================================================================
// Trigger: banshi
//
// Можно не трогать
//===========================================================================
function Trig_banshi_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A01Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ( 'A015', GetSpellTargetUnit() )
endfunction

//===========================================================================
function InitTrig_banshi takes nothing returns nothing
    set gg_trg_banshi = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_banshi, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_banshi, Condition( function Trig_banshi_Conditions ) )
    call TriggerAddAction( gg_trg_banshi, function Trig_banshi_Actions )
endfunction

//===========================================================================
// Trigger: ghost
//
// Можно не трогать
//===========================================================================
function Trig_ghost_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'ewsp' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R01B', GetOwningPlayer(GetDyingUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_Conditions takes nothing returns boolean
    if ( not Trig_ghost_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_Func001Func001001002003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_ghost_Func001Func001001002003002001 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit()) )
endfunction

function Trig_ghost_Func001Func001001002003002002 takes nothing returns boolean
    return ( GetFilterUnit() != GetDyingUnit() )
endfunction

function Trig_ghost_Func001Func001001002003002 takes nothing returns boolean
    return GetBooleanAnd( Trig_ghost_Func001Func001001002003002001(), Trig_ghost_Func001Func001001002003002002() )
endfunction

function Trig_ghost_Func001Func001001002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_ghost_Func001Func001001002003001(), Trig_ghost_Func001Func001001002003002() )
endfunction

function Trig_ghost_Func001Func001A takes nothing returns nothing
    call UnitAddAbilityBJ( 'A021', GetEnumUnit() )
    call IssueImmediateOrderBJ( GetEnumUnit(), "divineshield" )
    call SetUnitLifeBJ( GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + 150.00 ) )
endfunction

function Trig_ghost_Func001Func002001001003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_ghost_Func001Func002001001003002001 takes nothing returns boolean
    return ( GetFilterUnit() != GetDyingUnit() )
endfunction

function Trig_ghost_Func001Func002001001003002002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetDyingUnit()) )
endfunction

function Trig_ghost_Func001Func002001001003002 takes nothing returns boolean
    return GetBooleanAnd( Trig_ghost_Func001Func002001001003002001(), Trig_ghost_Func001Func002001001003002002() )
endfunction

function Trig_ghost_Func001Func002001001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_ghost_Func001Func002001001003001(), Trig_ghost_Func001Func002001001003002() )
endfunction

function Trig_ghost_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRangeOfLocMatching(400.00, GetUnitLoc(GetDyingUnit()), Condition(function Trig_ghost_Func001Func002001001003))) != 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_Actions takes nothing returns nothing
    if ( Trig_ghost_Func001C() ) then
        call ForGroupBJ( GetRandomSubGroup(1, GetUnitsInRangeOfLocMatching(400.00, GetUnitLoc(GetDyingUnit()), Condition(function Trig_ghost_Func001Func001001002003))), function Trig_ghost_Func001Func001A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_ghost takes nothing returns nothing
    set gg_trg_ghost = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ghost, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_ghost, Condition( function Trig_ghost_Conditions ) )
    call TriggerAddAction( gg_trg_ghost, function Trig_ghost_Actions )
endfunction

//===========================================================================
// Trigger: ghost active
//
// Можно не трогать
//===========================================================================
function Trig_ghost_active_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A021' ) ) then
        return false
    endif
    return true
endfunction

function Trig_ghost_active_Actions takes nothing returns nothing
    call TriggerExecute( gg_trg_ghost_del_1 )
endfunction

//===========================================================================
function InitTrig_ghost_active takes nothing returns nothing
    set gg_trg_ghost_active = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ghost_active, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_ghost_active, Condition( function Trig_ghost_active_Conditions ) )
    call TriggerAddAction( gg_trg_ghost_active, function Trig_ghost_active_Actions )
endfunction

//===========================================================================
// Trigger: ghost del 1
//
// Можно не трогать
//===========================================================================
function Trig_ghost_del_1_Actions takes nothing returns nothing
    call TriggerSleepAction( 5.00 )
    call UnitRemoveAbilityBJ( 'A021', GetTriggerUnit() )
endfunction

//===========================================================================
function InitTrig_ghost_del_1 takes nothing returns nothing
    set gg_trg_ghost_del_1 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_ghost_del_1, function Trig_ghost_del_1_Actions )
endfunction

//===========================================================================
// Trigger: rejuvenation
//
// Можно не трогать
//===========================================================================
function Trig_rejuvenation_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A026' ) ) then
        return false
    endif
    return true
endfunction

function Trig_rejuvenation_Func001001002003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_rejuvenation_Func001001002003002 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetSpellAbilityUnit()) )
endfunction

function Trig_rejuvenation_Func001001002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_rejuvenation_Func001001002003001(), Trig_rejuvenation_Func001001002003002() )
endfunction

function Trig_rejuvenation_Func001A takes nothing returns nothing
    call CreateNUnitsAtLoc( 1, 'h00G', GetOwningPlayer(GetSpellAbilityUnit()), GetUnitLoc(GetEnumUnit()), bj_UNIT_FACING )
    call UnitAddAbilityBJ( 'A025', GetLastCreatedUnit() )
    call IssueTargetOrderBJ( GetLastCreatedUnit(), "rejuvination", GetEnumUnit() )
endfunction

function Trig_rejuvenation_Actions takes nothing returns nothing
    call ForGroupBJ( GetRandomSubGroup(5, GetUnitsInRangeOfLocMatching(200.00, GetSpellTargetLoc(), Condition(function Trig_rejuvenation_Func001001002003))), function Trig_rejuvenation_Func001A )
endfunction

//===========================================================================
function InitTrig_rejuvenation takes nothing returns nothing
    set gg_trg_rejuvenation = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_rejuvenation, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_rejuvenation, Condition( function Trig_rejuvenation_Conditions ) )
    call TriggerAddAction( gg_trg_rejuvenation, function Trig_rejuvenation_Actions )
endfunction

//===========================================================================
// Trigger: tip
//
// Можно не трогать
//===========================================================================
function Trig_tip_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_tip_Func001Func003001001003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_tip_Func001Func003001001003002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00Z' )
endfunction

function Trig_tip_Func001Func003001001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_tip_Func001Func003001001003001(), Trig_tip_Func001Func003001001003002() )
endfunction

function Trig_tip_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRangeOfLocMatching(1200.00, GetUnitLoc(GetSpellAbilityUnit()), Condition(function Trig_tip_Func001Func003001001003))) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_tip_Actions takes nothing returns nothing
    if ( Trig_tip_Func001C() ) then
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())), "TRIGSTR_2092" )
    else
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(GetSpellAbilityUnit())), "TRIGSTR_2091" )
    endif
endfunction

//===========================================================================
function InitTrig_tip takes nothing returns nothing
    set gg_trg_tip = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tip, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_tip, Condition( function Trig_tip_Conditions ) )
    call TriggerAddAction( gg_trg_tip, function Trig_tip_Actions )
endfunction

//===========================================================================
// Trigger: gold for gems
//
// Можно не трогать
//===========================================================================
function Trig_gold_for_gems_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02H' ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 250 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_for_gems_Conditions takes nothing returns boolean
    if ( not Trig_gold_for_gems_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_for_gems_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ( -250, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 5, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER )
endfunction

//===========================================================================
function InitTrig_gold_for_gems takes nothing returns nothing
    set gg_trg_gold_for_gems = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_gold_for_gems, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_gold_for_gems, Condition( function Trig_gold_for_gems_Conditions ) )
    call TriggerAddAction( gg_trg_gold_for_gems, function Trig_gold_for_gems_Actions )
endfunction

//===========================================================================
// Trigger: gems for gold
//
// Можно не трогать
//===========================================================================
function Trig_gems_for_gold_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02I' ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER) >= 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gems_for_gold_Conditions takes nothing returns boolean
    if ( not Trig_gems_for_gold_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gems_for_gold_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ( 250, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( -5, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_LUMBER )
endfunction

//===========================================================================
function InitTrig_gems_for_gold takes nothing returns nothing
    set gg_trg_gems_for_gold = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_gems_for_gold, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_gems_for_gold, Condition( function Trig_gems_for_gold_Conditions ) )
    call TriggerAddAction( gg_trg_gems_for_gold, function Trig_gems_for_gold_Actions )
endfunction

//===========================================================================
// Trigger: sea dragon
//
// Можно не трогать
//===========================================================================
function Trig_sea_dragon_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'nsnp' ) ) then
        return false
    endif
    if ( not ( GetUnitAbilityLevelSwapped('A032', GetEnteringUnit()) == 0 ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R02C', GetOwningPlayer(GetEnteringUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_sea_dragon_Conditions takes nothing returns boolean
    if ( not Trig_sea_dragon_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_sea_dragon_Actions takes nothing returns nothing
    call UnitAddAbilityBJ( 'A032', GetEnteringUnit() )
endfunction

//===========================================================================
function InitTrig_sea_dragon takes nothing returns nothing
    set gg_trg_sea_dragon = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_sea_dragon, GetEntireMapRect() )
    call TriggerAddCondition( gg_trg_sea_dragon, Condition( function Trig_sea_dragon_Conditions ) )
    call TriggerAddAction( gg_trg_sea_dragon, function Trig_sea_dragon_Actions )
endfunction

//===========================================================================
// Trigger: boss ini start
//===========================================================================
function Trig_boss_ini_start_Func004C takes nothing returns boolean
    if ( not ( udg_wave == ( udg_wave_mini[1] - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_ini_start_Func009C takes nothing returns boolean
    if ( not ( CountPlayersInForceBJ(udg_players_group) < 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_ini_start_Actions takes nothing returns nothing
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(11) )
    set udg_boss_time = 300.00
    if ( Trig_boss_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'n000', Player(11), GetRectCenter(gg_rct_waveunitsCENTRE), bj_UNIT_FACING )
        set udg_boss = GetLastCreatedUnit()
        call SetUnitColor( GetLastCreatedUnit(), PLAYER_COLOR_RED )
        call EnableTrigger( gg_trg_spells_check )
    else
    endif
    call PauseUnitBJ( true, udg_boss )
    call SetUnitInvulnerable( udg_boss, true )
    call SetUnitLifePercentBJ( udg_boss, ( 12.50 * I2R(CountPlayersInForceBJ(udg_players_group)) ) )
    set udg_boss_hp = GetUnitLifePercent(udg_boss)
    if ( Trig_boss_ini_start_Func009C() ) then
        call UnitAddAbilityBJ( 'A01B', udg_boss )
        call SetUnitAbilityLevelSwapped( 'A01B', udg_boss, CountPlayersInForceBJ(udg_players_group) )
    else
    endif
    call TriggerSleepAction( 2 )
    call EnableTrigger( gg_trg_boss_end )
    call EnableTrigger( gg_trg_boss_end_timer )
    call PauseUnitBJ( false, udg_boss )
    call SetUnitInvulnerable( udg_boss, false )
endfunction

//===========================================================================
function InitTrig_boss_ini_start takes nothing returns nothing
    set gg_trg_boss_ini_start = CreateTrigger(  )
    call TriggerAddAction( gg_trg_boss_ini_start, function Trig_boss_ini_start_Actions )
endfunction

//===========================================================================
// Trigger: boss ini finish
//===========================================================================
function Trig_boss_ini_finish_Func005A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_boss_ini_finish_Func006A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_boss_ini_finish_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_spells_check )
    call QueuedTriggerRemoveBJ( gg_trg_spell_1 )
    call DisableTrigger( gg_trg_spell_2 )
    call DisableTrigger( gg_trg_spell_4 )
    call ForGroupBJ( GetUnitsOfPlayerAll(GetOwningPlayer(udg_boss)), function Trig_boss_ini_finish_Func005A )
    call ForGroupBJ( udg_wave_units, function Trig_boss_ini_finish_Func006A )
    call GroupClear( udg_wave_units )
    set udg_boss_wave = false
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, false, Player(11) )
    set udg_j = 0
    loop
        exitwhen udg_j > 5
        set udg_boss_phase[udg_j] = false
        set udg_j = udg_j + 1
    endloop
endfunction

//===========================================================================
function InitTrig_boss_ini_finish takes nothing returns nothing
    set gg_trg_boss_ini_finish = CreateTrigger(  )
    call TriggerAddAction( gg_trg_boss_ini_finish, function Trig_boss_ini_finish_Actions )
endfunction

//===========================================================================
// Trigger: boss end timer
//===========================================================================
function Trig_boss_end_timer_Conditions takes nothing returns boolean
    if ( not ( udg_wave_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_timer_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(udg_boss) == 'n000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_timer_Actions takes nothing returns nothing
    call DestroyTimerDialogBJ( GetLastCreatedTimerDialogBJ() )
    if ( Trig_boss_end_timer_Func004C() ) then
        set bj_forLoopBIndex = 1
        set bj_forLoopBIndexEnd = ( 20 + ( 3 * CountPlayersInForceBJ(udg_players_group) ) )
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call CreateNUnitsAtLoc( 1, 'nlv1', Player(11), PolarProjectionBJ(GetUnitLoc(udg_boss), GetRandomReal(0, 1024.00), GetRandomDirectionDeg()), bj_UNIT_FACING )
            call IssuePointOrderLocBJ( GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)) )
            call SetUnitVertexColorBJ( GetLastCreatedUnit(), 10.00, 10.00, 10.00, 0.00 )
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
    else
    endif
endfunction

//===========================================================================
function InitTrig_boss_end_timer takes nothing returns nothing
    set gg_trg_boss_end_timer = CreateTrigger(  )
    call DisableTrigger( gg_trg_boss_end_timer )
    call TriggerRegisterTimerExpireEventBJ( gg_trg_boss_end_timer, udg_boss_end_timer )
    call TriggerAddCondition( gg_trg_boss_end_timer, Condition( function Trig_boss_end_timer_Conditions ) )
    call TriggerAddAction( gg_trg_boss_end_timer, function Trig_boss_end_timer_Actions )
endfunction

//===========================================================================
// Trigger: boss end
//===========================================================================
function Trig_boss_end_Func001Func001A takes nothing returns nothing
    call AdjustPlayerStateBJ( udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )
    call DisplayTimedTextToForce( GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Бонус золота за прохождение босса (x2 доход): |cFFFFCD00" + I2S(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())]) ) )
    call AdjustPlayerStateBJ( udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER )
    call DisplayTimedTextToForce( GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Бонус самоцветов за прохождение босса (x2 доход): |cFFB23AEE" + I2S(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]) ) )
endfunction

function Trig_boss_end_Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(udg_boss) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_Func002Func001C takes nothing returns boolean
    if ( ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return true
    endif
    if ( ( IsUnitAliveBJ(udg_boss) == false ) ) then
        return true
    endif
    return false
endfunction

function Trig_boss_end_Func002Func005A takes nothing returns nothing
    call SetUnitInvulnerable( GetEnumUnit(), false )
endfunction

function Trig_boss_end_Func002Func010Func001A takes nothing returns nothing
    call PauseUnitBJ( false, GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func010Func002001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_boss_end_Func002Func010Func002A takes nothing returns nothing
    call PauseUnitBJ( false, GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func010C takes nothing returns boolean
    if ( not ( udg_building_status == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_Func002Func011A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func012A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func013A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func014A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func015A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func016A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func017A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func018A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func019A takes nothing returns nothing
    call SetUnitVertexColorBJ( GetEnumUnit(), 100.00, 100.00, 100.00, 0 )
    call ShowUnitHide( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func020A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func021A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func022A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func023A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_boss_end_Func002Func024A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0.50 )
    call AdjustPlayerStateBJ( udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )
    call DisplayTimedTextToForce( GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход золота: |cFFFFCD00" + I2S(udg_income_gold[GetConvertedPlayerId(GetEnumPlayer())]) ) )
    call AdjustPlayerStateBJ( udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER )
    call DisplayTimedTextToForce( GetForceOfPlayer(GetEnumPlayer()), 10.00, ( "Доход самоцветов: |cFFB23AEE" + I2S(udg_income_wood[GetConvertedPlayerId(GetEnumPlayer())]) ) )
endfunction

function Trig_boss_end_Func002Func028A takes nothing returns nothing
    call DestructableRestoreLife( GetEnumDestructable(), GetDestructableMaxLife(GetEnumDestructable()), false )
endfunction

function Trig_boss_end_Func002C takes nothing returns boolean
    if ( not Trig_boss_end_Func002Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_boss_end_Actions takes nothing returns nothing
    if ( Trig_boss_end_Func001C() ) then
        call ForForce( udg_players_group, function Trig_boss_end_Func001Func001A )
    else
    endif
    if ( Trig_boss_end_Func002C() ) then
        call TriggerExecute( gg_trg_boss_ini_finish )
        call DisableTrigger( gg_trg_boss_end_timer )
        call DisableTrigger( gg_trg_building_inf )
        call ForGroupBJ( udg_buildings, function Trig_boss_end_Func002Func005A )
        set udg_wave_status = false
        call DisableTrigger( GetTriggeringTrigger() )
        call DestroyTimerDialogBJ( GetLastCreatedTimerDialogBJ() )
        call PlaySoundBJ( gg_snd_QuestCompleted )
        if ( Trig_boss_end_Func002Func010C() ) then
            call ForGroupBJ( udg_buildings, function Trig_boss_end_Func002Func010Func001A )
            call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_boss_end_Func002Func010Func002001002)), function Trig_boss_end_Func002Func010Func002A )
        else
        endif
        call ForGroupBJ( udg_light[0], function Trig_boss_end_Func002Func011A )
        call ForGroupBJ( udg_light[1], function Trig_boss_end_Func002Func012A )
        call ForGroupBJ( udg_light[2], function Trig_boss_end_Func002Func013A )
        call ForGroupBJ( udg_light[3], function Trig_boss_end_Func002Func014A )
        call ForGroupBJ( udg_light[4], function Trig_boss_end_Func002Func015A )
        call ForGroupBJ( udg_light[5], function Trig_boss_end_Func002Func016A )
        call ForGroupBJ( udg_light[6], function Trig_boss_end_Func002Func017A )
        call ForGroupBJ( udg_light[7], function Trig_boss_end_Func002Func018A )
        call ForGroupBJ( udg_light[8], function Trig_boss_end_Func002Func019A )
        call ForGroupBJ( GetUnitsOfTypeIdAll('n006'), function Trig_boss_end_Func002Func020A )
        call ForGroupBJ( GetUnitsOfTypeIdAll('n003'), function Trig_boss_end_Func002Func021A )
        call ForGroupBJ( GetUnitsOfTypeIdAll('n004'), function Trig_boss_end_Func002Func022A )
        call ForGroupBJ( GetUnitsOfTypeIdAll('n005'), function Trig_boss_end_Func002Func023A )
        call ForForce( udg_players_group, function Trig_boss_end_Func002Func024A )
        call TriggerExecute( gg_trg_income_effects )
        call EnumDestructablesInCircleBJ( 5632.00, GetRectCenter(GetPlayableMapRect()), function Trig_boss_end_Func002Func028A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_boss_end takes nothing returns nothing
    set gg_trg_boss_end = CreateTrigger(  )
    call DisableTrigger( gg_trg_boss_end )
    call TriggerRegisterTimerEventPeriodic( gg_trg_boss_end, 0.50 )
    call TriggerAddAction( gg_trg_boss_end, function Trig_boss_end_Actions )
endfunction

//===========================================================================
// Trigger: spells check
//===========================================================================
function Trig_spells_check_Func001Func001C takes nothing returns boolean
    if ( not ( udg_boss_phase[0] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.87 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func001C takes nothing returns boolean
    if ( not Trig_spells_check_Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func002Func005C takes nothing returns boolean
    if ( not ( udg_boss_phase[1] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.74 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func002C takes nothing returns boolean
    if ( not Trig_spells_check_Func002Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func003Func004C takes nothing returns boolean
    if ( not ( udg_boss_phase[2] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.61 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func003C takes nothing returns boolean
    if ( not Trig_spells_check_Func003Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func004Func009C takes nothing returns boolean
    if ( not ( udg_boss_phase[3] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.48 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func004C takes nothing returns boolean
    if ( not Trig_spells_check_Func004Func009C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func005Func004003001001003 takes nothing returns boolean
    return ( IsUnitInGroup(GetFilterUnit(), udg_wave_units) == true )
endfunction

function Trig_spells_check_Func005Func005C takes nothing returns boolean
    if ( not ( udg_boss_phase[4] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.35 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func005C takes nothing returns boolean
    if ( not Trig_spells_check_Func005Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func006Func007001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00H' )
endfunction

function Trig_spells_check_Func006Func007A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_spells_check_Func006Func013C takes nothing returns boolean
    if ( not ( udg_boss_phase[5] == false ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(udg_boss) <= ( 0.22 * udg_boss_hp ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Func006C takes nothing returns boolean
    if ( not Trig_spells_check_Func006Func013C() ) then
        return false
    endif
    return true
endfunction

function Trig_spells_check_Actions takes nothing returns nothing
    if ( Trig_spells_check_Func001C() ) then
        call ConditionalTriggerExecute( gg_trg_spell_1 )
        set udg_boss_phase[0] = true
        call PlaySoundBJ( gg_snd_BloodElfMageReady1 )
    else
    endif
    if ( Trig_spells_check_Func002C() ) then
        set udg_boss_phase[1] = true
        set udg_k = 1
        loop
            exitwhen udg_k > 11
            call CreateNUnitsAtLoc( 1, 'h00H', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), ( 68.00 * I2R(udg_k) ), 90.00), bj_UNIT_FACING )
            set udg_k = udg_k + 1
        endloop
        call EnableTrigger( gg_trg_spell_2 )
        call PlaySoundBJ( gg_snd_BloodElfMageWarcry1 )
    else
    endif
    if ( Trig_spells_check_Func003C() ) then
        set udg_boss_phase[2] = true
        set udg_k = 1
        loop
            exitwhen udg_k > ( CountPlayersInForceBJ(udg_players_group) + ( ( CountPlayersInForceBJ(udg_players_group) * CountPlayersInForceBJ(udg_players_group) ) / 5 ) )
            call CreateNUnitsAtLoc( 1, 'h00G', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), GetRandomReal(512.00, 2512.00), GetRandomDirectionDeg()), bj_UNIT_FACING )
            call UnitAddAbilityBJ( 'A00Q', GetLastCreatedUnit() )
            call IssueImmediateOrderBJ( GetLastCreatedUnit(), "lavamonster" )
            set udg_k = udg_k + 1
        endloop
        call PlaySoundBJ( gg_snd_BloodElfMageYesAttack1 )
    else
    endif
    if ( Trig_spells_check_Func004C() ) then
        set udg_boss_phase[3] = true
        call PlaySoundBJ( gg_snd_BloodElfMageYesAttack3 )
        call SetUnitInvulnerable( udg_boss, true )
        call UnitAddAbilityBJ( 'A00R', udg_boss )
        call SetUnitAbilityLevelSwapped( 'A00R', udg_boss, ( CountPlayersInForceBJ(udg_players_group) / 2 ) )
        call IssuePointOrderLocBJ( udg_boss, "volcano", GetUnitLoc(udg_boss) )
        call TriggerSleepAction( 24.00 )
        call SetUnitInvulnerable( udg_boss, false )
    else
    endif
    if ( Trig_spells_check_Func005C() ) then
        set udg_boss_phase[4] = true
        call PlaySoundBJ( gg_snd_BloodElfMageReady1 )
        call UnitAddAbilityBJ( 'A00S', udg_boss )
        call IssuePointOrderLocBJ( udg_boss, "stampede", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(900.00, GetUnitLoc(udg_boss), Condition(function Trig_spells_check_Func005Func004003001001003)))) )
    else
    endif
    if ( Trig_spells_check_Func006C() ) then
        set udg_boss_phase[5] = true
        call PlaySoundBJ( gg_snd_BloodElfMagePissed1 )
        call SetUnitVertexColorBJ( udg_boss, 100, 60.00, 0.00, 0 )
        call AddSpecialEffectTargetUnitBJ( "left,hand", udg_boss, "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl" )
        call AddSpecialEffectTargetUnitBJ( "right,hand", udg_boss, "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl" )
        call UnitAddAbilityBJ( 'A00N', udg_boss )
        call ForGroupBJ( GetUnitsOfPlayerMatching(GetOwningPlayer(udg_boss), Condition(function Trig_spells_check_Func006Func007001002)), function Trig_spells_check_Func006Func007A )
        call DisableTrigger( gg_trg_spell_2 )
        set udg_k = 0
        set udg_boss_spell_integer = 0
        set udg_k = 1
        loop
            exitwhen udg_k > 11
            call CreateNUnitsAtLoc( 1, 'h00H', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), ( 68.00 * I2R(udg_k) ), 90.00), bj_UNIT_FACING )
            set udg_k = udg_k + 1
        endloop
        call EnableTrigger( gg_trg_spell_4 )
    else
    endif
endfunction

//===========================================================================
function InitTrig_spells_check takes nothing returns nothing
    set gg_trg_spells_check = CreateTrigger(  )
    call DisableTrigger( gg_trg_spells_check )
    call TriggerRegisterTimerEventPeriodic( gg_trg_spells_check, 1.00 )
    call TriggerAddAction( gg_trg_spells_check, function Trig_spells_check_Actions )
endfunction

//===========================================================================
// Trigger: spell 1
//===========================================================================
function Trig_spell_1_Actions takes nothing returns nothing
    set udg_j = 1
    loop
        exitwhen udg_j > 10
        call CreateNUnitsAtLoc( 1, 'h00G', GetOwningPlayer(udg_boss), PolarProjectionBJ(GetUnitLoc(udg_boss), GetRandomReal(175.00, 900.00), GetRandomDirectionDeg()), bj_UNIT_FACING )
        call UnitAddAbilityBJ( 'A00O', GetLastCreatedUnit() )
        call IssuePointOrderLocBJ( GetLastCreatedUnit(), "flamestrike", GetUnitLoc(GetLastCreatedUnit()) )
        call TriggerSleepAction( 4.00 )
        set udg_j = udg_j + 1
    endloop
endfunction

//===========================================================================
function InitTrig_spell_1 takes nothing returns nothing
    set gg_trg_spell_1 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_spell_1, function Trig_spell_1_Actions )
endfunction

//===========================================================================
// Trigger: spell 2
//===========================================================================
function Trig_spell_2_Func002A takes nothing returns nothing
    set udg_k = ( udg_k + 1 )
    call SetUnitPositionLoc( GetEnumUnit(), PolarProjectionBJ(GetUnitLoc(udg_boss), ( 68.00 * I2R(udg_k) ), ( 1.13 * I2R(udg_boss_spell_integer) )) )
endfunction

function Trig_spell_2_Func004Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_spell_2_Func004C takes nothing returns boolean
    if ( not ( udg_boss_spell_integer >= 2000 ) ) then
        return false
    endif
    return true
endfunction

function Trig_spell_2_Actions takes nothing returns nothing
    set udg_boss_spell_integer = ( udg_boss_spell_integer + 1 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00H'), function Trig_spell_2_Func002A )
    set udg_k = 0
    if ( Trig_spell_2_Func004C() ) then
        call DisableTrigger( GetTriggeringTrigger() )
        call ForGroupBJ( GetUnitsOfTypeIdAll('h00H'), function Trig_spell_2_Func004Func002A )
        set udg_boss_spell_integer = 0
    else
    endif
endfunction

//===========================================================================
function InitTrig_spell_2 takes nothing returns nothing
    set gg_trg_spell_2 = CreateTrigger(  )
    call DisableTrigger( gg_trg_spell_2 )
    call TriggerRegisterTimerEventPeriodic( gg_trg_spell_2, 0.05 )
    call TriggerAddAction( gg_trg_spell_2, function Trig_spell_2_Actions )
endfunction

//===========================================================================
// Trigger: spell 3
//===========================================================================
function Trig_spell_3_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'nlv1' ) ) then
        return false
    endif
    return true
endfunction

function Trig_spell_3_Actions takes nothing returns nothing
    call SetUnitPathing( GetEnteringUnit(), false )
    call IssuePointOrderLocBJ( GetEnteringUnit(), "attack", GetUnitLoc(udg_boss) )
endfunction

//===========================================================================
function InitTrig_spell_3 takes nothing returns nothing
    set gg_trg_spell_3 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_spell_3, GetEntireMapRect() )
    call TriggerAddCondition( gg_trg_spell_3, Condition( function Trig_spell_3_Conditions ) )
    call TriggerAddAction( gg_trg_spell_3, function Trig_spell_3_Actions )
endfunction

//===========================================================================
// Trigger: spell 4
//===========================================================================
function Trig_spell_4_Func002A takes nothing returns nothing
    set udg_k = ( udg_k + 1 )
    call SetUnitPositionLoc( GetEnumUnit(), PolarProjectionBJ(GetUnitLoc(udg_boss), ( ( I2R(udg_k) * GetRandomReal(77.00, 238.00) ) * 1.00 ), ( 1.13 * I2R(udg_boss_spell_integer) )) )
endfunction

function Trig_spell_4_Func004Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_spell_4_Func004C takes nothing returns boolean
    if ( not ( udg_boss_spell_integer >= 800 ) ) then
        return false
    endif
    return true
endfunction

function Trig_spell_4_Actions takes nothing returns nothing
    set udg_boss_spell_integer = ( udg_boss_spell_integer + 1 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00H'), function Trig_spell_4_Func002A )
    set udg_k = 0
    if ( Trig_spell_4_Func004C() ) then
        call DisableTrigger( GetTriggeringTrigger() )
        call ForGroupBJ( GetUnitsOfTypeIdAll('h00H'), function Trig_spell_4_Func004Func002A )
        set udg_boss_spell_integer = 0
    else
    endif
endfunction

//===========================================================================
function InitTrig_spell_4 takes nothing returns nothing
    set gg_trg_spell_4 = CreateTrigger(  )
    call DisableTrigger( gg_trg_spell_4 )
    call TriggerRegisterTimerEventPeriodic( gg_trg_spell_4, 0.05 )
    call TriggerAddAction( gg_trg_spell_4, function Trig_spell_4_Actions )
endfunction

//===========================================================================
// Trigger: hunter death
//===========================================================================
function Trig_hunter_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'Ewar' ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_death_Func004Func001A takes nothing returns nothing
endfunction

function Trig_hunter_death_Func004C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_death_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple( GetDyingUnit(), udg_wave_units )
    call SetHeroLevelBJ( GetKillingUnitBJ(), ( GetHeroLevel(GetKillingUnitBJ()) + 1 ), true )
    call RemoveUnit( GetDyingUnit() )
    if ( Trig_hunter_death_Func004C() ) then
        call ForGroupBJ( GetUnitsOfTypeIdAll('Ewar'), function Trig_hunter_death_Func004Func001A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_hunter_death takes nothing returns nothing
    set gg_trg_hunter_death = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hunter_death, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_hunter_death, Condition( function Trig_hunter_death_Conditions ) )
    call TriggerAddAction( gg_trg_hunter_death, function Trig_hunter_death_Actions )
endfunction

//===========================================================================
// Trigger: hunter time
//===========================================================================
function Trig_hunter_time_Func004C takes nothing returns boolean
    if ( not ( udg_k >= ( 9 - CountPlayersInForceBJ(udg_players_group) ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_time_Actions takes nothing returns nothing
    call IssuePointOrderLocBJ( GroupPickRandomUnit(GetUnitsOfPlayerAll(Player(11))), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)) )
    set udg_j = 1
    loop
        exitwhen udg_j > CountPlayersInForceBJ(udg_players_group)
        call CreateItemLoc( 'gold', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), GetRandomReal(0, 5200.00), GetRandomDirectionDeg()) )
        set udg_j = udg_j + 1
    endloop
    set udg_k = ( udg_k + 1 )
    if ( Trig_hunter_time_Func004C() ) then
        set udg_k = 0
        call CreateNUnitsAtLoc( 1, 'nlv1', Player(11), PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), GetRandomReal(0, 5000.00), GetRandomDirectionDeg()), bj_UNIT_FACING )
        call IssuePointOrderLocBJ( GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)) )
        call SetUnitVertexColorBJ( GetLastCreatedUnit(), 10.00, 10.00, 10.00, 0.00 )
    else
    endif
endfunction

//===========================================================================
function InitTrig_hunter_time takes nothing returns nothing
    set gg_trg_hunter_time = CreateTrigger(  )
    call DisableTrigger( gg_trg_hunter_time )
    call TriggerRegisterTimerEventPeriodic( gg_trg_hunter_time, 1.30 )
    call TriggerAddAction( gg_trg_hunter_time, function Trig_hunter_time_Actions )
endfunction

//===========================================================================
// Trigger: hunter end
//
// Оптимизировать!!!
//===========================================================================
function Trig_hunter_end_Func002001002 takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == 'gold' )
endfunction

function Trig_hunter_end_Func003C takes nothing returns boolean
    if ( not ( udg_k >= 2200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hunter_end_Actions takes nothing returns nothing
    set udg_k = ( udg_k + 1 )
    call RemoveItem( RandomItemInRectBJ(GetPlayableMapRect(), Condition(function Trig_hunter_end_Func002001002)) )
    if ( Trig_hunter_end_Func003C() ) then
        call DisableTrigger( GetTriggeringTrigger() )
        set udg_k = 0
    else
    endif
endfunction

//===========================================================================
function InitTrig_hunter_end takes nothing returns nothing
    set gg_trg_hunter_end = CreateTrigger(  )
    call DisableTrigger( gg_trg_hunter_end )
    call TriggerRegisterTimerEventPeriodic( gg_trg_hunter_end, 0.04 )
    call TriggerAddAction( gg_trg_hunter_end, function Trig_hunter_end_Actions )
endfunction

//===========================================================================
// Trigger: zombie ini start
//===========================================================================
function Trig_zombie_ini_start_Func001A takes nothing returns nothing
    call SetPlayerTechMaxAllowedSwap( 'hhou', 20, GetEnumPlayer() )
endfunction

function Trig_zombie_ini_start_Actions takes nothing returns nothing
    call ForForce( udg_players_group, function Trig_zombie_ini_start_Func001A )
    call SetDayNightModels( "", "" )
    set udg_k = 1
    loop
        exitwhen udg_k > 8
        call CreateDestructableLoc( 'B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 4096.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0 )
        call CreateDestructableLoc( 'B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 3072.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0 )
        call CreateDestructableLoc( 'B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 2048.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0 )
        call CreateDestructableLoc( 'B008', PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), 1024.00, ( 45.00 * I2R(udg_k) )), GetRandomDirectionDeg(), 2.00, 0 )
        set udg_k = udg_k + 1
    endloop
    call CreateDestructableLoc( 'B008', GetRectCenter(gg_rct_centreCENTRE), GetRandomDirectionDeg(), 2.00, 0 )
    call CreateDestructableLoc( 'B008', GetRectCenter(gg_rct_upright), GetRandomDirectionDeg(), 2.00, 0 )
    call CreateDestructableLoc( 'B008', GetRectCenter(gg_rct_downright), GetRandomDirectionDeg(), 2.00, 0 )
    call CreateDestructableLoc( 'B008', GetRectCenter(gg_rct_downleft), GetRandomDirectionDeg(), 2.00, 0 )
    call CreateDestructableLoc( 'B008', GetRectCenter(gg_rct_upleft), GetRandomDirectionDeg(), 2.00, 0 )
    call TriggerSleepAction( 30.00 )
    set udg_k = 0
    call EnableTrigger( gg_trg_zombie_spawn )
endfunction

//===========================================================================
function InitTrig_zombie_ini_start takes nothing returns nothing
    set gg_trg_zombie_ini_start = CreateTrigger(  )
    call TriggerAddAction( gg_trg_zombie_ini_start, function Trig_zombie_ini_start_Actions )
endfunction

//===========================================================================
// Trigger: zombie ini finish
//===========================================================================
function Trig_zombie_ini_finish_Func004Func001C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetEnumDestructable()) == 'B008' ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_ini_finish_Func004A takes nothing returns nothing
    if ( Trig_zombie_ini_finish_Func004Func001C() ) then
        call RemoveDestructable( GetEnumDestructable() )
    else
    endif
endfunction

function Trig_zombie_ini_finish_Func005A takes nothing returns nothing
    call SetPlayerAllianceBJ( GetEnumPlayer(), ALLIANCE_PASSIVE, false, Player(11) )
    call SetPlayerAllianceBJ( Player(11), ALLIANCE_PASSIVE, false, GetEnumPlayer() )
endfunction

function Trig_zombie_ini_finish_Func006A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_zombie_ini_finish_Func007Func001Func001A takes nothing returns nothing
    call AdjustPlayerStateBJ( ( 150 + ( 25 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
endfunction

function Trig_zombie_ini_finish_Func007Func001A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'nzom'), function Trig_zombie_ini_finish_Func007Func001Func001A )
endfunction

function Trig_zombie_ini_finish_Func007Func004Func001A takes nothing returns nothing
    call AdjustPlayerStateBJ( ( 325 + ( 35 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
endfunction

function Trig_zombie_ini_finish_Func007Func004A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'h00I'), function Trig_zombie_ini_finish_Func007Func004Func001A )
endfunction

function Trig_zombie_ini_finish_Func007Func007001001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00I' )
endfunction

function Trig_zombie_ini_finish_Func007Func007001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_zombie_ini_finish_Func007Func007001001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_zombie_ini_finish_Func007Func007001001002001(), Trig_zombie_ini_finish_Func007Func007001001002002() )
endfunction

function Trig_zombie_ini_finish_Func007C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_zombie_ini_finish_Func007Func007001001002))) > 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_ini_finish_Func008A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_zombie_ini_finish_Func009A takes nothing returns nothing
    call GroupRemoveUnitSimple( GetEnumUnit(), udg_wave_units )
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_zombie_ini_finish_Actions takes nothing returns nothing
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl" , "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call DisableTrigger( gg_trg_zombie_spawn )
    call EnumDestructablesInRectAll( GetPlayableMapRect(), function Trig_zombie_ini_finish_Func004A )
    call ForForce( udg_players_group, function Trig_zombie_ini_finish_Func005A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('hhou'), function Trig_zombie_ini_finish_Func006A )
    if ( Trig_zombie_ini_finish_Func007C() ) then
        call ForForce( udg_players_group, function Trig_zombie_ini_finish_Func007Func004A )
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, "TRIGSTR_484" )
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Все выжившие игроки получают |cFFFFCD00" + ( I2S(( 325 + ( 35 * udg_wave ) )) + "|r ед. золота!" ) ) )
    else
        call ForForce( udg_players_group, function Trig_zombie_ini_finish_Func007Func001A )
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, "TRIGSTR_3793" )
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Все игроки получают |cFFFFCD00" + ( I2S(( 150 + ( 25 * udg_wave ) )) + "|r ед. золота!" ) ) )
    endif
    call ForGroupBJ( GetUnitsOfTypeIdAll('nzom'), function Trig_zombie_ini_finish_Func008A )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00I'), function Trig_zombie_ini_finish_Func009A )
endfunction

//===========================================================================
function InitTrig_zombie_ini_finish takes nothing returns nothing
    set gg_trg_zombie_ini_finish = CreateTrigger(  )
    call TriggerAddAction( gg_trg_zombie_ini_finish, function Trig_zombie_ini_finish_Actions )
endfunction

//===========================================================================
// Trigger: zombie death
//===========================================================================
function Trig_zombie_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'h00I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_death_Func002A takes nothing returns nothing
    call SetPlayerAllianceBJ( GetOwningPlayer(GetDyingUnit()), ALLIANCE_PASSIVE, false, GetEnumPlayer() )
    call SetPlayerAllianceBJ( GetEnumPlayer(), ALLIANCE_PASSIVE, false, GetOwningPlayer(GetDyingUnit()) )
endfunction

function Trig_zombie_death_Func010Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_zombie_death_Func010Func003001001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00I' )
endfunction

function Trig_zombie_death_Func010Func003001001002002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_zombie_death_Func010Func003001001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_zombie_death_Func010Func003001001002001(), Trig_zombie_death_Func010Func003001001002002() )
endfunction

function Trig_zombie_death_Func010C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_zombie_death_Func010Func003001001002))) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_death_Actions takes nothing returns nothing
    call ForForce( udg_players_group, function Trig_zombie_death_Func002A )
    call SetPlayerAllianceBJ( GetOwningPlayer(GetDyingUnit()), ALLIANCE_PASSIVE, true, Player(11) )
    call SetPlayerAllianceBJ( Player(11), ALLIANCE_PASSIVE, true, GetOwningPlayer(GetDyingUnit()) )
    call CreateNUnitsAtLoc( 1, 'nzom', GetOwningPlayer(GetDyingUnit()), GetUnitLoc(GetDyingUnit()), bj_UNIT_FACING )
    call IssuePointOrderLocBJ( GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)) )
    call UnitAddAbilityBJ( 'A00U', GetLastCreatedUnit() )
    call UnitAddAbilityBJ( 'A00V', GetLastCreatedUnit() )
    call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(GetOwningPlayer(GetLastCreatedUnit())) )
    if ( Trig_zombie_death_Func010C() ) then
        call TriggerExecute( gg_trg_zombie_ini_finish )
        call ForGroupBJ( GetUnitsOfTypeIdAll('nzom'), function Trig_zombie_death_Func010Func002A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_zombie_death takes nothing returns nothing
    set gg_trg_zombie_death = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_zombie_death, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_zombie_death, Condition( function Trig_zombie_death_Conditions ) )
    call TriggerAddAction( gg_trg_zombie_death, function Trig_zombie_death_Actions )
endfunction

//===========================================================================
// Trigger: zombie spawn
//===========================================================================
function Trig_zombie_spawn_Func002C takes nothing returns boolean
    if ( not ( udg_k >= ( 9 - CountPlayersInForceBJ(udg_players_group) ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_zombie_spawn_Actions takes nothing returns nothing
    set udg_k = ( udg_k + 1 )
    if ( Trig_zombie_spawn_Func002C() ) then
        set udg_k = 0
        call CreateNUnitsAtLoc( 1, 'nzom', Player(11), PolarProjectionBJ(GetRectCenter(gg_rct_centreCENTRE), GetRandomReal(0, 5000.00), GetRandomDirectionDeg()), bj_UNIT_FACING )
        call IssuePointOrderLocBJ( GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(udg_wave_units)) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_zombie_spawn takes nothing returns nothing
    set gg_trg_zombie_spawn = CreateTrigger(  )
    call DisableTrigger( gg_trg_zombie_spawn )
    call TriggerRegisterTimerEventPeriodic( gg_trg_zombie_spawn, 1.00 )
    call TriggerAddAction( gg_trg_zombie_spawn, function Trig_zombie_spawn_Actions )
endfunction

//===========================================================================
// Trigger: gold ini start
//===========================================================================
function Trig_gold_ini_start_Func001Func001A takes nothing returns nothing
    call PauseUnitBJ( true, GetEnumUnit() )
endfunction

function Trig_gold_ini_start_Func001A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAll(GetEnumPlayer()), function Trig_gold_ini_start_Func001Func001A )
endfunction

function Trig_gold_ini_start_Func004A takes nothing returns nothing
    call SetCameraBoundsToRectForPlayerBJ( GetEnumPlayer(), gg_rct_roulette )
    call CreateNUnitsAtLoc( 1, 'h00X', GetEnumPlayer(), GetRandomLocInRect(gg_rct_roulettespawn), bj_UNIT_FACING )
    call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    call SelectUnitForPlayerSingle( GetLastCreatedUnit(), GetEnumPlayer() )
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetUnitLoc(GetLastCreatedUnit()), 0 )
endfunction

function Trig_gold_ini_start_Func006A takes nothing returns nothing
    call UnitAddAbilityBJ( 'A00U', GetEnumUnit() )
    call SetUnitColor( GetEnumUnit(), GetPlayerColor(GetOwningPlayer(GetEnumUnit())) )
endfunction

function Trig_gold_ini_start_Actions takes nothing returns nothing
    call ForForce( udg_players_group, function Trig_gold_ini_start_Func001A )
    call TriggerSleepAction( 0.30 )
    call EnableTrigger( gg_trg_gold_bet )
    call ForForce( udg_players_group, function Trig_gold_ini_start_Func004A )
    call TriggerSleepAction( 0.10 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00X'), function Trig_gold_ini_start_Func006A )
endfunction

//===========================================================================
function InitTrig_gold_ini_start takes nothing returns nothing
    set gg_trg_gold_ini_start = CreateTrigger(  )
    call TriggerAddAction( gg_trg_gold_ini_start, function Trig_gold_ini_start_Actions )
endfunction

//===========================================================================
// Trigger: gold bet
//===========================================================================
function Trig_gold_bet_Func002C takes nothing returns boolean
    if ( ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gold" ) ) then
        return true
    endif
    if ( ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gems" ) ) then
        return true
    endif
    return false
endfunction

function Trig_gold_bet_Conditions takes nothing returns boolean
    if ( not Trig_gold_bet_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func002Func001C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 0 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func002C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func002Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func003Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 11 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 25 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func003C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func003Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func004Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 26 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 50 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func004C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func004Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func005Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 51 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002Func005C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func001Func002Func005Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gems" ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func003Func001C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 0 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func003C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func003Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func004Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 201 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 500 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func004C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func004Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func005Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 501 ) ) then
        return false
    endif
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) <= 1000 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func005C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func005Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func006Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 7, 11)) >= 1001 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002Func006C takes nothing returns boolean
    if ( not Trig_gold_bet_Func001Func002Func006Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001Func002C takes nothing returns boolean
    if ( not ( S2I(SubStringBJ(GetEventPlayerChatString(), 6, 10)) <= GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Func001C takes nothing returns boolean
    if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-gold" ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_bet_Actions takes nothing returns nothing
    if ( Trig_gold_bet_Func001C() ) then
        if ( Trig_gold_bet_Func001Func002C() ) then
            if ( Trig_gold_bet_Func001Func002Func003C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 0.25 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            if ( Trig_gold_bet_Func001Func002Func004C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 0.50 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            if ( Trig_gold_bet_Func001Func002Func005C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 0.75 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            if ( Trig_gold_bet_Func001Func002Func006C() ) then
                set udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 1.00 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
            else
            endif
            call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), ( "|cFF00FF00Вы ввели ставку золота|r, в случае победы вы получите: " + I2S(R2I(( 0.80 * I2R(udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]) ))) ) )
            call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), ( "|cFFFF0000Вы ввели ставку золота|r, в случае проигрыша вы потеряете: " + I2S(udg_roulette_gold[GetConvertedPlayerId(GetTriggerPlayer())]) ) )
        else
            call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_1092" )
        endif
    else
        if ( Trig_gold_bet_Func001Func001C() ) then
            if ( Trig_gold_bet_Func001Func001Func002C() ) then
                if ( Trig_gold_bet_Func001Func001Func002Func002C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 0.25 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                if ( Trig_gold_bet_Func001Func001Func002Func003C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 0.50 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                if ( Trig_gold_bet_Func001Func001Func002Func004C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 0.75 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                if ( Trig_gold_bet_Func001Func001Func002Func005C() ) then
                    set udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())] = R2I(( 1.00 * S2R(SubStringBJ(GetEventPlayerChatString(), 7, 11)) ))
                else
                endif
                call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), ( "|cFF00FF00Вы ввели ставку самоцветов|r, в случае победы вы получите: " + I2S(R2I(( 0.80 * I2R(udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]) ))) ) )
                call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), ( "|cFFFF0000Вы ввели ставку самоцветов|r, в случае проигрыша вы потеряете: " + I2S(udg_roulette_gems[GetConvertedPlayerId(GetTriggerPlayer())]) ) )
            else
                call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_1093" )
            endif
        else
            call DisplayTextToForce( GetForceOfPlayer(GetTriggerPlayer()), "TRIGSTR_1085" )
        endif
    endif
endfunction

//===========================================================================
function InitTrig_gold_bet takes nothing returns nothing
    set gg_trg_gold_bet = CreateTrigger(  )
    call DisableTrigger( gg_trg_gold_bet )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(0), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(0), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(1), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(1), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(2), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(2), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(3), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(3), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(4), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(4), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(5), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(5), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(6), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(6), "-gems", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(7), "-gold", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_gold_bet, Player(7), "-gems", false )
    call TriggerAddCondition( gg_trg_gold_bet, Condition( function Trig_gold_bet_Conditions ) )
    call TriggerAddAction( gg_trg_gold_bet, function Trig_gold_bet_Actions )
endfunction

//===========================================================================
// Trigger: gold result
//===========================================================================
function Trig_gold_result_Func001A takes nothing returns nothing
    call PauseUnitBJ( true, GetEnumUnit() )
endfunction

function Trig_gold_result_Func002Func001001002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n001' )
endfunction

function Trig_gold_result_Func002Func001Func005001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00X' )
endfunction

function Trig_gold_result_Func002Func001Func005A takes nothing returns nothing
    call ForceAddPlayerSimple( GetOwningPlayer(GetEnumUnit()), udg_roulette_winners )
endfunction

function Trig_gold_result_Func002Func001A takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, ( "Победили номер |cFFFF9B00" + I2S(GetUnitUserData(GetEnumUnit())) ) )
    call SetUnitScalePercent( GetEnumUnit(), 150.00, 150.00, 150.00 )
    call AddSpecialEffectTargetUnitBJ( "overhead", GetEnumUnit(), "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl" )
    call PlaySoundBJ( gg_snd_QuestNew )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(64.00, GetUnitLoc(GetEnumUnit()), Condition(function Trig_gold_result_Func002Func001Func005001003)), function Trig_gold_result_Func002Func001Func005A )
endfunction

function Trig_gold_result_Func002Func002001002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'n001' )
endfunction

function Trig_gold_result_Func002Func002Func005001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'h00X' )
endfunction

function Trig_gold_result_Func002Func002Func005A takes nothing returns nothing
    call ForceAddPlayerSimple( GetOwningPlayer(GetEnumUnit()), udg_roulette_winners )
endfunction

function Trig_gold_result_Func002Func002A takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 20.00, ( "Победили номер |cFFFF9B00" + I2S(GetUnitUserData(GetEnumUnit())) ) )
    call SetUnitScalePercent( GetEnumUnit(), 150.00, 150.00, 150.00 )
    call AddSpecialEffectTargetUnitBJ( "overhead", GetEnumUnit(), "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl" )
    call PlaySoundBJ( gg_snd_QuestNew )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(64.00, GetUnitLoc(GetEnumUnit()), Condition(function Trig_gold_result_Func002Func002Func005001003)), function Trig_gold_result_Func002Func002Func005A )
endfunction

function Trig_gold_result_Func002C takes nothing returns boolean
    if ( not ( CountPlayersInForceBJ(udg_players_group) <= 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_result_Func003Func001Func003Func002C takes nothing returns boolean
    if ( ( udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())] != 0 ) ) then
        return true
    endif
    if ( ( udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())] != 0 ) ) then
        return true
    endif
    return false
endfunction

function Trig_gold_result_Func003Func001Func003C takes nothing returns boolean
    if ( not Trig_gold_result_Func003Func001Func003Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_gold_result_Func003Func001C takes nothing returns boolean
    if ( not ( IsPlayerInForce(GetEnumPlayer(), udg_roulette_winners) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_gold_result_Func003A takes nothing returns nothing
    if ( Trig_gold_result_Func003Func001C() ) then
        call AdjustPlayerStateBJ( ( udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())] * -1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( ( udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())] * -1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER )
        if ( Trig_gold_result_Func003Func001Func003C() ) then
            call DisplayTextToForce( GetForceOfPlayer(GetEnumPlayer()), "TRIGSTR_1088" )
        else
        endif
    else
        call AdjustPlayerStateBJ( R2I(( I2R(udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())]) * 0.80 )), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( R2I(( I2R(udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())]) * 0.80 )), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER )
        call DisplayTextToForce( GetPlayersAll(), ( udg_players_colour[GetConvertedPlayerId(GetEnumPlayer())] + ( udg_players_name[GetConvertedPlayerId(GetEnumPlayer())] + ( "|r выигрывает |cFFFFCD00" + ( I2S(R2I(( 0.80 * I2R(udg_roulette_gold[GetConvertedPlayerId(GetEnumPlayer())]) ))) + ( "|r ед. золота и |cFFB23AEE" + ( I2S(R2I(( 0.80 * I2R(udg_roulette_gems[GetConvertedPlayerId(GetEnumPlayer())]) ))) + "|r ед. самоцветов." ) ) ) ) ) ) )
    endif
endfunction

function Trig_gold_result_Func004Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) != 'h00X' )
endfunction

function Trig_gold_result_Func004Func001A takes nothing returns nothing
    call PauseUnitBJ( false, GetEnumUnit() )
endfunction

function Trig_gold_result_Func004A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_gold_result_Func004Func001001002)), function Trig_gold_result_Func004Func001A )
endfunction

function Trig_gold_result_Func006A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_gold_result_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00X'), function Trig_gold_result_Func001A )
    if ( Trig_gold_result_Func002C() ) then
        call ForGroupBJ( GetRandomSubGroup(4, GetUnitsInRectMatching(gg_rct_roulettegame, Condition(function Trig_gold_result_Func002Func002001002002))), function Trig_gold_result_Func002Func002A )
    else
        call ForGroupBJ( GetRandomSubGroup(2, GetUnitsInRectMatching(gg_rct_roulettegame, Condition(function Trig_gold_result_Func002Func001001002002))), function Trig_gold_result_Func002Func001A )
    endif
    call ForForce( udg_players_group, function Trig_gold_result_Func003A )
    call ForForce( udg_players_group, function Trig_gold_result_Func004A )
    call TriggerSleepAction( 5.00 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00X'), function Trig_gold_result_Func006A )
    call GroupClear( udg_wave_units )
endfunction

//===========================================================================
function InitTrig_gold_result takes nothing returns nothing
    set gg_trg_gold_result = CreateTrigger(  )
    call TriggerAddAction( gg_trg_gold_result, function Trig_gold_result_Actions )
endfunction

//===========================================================================
// Trigger: horse ini start
//===========================================================================
function Trig_horse_ini_start_Func004C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func005C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(1)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func006C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(2)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func007C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(3)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func008C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(4)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func009C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(5)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func010C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(6)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func011C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(7)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_ini_start_Func012Func001002001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func012A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetUnitLoc(GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func012Func001002001001002)))), 0 )
    call SetCameraTargetControllerNoZForPlayer( GetEnumPlayer(), GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'hhdl')), 0, 0, false )
endfunction

function Trig_horse_ini_start_Func015Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func015Func001A takes nothing returns nothing
    call CreateTextTagLocBJ( "TRIGSTR_491", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 1.00 )
endfunction

function Trig_horse_ini_start_Func015A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func015Func001001002)), function Trig_horse_ini_start_Func015Func001A )
endfunction

function Trig_horse_ini_start_Func018Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func018Func001A takes nothing returns nothing
    call CreateTextTagLocBJ( "TRIGSTR_1032", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 1.00 )
endfunction

function Trig_horse_ini_start_Func018A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func018Func001001002)), function Trig_horse_ini_start_Func018Func001A )
endfunction

function Trig_horse_ini_start_Func021Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func021Func001A takes nothing returns nothing
    call CreateTextTagLocBJ( "TRIGSTR_1033", GetUnitLoc(GetEnumUnit()), 0, 60.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 1.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 1.00 )
endfunction

function Trig_horse_ini_start_Func021A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func021Func001001002)), function Trig_horse_ini_start_Func021Func001A )
endfunction

function Trig_horse_ini_start_Func023Func001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'hhdl' )
endfunction

function Trig_horse_ini_start_Func023Func001A takes nothing returns nothing
    call CreateTextTagLocBJ( "TRIGSTR_1034", GetUnitLoc(GetEnumUnit()), 0, 20.00, 100, 0.00, 0.00, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(GetEnumPlayer()) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 6.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 6.00 )
endfunction

function Trig_horse_ini_start_Func023A takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_horse_ini_start_Func023Func001001002)), function Trig_horse_ini_start_Func023Func001A )
endfunction

function Trig_horse_ini_start_Func026A takes nothing returns nothing
    call IssuePointOrderLocBJ( GetEnumUnit(), "move", PolarProjectionBJ(GetUnitLoc(GetEnumUnit()), 5568.00, 0) )
endfunction

function Trig_horse_ini_start_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.30 )
    set udg_r = 0
    // Я без понятия чего редактор так активно создаёт дессинхрон при цикличном спавне лошадок, посему каждому персонально. мдя.
    if ( Trig_horse_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(0), GetRectCenter(gg_rct_horse1), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(0)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(1), GetRectCenter(gg_rct_horse2), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(1)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func006C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(2), GetRectCenter(gg_rct_horse3), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(2)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func007C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(3), GetRectCenter(gg_rct_horse4), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(3)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func008C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(4), GetRectCenter(gg_rct_horse5), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(4)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func009C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(5), GetRectCenter(gg_rct_horse6), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(5)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func010C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(6), GetRectCenter(gg_rct_horse7), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(6)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_horse_ini_start_Func011C() ) then
        call CreateNUnitsAtLoc( 1, 'hhdl', Player(7), GetRectCenter(gg_rct_horse8), 0.00 )
        call SetUnitColor( GetLastCreatedUnit(), GetPlayerColor(Player(7)) )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    call ForForce( udg_players_group, function Trig_horse_ini_start_Func012A )
    call TriggerSleepAction( 2.00 )
    call PlaySoundBJ( gg_snd_BattleNetTick )
    call ForForce( udg_players_group, function Trig_horse_ini_start_Func015A )
    call TriggerSleepAction( 1.00 )
    call PlaySoundBJ( gg_snd_BattleNetTick )
    call ForForce( udg_players_group, function Trig_horse_ini_start_Func018A )
    call TriggerSleepAction( 1.00 )
    call PlaySoundBJ( gg_snd_BattleNetTick )
    call ForForce( udg_players_group, function Trig_horse_ini_start_Func021A )
    call TriggerSleepAction( 1.00 )
    call ForForce( udg_players_group, function Trig_horse_ini_start_Func023A )
    call EnableTrigger( gg_trg_horse_speed )
    call EnableTrigger( gg_trg_horse_finish )
    call ForGroupBJ( GetUnitsOfTypeIdAll('hhdl'), function Trig_horse_ini_start_Func026A )
endfunction

//===========================================================================
function InitTrig_horse_ini_start takes nothing returns nothing
    set gg_trg_horse_ini_start = CreateTrigger(  )
    call TriggerAddAction( gg_trg_horse_ini_start, function Trig_horse_ini_start_Actions )
endfunction

//===========================================================================
// Trigger: horse speed
//===========================================================================
function Trig_horse_speed_Func001A takes nothing returns nothing
    call SetUnitMoveSpeed( GetEnumUnit(), ( GetUnitMoveSpeed(GetEnumUnit()) + 1.50 ) )
endfunction

function Trig_horse_speed_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 'hhdl'), function Trig_horse_speed_Func001A )
endfunction

//===========================================================================
function InitTrig_horse_speed takes nothing returns nothing
    set gg_trg_horse_speed = CreateTrigger(  )
    call DisableTrigger( gg_trg_horse_speed )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(1), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(1), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(2), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(2), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(3), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(3), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(4), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(4), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(5), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(5), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(6), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(6), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(7), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_horse_speed, Player(7), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerAddAction( gg_trg_horse_speed, function Trig_horse_speed_Actions )
endfunction

//===========================================================================
// Trigger: horse finish
//===========================================================================
function Trig_horse_finish_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'hhdl' ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_finish_Func005Func001Func004C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_finish_Func005C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_horse_finish_Actions takes nothing returns nothing
    set udg_r = ( udg_r + 1 )
    call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnteringUnit()))] + ( "|r финишировал со скоростью |cFFFF9B00" + R2S(GetUnitMoveSpeed(GetEnteringUnit())) ) ) ) )
    set udg_horse_winners[udg_r] = GetOwningPlayer(GetEnteringUnit())
    call GroupRemoveUnitSimple( GetEnteringUnit(), udg_wave_units )
    if ( Trig_horse_finish_Func005C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = udg_r
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Место |cFF00FF00#" + ( I2S(GetForLoopIndexA()) + ( "|r занимает " + ( udg_players_colour[GetConvertedPlayerId(udg_horse_winners[GetForLoopIndexA()])] + udg_players_name[GetConvertedPlayerId(udg_horse_winners[GetForLoopIndexA()])] ) ) ) ) )
            call AdjustPlayerStateBJ( ( 666 - ( 66 * GetForLoopIndexA() ) ), udg_horse_winners[GetForLoopIndexA()], PLAYER_STATE_RESOURCE_GOLD )
            call DisplayTimedTextToForce( GetForceOfPlayer(udg_horse_winners[GetForLoopIndexA()]), 10.00, ( "Золото за результат гонок: |cFFFFCD00" + I2S(( 666 - ( GetForLoopIndexA() * 66 ) )) ) )
            if ( Trig_horse_finish_Func005Func001Func004C() ) then
            else
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set udg_r = 0
        call DisableTrigger( GetTriggeringTrigger() )
        call DisableTrigger( gg_trg_horse_speed )
    else
    endif
    call AddSpecialEffectLocBJ( GetUnitLoc(GetEnteringUnit()), "Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl" )
    call DestroyEffectBJ( GetLastCreatedEffectBJ() )
    call RemoveUnit( GetEnteringUnit() )
endfunction

//===========================================================================
function InitTrig_horse_finish takes nothing returns nothing
    set gg_trg_horse_finish = CreateTrigger(  )
    call DisableTrigger( gg_trg_horse_finish )
    call TriggerRegisterEnterRectSimple( gg_trg_horse_finish, gg_rct_finish )
    call TriggerAddCondition( gg_trg_horse_finish, Condition( function Trig_horse_finish_Conditions ) )
    call TriggerAddAction( gg_trg_horse_finish, function Trig_horse_finish_Actions )
endfunction

//===========================================================================
// Trigger: miners ini start
//===========================================================================
function Trig_miners_ini_start_Func002C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func003C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(1)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func004C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(2)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func005C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(3)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func006C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(4)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func007C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(5)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func008C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(6)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func009C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(Player(7)) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_ini_start_Func010Func001002001001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'ngsp' )
endfunction

function Trig_miners_ini_start_Func010A takes nothing returns nothing
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetUnitLoc(GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetEnumPlayer(), Condition(function Trig_miners_ini_start_Func010Func001002001001002)))), 0 )
    call SetCameraBoundsToRectForPlayerBJ( GetEnumPlayer(), gg_rct_minersregion )
endfunction

function Trig_miners_ini_start_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.30 )
    if ( Trig_miners_ini_start_Func002C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(0), GetRectCenter(gg_rct_miner1), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func003C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(1), GetRectCenter(gg_rct_miner2), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(2), GetRectCenter(gg_rct_miner3), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(3), GetRectCenter(gg_rct_miner4), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func006C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(4), GetRectCenter(gg_rct_miner5), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func007C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(5), GetRectCenter(gg_rct_miner6), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func008C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(6), GetRectCenter(gg_rct_miner7), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    if ( Trig_miners_ini_start_Func009C() ) then
        call CreateNUnitsAtLoc( 1, 'ngsp', Player(7), GetRectCenter(gg_rct_miner8), bj_UNIT_FACING )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    else
    endif
    call ForForce( udg_players_group, function Trig_miners_ini_start_Func010A )
endfunction

//===========================================================================
function InitTrig_miners_ini_start takes nothing returns nothing
    set gg_trg_miners_ini_start = CreateTrigger(  )
    call TriggerAddAction( gg_trg_miners_ini_start, function Trig_miners_ini_start_Actions )
endfunction

//===========================================================================
// Trigger: miners death
//===========================================================================
function Trig_miners_death_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'ngsp' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == GetOwningPlayer(GetDyingUnit()) ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Func002Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Func002Func001A takes nothing returns nothing
    if ( Trig_miners_death_Func002Func001Func001C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] ) ) )
        call AdjustPlayerStateBJ( ( 250 + ( 25 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в Miners: |cFFFFCD00" + I2S(( 250 + ( 25 * udg_wave ) )) ) )
    else
    endif
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_miners_death_Func002C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) <= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_death_Actions takes nothing returns nothing
    if ( Trig_miners_death_Func001C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Игрок " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit()))] + "|r подорвал сам себя." ) ) ) )
    else
    endif
    if ( Trig_miners_death_Func002C() ) then
        call ForGroupBJ( GetUnitsOfTypeIdAll('ngsp'), function Trig_miners_death_Func002Func001A )
        call GroupClear( udg_wave_units )
    else
    endif
endfunction

//===========================================================================
function InitTrig_miners_death takes nothing returns nothing
    set gg_trg_miners_death = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_miners_death, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_miners_death, Condition( function Trig_miners_death_Conditions ) )
    call TriggerAddAction( gg_trg_miners_death, function Trig_miners_death_Actions )
endfunction

//===========================================================================
// Trigger: miners explosion
//===========================================================================
function Trig_miners_explosion_Conditions takes nothing returns boolean
    if ( not ( GetDestructableTypeId(GetFilterDestructable()) == 'B009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_explosion_Func006C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_explosion_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetDestructableLoc(GetDyingDestructable()), "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl" )
    call DestroyEffectBJ( GetLastCreatedEffectBJ() )
    set udg_random = GetRandomInt(1, ( ( CountPlayersInForceBJ(udg_players_group) * 3 ) + 12 ))
    if ( Trig_miners_explosion_Func006C() ) then
        call CreateItemLoc( 'I000', GetDestructableLoc(GetFilterDestructable()) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_miners_explosion takes nothing returns nothing
    set gg_trg_miners_explosion = CreateTrigger(  )
    call TriggerRegisterDestDeathInRegionEvent( gg_trg_miners_explosion, gg_rct_minersregion )
    call TriggerAddCondition( gg_trg_miners_explosion, Condition( function Trig_miners_explosion_Conditions ) )
    call TriggerAddAction( gg_trg_miners_explosion, function Trig_miners_explosion_Actions )
endfunction

//===========================================================================
// Trigger: miners set
//===========================================================================
function Trig_miners_set_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == 'nglm' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func002Func001Func002Func001C takes nothing returns boolean
    if ( not ( RectContainsUnit(RectFromCenterSizeBJ(Location(( 7872.00 + ( 128.00 * I2R(udg_i) ) ), ( 7744.00 - ( 128.00 * I2R(udg_j) ) )), 128.00, 128.00), GetEnteringUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func002Func001C takes nothing returns boolean
    if ( not ( udg_miners_log == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func004Func001Func001001002 takes nothing returns boolean
    return ( GetDestructableTypeId(GetFilterDestructable()) == 'B009' )
endfunction

function Trig_miners_set_Func004Func001Func004Func003003002001002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'ngsp' )
endfunction

function Trig_miners_set_Func004Func001Func004C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() == GetUnitAbilityLevelSwapped('AIpm', GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetOwningPlayer(GetEnteringUnit()), Condition(function Trig_miners_set_Func004Func001Func004Func003003002001002)))) ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func004Func001Func005Func002001002 takes nothing returns boolean
    return ( GetDestructableTypeId(GetFilterDestructable()) == 'B009' )
endfunction

function Trig_miners_set_Func004Func001Func005Func004C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Func004Func001Func005C takes nothing returns boolean
    if ( not ( GetDestructableTypeId(RandomDestructableInRectSimpleBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 96.00, 96.00))) == 'B009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_set_Actions takes nothing returns nothing
    set udg_miners_log = false
    set udg_i = 0
    loop
        exitwhen udg_i > 17
        if ( Trig_miners_set_Func002Func001C() ) then
            set udg_j = 0
            loop
                exitwhen udg_j > 17
                if ( Trig_miners_set_Func002Func001Func002Func001C() ) then
                    set udg_miners_log = true
                    call SetUnitPositionLoc( GetEnteringUnit(), Location(( 7872.00 + ( 128.00 * I2R(udg_i) ) ), ( 7744.00 - ( 128.00 * I2R(udg_j) ) )) )
                else
                endif
                set udg_j = udg_j + 1
            endloop
        else
        endif
        set udg_i = udg_i + 1
    endloop
    call TriggerSleepAction( 3.00 )
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetUnitAbilityLevelSwapped('AIpm', GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetOwningPlayer(GetEnteringUnit()), 'ngsp')))
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set bj_forLoopBIndex = 1
        set bj_forLoopBIndexEnd = 4
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call KillDestructable( RandomDestructableInRectBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), 0.00, 0), 96.00, 96.00), Condition(function Trig_miners_set_Func004Func001Func001001002)) )
            call UnitDamagePointLoc( GetEnteringUnit(), 0, 64.00, GetUnitLoc(GetEnteringUnit()), 1000.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
            call UnitDamagePointLoc( GetEnteringUnit(), 0, 62.00, PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 1000.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
            if ( Trig_miners_set_Func004Func001Func004C() ) then
                call AddSpecialEffectLocBJ( PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl" )
                call DestroyEffectBJ( GetLastCreatedEffectBJ() )
            else
            endif
            if ( Trig_miners_set_Func004Func001Func005C() ) then
                call KillDestructable( RandomDestructableInRectBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 96.00, 96.00), Condition(function Trig_miners_set_Func004Func001Func005Func002001002)) )
                set udg_random = GetRandomInt(1, ( ( CountPlayersInForceBJ(udg_players_group) * 3 ) + 12 ))
                if ( Trig_miners_set_Func004Func001Func005Func004C() ) then
                    call CreateItemLoc( 'I000', GetDestructableLoc(RandomDestructableInRectSimpleBJ(RectFromCenterSizeBJ(PolarProjectionBJ(GetUnitLoc(GetEnteringUnit()), ( 128.00 * I2R(GetForLoopIndexA()) ), ( 90.00 * I2R(GetForLoopIndexB()) )), 96.00, 96.00))) )
                else
                endif
            else
            endif
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call KillUnit( GetEnteringUnit() )
endfunction

//===========================================================================
function InitTrig_miners_set takes nothing returns nothing
    set gg_trg_miners_set = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_miners_set, GetEntireMapRect() )
    call TriggerAddCondition( gg_trg_miners_set, Condition( function Trig_miners_set_Conditions ) )
    call TriggerAddAction( gg_trg_miners_set, function Trig_miners_set_Actions )
endfunction

//===========================================================================
// Trigger: miners reward
//===========================================================================
function Trig_miners_reward_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_reward_Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('AIpm', GetManipulatingUnit()) < 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_miners_reward_Actions takes nothing returns nothing
    if ( Trig_miners_reward_Func001C() ) then
        call IncUnitAbilityLevelSwapped( 'AIpm', GetManipulatingUnit() )
        call AddSpecialEffectLocBJ( GetUnitLoc(GetManipulatingUnit()), "Abilities\\Spells\\Other\\Levelup\\LevelupCaster.mdl" )
        call DestroyEffectBJ( GetLastCreatedEffectBJ() )
    else
    endif
endfunction

//===========================================================================
function InitTrig_miners_reward takes nothing returns nothing
    set gg_trg_miners_reward = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_miners_reward, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_miners_reward, Condition( function Trig_miners_reward_Conditions ) )
    call TriggerAddAction( gg_trg_miners_reward, function Trig_miners_reward_Actions )
endfunction

//===========================================================================
// Trigger: hide ini
//===========================================================================
function Trig_hide_ini_Func025Func001C takes nothing returns boolean
    if ( not ( GetEnumPlayer() != udg_hide_hunter ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func025A takes nothing returns nothing
    if ( Trig_hide_ini_Func025Func001C() ) then
        call DestroyFogModifier( GetLastCreatedFogModifier() )
        call CreateNUnitsAtLoc( 1, 'h00X', GetEnumPlayer(), GetRandomLocInRect(gg_rct_hideandseek), bj_UNIT_FACING )
        call SetUnitVertexColorBJ( GetLastCreatedUnit(), 100, 100, 100, 100.00 )
        call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
        call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetUnitLoc(GetLastCreatedUnit()), 0 )
        call SetCameraBoundsToRectForPlayerBJ( GetEnumPlayer(), gg_rct_hideandseekall )
        set udg_hide[GetConvertedPlayerId(GetEnumPlayer())] = GetRandomInt(1, 5)
    else
    endif
endfunction

function Trig_hide_ini_Func027Func001Func002C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func001Func003C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func001C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func002C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func003C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func004C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func005Func002C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func005Func003C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027Func005C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_ini_Func027A takes nothing returns nothing
    if ( Trig_hide_ini_Func027Func001C() ) then
        set udg_random = GetRandomInt(1, 3)
        if ( Trig_hide_ini_Func027Func001Func002C() ) then
            call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Rocks\\Lords_Rock\\Lords_Rock0.mdl" )
        else
        endif
        if ( Trig_hide_ini_Func027Func001Func003C() ) then
            call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Rocks\\Lords_Rock\\Lords_Rock5.mdl" )
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = 6
        else
            call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Rocks\\Lords_Rock\\Lords_Rock8.mdl" )
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = 7
        endif
    else
    endif
    if ( Trig_hide_ini_Func027Func002C() ) then
        call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Buildings\\Other\\BarrelsUnit0\\BarrelsUnit0.mdl" )
    else
    endif
    if ( Trig_hide_ini_Func027Func003C() ) then
        call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\Northrend\\Water\\FloatingBox\\FloatingBox.mdl" )
    else
    endif
    if ( Trig_hide_ini_Func027Func004C() ) then
        call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\LordaeronSummer\\Props\\TorchHuman\\TorchHuman.mdl" )
    else
    endif
    if ( Trig_hide_ini_Func027Func005C() ) then
        set udg_random = GetRandomInt(1, 3)
        if ( Trig_hide_ini_Func027Func005Func002C() ) then
            call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\Dungeon\\Props\\JunkPile\\JunkPile0.mdl" )
        else
        endif
        if ( Trig_hide_ini_Func027Func005Func003C() ) then
            call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\Dungeon\\Props\\JunkPile\\JunkPile1.mdl" )
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = 8
        else
            call AddSpecialEffectTargetUnitBJ( "origin", GetEnumUnit(), "Doodads\\Dungeon\\Props\\TreasurePile\\TreasurePile0.mdl" )
            set udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = 9
        endif
    else
    endif
endfunction

function Trig_hide_ini_Func034A takes nothing returns nothing
    call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_all )
endfunction

function Trig_hide_ini_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.30 )
    set udg_hide_hunter = ForcePickRandomPlayer(udg_players_group)
    call SetTimeOfDay( 0.00 )
    call DisplayTextToForce( GetPlayersAll(), ( "ИЩЕТ: " + ( udg_players_colour[GetConvertedPlayerId(udg_hide_hunter)] + udg_players_name[GetConvertedPlayerId(udg_hide_hunter)] ) ) )
    call CameraSetupApplyForPlayer( true, gg_cam_hide_and_seek, udg_hide_hunter, 0 )
    call SetCameraBoundsToRectForPlayerBJ( udg_hide_hunter, gg_rct_hideandseekcam )
    call CreateTextTagLocBJ( "TRIGSTR_1046", GetRectCenter(gg_rct_hideandseekcam), 0, 60.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(udg_hide_hunter) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 30.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 30.00 )
    call CreateTextTagLocBJ( "TRIGSTR_1153", PolarProjectionBJ(GetRectCenter(gg_rct_hideandseekcam), -256.00, 270.00), 0.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(udg_hide_hunter) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 30.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 30.00 )
    call CreateTextTagLocBJ( "TRIGSTR_1154", PolarProjectionBJ(GetRectCenter(gg_rct_hideandseekcam), 376.00, 270.00), 0.00, 10.00, 100, 100, 100, 0 )
    call ShowTextTagForceBJ( false, GetLastCreatedTextTag(), GetPlayersAll() )
    call ShowTextTagForceBJ( true, GetLastCreatedTextTag(), GetForceOfPlayer(udg_hide_hunter) )
    call SetTextTagPermanentBJ( GetLastCreatedTextTag(), false )
    call SetTextTagFadepointBJ( GetLastCreatedTextTag(), 30.00 )
    call SetTextTagLifespanBJ( GetLastCreatedTextTag(), 30.00 )
    call ForForce( udg_players_group, function Trig_hide_ini_Func025A )
    call TriggerSleepAction( 0.10 )
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00X'), function Trig_hide_ini_Func027A )
    call TriggerSleepAction( 29.00 )
    call TriggerExecute( gg_trg_hide_stop )
    call TriggerSleepAction( 2.00 )
    call CreateNUnitsAtLoc( 1, 'h00Y', udg_hide_hunter, GetRectCenter(gg_rct_hideandseek), bj_UNIT_FACING )
    call SetCameraBoundsToRectForPlayerBJ( udg_hide_hunter, gg_rct_hideandseekall )
    call PanCameraToTimedLocForPlayer( udg_hide_hunter, GetRectCenter(gg_rct_hideandseek), 0 )
    call ForForce( udg_players_group, function Trig_hide_ini_Func034A )
endfunction

//===========================================================================
function InitTrig_hide_ini takes nothing returns nothing
    set gg_trg_hide_ini = CreateTrigger(  )
    call TriggerAddAction( gg_trg_hide_ini, function Trig_hide_ini_Actions )
endfunction

//===========================================================================
// Trigger: hide stop
//===========================================================================
function Trig_hide_stop_Func001Func002C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func003C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func004C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func005C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func006C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func007C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func008C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func009C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001Func010C takes nothing returns boolean
    if ( not ( udg_hide[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_stop_Func001A takes nothing returns nothing
    call ClearSelectionForPlayer( GetOwningPlayer(GetEnumUnit()) )
    if ( Trig_hide_stop_Func001Func002C() ) then
        call CreateDestructableLoc( 'B00A', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func003C() ) then
        call CreateDestructableLoc( 'B00B', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func004C() ) then
        call CreateDestructableLoc( 'B00C', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func005C() ) then
        call CreateDestructableLoc( 'B00E', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func006C() ) then
        call CreateDestructableLoc( 'B00F', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func007C() ) then
        call CreateDestructableLoc( 'B00D', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func008C() ) then
        call CreateDestructableLoc( 'B00G', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func009C() ) then
        call CreateDestructableLoc( 'B00H', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    if ( Trig_hide_stop_Func001Func010C() ) then
        call CreateDestructableLoc( 'B00I', GetUnitLoc(GetEnumUnit()), GetUnitFacing(GetEnumUnit()), 1.15, 0 )
    else
    endif
    call CreateNUnitsAtLoc( 1, 'h00Z', GetOwningPlayer(GetEnumUnit()), GetUnitLoc(GetEnumUnit()), bj_UNIT_FACING )
    call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    call GroupRemoveUnitSimple( GetEnumUnit(), udg_wave_units )
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_hide_stop_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfTypeIdAll('h00X'), function Trig_hide_stop_Func001A )
endfunction

//===========================================================================
function InitTrig_hide_stop takes nothing returns nothing
    set gg_trg_hide_stop = CreateTrigger(  )
    call TriggerAddAction( gg_trg_hide_stop, function Trig_hide_stop_Actions )
endfunction

//===========================================================================
// Trigger: hide kill
//===========================================================================
function Trig_hide_kill_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'h00Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_kill_Func003A takes nothing returns nothing
    call RemoveDestructable( GetEnumDestructable() )
endfunction

function Trig_hide_kill_Func009Func006A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_hide_kill_Func009C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_hide_kill_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetDyingUnit()), "Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl" )
    call DestroyEffectBJ( GetLastCreatedEffectBJ() )
    call EnumDestructablesInCircleBJ( 32.00, GetUnitLoc(GetDyingUnit()), function Trig_hide_kill_Func003A )
    call GroupRemoveUnitSimple( GetDyingUnit(), udg_wave_units )
    call RemoveUnit( GetEnumUnit() )
    call CreateNUnitsAtLoc( 1, 'h00Y', GetOwningPlayer(GetDyingUnit()), GetUnitLoc(GetDyingUnit()), bj_UNIT_FACING )
    if ( Trig_hide_kill_Func009C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Победил охотник: " + ( udg_players_colour[GetConvertedPlayerId(udg_hide_hunter)] + udg_players_name[GetConvertedPlayerId(udg_hide_hunter)] ) ) )
        call AdjustPlayerStateBJ( ( 200 + ( 30 * udg_wave ) ), udg_hide_hunter, PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetForceOfPlayer(udg_hide_hunter), 10.00, ( "Победа в hide&seek: |cFFFFCD00" + I2S(( 200 + ( 30 * udg_wave ) )) ) )
        call AdjustPlayerStateBJ( R2I(( 0.50 * I2R(udg_wave) )), udg_hide_hunter, PLAYER_STATE_RESOURCE_LUMBER )
        call DisplayTimedTextToForce( GetForceOfPlayer(udg_hide_hunter), 10.00, ( "Победа в hide&seek: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ) )
        call ForGroupBJ( GetUnitsInRectAll(gg_rct_hideandseekall), function Trig_hide_kill_Func009Func006A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_hide_kill takes nothing returns nothing
    set gg_trg_hide_kill = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hide_kill, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_hide_kill, Condition( function Trig_hide_kill_Conditions ) )
    call TriggerAddAction( gg_trg_hide_kill, function Trig_hide_kill_Actions )
endfunction

//===========================================================================
// Trigger: banshi ini
//===========================================================================
function Trig_banshi_ini_Func002A takes nothing returns nothing
    call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_hideandseekall )
    call CreateNUnitsAtLoc( 1, 'u000', GetEnumPlayer(), GetRandomLocInRect(gg_rct_hideandseek), bj_UNIT_FACING )
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetUnitLoc(GetLastCreatedUnit()), 0 )
    call SelectUnitForPlayerSingle( GetLastCreatedUnit(), GetEnumPlayer() )
    call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
endfunction

function Trig_banshi_ini_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.30 )
    call ForForce( udg_players_group, function Trig_banshi_ini_Func002A )
    call EnableTrigger( gg_trg_banshi_attack )
    call EnableTrigger( gg_trg_banshi_spawn )
    call EnableTrigger( gg_trg_banshi_end )
endfunction

//===========================================================================
function InitTrig_banshi_ini takes nothing returns nothing
    set gg_trg_banshi_ini = CreateTrigger(  )
    call TriggerAddAction( gg_trg_banshi_ini, function Trig_banshi_ini_Actions )
endfunction

//===========================================================================
// Trigger: banshi cast
//===========================================================================
function Trig_banshi_cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'Apos' ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_cast_Actions takes nothing returns nothing
    call UnitAddAbilityBJ( 'Amim', GetSpellTargetUnit() )
    call GroupAddUnitSimple( GetSpellTargetUnit(), udg_wave_units )
endfunction

//===========================================================================
function InitTrig_banshi_cast takes nothing returns nothing
    set gg_trg_banshi_cast = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_banshi_cast, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_banshi_cast, Condition( function Trig_banshi_cast_Conditions ) )
    call TriggerAddAction( gg_trg_banshi_cast, function Trig_banshi_cast_Actions )
endfunction

//===========================================================================
// Trigger: banshi end
//===========================================================================
function Trig_banshi_end_Func007C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 1 ) ) then
        return false
    endif
    if ( not ( udg_wave == udg_wave_mini[7] ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_end_Conditions takes nothing returns boolean
    if ( not Trig_banshi_end_Func007C() ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_end_Func004A takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), ( "Победил " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + ( udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + "|r" ) ) ) )
    call AdjustPlayerStateBJ( ( 200 + ( 30 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
    call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мине-игре: |cFFFFCD00" + I2S(( 200 + ( 30 * udg_wave ) )) ) )
    call AdjustPlayerStateBJ( R2I(( 0.50 * I2R(udg_wave) )), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_LUMBER )
    call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мини-игре: |cFFB23AEE" + I2S(R2I(( 0.50 * I2R(udg_wave) ))) ) )
endfunction

function Trig_banshi_end_Func005A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_banshi_end_Actions takes nothing returns nothing
    call DisableTrigger( GetTriggeringTrigger() )
    call DisableTrigger( gg_trg_banshi_attack )
    call DisableTrigger( gg_trg_banshi_spawn )
    call ForGroupBJ( udg_wave_units, function Trig_banshi_end_Func004A )
    call ForGroupBJ( GetUnitsInRectAll(gg_rct_hideandseekall), function Trig_banshi_end_Func005A )
    call GroupClear( udg_wave_units )
endfunction

//===========================================================================
function InitTrig_banshi_end takes nothing returns nothing
    set gg_trg_banshi_end = CreateTrigger(  )
    call DisableTrigger( gg_trg_banshi_end )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_banshi_end, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_banshi_end, Condition( function Trig_banshi_end_Conditions ) )
    call TriggerAddAction( gg_trg_banshi_end, function Trig_banshi_end_Actions )
endfunction

//===========================================================================
// Trigger: banshi spawn
//===========================================================================
function Trig_banshi_spawn_Func002C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func003C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func004C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func005C takes nothing returns boolean
    if ( not ( udg_random == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func006C takes nothing returns boolean
    if ( not ( udg_random == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func007C takes nothing returns boolean
    if ( not ( udg_random == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func008C takes nothing returns boolean
    if ( not ( udg_random == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func009C takes nothing returns boolean
    if ( not ( udg_random == 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func010C takes nothing returns boolean
    if ( not ( udg_random == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func011C takes nothing returns boolean
    if ( not ( udg_random == 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func012C takes nothing returns boolean
    if ( not ( udg_random == 11 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func013C takes nothing returns boolean
    if ( not ( udg_random == 12 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func014C takes nothing returns boolean
    if ( not ( udg_random == 13 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func015C takes nothing returns boolean
    if ( not ( udg_random == 14 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func016C takes nothing returns boolean
    if ( not ( udg_random == 15 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func017C takes nothing returns boolean
    if ( not ( udg_random == 16 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func018C takes nothing returns boolean
    if ( not ( udg_random == 17 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func019C takes nothing returns boolean
    if ( not ( udg_random == 18 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func020C takes nothing returns boolean
    if ( not ( udg_random == 19 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func021C takes nothing returns boolean
    if ( not ( udg_random == 20 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func022C takes nothing returns boolean
    if ( not ( udg_random == 21 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func023C takes nothing returns boolean
    if ( not ( udg_random == 22 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func024C takes nothing returns boolean
    if ( not ( udg_random == 23 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func025C takes nothing returns boolean
    if ( not ( udg_random == 24 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func026C takes nothing returns boolean
    if ( not ( udg_random == 25 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func027C takes nothing returns boolean
    if ( not ( udg_random == 26 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func028C takes nothing returns boolean
    if ( not ( udg_random == 27 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func029C takes nothing returns boolean
    if ( not ( udg_random == 28 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func030C takes nothing returns boolean
    if ( not ( udg_random == 29 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func031C takes nothing returns boolean
    if ( not ( udg_random == 30 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func032C takes nothing returns boolean
    if ( not ( udg_random == 31 ) ) then
        return false
    endif
    return true
endfunction

function Trig_banshi_spawn_Func033003001001002 takes nothing returns boolean
    return ( GetPlayerSlotState(GetOwningPlayer(GetFilterUnit())) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_banshi_spawn_Actions takes nothing returns nothing
    set udg_random = GetRandomInt(1, 31)
    if ( Trig_banshi_spawn_Func002C() ) then
        call CreateNUnitsAtLoc( 1, 'nltl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func003C() ) then
        call CreateNUnitsAtLoc( 1, 'nssp', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'nfrl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'ndtt', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func006C() ) then
        call CreateNUnitsAtLoc( 1, 'nwlt', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func007C() ) then
        call CreateNUnitsAtLoc( 1, 'nmrm', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func008C() ) then
        call CreateNUnitsAtLoc( 1, 'nsts', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func009C() ) then
        call CreateNUnitsAtLoc( 1, 'nslf', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func010C() ) then
        call CreateNUnitsAtLoc( 1, 'nslr', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func011C() ) then
        call CreateNUnitsAtLoc( 1, 'nenp', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func012C() ) then
        call CreateNUnitsAtLoc( 1, 'nmmu', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func013C() ) then
        call CreateNUnitsAtLoc( 1, 'npfl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func014C() ) then
        call CreateNUnitsAtLoc( 1, 'ngnv', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func015C() ) then
        call CreateNUnitsAtLoc( 1, 'ngno', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func016C() ) then
        call CreateNUnitsAtLoc( 1, 'ngns', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func017C() ) then
        call CreateNUnitsAtLoc( 1, 'nomg', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func018C() ) then
        call CreateNUnitsAtLoc( 1, 'nogl', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func019C() ) then
        call CreateNUnitsAtLoc( 1, 'nith', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func020C() ) then
        call CreateNUnitsAtLoc( 1, 'nspd', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func021C() ) then
        call CreateNUnitsAtLoc( 1, 'nnwa', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func022C() ) then
        call CreateNUnitsAtLoc( 1, 'nplb', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func023C() ) then
        call CreateNUnitsAtLoc( 1, 'ntkh', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func024C() ) then
        call CreateNUnitsAtLoc( 1, 'ntkw', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func025C() ) then
        call CreateNUnitsAtLoc( 1, 'ntkc', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func026C() ) then
        call CreateNUnitsAtLoc( 1, 'nwen', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func027C() ) then
        call CreateNUnitsAtLoc( 1, 'nwna', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func028C() ) then
        call CreateNUnitsAtLoc( 1, 'nsc3', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func029C() ) then
        call CreateNUnitsAtLoc( 1, 'nfpt', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func030C() ) then
        call CreateNUnitsAtLoc( 1, 'nanw', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func031C() ) then
        call CreateNUnitsAtLoc( 1, 'nbdm', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    if ( Trig_banshi_spawn_Func032C() ) then
        call CreateNUnitsAtLoc( 1, 'nfod', Player(11), GetRandomLocInRect(gg_rct_banshispawn), bj_UNIT_FACING )
    else
    endif
    call IssuePointOrderLocBJ( GetLastCreatedUnit(), "attack", GetUnitLoc(GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_hideandseekall, Condition(function Trig_banshi_spawn_Func033003001001002)))) )
endfunction

//===========================================================================
function InitTrig_banshi_spawn takes nothing returns nothing
    set gg_trg_banshi_spawn = CreateTrigger(  )
    call DisableTrigger( gg_trg_banshi_spawn )
    call TriggerRegisterTimerEventPeriodic( gg_trg_banshi_spawn, 4.00 )
    call TriggerAddAction( gg_trg_banshi_spawn, function Trig_banshi_spawn_Actions )
endfunction

//===========================================================================
// Trigger: banshi attack
//===========================================================================
function Trig_banshi_attack_Func001A takes nothing returns nothing
    call IssuePointOrderLocBJ( GetEnumUnit(), "attack", GetRandomLocInRect(gg_rct_hideandseekall) )
endfunction

function Trig_banshi_attack_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRectOfPlayer(gg_rct_hideandseekall, Player(11)), function Trig_banshi_attack_Func001A )
endfunction

//===========================================================================
function InitTrig_banshi_attack takes nothing returns nothing
    set gg_trg_banshi_attack = CreateTrigger(  )
    call DisableTrigger( gg_trg_banshi_attack )
    call TriggerRegisterTimerEventPeriodic( gg_trg_banshi_attack, 24.00 )
    call TriggerAddAction( gg_trg_banshi_attack, function Trig_banshi_attack_Actions )
endfunction

//===========================================================================
// Trigger: parody ini start
//===========================================================================
function Trig_parody_ini_start_Func003A takes nothing returns nothing
    call CreateNUnitsAtLoc( 1, 'odkt', GetEnumPlayer(), PolarProjectionBJ(GetRectCenter(gg_rct________________081), 256, ( 45.00 * I2R(GetConvertedPlayerId(GetEnumPlayer())) )), ( 180.00 + ( 45.00 * I2R(GetConvertedPlayerId(GetEnumPlayer())) ) ) )
    call ClearSelectionForPlayer( GetEnumPlayer() )
    call SelectUnitForPlayerSingle( GetLastCreatedUnit(), GetEnumPlayer() )
    call GroupAddUnitSimple( GetLastCreatedUnit(), udg_wave_units )
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetRectCenter(gg_rct________________081), 0 )
    set udg_is_casted[GetConvertedPlayerId(GetEnumPlayer())] = true
endfunction

function Trig_parody_ini_start_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.30 )
    set udg_parody_game = true
    call ForForce( udg_players_group, function Trig_parody_ini_start_Func003A )
    call CreateNUnitsAtLoc( 1, 'odkt', Player(PLAYER_NEUTRAL_PASSIVE), GetRectCenter(gg_rct________________082), bj_UNIT_FACING )
    set udg_parody_main = GetLastCreatedUnit()
    set udg_parody_time = 5.00
    call TriggerSleepAction( 0.30 )
    call TriggerExecute( gg_trg_parodys_set_cast )
    call EnableTrigger( gg_trg_parodys_cast )
endfunction

//===========================================================================
function InitTrig_parody_ini_start takes nothing returns nothing
    set gg_trg_parody_ini_start = CreateTrigger(  )
    call TriggerAddAction( gg_trg_parody_ini_start, function Trig_parody_ini_start_Actions )
endfunction

//===========================================================================
// Trigger: parodys set cast
//===========================================================================
function Trig_parodys_set_cast_Func002Func001Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_parodys_set_cast_Func002Func001Func003Func001Func001A takes nothing returns nothing
    call KillUnit( GetEnumUnit() )
endfunction

function Trig_parodys_set_cast_Func002Func001Func003Func001C takes nothing returns boolean
    if ( not ( udg_is_casted[GetConvertedPlayerId(GetEnumPlayer())] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func003A takes nothing returns nothing
    if ( Trig_parodys_set_cast_Func002Func001Func003Func001C() ) then
        call ForGroupBJ( GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'odkt'), function Trig_parodys_set_cast_Func002Func001Func003Func001Func001A )
    else
    endif
    set udg_is_casted[GetConvertedPlayerId(GetEnumPlayer())] = false
endfunction

function Trig_parodys_set_cast_Func002Func001Func006C takes nothing returns boolean
    if ( not ( udg_random == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func007C takes nothing returns boolean
    if ( not ( udg_random == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003001001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003001002 takes nothing returns boolean
    return ( IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_players_group) == true )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003001 takes nothing returns boolean
    return GetBooleanAnd( Trig_parodys_set_cast_Func002Func001Func008Func001001003001001(), Trig_parodys_set_cast_Func002Func001Func008Func001001003001002() )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == 'odkt' )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_parodys_set_cast_Func002Func001Func008Func001001003001(), Trig_parodys_set_cast_Func002Func001Func008Func001001003002() )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008Func001A takes nothing returns nothing
    call CreateNUnitsAtLoc( 1, 'hfoo', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRandomLocInRect(gg_rct________________082), bj_UNIT_FACING )
endfunction

function Trig_parodys_set_cast_Func002Func001Func008C takes nothing returns boolean
    if ( not ( udg_random == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001Func009C takes nothing returns boolean
    if ( not ( udg_parody_time > 0.30 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Func002Func001C takes nothing returns boolean
    if ( not ( udg_parody_game == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_set_cast_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_parodys_cast )
    set udg_k = 1
    loop
        exitwhen udg_k > 100
        if ( Trig_parodys_set_cast_Func002Func001C() ) then
            call TriggerSleepAction( udg_parody_time )
            call ForGroupBJ( GetUnitsOfPlayerAndTypeId(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'hfoo'), function Trig_parodys_set_cast_Func002Func001Func002A )
            call ForForce( udg_players_group, function Trig_parodys_set_cast_Func002Func001Func003A )
            call TriggerExecute( gg_trg_parody_dies )
            set udg_random = GetRandomInt(1, 3)
            if ( Trig_parodys_set_cast_Func002Func001Func006C() ) then
                call IssueImmediateOrderBJ( udg_parody_main, "stomp" )
                set udg_parody_spell = 'A03Q'
            else
            endif
            if ( Trig_parodys_set_cast_Func002Func001Func007C() ) then
                call IssueImmediateOrderBJ( udg_parody_main, "starfall" )
                set udg_parody_spell = 'A03S'
            else
            endif
            if ( Trig_parodys_set_cast_Func002Func001Func008C() ) then
                call ForGroupBJ( GetUnitsInRangeOfLocMatching(999.00, GetRectCenter(gg_rct________________082), Condition(function Trig_parodys_set_cast_Func002Func001Func008Func001001003)), function Trig_parodys_set_cast_Func002Func001Func008Func001A )
                call IssueTargetOrderBJ( udg_parody_main, "chainlightning", GetLastCreatedUnit() )
                set udg_parody_spell = 'A03R'
            else
            endif
            if ( Trig_parodys_set_cast_Func002Func001Func009C() ) then
                set udg_parody_time = ( udg_parody_time - 0.30 )
            else
            endif
        else
        endif
        set udg_k = udg_k + 1
    endloop
endfunction

//===========================================================================
function InitTrig_parodys_set_cast takes nothing returns nothing
    set gg_trg_parodys_set_cast = CreateTrigger(  )
    call DisableTrigger( gg_trg_parodys_set_cast )
    call TriggerAddAction( gg_trg_parodys_set_cast, function Trig_parodys_set_cast_Actions )
endfunction

//===========================================================================
// Trigger: parodys cast
//===========================================================================
function Trig_parodys_cast_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'odkt' ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_cast_Conditions takes nothing returns boolean
    if ( not Trig_parodys_cast_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_cast_Func002C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() != udg_parody_spell ) ) then
        return false
    endif
    return true
endfunction

function Trig_parodys_cast_Actions takes nothing returns nothing
    if ( Trig_parodys_cast_Func002C() ) then
        call KillUnit( GetSpellAbilityUnit() )
    else
        set udg_is_casted[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = true
    endif
endfunction

//===========================================================================
function InitTrig_parodys_cast takes nothing returns nothing
    set gg_trg_parodys_cast = CreateTrigger(  )
    call DisableTrigger( gg_trg_parodys_cast )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_parodys_cast, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_parodys_cast, Condition( function Trig_parodys_cast_Conditions ) )
    call TriggerAddAction( gg_trg_parodys_cast, function Trig_parodys_cast_Actions )
endfunction

//===========================================================================
// Trigger: parody dies
//===========================================================================
function Trig_parody_dies_Func001Func001Func005A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_parody_dies_Func001Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) < 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Func001Func002Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetEnumUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) ) ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Func001Func002Func001C takes nothing returns boolean
    if ( not Trig_parody_dies_Func001Func002Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Func001Func002A takes nothing returns nothing
    if ( Trig_parody_dies_Func001Func002Func001C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 15.00, ( "Победил игрок " + ( udg_players_colour[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + udg_players_name[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] ) ) )
        call AdjustPlayerStateBJ( ( 400 + ( 40 * udg_wave ) ), GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 10.00, ( "Победа в мини-игре: |cFFFFCD00" + I2S(( 400 + ( 40 * udg_wave ) )) ) )
    else
    endif
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_parody_dies_Func001Func006A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_parody_dies_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_wave_units) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_parody_dies_Actions takes nothing returns nothing
    if ( Trig_parody_dies_Func001C() ) then
        call ForGroupBJ( GetUnitsOfTypeIdAll('odkt'), function Trig_parody_dies_Func001Func002A )
        call GroupClear( udg_wave_units )
        call DisableTrigger( gg_trg_parodys_set_cast )
        call DisableTrigger( gg_trg_parodys_cast )
        call ForGroupBJ( GetUnitsInRectAll(gg_rct________________082), function Trig_parody_dies_Func001Func006A )
        set udg_parody_game = false
    else
        if ( Trig_parody_dies_Func001Func001C() ) then
            call DisplayTimedTextToForce( GetPlayersAll(), 10.00, "TRIGSTR_3768" )
            call GroupClear( udg_wave_units )
            call DisableTrigger( gg_trg_parodys_set_cast )
            call DisableTrigger( gg_trg_parodys_cast )
            call ForGroupBJ( GetUnitsInRectAll(gg_rct________________082), function Trig_parody_dies_Func001Func001Func005A )
            set udg_parody_game = false
        else
        endif
    endif
endfunction

//===========================================================================
function InitTrig_parody_dies takes nothing returns nothing
    set gg_trg_parody_dies = CreateTrigger(  )
    call TriggerAddAction( gg_trg_parody_dies, function Trig_parody_dies_Actions )
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_unit_resources(  )
    call InitTrig_upgrade_def_and_dmg(  )
    call InitTrig_inc_ini(  )
    call InitTrig_inc_per_second(  )
    call InitTrig_inc_upg(  )
    call InitTrig_income_effects(  )
    call InitTrig_Weather(  )
    call InitTrig_Blizzard(  )
    call InitTrig_Storm(  )
    call InitTrig_Storm_effect(  )
    call InitTrig_Armageddon(  )
    call InitTrig_Armageddon_effect(  )
    call InitTrig_Armageddon_effect_2(  )
    call InitTrig_faq(  )
    call InitTrig_faq_death(  )
    call InitTrig_building_inf(  )
    call InitTrig_builder_left(  )
    call InitTrig_mediv_select(  )
    call InitTrig_change_set(  )
    call InitTrig_assassin(  )
    call InitTrig_banshi(  )
    call InitTrig_ghost(  )
    call InitTrig_ghost_active(  )
    call InitTrig_ghost_del_1(  )
    call InitTrig_rejuvenation(  )
    call InitTrig_tip(  )
    call InitTrig_gold_for_gems(  )
    call InitTrig_gems_for_gold(  )
    call InitTrig_sea_dragon(  )
    call InitTrig_boss_ini_start(  )
    call InitTrig_boss_ini_finish(  )
    call InitTrig_boss_end_timer(  )
    call InitTrig_boss_end(  )
    call InitTrig_spells_check(  )
    call InitTrig_spell_1(  )
    call InitTrig_spell_2(  )
    call InitTrig_spell_3(  )
    call InitTrig_spell_4(  )
    call InitTrig_hunter_death(  )
    call InitTrig_hunter_time(  )
    call InitTrig_hunter_end(  )
    call InitTrig_zombie_ini_start(  )
    call InitTrig_zombie_ini_finish(  )
    call InitTrig_zombie_death(  )
    call InitTrig_zombie_spawn(  )
    call InitTrig_gold_ini_start(  )
    call InitTrig_gold_bet(  )
    call InitTrig_gold_result(  )
    call InitTrig_horse_ini_start(  )
    call InitTrig_horse_speed(  )
    call InitTrig_horse_finish(  )
    call InitTrig_miners_ini_start(  )
    call InitTrig_miners_death(  )
    call InitTrig_miners_explosion(  )
    call InitTrig_miners_set(  )
    call InitTrig_miners_reward(  )
    call InitTrig_hide_ini(  )
    call InitTrig_hide_stop(  )
    call InitTrig_hide_kill(  )
    call InitTrig_banshi_ini(  )
    call InitTrig_banshi_cast(  )
    call InitTrig_banshi_end(  )
    call InitTrig_banshi_spawn(  )
    call InitTrig_banshi_attack(  )
    call InitTrig_parody_ini_start(  )
    call InitTrig_parodys_set_cast(  )
    call InitTrig_parodys_cast(  )
    call InitTrig_parody_dies(  )
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation( Player(0), 0 )
    call ForcePlayerStartLocation( Player(0), 0 )
    call SetPlayerColor( Player(0), ConvertPlayerColor(0) )
    call SetPlayerRacePreference( Player(0), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(0), false )
    call SetPlayerController( Player(0), MAP_CONTROL_USER )

    // Player 1
    call SetPlayerStartLocation( Player(1), 1 )
    call ForcePlayerStartLocation( Player(1), 1 )
    call SetPlayerColor( Player(1), ConvertPlayerColor(1) )
    call SetPlayerRacePreference( Player(1), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(1), false )
    call SetPlayerController( Player(1), MAP_CONTROL_USER )

    // Player 2
    call SetPlayerStartLocation( Player(2), 2 )
    call ForcePlayerStartLocation( Player(2), 2 )
    call SetPlayerColor( Player(2), ConvertPlayerColor(2) )
    call SetPlayerRacePreference( Player(2), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(2), false )
    call SetPlayerController( Player(2), MAP_CONTROL_USER )

    // Player 3
    call SetPlayerStartLocation( Player(3), 3 )
    call ForcePlayerStartLocation( Player(3), 3 )
    call SetPlayerColor( Player(3), ConvertPlayerColor(3) )
    call SetPlayerRacePreference( Player(3), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(3), false )
    call SetPlayerController( Player(3), MAP_CONTROL_USER )

    // Player 4
    call SetPlayerStartLocation( Player(4), 4 )
    call ForcePlayerStartLocation( Player(4), 4 )
    call SetPlayerColor( Player(4), ConvertPlayerColor(4) )
    call SetPlayerRacePreference( Player(4), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(4), false )
    call SetPlayerController( Player(4), MAP_CONTROL_USER )

    // Player 5
    call SetPlayerStartLocation( Player(5), 5 )
    call ForcePlayerStartLocation( Player(5), 5 )
    call SetPlayerColor( Player(5), ConvertPlayerColor(5) )
    call SetPlayerRacePreference( Player(5), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(5), false )
    call SetPlayerController( Player(5), MAP_CONTROL_USER )

    // Player 6
    call SetPlayerStartLocation( Player(6), 6 )
    call ForcePlayerStartLocation( Player(6), 6 )
    call SetPlayerColor( Player(6), ConvertPlayerColor(6) )
    call SetPlayerRacePreference( Player(6), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(6), false )
    call SetPlayerController( Player(6), MAP_CONTROL_USER )

    // Player 7
    call SetPlayerStartLocation( Player(7), 7 )
    call ForcePlayerStartLocation( Player(7), 7 )
    call SetPlayerColor( Player(7), ConvertPlayerColor(7) )
    call SetPlayerRacePreference( Player(7), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(7), false )
    call SetPlayerController( Player(7), MAP_CONTROL_USER )

    // Player 11
    call SetPlayerStartLocation( Player(11), 8 )
    call ForcePlayerStartLocation( Player(11), 8 )
    call SetPlayerColor( Player(11), ConvertPlayerColor(11) )
    call SetPlayerRacePreference( Player(11), RACE_PREF_UNDEAD )
    call SetPlayerRaceSelectable( Player(11), false )
    call SetPlayerController( Player(11), MAP_CONTROL_COMPUTER )

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_399
    call SetPlayerTeam( Player(0), 0 )
    call SetPlayerTeam( Player(1), 0 )
    call SetPlayerTeam( Player(2), 0 )
    call SetPlayerTeam( Player(3), 0 )
    call SetPlayerTeam( Player(4), 0 )
    call SetPlayerTeam( Player(5), 0 )
    call SetPlayerTeam( Player(6), 0 )
    call SetPlayerTeam( Player(7), 0 )

    // Force: TRIGSTR_400
    call SetPlayerTeam( Player(11), 1 )

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount( 0, 1 )
    call SetStartLocPrio( 0, 0, 1, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 1, 2 )
    call SetStartLocPrio( 1, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 1, 2, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 2, 2 )
    call SetStartLocPrio( 2, 0, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 1, 3, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 3, 2 )
    call SetStartLocPrio( 3, 0, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 1, 4, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 4, 2 )
    call SetStartLocPrio( 4, 0, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 1, 5, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 5, 2 )
    call SetStartLocPrio( 5, 0, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 1, 6, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 6, 2 )
    call SetStartLocPrio( 6, 0, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 1, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 7, 1 )
    call SetStartLocPrio( 7, 0, 6, MAP_LOC_PRIO_HIGH )
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds( -7680.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -8192.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 11776.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 8192.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -7680.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 8192.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 11776.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -8192.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM) )
    call SetDayNightModels( "Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl" )
    call NewSoundEnvironment( "Default" )
    call SetAmbientDaySound( "DalaranDay" )
    call SetAmbientNightSound( "DalaranNight" )
    call SetMapMusic( "Music", true, 0 )
    call InitSounds(  )
    call CreateRegions(  )
    call CreateCameras(  )
    call CreateAllItems(  )
    call CreateAllUnits(  )
    call InitBlizzard(  )
    call InitGlobals(  )
    call InitCustomTriggers(  )

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName( "TRIGSTR_019" )
    call SetMapDescription( "" )
    call SetPlayers( 9 )
    call SetTeams( 9 )
    call SetGamePlacement( MAP_PLACEMENT_TEAMS_TOGETHER )

    call DefineStartLocation( 0, -6656.0, 7168.0 )
    call DefineStartLocation( 1, -6656.0, 5120.0 )
    call DefineStartLocation( 2, -6656.0, 3072.0 )
    call DefineStartLocation( 3, -6656.0, 1024.0 )
    call DefineStartLocation( 4, -6656.0, -1024.0 )
    call DefineStartLocation( 5, -6656.0, -3072.0 )
    call DefineStartLocation( 6, -6656.0, -5120.0 )
    call DefineStartLocation( 7, -6656.0, -7168.0 )
    call DefineStartLocation( 8, 0.0, 0.0 )

    // Player setup
    call InitCustomPlayerSlots(  )
    call InitCustomTeams(  )
    call InitAllyPriorities(  )
endfunction

