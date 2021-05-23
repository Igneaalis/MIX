/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     23.05.2021 15:33       =
=============================================

Погода

*/

library Weather initializer Init requires NokladrLib, UnitRecycler, Logs
    
    globals
        Weather weather
        private constant integer disableResearchUnitTypeId = 'h029'
        private trigger onResearchTrigger = CreateTrigger()
        private rect Storm_areaOfEffect = Rect(0, 0, 512, 512)
        private unit Armageddon_dummy
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
            call MoveRectTo(Storm_areaOfEffect, GetRandomReal(-5000, 5000), GetRandomReal(-5000, 5000))
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

    struct Armageddon extends IWeather
        static integer researchId = 'R02N'

        private static timer t1 = CreateTimer()
        private static timer t2 = CreateTimer()
        private static integer abilityId = 'A03B'
        private static integer infernalTypeId = 'ninf'

        private static method onResearch takes nothing returns nothing
            if GetResearched() == Armageddon.researchId then
                call ForGroup(GetUnitsOfTypeIdAll(disableResearchUnitTypeId), function C_RemoveEnumUnits)
                set weather.owner = GetTriggerPlayer()
                set weather.curWeather = weather.armageddon
            endif
        endmethod

        private static method IsMatchingTarget takes nothing returns boolean
            local unit u = GetFilterUnit()
            local boolean result = GetUnitTypeId(u) != infernalTypeId and GetUnitTypeId(u) != 'eRez' and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and IsUnitAliveBJ(u)

            set u = null
            return result
        endmethod

        private static method findTarget takes nothing returns nothing
            local unit u = GetEnumUnit()
            local unit target = GroupPickRandomUnit(GetUnitsInRectMatching(gg_rct_all, function thistype.IsMatchingTarget))

            if target != null then
                call IssuePointOrder(u, "attack", GetUnitX(target), GetUnitY(target))
            endif

            set u = null
            set target = null
        endmethod

        private static method Timer_onTick takes nothing returns nothing
            local real x = GetRandomReal(-4700, 4700)
            local real y = GetRandomReal(-4700, 4700)
            call IssuePointOrder(Armageddon_dummy, "dreadlordinferno", x, y)
        endmethod

        private static method Infernal_FindTarget takes nothing returns nothing
            call ForGroup(GetUnitsOfTypeIdAll(infernalTypeId), function thistype.findTarget)
        endmethod

        method Force takes nothing returns nothing
            call TimerStart(t1, 10, true, function thistype.Timer_onTick)
            call TimerStart(t2, 5, true, function thistype.Infernal_FindTarget)
            set weather.curWeatherEffect = AddWeatherEffect(gg_rct_all, 'WOcw')
            call FadeMap()
            call TriggerExecute(gg_trg_Armageddon_effects)
            call EnableWeatherEffect(weather.curWeatherEffect, true)
            call SetTerrainFogEx(0, 1000, 3500, 0.5, 1, 0, 0)
        endmethod

        method Init takes nothing returns nothing
            // call Log.execute("Armageddon!")
        endmethod

        method Finish takes nothing returns nothing
            call PauseTimer(t1)
            call PauseTimer(t2)
            call ForGroup(GetUnitsOfTypeIdAll(infernalTypeId), function C_RemoveEnumUnits)
        endmethod

        private static method onInit takes nothing returns nothing
            call TriggerAddAction(onResearchTrigger, function thistype.onResearch)
            set Armageddon_dummy = CreateUnitEx(Player(bj_PLAYER_NEUTRAL_EXTRA), 'eRez', 0, 0, 0)  // Dummy
            call UnitAddAbility(Armageddon_dummy, abilityId)
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
        Armageddon armageddon
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
        set weather.armageddon = Armageddon.create()
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