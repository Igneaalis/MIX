scope Settings initializer Init

    globals
        integer finalWave = 15
        integer numberOfMinigames = 8
        
        constant integer base_gold = 755  // Кол-во золота в начале игры
        constant integer base_gems = 22   // Кол-во гемов в начале игры

        real timeBeforeFirstWave = 60.00
        debug constant real debugTimeBeforeFirstWave = 10.00
    endglobals

    private function Init takes nothing returns nothing
        debug set timeBeforeFirstWave = debugTimeBeforeFirstWave
    endfunction

endscope