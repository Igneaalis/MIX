/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:41       =
= Дата изменения:    03.11.2020 14:37       =
=============================================

Объявление глобальных переменных

*/

globals
    boolean IsDevInGame = false                                                                 // Условие: один из разработчиков в игре?
    hashtable hash = InitHashtable()                                                            // Инициализация хэш-таблицы
    constant string strVersion = "0.0.1"                                                        // Версия карты, семантическое версионирование: (Major, Minor, Patch)
    constant string Version = "Test"                                                            // Тип версии {Test, Release}
    constant string strEmail = (LB + "Nostaleal.ru|r" + GOLD + "@|r" + LB + "yandex.ru|r")      // E-Mail адрес
    constant string strBuild_Time = "8 November 2020"                                           // Время создания билда карты

    leaderboard Leaderboard                                                                     // таблица лидеров

    constant integer finalWave = 15
    constant integer numberOfMinigames = 8
endglobals