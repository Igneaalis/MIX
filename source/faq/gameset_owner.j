/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 21:07       =
=============================================

Sets the owner of the game.
Shows all available commands and settings
Owner can modify game settings via commands.

*/


scope GameSetOwner initializer Init

    globals
        player GameOwner
    endglobals

    function GameSetOwner_SetOwner takes nothing returns nothing
        local integer i = 0
        loop // Sets GameOwner to the first available player
            if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) then // Must be a playing player
                set GameOwner = Player(i)
            endif
            exitwhen (GameOwner == Player(i))
            set i = i + 1
        endloop

        static if not DEBUG_MODE then
            // Notification for game owner
            call DisplayTimedTextToPlayer(GameOwner, 0, 0, 10, "Вы получили права " + GREEN + "владельца игры|r.")
        endif

        if (GetTimeInSeconds() < R2I(settingsTimerTime)) then // Shows commands and settings only at game start
            static if not DEBUG_MODE then
                if (pdb[GameOwner].info == true) then // Checks Info flag of game owner
                    // Shows all available commands and settings
                    call TimeCommand.run.evaluate(GameOwner, "-time")
                    call ArenaCommand.run.evaluate(GameOwner, "-arena")
                    call BuildCommand.run.evaluate(GameOwner, "-build")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, Commands.GetCmdDisplayTime.evaluate(),  GOLD + "-point|r " + GREEN + "#|r-" + GREEN +"#|r, где " + GREEN + "#|r-" + GREEN + "#|r - число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "|r-" + GREEN + I2S(IncomeObjects_EndAmount) + "|r.")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, Commands.GetCmdDisplayTime.evaluate(),  GOLD + "-mgw|r " + GREEN + "#|r, при " + GREEN + "#|r = 1 миниигры будут каждую волну, при " + GREEN + "#|r = 2 миниигры будут каждые 2 волны, при " + GREEN + "#|r = 0 миниигр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(minigameWave) + "|r.")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, Commands.GetCmdDisplayTime.evaluate(),  GOLD + "-final|r " + GREEN + "#|r, где " + GREEN + "#|r - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r.")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, settingsTimerTime, "Настройка карты доступна первые " + GREEN + I2S(R2I(settingsTimerTime)) + "|r сек.")
                endif
            endif
        endif
    endfunction

    private function Init takes nothing returns nothing

    endfunction

endscope