library PlayerDBLib initializer Init  // Library by Nokladr special for MIX Community https://github.com/Igneaalis/MIX
    globals
        Playerdb pdb
        private PlayerStruct array playerStructs[8]
    endglobals

    struct PlayerStruct
        private player p

        real leaderCoeff = 1.00
        integer leaderWins = 0
        integer arenaWins = 1
        integer changeSet = 3
        integer incomeGold = 240
        integer incomeGems = 8
        integer incomeBigMineGold = 3
        integer incomeBigMinePoints = 2
        integer incomeSmallMineGold = 1
        integer incomeSmallMinePoints = 1
        integer incomeFlagGold = 1
        integer incomeFlagPoints = 1
        real incomePoints = 0
        boolean info = true // показывать команды/полезную инфу
        integer kills = 0
        integer upgrades = 0
        integer castlesDestroyed = 0
        real points = 0

        static method create takes player p returns PlayerStruct
            local PlayerStruct playerStruct = PlayerStruct.allocate()
                set playerStruct.p = p
            return playerStruct
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
        method operator [] takes player p returns PlayerStruct
            return playerStructs[GetPlayerId(p)]
        endmethod
    endstruct

    private function fill_dbarr takes nothing returns nothing
        set pdb = Playerdb.create()
        set playerStructs[0] = PlayerStruct.create(Player(0x00))
        set playerStructs[1] = PlayerStruct.create(Player(0x01))
        set playerStructs[2] = PlayerStruct.create(Player(0x02))
        set playerStructs[3] = PlayerStruct.create(Player(0x03))
        set playerStructs[4] = PlayerStruct.create(Player(0x04))
        set playerStructs[5] = PlayerStruct.create(Player(0x05))
        set playerStructs[6] = PlayerStruct.create(Player(0x06))
        set playerStructs[7] = PlayerStruct.create(Player(0x07))
    endfunction

    private function Init takes nothing returns nothing
        call fill_dbarr()
    endfunction
endlibrary
