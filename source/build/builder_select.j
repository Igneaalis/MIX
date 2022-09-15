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
        private integer array peonsId[6]
        
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
            call AddGoldToPlayer(baseGold, owner_of_peon) // Check Globals.j
            call AddLumberToPlayer(baseGems, owner_of_peon) // Check Globals.j
        endif

        set peon = null
        set owner_of_peon = null
        call DestroyGroup(group_of_dummies)
        set group_of_dummies = null
        set mbitem = null
    endfunction

    //===========================================================================
    function builder_select takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i

        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_SELL, null)
        endfor

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