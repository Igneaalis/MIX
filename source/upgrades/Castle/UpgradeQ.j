// Улучшение: "Золотодобыча"

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
        
        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerAddAction(t, function Actions)
        
        set t = null
    endfunction
    
endscope