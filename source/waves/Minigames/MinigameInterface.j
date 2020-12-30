library MinigameInterface

    interface Minigame
        string title
        string description
        real timerTime
        real x
        real y
        method Fire takes nothing returns nothing
        method Finish takes nothing returns nothing
    endinterface

endlibrary