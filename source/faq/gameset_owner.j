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
        private real cmdDisplayTime
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
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime, "Настройка карты доступна первые " + GREEN + I2S(R2I(settingsTimerTime)) + "|r сек.")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-time ##|r, где ## - время между раундами от 20 до 60 сек. " + "Текущий показатель: " + GREEN + I2S(R2I(relaxWaveTime)) + "|r сек.")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-arena ###|r, где ### - начальное время раунда на арене от 60 сек. до 150 сек. " + "Текущий показатель: " + GREEN + I2S(R2I(arenaTimerTime)) + "|r сек.")
                    if (IsBuildingDuringWavesAllowed == true) then
                        call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-build #|r, при # = 1 во время раунда можно строить и улучшать юнитов, при # = 0 - нельзя. " + "Текущий показатель: " + GREEN + "1|r")
                    else
                        call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-build #|r, при # = 1 во время раунда можно строить и улучшать юнитов, при # = 0 - нельзя. " + "Текущий показатель: " + GREEN + "0|r")
                    endif
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-point #-#|r, влияет на число контрольных точек. " + "Текущий показатель: " + GREEN + I2S(IncomeObjects_StartAmount) + "-" + I2S(IncomeObjects_EndAmount) + "|r")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-mode #|r, при # = 1 мини-игры будут чередоваться каждую вторую волну, при # = 2 мини-игры будут каждые 3 волны, при # = 3 мини-игр не будет совсем. " + "Текущий показатель: " + GREEN + I2S(gameMode) + "|r")
                    call DisplayTimedTextToPlayer(GameOwner, 0, 0, cmdDisplayTime,  GOLD + "-final ##|r, где ## - волна, после которой закончится игра. " + "Текущий показатель: " + GREEN + I2S(finalWave) + "|r")
                endif
            endif
        endif
    endfunction

    private function Init takes nothing returns nothing
        set cmdDisplayTime = settingsTimerTime
    endfunction

endscope