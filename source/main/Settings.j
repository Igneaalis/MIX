/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     24.12.2020 16:58       =
=============================================

Базовые настройки игры

*/

scope Settings initializer Init

    globals
        integer finalWave = 4
        
        constant integer baseGold = 755  // Кол-во золота в начале игры
        constant integer baseGems = 22   // Кол-во гемов в начале игры

        real settingsTimerTime = 60.00
        private constant real debugSettingsTimerTime = 8.00

        boolean IsBuildingDuringWavesAllowed = true
    endglobals

    private function Init takes nothing returns nothing
        debug set settingsTimerTime = debugSettingsTimerTime
    endfunction

endscope