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

    // globals
    //     private string debug_test_playerList = ""
    //     private integer debug_test_numberOfPlayers = 0
    // endglobals

    // private function debug_test_ForForce takes nothing returns nothing
    //     set debug_test_playerList = debug_test_playerList + GetPlayerName(GetEnumPlayer()) + " "
    //     set debug_test_numberOfPlayers = debug_test_numberOfPlayers + 1
    // endfunction

    // private function debug_test takes nothing returns nothing
    //     set debug_test_playerList = ""
    //     set debug_test_numberOfPlayers = 0
    //     call ForForce(minigameActingPlayers, function debug_test_ForForce)
    //     call Log("Minigame number of acting players: " + I2S(minigameNumberOfActingPlayers))
    //     call Log("Minigame number of acting players in force: " + I2S(debug_test_numberOfPlayers))
    //     call Log("Minigame acting players in force: " + debug_test_playerList)
    //     call Log("------------------------")
    //     set debug_test_playerList = ""
    //     set debug_test_numberOfPlayers = 0
    //     call ForForce(players, function debug_test_ForForce)
    //     call Log("Number of players in force: " + I2S(debug_test_numberOfPlayers))
    //     call Log("Players in force: " + debug_test_playerList)
    // endfunction

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

            // for i = 1 to 15
            //     call Log(I2S(GetRandomInt(0, 2))) - 0, 1, 2
            // endfor

            // for i = 0 to 0
            //     call Log("i = : " + I2S(i)) - 0
            // endfor

            // call Log("-------")

            // for i = 0 to 1
            //     call Log("i = : " + I2S(i)) - 0, 1
            // endfor

        endif
        
        debug set t = null
    endfunction

endscope