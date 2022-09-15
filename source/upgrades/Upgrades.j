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
        local integer i

        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        endfor
        call TriggerAddAction(t, function OnResearchFinish)

        set t = null
    endfunction
    
endscope