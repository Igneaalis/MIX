/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 11:48       =
=============================================

Шаблон для улучшений в замке

*/

scope CastleUpgradeBlank initializer Init
    
    globals
        private constant integer upgradeRC = '0000'
    endglobals

    private function Actions takes nothing returns nothing
        local integer researchRC = GetResearched()
        local player p = GetTriggerPlayer()
        local integer lvl = GetPlayerTechCount(p, researchRC, true)

        if researchRC != upgradeRC then
            set p = null
            return
        endif

        

        set p = null
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i
        
        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        endfor
        call TriggerAddAction(t, function Actions)
        
        set t = null
    endfunction
    
endscope