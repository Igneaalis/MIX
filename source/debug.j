function DebugInit takes nothing returns nothing
    debug local trigger t = CreateTrigger()
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