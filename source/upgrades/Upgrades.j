/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 11:44       =
=============================================

Реализация OnResearchFinish() event

*/

scope Upgrades initializer Init
    
    globals
        
    endglobals

    private function OnResearchFinish takes nothing returns nothing
        local player p = GetTriggerPlayer()

        if (IncomeUpgrade_Conditions.evaluate()) then
            set pdb[p].upgrades = pdb[p].upgrades + 1
        endif

        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerUnitEvent(t, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(t, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerAddAction(t, function OnResearchFinish)

        set t = null
    endfunction
    
endscope