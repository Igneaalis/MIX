scope Settings initializer Init

    globals
        integer finalWave = 15
        
        constant integer baseGold = 755  // Кол-во золота в начале игры
        constant integer baseGems = 22   // Кол-во гемов в начале игры

        real settingsTimerTime = 60.00
        debug constant real debugSettingsTimerTime = 10.00
    endglobals

    private function Init takes nothing returns nothing
        debug set settingsTimerTime = debugSettingsTimerTime
    endfunction

endscope