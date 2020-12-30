/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     13.12.2020 20:30       =
=============================================

Реализация тестирования при инициализации

*/

scope Debug initializer Init

    private function Init takes nothing returns nothing
        debug local trigger t = CreateTrigger()
        debug local integer i

        static if DEBUG_MODE then
            // call Log("Hello world!")
            
            // call Log(I2S(PLAYER_NEUTRAL_AGGRESSIVE)) - 24
            // call Log(I2S(bj_PLAYER_NEUTRAL_VICTIM)) - 25
            // call Log(I2S(bj_PLAYER_NEUTRAL_EXTRA)) - 26
            // call Log(I2S(PLAYER_NEUTRAL_PASSIVE)) - 27

            // call Log(I2S(bj_MAX_PLAYERS)) - 24
            // call Log(I2S(bj_MAX_PLAYER_SLOTS)) - 28
        endif
        
        debug set t = null
    endfunction

endscope