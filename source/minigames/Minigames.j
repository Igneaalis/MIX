scope Minigames initializer Init

    globals
        
    endglobals

    private function Conditions takes nothing returns boolean
        local integer i = 0
        if (udg_random_log == true) then
            return false
        endif
        loop
            exitwhen i > 8
            if (udg_wave_mini[i] == (udg_r * 2)) then
                return false
            endif
            set i = i + 1
        endloop
        return true
    endfunction

    private function Init takes nothing returns nothing
        local integer i

        // Что-то связанное с минииграми
        set i = 0
        loop
            exitwhen i > udg_mini_game_max
            if (i != 1) then
                // Если не миниигра с боссом, то
                set udg_random_log = false
                loop // Заполняем wave_mini[] рандомными, неповторяющимися числами (2, 4, 6, ..., 18) - волны, когда будут миниигры. mode = 1 (стандартный режим)
                    exitwhen udg_random_log
                    set udg_r = GetRandomInt(1, (udg_mini_game_max + 1)) // От 1 до 9 (кол-во миниигр)
                    if (Conditions()) then
                        set udg_random_log = true
                        set udg_wave_mini[i] = udg_r * 2
                    endif
                endloop
            endif
            set i = i + 1
        endloop
    endfunction

endscope