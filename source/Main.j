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

scope Main initializer MainInit
  
    function map_init takes nothing returns nothing
        local string strTestWarning_RU  // Предупреждение к тестовому типу карты
        local string strWarning_RU      // Предупреждение к тестовому типу карты
        local string strVar_RU          // Итоговое сообщение о типе карты
        local string Feedback_RU        // Сообщение об обратной связи с создателями карты

        // Аналогично, но только по-английски.
        local string strTestWarning_EN
        local string strWarning_EN
        local string strVar_EN
        local string Feedback_EN

        local integer i = 0


        static if (not DEBUG_MODE) then
            // Отображает strVar_** в зависимости от типа карты
            set strTestWarning_RU = "В данной версии вы можете увидеть десинхронизацию, баги, неправильную работу способностей и ошиКБи в словах."
            set strWarning_RU = (RED + "Внимание:|r " + "вы играете в " + Version + " версию " + strVersion + ". ")
            set strTestWarning_EN = "In this version you can experience desyncs, bugs, and miTSakes in localization."
            set strWarning_EN = (RED + "Caution:|r " + "you are playing in " + Version + " version " + strVersion + ". ")
            if (Version != "" and strVersion != "") then
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
            loop
                exitwhen (i > 11)
                if (GetPlayerName(Player(i)) == "Nokladr" or GetPlayerName(Player(i)) == "Nokladr#2429") then
                    if (Locale.evaluate() == "RU") then
                        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("С вами играет создатель данной карты, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Критика приветствуется :)\n "))
                    else
                        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("You are playing with author, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Any feedback is welcome :)\n "))
                    endif
                    set IsDevInGame = true
                endif
                set i = i + 1
            endloop
        endif

        // Инициализируем хэш-таблицу
        set hash = HashTable.create()
        set table = Table.create()

        // Заполнение массива incSpellrc равкодами инкам способностей
        set incSpellrc[1] = 'R00F'
        set incSpellrc[2] = 'R00G'
        set incSpellrc[3] = 'R00H'
        set incSpellrc[4] = 'R00I'
        set incSpellrc[5] = 'R00J'
        set incSpellrc[6] = 'R00Q'
        set incSpellrc[7] = 'R00R'
        set incSpellrc[8] = 'R00S'
        set incSpellrc[9] = 'R027'
        set incSpellrc[10] = 'R029'
        set incSpellrc[11] = 'R02I'
        set incSpellrc[12] = 'R02J'
        set incSpellrc[13] = 'R02K'

        // Заполнение массивов robbery_pr_f и robbery_pr_s процентами спосоности Грабёж
        set robbery_pr_f[1] = 5
        set robbery_pr_f[2] = 10
        set robbery_pr_f[3] = 15
        set robbery_pr_f[4] = 20
        set robbery_pr_f[5] = 30
        set robbery_pr_f[6] = 40

        set robbery_pr_s[1] = 5
        set robbery_pr_s[2] = 6
        set robbery_pr_s[3] = 7
        set robbery_pr_s[4] = 8
        set robbery_pr_s[5] = 9
        set robbery_pr_s[6] = 10

        // Заполнение массивов stab_time_gold и stab_time_lumber периодом инкама
        set stab_time_gold[1] = 3
        set stab_time_gold[2] = 3
        set stab_time_gold[3] = 3
        set stab_time_gold[4] = 3
        set stab_time_gold[5] = 3
        set stab_time_gold[6] = 3

        set stab_time_lumber[1] = 40
        set stab_time_lumber[2] = 40
        set stab_time_lumber[3] = 30
        set stab_time_lumber[4] = 20
        set stab_time_lumber[5] = 15
        set stab_time_lumber[6] = 12

        // Заполнение массивов stab_gold и stab_lumber кол-вом инкама
        set stab_gold[1] = 1
        set stab_gold[2] = 1
        set stab_gold[3] = 2
        set stab_gold[4] = 2
        set stab_gold[5] = 3
        set stab_gold[6] = 4
        
        set stab_lumber[1] = 0
        set stab_lumber[2] = 1
        set stab_lumber[3] = 1
        set stab_lumber[4] = 1
        set stab_lumber[5] = 1
        set stab_lumber[6] = 1

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

        call Log("map_init finished!")

        // Не забываем обнулить переменные!!!
        set strTestWarning_RU = null
        set strWarning_RU = null
        set strVar_RU = null
        set Feedback_RU = null
        
        set strTestWarning_EN = null
        set strWarning_EN = null
        set strVar_EN = null
        set Feedback_EN = null
    endfunction

    //-----------------------------Post main init------------------------------

    function post_map_init takes nothing returns nothing

        call initialization_in_game.execute()

        // Disable Damage Detection System until Fast Arena begins
        call DisableTrigger(DDS)

        call Log("post_map_init finished!")
        
    endfunction

    //-------------------------The very first function-------------------------
    // Starts map initialization
    function MainInit takes nothing returns nothing
        local trigger t = CreateTrigger()

        call map_init()
        call TriggerRegisterTimerEventSingle(t, 0)
        call TriggerAddAction(t, function post_map_init)
        call C_SetComputers()
        call StartInitTimer()

        set t = null
    endfunction

endscope
