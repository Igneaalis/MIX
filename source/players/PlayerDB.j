/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     13.12.2020 20:30       =
=============================================

Структура данных для каждого игрока

*/

library PlayerDBLib initializer Init  // Library by Nokladr special for MIX Community https://github.com/Igneaalis/MIX
    globals
        Playerdb pdb
        private PlayerStruct array playerStructs[maxNumberOfPlayers]
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
            if p != null then
                return playerStructs[GetPlayerId(p)]
            else
                return PlayerStruct.create(null)
            endif
        endmethod
    endstruct

    private function Init takes nothing returns nothing
        local integer i = 0
        set pdb = Playerdb.create()
        for i = 0 to maxNumberOfPlayers - 1
            set playerStructs[i] = PlayerStruct.create(Player(i))
        endfor
    endfunction
endlibrary
