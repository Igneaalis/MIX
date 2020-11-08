/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:28       =
= Дата изменения:    08.11.2020 22:01       =
=============================================

Главный и входной интерфейс карты.

*/

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
        if (Locale() == "RU") then
            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_RU)
        else
            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 25, strVar_EN)
        endif
    endif

    // Сообщение об обратной связи
    set Feedback_RU = "Связаться со мной можно по электронной почте, буду рад ответить на любые вопросы: " + strEmail + "\n "
    set Feedback_EN = "If you see an issue, please, leave the feedback/suggestions in the E-Mail: " + strEmail + "\n "
    if (Locale() == "RU") then
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_RU)
    else
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, Feedback_EN)
    endif

    // Условие: один из разработчиков в игре?
    loop
        exitwhen (i > 11)
        if (GetPlayerName(Player(i)) == "Nokladr" or GetPlayerName(Player(i)) == "Nokladr#2429") then
            if (Locale() == "RU") then
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("С вами играет создатель данной карты, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Критика приветствуется :)\n "))
            else
                call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 35, ("You are playing with author, " + C_IntToColor(i) + "Nokladr#2429" + "|r. Any feedback is welcome :)\n "))
            endif
            set IsDevInGame = true
        endif
        set i = i + 1
    endloop


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

//--------------------------------------------------Post main init---------------------------------------------------

function post_map_init takes nothing returns nothing
    
    //Сообщения
    call SetMessagesInit()

    //initialization in game trigger
    call initialization_in_game()
    
endfunction