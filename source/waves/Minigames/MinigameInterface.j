/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     29.12.2020 23:48       =
=============================================

Интерфейс типа Minigame

*/

library MinigameInterface

    interface Minigame
        string title
        string description
        real timerTime
        real debugTimerTime
        real x
        real y
        method Fire takes nothing returns nothing
        method Finish takes nothing returns nothing
    endinterface

endlibrary