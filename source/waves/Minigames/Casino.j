/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.05.2021 18:07       =
=============================================

Миниигра: "Казино"

*/

scope MinigameCasino initializer Init

    globals
        private constant integer circleTypeId = 'n001'
        private constant integer X = -4030
        private constant integer Y = 6850
        private real startPointX = 0
        private real startPointY = 0
        private integer array playerGoldBet[maxNumberOfPlayers]
        private integer array playerGemsBet[maxNumberOfPlayers]
        private unit array playerGoldBetSelectedCircle[maxNumberOfPlayers]
        private unit array playerGemsBetSelectedCircle[maxNumberOfPlayers]
        private integer array playerGoldBetSelectedCircleNumber[maxNumberOfPlayers]
        private integer array playerGemsBetSelectedCircleNumber[maxNumberOfPlayers]
    endglobals

    private function Command_gold takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local integer chatGold = S2I(SubString(GetEventPlayerChatString(), 6, 13))
        local integer playerGold = GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)
        local integer differenceGold = 0
        local group g = CreateGroup()
        local unit selectedUnit
        local integer i = 0
        call SyncSelections()
        call GroupEnumUnitsSelected(g, p, null)
        set selectedUnit = FirstOfGroup(g)
        call DestroyGroup(g)
        set g = null

        if curMinigame.getType() != Casino.typeid then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r данная команда работает только в миниигре " + GREEN + "Казино|r!")
            set p = null
            set selectedUnit = null
            return
        endif

        if GetUnitTypeId(selectedUnit) != circleTypeId then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r нужно выбрать сектор, чтобы сделать ставку!")
            set p = null
            set selectedUnit = null
            return
        endif

        if chatGold < 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r введено неправильное количество!")
        elseif playerGold < 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r у вас " + GOLD + "0|r золота!")
        elseif playerGoldBet[GetPlayerId(p)] > 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r ставки сделаны, ставок больше нет! (" + GOLD + "Золото|r" + ")")
        else
            set differenceGold = IMinBJ(playerGold, chatGold)
            call SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, playerGold - differenceGold)
            set playerGoldBet[GetPlayerId(p)] = differenceGold
            set playerGoldBetSelectedCircle[GetPlayerId(p)] = selectedUnit
            set i = 1
            while selectedUnit != table[StringHash("Casino")].unit[i]
                set i = i + 1
            endwhile
            set playerGoldBetSelectedCircleNumber[GetPlayerId(p)] = i
            call DisplayTimedTextToPlayer(p, 0, 0, 10, "Было поставлено " + GOLD + I2S(differenceGold) + "|r золота!")
        endif

        set p = null
        set selectedUnit = null
    endfunction

    private function Command_gems takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local integer chatGems = S2I(SubString(GetEventPlayerChatString(), 6, 13))
        local integer playerGems = GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)
        local integer differenceGems = 0
        local group g = CreateGroup()
        local unit selectedUnit
        local integer i = 0
        call SyncSelections()
        call GroupEnumUnitsSelected(g, p, null)
        set selectedUnit = FirstOfGroup(g)
        call DestroyGroup(g)
        set g = null

        if curMinigame.getType() != Casino.typeid then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r данная команда работает только в миниигре " + GREEN + "Казино|r!")
            set p = null
            set selectedUnit = null
            return
        endif

        if GetUnitTypeId(selectedUnit) != circleTypeId then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r нужно выбрать сектор, чтобы сделать ставку!")
            set p = null
            set selectedUnit = null
            return
        endif

        if chatGems < 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r введено неправильное количество!")
        elseif playerGems < 1 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r у вас " + GOLD + "0|r самоцветов!")
        elseif playerGemsBet[GetPlayerId(p)] > 0 then
            call DisplayTimedTextToPlayer(p, 0, 0, 10, RED + "Внимание:|r ставки сделаны, ставок больше нет! (" + VIOLET + "Самоцветы|r" + ")")
        else
            set differenceGems = IMinBJ(playerGems, chatGems)
            call SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, playerGems - differenceGems)
            set playerGemsBet[GetPlayerId(p)] = differenceGems
            set playerGemsBetSelectedCircle[GetPlayerId(p)] = selectedUnit
            set i = 1
            while selectedUnit != table[StringHash("Casino")].unit[i]
                set i = i + 1
            endwhile
            set playerGemsBetSelectedCircleNumber[GetPlayerId(p)] = i
            call DisplayTimedTextToPlayer(p, 0, 0, 10, "Было поставлено " + VIOLET + I2S(differenceGems) + "|r самоцветов!")
        endif

        set p = null
        set selectedUnit = null
    endfunction

    private function Init takes nothing returns nothing
        local integer i = 0
        local integer j = 0
        local integer count = 0
        local unit circle
        local texttag tt
        local trigger t = CreateTrigger()

        call TriggerSleepAction(0)

        call TriggerRegisterPlayerChatEvent(t, Player(0x00), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x01), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x02), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x03), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x04), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x05), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x06), "-gold", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x07), "-gold", false)
        call TriggerAddAction(t, function Command_gold)

        set t = CreateTrigger()

        call TriggerRegisterPlayerChatEvent(t, Player(0x00), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x01), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x02), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x03), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x04), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x05), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x06), "-gems", false)
        call TriggerRegisterPlayerChatEvent(t, Player(0x07), "-gems", false)
        call TriggerAddAction(t, function Command_gems)
        set t = null

        set startPointX = GetRectCenterX(gg_rct_circle)
        set startPointY = GetRectCenterY(gg_rct_circle)

        //====== for i = 0 to 2  ======//
        for i = 0 to 2
            for j = 0 to 4
                set circle = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), circleTypeId, startPointX + 256 * j, startPointY - 256 * i, 270)
                set count = count + 1
                set table[StringHash("Casino")].unit[count] = circle
                if (ModuloInteger(count, 2) == 1) then
                    // Z offset = 0
                    // Font size = 11.00
                    // Red =    100.00%
                    // Green =  10.00%
                    // Blue =   10.00%
                    // Transparency = 0%
                    set tt = NewTextTagAtUnitColored(I2S(count), circle, 0, 11, 255, 26, 26)
                    call SetUnitColor(circle, PLAYER_COLOR_RED)
                else
                    set tt = NewTextTagAtUnitColored(I2S(count), circle, 0, 11, 75, 75, 55)
                    call SetUnitColor(circle, PLAYER_COLOR_BROWN)
                endif
            endfor
        endfor

        set tt = null
        set circle = null
    endfunction

    struct Casino extends Minigame
        string title = "Казино"
        string description = "Делайте свои ставки. Доступные " + GREEN + "команды|r:\n" + GOLD + "-gold xxxxx|r\n" + VIOLET + "-gems xxx|r"
        real timerTime = 60.00
        real debugTimerTime = 30.00
        real x = X
        real y = Y
        
        method Fire takes nothing returns nothing
        endmethod

        method Finish takes nothing returns nothing
            local integer i = 0
            local integer winNumber1 = GetRandomInt(1, 15)
            local integer winNumber2 = winNumber1
            local integer temp = 0
            local integer loseGold = 0
            local integer winGold = 0
            local integer differenceGold = 0
            local integer loseGems = 0
            local integer winGems = 0
            local integer differenceGems = 0

            while winNumber2 == winNumber1
                set winNumber2 = GetRandomInt(1, 15)
            endwhile
            set temp = winNumber1
            set winNumber1 = IMinBJ(winNumber1, winNumber2)
            set winNumber2 = IMaxBJ(temp, winNumber2)
            call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, "Выигрышные номера: " + GREEN + I2S(winNumber1) + "|r и " + GREEN + I2S(winNumber2) + "|r!")
            
            for i = 0 to maxNumberOfPlayers - 1
                if playerGoldBet[i] > 0 then
                    if table[StringHash("Casino")].unit[winNumber1] == playerGoldBetSelectedCircle[i] or table[StringHash("Casino")].unit[winNumber2] == playerGoldBetSelectedCircle[i] then
                        if playerGoldBet[i] <= 200 then
                            set winGold = R2I(playerGoldBet[i] * 0.20)
                            set differenceGold = playerGoldBet[i] + winGold
                        elseif playerGoldBet[i] > 200 and playerGoldBet[i] <= 500 then
                            set winGold = R2I(playerGoldBet[i] * 0.40)
                            set differenceGold = playerGoldBet[i] + winGold
                        elseif playerGoldBet[i] > 500 and playerGoldBet[i] <= 1000 then
                            set winGold = R2I(playerGoldBet[i] * 0.60)
                            set differenceGold = playerGoldBet[i] + winGold
                        elseif playerGoldBet[i] > 1000 then
                            set winGold = R2I(playerGoldBet[i] * 0.80)
                            set differenceGold = playerGoldBet[i] + winGold
                        endif
                        
                        call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, GREEN + "Ваша ставка состоялась.|r (" + GOLD + "Золото|r" + " - " + GREEN + I2S(playerGoldBetSelectedCircleNumber[i]) + "|r)\nВы зарабатываете: " + GOLD + I2S(winGold) + "|r золота!")
                        call AddGoldToPlayer(differenceGold, Player(i))
                    else
                        if playerGoldBet[i] <= 200 then
                            set loseGold = R2I(playerGoldBet[i] * 0.25)
                            set differenceGold = playerGoldBet[i] - loseGold
                        elseif playerGoldBet[i] > 200 and playerGoldBet[i] <= 500 then
                            set loseGold = R2I(playerGoldBet[i] * 0.50)
                            set differenceGold = playerGoldBet[i] - loseGold
                        elseif playerGoldBet[i] > 500 and playerGoldBet[i] <= 1000 then
                            set loseGold = R2I(playerGoldBet[i] * 0.75)
                            set differenceGold = playerGoldBet[i] - loseGold
                        elseif playerGoldBet[i] > 1000 then
                            set loseGold = R2I(playerGoldBet[i] * 1.00)
                            set differenceGold = playerGoldBet[i] - loseGold
                        endif
                        call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, RED + "Ваша ставка не состоялась.|r (" + GOLD + "Золото|r" + " - " + GREEN + I2S(playerGoldBetSelectedCircleNumber[i]) + "|r)\nВы потеряли: " + GOLD + I2S(loseGold) + "|r золота!")
                        call AddGoldToPlayer(differenceGold, Player(i))
                    endif
                    set playerGoldBet[i] = 0
                    set playerGoldBetSelectedCircle[i] = null
                    set playerGoldBetSelectedCircleNumber[i] = 0
                endif

                if playerGemsBet[i] > 0 then
                    if table[StringHash("Casino")].unit[winNumber1] == playerGemsBetSelectedCircle[i] or table[StringHash("Casino")].unit[winNumber2] == playerGemsBetSelectedCircle[i] then
                        if playerGemsBet[i] <= 10 then
                            set winGems = R2I(playerGemsBet[i] * 0.20)
                            set differenceGems = playerGemsBet[i] + winGems
                        elseif playerGemsBet[i] > 10 and playerGemsBet[i] <= 25 then
                            set winGems = R2I(playerGemsBet[i] * 0.40)
                            set differenceGems = playerGemsBet[i] + winGems
                        elseif playerGemsBet[i] > 25 and playerGemsBet[i] <= 50 then
                            set winGems = R2I(playerGemsBet[i] * 0.60)
                            set differenceGems = playerGemsBet[i] + winGems
                        elseif playerGemsBet[i] > 50 then
                            set winGems = R2I(playerGemsBet[i] * 0.80)
                            set differenceGems = playerGemsBet[i] + winGems
                        endif
                        call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, GREEN + "Ваша ставка состоялась.|r (" + VIOLET + "Самоцветы|r" + " - " + GREEN + I2S(playerGemsBetSelectedCircleNumber[i]) + "|r)\nВы зарабатываете: " + VIOLET + I2S(winGems) + "|r самоцветов!")
                        call AddGemsToPlayer(differenceGems, Player(i))
                    else
                        if playerGemsBet[i] <= 10 then
                            set loseGems = R2I(playerGemsBet[i] * 0.25)
                            set differenceGems = playerGemsBet[i] - loseGems
                        elseif playerGemsBet[i] > 10 and playerGemsBet[i] <= 25 then
                            set loseGems = R2I(playerGemsBet[i] * 0.50)
                            set differenceGems = playerGemsBet[i] - loseGems
                        elseif playerGemsBet[i] > 25 and playerGemsBet[i] <= 50 then
                            set loseGems = R2I(playerGemsBet[i] * 0.75)
                            set differenceGems = playerGemsBet[i] - loseGems
                        elseif playerGemsBet[i] > 50 then
                            set loseGems = R2I(playerGemsBet[i] * 1.00)
                            set differenceGems = playerGemsBet[i] - loseGems
                        endif
                        call DisplayTimedTextToPlayer(Player(i), 0, 0, 10, RED + "Ваша ставка не состоялась.|r (" + VIOLET + "Самоцветы|r" + " - " + GREEN + I2S(playerGemsBetSelectedCircleNumber[i]) + "|r)\nВы потеряли: " + VIOLET + I2S(loseGems) + "|r самоцветов!")
                        call AddGemsToPlayer(differenceGems, Player(i))
                    endif
                    set playerGemsBet[i] = 0
                    set playerGemsBetSelectedCircle[i] = null
                    set playerGemsBetSelectedCircleNumber[i] = 0
                endif
            endfor
        endmethod
    endstruct

endscope
