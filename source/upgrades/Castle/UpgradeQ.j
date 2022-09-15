/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 11:44       =
=============================================

Улучшение: "Золотодобыча"

*/

scope CastleUpgradeQ initializer Init
    
    globals
        private constant integer upgradeRC = 'R00F'
        private integer array s_incomeBigMineGold
        private integer array s_incomeSmallMineGold
        private integer array s_incomeFlagGold
        private integer array s_incomeGold
    endglobals

    private function Actions takes nothing returns nothing
        local integer researchRC = GetResearched()
        local player p = GetTriggerPlayer()
        local integer lvl = GetPlayerTechCount(p, researchRC, true)

        if researchRC != upgradeRC then
            set p = null
            return
        endif

        set pdb[p].incomeBigMineGold = pdb[p].incomeBigMineGold + s_incomeBigMineGold[lvl]
        set pdb[p].incomeSmallMineGold = pdb[p].incomeSmallMineGold + s_incomeSmallMineGold[lvl]
        set pdb[p].incomeFlagGold = pdb[p].incomeFlagGold + s_incomeFlagGold[lvl]
        set pdb[p].incomeGold = pdb[p].incomeGold + s_incomeGold[lvl]

        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i

        set s_incomeBigMineGold[1] = 1
        set s_incomeBigMineGold[2] = 1
        set s_incomeBigMineGold[3] = 1
        set s_incomeBigMineGold[4] = 1
        set s_incomeBigMineGold[5] = 1
        set s_incomeBigMineGold[6] = 1

        set s_incomeSmallMineGold[1] = 0
        set s_incomeSmallMineGold[2] = 0
        set s_incomeSmallMineGold[3] = 1
        set s_incomeSmallMineGold[4] = 0
        set s_incomeSmallMineGold[5] = 1
        set s_incomeSmallMineGold[6] = 1

        set s_incomeFlagGold[1] = 0
        set s_incomeFlagGold[2] = 0
        set s_incomeFlagGold[3] = 1
        set s_incomeFlagGold[4] = 0
        set s_incomeFlagGold[5] = 1
        set s_incomeFlagGold[6] = 1
        
        set s_incomeGold[1] = 10
        set s_incomeGold[2] = 10
        set s_incomeGold[3] = 10
        set s_incomeGold[4] = 10
        set s_incomeGold[5] = 10
        set s_incomeGold[6] = 10
        
        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        endfor
        call TriggerAddAction(t, function Actions)
        
        set t = null
    endfunction
    
endscope