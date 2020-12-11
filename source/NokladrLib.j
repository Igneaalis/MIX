/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     18.02.2016             =
=============================================

Библиотека общего назначения.

*/

library NokladrLib
    globals
        constant string GOLD =      "|cffffcc00"
        constant string WHITE =     "|cffffffff"
        constant string RED =       "|cffff0202"    // Player(0)
        constant string BLUE =      "|cff0041ff"    // Player(1)
        constant string TEAL =      "|cff1be5b8"    // Player(2)
        constant string PURPLE =    "|cff530080"    // Player(3)
        constant string YELLOW =    "|cffffff00"    // Player(4)
        constant string ORANGE =    "|cfffe890D"    // Player(5)
        constant string GREEN =     "|cff1fbf00"    // Player(6)
        constant string PINK =      "|cffe45aaa"    // Player(7)
        constant string GRAY =      "|cff949596"    // Player(8)
        constant string LB =        "|cff7dbef1"    // Player(9)
        constant string DG =        "|cff0f6145"    // Player(10)
        constant string BROWN =     "|cff4d2903"    // Player(11)
        integer array time[3] // time[0] - секунды, time[1] - минуты, time[2] - часы
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
        endif
        return ""
    endfunction

    // Отображает сообщение об ошибке
    function C_ErrorMsg takes string s returns nothing
        debug call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, (RED + "Ошибка: " + s + "|r"))
    endfunction

    // Лог сообщений
    function Log takes string s returns nothing
        debug call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, (GOLD + "Log:|r " + GREEN + s + "|r"))
    endfunction

    // Устанавливает всем компьютерным игрокам соответствующее имя
    function C_SetComputers takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen (i > 14)
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
        call RemoveUnit(GetEnumUnit())
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

    // Makes map normal in opposite to FadeMap()
    function UnfadeMap takes nothing returns nothing
        call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    endfunction
    
    // Makes map absolute black
    function FadeMap takes nothing returns nothing
        call SetDayNightModels("", "")
    endfunction

endlibrary