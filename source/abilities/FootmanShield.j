scope AbilityFootmanShield initializer Init
    
    globals
        private constant integer footmanTypeId = 'ha02'
        private constant integer swordsmanTypeId = 'ha04'
        private constant integer captainTypeId = 'ha05'
        private constant integer buffTypeId = 'B000'
        private constant real damageReduction = 1
        private constant real maxHitAngle = 30
    endglobals

    private function FootmanShield takes nothing returns boolean
        local unit sourceUnit = GetEventDamageSource()
        local unit targetUnit = BlzGetEventDamageTarget()
        local integer targetUnitTypeId = GetUnitTypeId(targetUnit)
        
        local location sourceLoc
        local location targetLoc
        local real angle
        local real unitAngle
        local real hitAngle

        if targetUnitTypeId == footmanTypeId or targetUnitTypeId == swordsmanTypeId or targetUnitTypeId == captainTypeId then
            if not IsUnitType(sourceUnit, UNIT_TYPE_MELEE_ATTACKER) and UnitHasBuffBJ(targetUnit, buffTypeId) then
                set sourceLoc = Location(GetUnitX(sourceUnit), GetUnitY(sourceUnit))
                set targetLoc = Location(GetUnitX(targetUnit), GetUnitY(targetUnit))
                set angle = AngleBetweenPoints(sourceLoc, targetLoc) + 180
                set unitAngle = GetUnitFacing(targetUnit)
                set hitAngle = RAbsBJ(angle - unitAngle)
                if hitAngle >= 0 and hitAngle <= maxHitAngle then
                    call BlzSetEventDamage(GetEventDamage() * (1 - damageReduction))  // Снаряды дальнего боя, попавшие в переднюю часть тела, полностью игнорируются.
                endif
            endif
        endif

        set sourceUnit = null
        set targetUnit = null
        set sourceLoc = null
        set targetLoc = null
        return false
    endfunction
    
    private function Init takes nothing returns nothing
        call AddDamageAction(function FootmanShield)
    endfunction
    
endscope