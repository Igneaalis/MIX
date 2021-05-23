library Weather initializer Init requires NokladrLib
    
    globals
        Weather weather
        private constant integer disableResearchUnitTypeId = 'h029'
        private trigger onResearchTrigger = CreateTrigger()
        private rect Storm_areaOfEffect = Rect(0, 0, 512, 512)
    endglobals

    interface IWeather
        method Force takes nothing returns nothing
        method Init takes nothing returns nothing
        method Finish takes nothing returns nothing
    endinterface

    private function ForPlayer_enableResearches takes nothing returns nothing
        local player p = GetEnumPlayer()

        call CreateUnitEx(p, disableResearchUnitTypeId, GetPlayerStartLocationX(p), GetPlayerStartLocationY(p), 0)
        
        set p = null
    endfunction

    struct Blizzard extends IWeather
        static integer buffId = 'S001'
        static integer researchId = 'R02L'

        private static method onResearch takes nothing returns nothing
            if GetResearched() == Blizzard.researchId then
                call ForGroup(GetUnitsOfTypeIdAll(disableResearchUnitTypeId), function C_RemoveEnumUnits)
                set weather.owner = GetTriggerPlayer()
                set weather.curWeather = weather.blizzard
            endif
        endmethod

        method Force takes nothing returns nothing
            call UnitAddAbility(FirstOfGroup(GetUnitsOfPlayerAndTypeId(weather.owner, castleRC)), buffId)
            set weather.curWeatherEffect = AddWeatherEffect(gg_rct_all, 'SNbs')
            call EnableWeatherEffect(weather.curWeatherEffect, true)
            call SetTerrainFogEx(0, 1000, 3500, 0.5, 0.6, 0.6, 1)
        endmethod

        method Init takes nothing returns nothing
            // call Log.execute("Blizzard!")
        endmethod

        method Finish takes nothing returns nothing
            call UnitRemoveAbility(FirstOfGroup(GetUnitsOfPlayerAndTypeId(weather.owner, castleRC)), buffId)
        endmethod

        private static method onInit takes nothing returns nothing
            call TriggerAddAction(onResearchTrigger, function thistype.onResearch)
        endmethod
    endstruct

    struct Storm extends IWeather
        static integer researchId = 'R02M'

        private static string lightningBoltModelFile = "Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl"
        private static string thunderClapModelFile = "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl"
        private static timer t = CreateTimer()

        private static method onResearch takes nothing returns nothing
            if GetResearched() == Storm.researchId then
                call ForGroup(GetUnitsOfTypeIdAll(disableResearchUnitTypeId), function C_RemoveEnumUnits)
                set weather.owner = GetTriggerPlayer()
                set weather.curWeather = weather.storm
            endif
        endmethod

        private static method onHit takes nothing returns nothing
            if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == false then
                call UnitDamageTargetBJ(FirstOfGroup(GetUnitsOfPlayerAll(weather.owner)), GetEnumUnit(), 500, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_LIGHTNING)  // DAMAGE_TYPE_UNIVERSAL - чистый урон без armor reduction
            endif
        endmethod

        private static method Timer_onTick takes nothing returns nothing
            local effect specialEffect

            set Storm_areaOfEffect = Rect(0, 0, 512, 512)
            call MoveRectTo(Storm_areaOfEffect, GetRandomReal(-4500, 4500), GetRandomReal(-4500, 4500))
            set specialEffect = AddSpecialEffect(lightningBoltModelFile, GetRectCenterX(Storm_areaOfEffect), GetRectCenterY(Storm_areaOfEffect))
            call DestroyEffect(AddSpecialEffect(thunderClapModelFile, GetRectCenterX(Storm_areaOfEffect), GetRectCenterY(Storm_areaOfEffect)))
            call ForGroup(GetUnitsInRectAll(Storm_areaOfEffect), function thistype.onHit)
            call TriggerSleepAction(0.33)
            call DestroyEffect(specialEffect)
            
            set specialEffect = null
        endmethod

        method Force takes nothing returns nothing
            call TimerStart(t, 1, true, function thistype.Timer_onTick)
            set weather.curWeatherEffect = AddWeatherEffect(gg_rct_all, 'RAhr')
            call EnableWeatherEffect(weather.curWeatherEffect, true)
            call SetTerrainFogEx(0, 1000, 3500, 0.5, 0, 0.5, 0.5)
        endmethod

        method Init takes nothing returns nothing
            // call Log.execute("Storm!")
        endmethod

        method Finish takes nothing returns nothing
            call PauseTimer(t)
        endmethod

        private static method onInit takes nothing returns nothing
            call TriggerAddAction(onResearchTrigger, function thistype.onResearch)
        endmethod
    endstruct

    struct Sunny extends IWeather
        method Force takes nothing returns nothing
            // Nothing
        endmethod

        method Init takes nothing returns nothing
            // call Log.execute("Sunny!")
            set weather.owner = null
            call ForForce(players, function ForPlayer_enableResearches)
            call ResetTerrainFog()
        endmethod

        method Finish takes nothing returns nothing
            // Nothing
        endmethod
    endstruct

    struct Weather
        IWeather CurWeather
        Blizzard blizzard
        Storm storm
        Sunny sunny
        weathereffect curWeatherEffect = null
        player owner = null

        method operator curWeather takes nothing returns IWeather
            return CurWeather
        endmethod

        method operator curWeather= takes IWeather whichWeather returns nothing
            if curWeather == whichWeather then
                // Nothing
                return
            endif

            call curWeather.Finish()
            if weather.curWeatherEffect != null then
                call EnableWeatherEffect(weather.curWeatherEffect, false)
                call RemoveWeatherEffect(weather.curWeatherEffect)
                set weather.curWeatherEffect = null
            endif
            call UnfadeMap()
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
        set weather.storm = Storm.create()
        set weather.sunny = Sunny.create()
        set weather.curWeather = weather.sunny

        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x00), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x01), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x02), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x03), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x04), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x05), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x06), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(onResearchTrigger, Player(0x07), EVENT_PLAYER_UNIT_RESEARCH_FINISH, null)
    endfunction

endlibrary