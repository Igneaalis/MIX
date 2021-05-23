library Weather initializer Init requires NokladrLib
    
    globals
        Weather weather
        private constant integer disableResearchUnitTypeId = 'h029'
        private trigger onResearch = CreateTrigger()
    endglobals

    interface IWeather
        method Force takes nothing returns nothing
        method Init takes nothing returns nothing
    endinterface

    private function ForPlayer_enableResearches takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CreateUnitEx(p, disableResearchUnitTypeId, GetPlayerStartLocationX(p), GetPlayerStartLocationY(p), 0)
        
        set p = null
    endfunction

    private function Blizzard_OnResearch takes nothing returns nothing
        if GetResearched() == Blizzard.researchId then
            call ForGroup(GetUnitsOfTypeIdAll(disableResearchUnitTypeId), function C_RemoveEnumUnits)
            set weather.owner = GetTriggerPlayer()
            set weather.curWeather = weather.blizzard
        endif
    endfunction

    struct Blizzard extends IWeather
        static integer buffId = 'S001'
        static integer researchId = 'R02L'

        method Force takes nothing returns nothing
            call UnitAddAbility(FirstOfGroup(GetUnitsOfPlayerAndTypeId(weather.owner, castleRC)), buffId)
        endmethod

        method Init takes nothing returns nothing
            call Log.execute("Blizzard!")
        endmethod

        static method onInit takes nothing returns nothing
            call TriggerAddAction(onResearch, function Blizzard_OnResearch)
        endmethod
    endstruct

    struct Sunny extends IWeather
        method Force takes nothing returns nothing
            // Nothing
        endmethod

        method Init takes nothing returns nothing
            call Log.execute("Sunny!")
            set weather.owner = null
            call ForForce(players, function ForPlayer_enableResearches)
        endmethod
    endstruct

    struct Weather
        IWeather CurWeather
        Blizzard blizzard
        Sunny sunny
        player owner = null

        method operator curWeather takes nothing returns IWeather
            return CurWeather
        endmethod

        method operator curWeather= takes IWeather whichWeather returns nothing
            if curWeather == whichWeather then
                // Nothing
                return
            endif
            
            set CurWeather = whichWeather
            call curWeather.Init()
        endmethod

        method Force takes nothing returns nothing
            call curWeather.Force()
        endmethod
    endstruct

    private function Init takes nothing returns nothing
        set weather = Weather.create()
        set weather.blizzard = Blizzard.create()
        set weather.sunny = Sunny.create()
        set weather.curWeather = weather.sunny

        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearch, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    endfunction

endlibrary