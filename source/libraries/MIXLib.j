library MIXLib initializer MIXLibInit requires NokladrLib  // Library by Nokladr special for MIX Community https://github.com/Igneaalis/MIX
    globals
        Playerdb pdb
        private DB array dbarr[8]
    endglobals

    struct DB
        private player p
        real leaderCoeff = 1.00
        integer leaderWins = 0
        integer arenaWins = 1
        integer changeSet = 3
        integer incomeGold = 240
        integer incomeGems = 8
        boolean info = true // показывать команды/полезную инфу
        integer kills = 0
        integer upgrades = 0
        integer castlesDestroyed = 0
        real points = 0

        static method create takes player p returns DB
            local DB db = DB.allocate()
                set db.p = p
            return db
        endmethod

        method operator result takes nothing returns real
            local real result = 0
            set result = result + GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) / 250
            set result = result + GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) / 5
            set result = result + kills / 5 * (10 + GetPlayerTechCount(p, pointsForKillsRC, true))
            set result = result + upgrades * 2
            set result = result + castlesDestroyed * 12.5
            set result = result + points * 0.07 * leaderCoeff
            return result
        endmethod
    endstruct

    struct Playerdb
        method operator [] takes player p returns DB
            return dbarr[GetPlayerId(p)]
        endmethod
    endstruct

    private function fill_dbarr takes nothing returns nothing
        set pdb = Playerdb.create()
        set dbarr[0] = DB.create(Player(0x00))
        set dbarr[1] = DB.create(Player(0x01))
        set dbarr[2] = DB.create(Player(0x02))
        set dbarr[3] = DB.create(Player(0x03))
        set dbarr[4] = DB.create(Player(0x04))
        set dbarr[5] = DB.create(Player(0x05))
        set dbarr[6] = DB.create(Player(0x06))
        set dbarr[7] = DB.create(Player(0x07))
    endfunction

    private function MIXLibInit takes nothing returns nothing
        call fill_dbarr()
    endfunction
endlibrary
