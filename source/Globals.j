/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:41       =
= Дата изменения:    03.12.2020 02:07       =
=============================================

Объявление глобальных переменных

*/

globals
    boolean IsDevInGame = false                                                                 // Условие: один из разработчиков в игре?
    HashTable hash                                                                              // Инициализация хэш-таблицы
    constant string strVersion = "0.0.1"                                                        // Версия карты, семантическое версионирование: (Major, Minor, Patch)
    constant string Version = "Test"                                                            // Тип версии {Test, Release}
    constant string strEmail = (LB + "Nostaleal.ru|r" + GOLD + "@|r" + LB + "yandex.ru|r")      // E-Mail адрес
    constant string strBuild_Time = "8 November 2020"                                           // Время создания билда карты

    leaderboard Leaderboard                                                                     // Таблица лидеров

    constant integer finalWave = 15
    constant integer numberOfMinigames = 8
    constant integer base_gold = 755                                                            // Кол-во золота в начале игры
    constant integer base_gems = 22                                                             // Кол-во гемов в начале игры

    constant integer incSpellrc_count = 14                                                      // Кол-во инкам способностей(значение увеличено на 1 для удобства)
    constant integer count_research_for_t1 = 12                                                 // Кол-во улучшений для доступа к т1
    constant integer count_research_for_t2 = 20                                                 // Кол-во улучшений для доступа к т2      
    constant integer max_players = 8                                                            // Максимальное кол-во игроков

    integer array incSpellrc[incSpellrc_count]                                                  // Массив инкам способностей(заполнение в Main.j, function map_init)
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

    // Равкоды
    constant integer castle_rc = 'h01O'
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
    
    // Настройки улучшения Грабёж, заполнение массива в Main.j
    constant integer robbery_pr_count = 7
    real array robbery_pr_f[robbery_pr_count]
    real array robbery_pr_s[robbery_pr_count]

    // Настройки улучшения Вклад
    constant integer contr_gold = 200
    constant integer contr_gold_mod = 100
    constant integer contr_lumber = 8
    constant integer contr_lumber_mod = 6
    constant integer contr_percent = 150 // процент

    // Настройки улучшения Стабильность, заполнение массива в Main.j
    constant integer stab_count = 7
    real array stab_time_gold[stab_count]
    real array stab_time_lumber[stab_count]
    integer array stab_gold[stab_count]
    integer array stab_lumber[stab_count]
    timer array stab_timer_gold[max_players]
    timer array stab_timer_lumber[max_players]

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

    // Настройки улучшения Золотодобыча, заполнение массива в Main.j
    constant integer goldmining_count = 6
    integer array goldmining_main_mine[goldmining_count]
    integer array goldmining_extra_mine[goldmining_count]
    integer array goldmining_income[goldmining_count]

    // Настройки улучшения Развитие ради развития
    constant real evforev_bonus_res = 0.01
    constant real evforev_bonus_res_mod = 0.01

    // Настройки улучшения Агрессивная игра
    // Аура - aggrgame_aura_rc, внутри неё менять скорость боя и перемещения
endglobals