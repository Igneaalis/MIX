library UnitRecycler initializer UnitRecyclerInit uses Colors, ArcingTextTag, Logs  // https://wc3modding.info/4529/system-unit-recycler-simple-damage-detection-system/
    //
    // Unit Recycler
    // By moyack. 2017
    //
    // ============================================================================
    // Credits to Litany, DioD, Captain Griffen, Troll Brain and other nice guys  
    // for their suggestions, comments and ideas.                                 
    // ============================================================================
    //
    // This library allows to your map to reuse died units, which saves memory.
    // It's very useful in AoS or footies games, where the unit spawning is a
    // common task.
    //
    // How it works?
    // =============
    //
    // The script detects if a unit reach the dying point (defined by the MIN_LIFE
    // constant), and if the damage can kill the unit, then it is sent to the dump
    // for further recycling. For custom situations like summoning or when a unit
    // enters to the map, you just have to use the functions provided by this 
    // library.
    //
    // Functions
    // =========
    // 
    // in order to recycle a unit, you can use these function:
    //
    //  => RecycleUnit(<unit variable>) returns unit
    //     -----------------------------------------
    //     This function takes as argument a unit, and returns the unit recycled.
    //     if there's a unit of the same typeid in the dump, it will use this unit
    //     instead of the one from the function input, removing it immediately, 
    //     otherwise this script will return the same unit.
    // 
    //  => CreateUnitEx(player, unitid, x, y, angle) returns unit
    //     ------------------------------------------------------
    //     Like the native function but tries to recycle the unit if avaliable in the dump
    //
    //  => KillUnitEx(<unit variable>) returns nothing
    //     -------------------------------------------
    //     Like the native function but it recycles the unit before killing it.
    //
    //  => RemoveUnitEx(<unit variable>) returns nothing
    //     ---------------------------------------------
    //     Like the native function but it recycles the unit.
    //
    //  => IsUnitDead(<unit variable>) returns boolean
    //     -------------------------------------------
    //     This function returns a boolean argument that indicates if the unit is dead or not.
    //     Remember that a unit is dead if it's in the Heaven group.
    //
    //  => ReplaceDummy(<unit variable>) returns unit
    //     -------------------------------------------
    //     This function returns a replacement unit without killing the output unit.
    //
    //  => CreateDummy(player, unitid, x, y, angle) returns unit
    //     ------------------------------------------------------
    //     Like the CreateUnit function but the returned unit won't be affected by the damage
    //     detection nor will be recycled automatically
    //
    //  => TriggerRegisterAnyUnitRecycleEvent(trigger t) returns nothing
    //     -------------------------------------------------------------
    //     All the trigger registered in this way will activate when a unit is about to be recycled
    //     (in other words, it triggers before it dies). You can use this functions to retrieve the
    //     the units involved in this event:
    //
    //      # GetRecycledUnit() returns the units that is going to be recycled
    //      # GetRecycleDummyUnit() returns the dummy unit which will die instead of the recycled unit
    //      # GetRecycleAttacker() returns the unit that "kills" the recycled unit
    //
    //  => IsUnitDummy(unit u) returns boolean
    //     -----------------------------------
    //     Checks if a unit can be recycled or not. Dummy units are not recycled, they're used as 
    //     placeholder of the unit about to die...
    //
    //  => GetUnitsInHeaven() returns group 
    //     --------------------------------
    //     Returns the group which contains the units in the heaven. Useful to do checks and
    //     operations on them.
    //
    //
    // For Damage detection, you just need to use these functions:
    //
    //  => AddDamageCondition(<Boolexpr variable>) returns nothing
    //     -------------------------------------------------------
    //     Just add a condition function which manage the damaged unit and the script
    //     will use it with all the the units in the DD.D group.
    //
    //  => DoNonDetectableDamage(unit, widget, damage, boolean_attack, boolean_ranged, attacktype, damagetype, weapontype) returns boolean
    //     -------------------------------------------------------------------------------------------------------------------------------
    //     Like the UnitDamageTarget function, but it can be used inside condition functions.
    //     How to know if you need to use it? if you use UnitDamageTarget() inside a DD function and 
    //     it freezes the game until it kills the attacked unit(s), then you have to replace that
    //     function by this custom one.
    //
    // CONFIGURATION PART
    globals
        private constant real     MIN_LIFE = 0.405          // the experimental death value that will be used to activate
                                                            // the fake death of units. units that reach this value or less
                                                            // won't die and they will be recycled.
        private constant boolean  AUTO_LOC = false          // If it's set to true, it will place automatically the heaven in one
                                                            // non visible corner of the map, else, it will use the HEAVEN_POS
                                                            // as a heaven location
        private constant player   DUMMY_PLAYER = Player(27) // sets the player owner of the unit's heaven
        private constant real     MANA_FACTOR = 1           // sets the initial mana amount (as percentage of maximum mana)
                                                            // to recycled units when they are just placed in the game.
                                                            // This constant is used only by CreateUnitEx function.
        
        private location HEAVEN_POS = Location(7500, -6150) // Indicates the heaven's location.

        trigger DDS
    endglobals
    // END CONFIGURATION PART
    
    globals
        private group Heaven // where worthy units go when they die...
    endglobals
    
    // this is a key functions part just to make homogeneus the unit management, please don't edit this unless
    // you know what are you doing, ok??
    private keyword Kill
    
    private function PrepareUnit takes unit u returns nothing
        call SelectUnit(u, false)
        call UnitRemoveBuffs(u, true, true)
        call UnitResetCooldown(u)
        call SetUnitInvulnerable(u, true)
        call SetWidgetLife(u, GetUnitState(u, UNIT_STATE_MAX_LIFE))
        call PauseUnit(u, true)
        call GroupAddUnit(Heaven, u)
    endfunction
    
    private function MoveUnit takes unit u returns nothing
        call SetUnitOwner(u, DUMMY_PLAYER, true)
        call SetUnitX(u, GetLocationX(HEAVEN_POS))
        call SetUnitY(u, GetLocationY(HEAVEN_POS))
    endfunction
    
    private function PlaceDummy takes unit d, unit u returns nothing
        call GroupAddUnit(Kill.corpse, d)
        call SetUnitUseFood(d, false)
        call SetUnitState(d, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA))
        call SetUnitFlyHeight(d, GetUnitFlyHeight(u), 0.)
        //call SetCSData(d, GetCSData(u)) //used to pass attached data via CSData to the corpse...
        call SetUnitPathing(d, false)
        call SetUnitX(d, GetUnitX(u))
        call SetUnitY(d, GetUnitY(u))
    endfunction
    // end key functions...
    
    private struct Trigger // struct to manage the EventRecycleUnit
        private static integer i = 0
        static unit R = null // recycled unit
        static unit D = null // dummy unit
        static unit A = null // attacker unit
        trigger t
        
        static method AddTrigger takes trigger t returns nothing
            local thistype T = thistype.allocate()
            set T.t = t
            set thistype.i = integer(T)
        endmethod
        
        static method evaluate takes unit r, unit d, unit a returns nothing
            local integer i = 1
            local Trigger T
            set thistype.R = r
            set thistype.D = d
            set thistype.A = a
            loop
                exitwhen i > Trigger.i
                set T =thistype(i)
                if T.t != null and TriggerEvaluate(T.t) then
                    call TriggerExecute(T.t)
                endif
                set i = i + 1
            endloop
        endmethod
    endstruct
    
    private struct Kill // struct used to manage the killed units...
        static group corpse // group of units that won't be touched by the damage detection (corpses and dummy units for instance)
        
        static method Do takes unit u, unit killer returns nothing
            local unit d = CreateUnit(GetOwningPlayer(u), GetUnitTypeId(u), GetUnitX(u), GetUnitY(u), GetUnitFacing(u))
            call SetUnitInvulnerable(u, true)
            call PlaceDummy(d, u)
            call SetWidgetLife(d, 1.)
            call Trigger.evaluate(u, d, killer)
            call UnitDamageTarget(killer, d, 2., true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
            call PrepareUnit(u)
            call MoveUnit(u)
            set d = null
        endmethod
        
        private static method ManageSummoned takes nothing returns nothing
            if IsUnitInGroup(GetSummonedUnit(), Kill.corpse) then
                // this part will run when a corpse is resurrected, so this units are suitable to
                // be controlled by the damage detection.
                call GroupRemoveUnit(Kill.corpse, GetSummonedUnit())
                call SetUnitPathing(GetSummonedUnit(), true)
            endif
        endmethod
        
        private static method onInit takes nothing returns nothing
            local trigger t = CreateTrigger()
            call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SUMMON)
            call TriggerAddAction(t, function Kill.ManageSummoned)
            set Kill.corpse = CreateGroup()
            set t = null
        endmethod
    endstruct
    
    private struct DD // damage detection struct, because damage detection can be so easy...
        static group D // group of unit that will have damage detection
        static trigger T
        static timer Tm = CreateTimer() // used to control the infinite looping when is used UnitDamageTarget over the same triggering unit 
        
        // Add the attacked unit to the damage detection if the unit is not in the unit group
        private static method AddUnit takes unit d returns nothing
            if not IsUnitInGroup(d, thistype.D) and not IsUnitInGroup(d, Kill.corpse) then
                // debug call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,2,"Added " + GetUnitName(d) + " to the DD")
                call TriggerRegisterUnitEvent(thistype.T, d, EVENT_UNIT_DAMAGED)
                call GroupAddUnit(thistype.D, d)
            endif
        endmethod
        
        private static method Attacked takes nothing returns nothing
            call thistype.AddUnit(GetTriggerUnit())
        endmethod
        
        private static method Spelled takes nothing returns nothing
            if GetSpellTargetUnit() != null then
                call thistype.AddUnit(GetSpellTargetUnit())
            endif
        endmethod
        
        static method AntiLoop takes nothing returns nothing
            call EnableTrigger(thistype.T)
        endmethod
        
        private static method onInit takes nothing returns nothing
            set thistype.T = CreateTrigger()
            set thistype.D = CreateGroup()
            call TriggerRegisterAnyUnitEventBJ(thistype.T, EVENT_PLAYER_UNIT_ATTACKED)
            call TriggerAddAction(thistype.T, function thistype.Attacked)
            set thistype.T = CreateTrigger()
            call TriggerRegisterAnyUnitEventBJ(thistype.T, EVENT_PLAYER_UNIT_SPELL_EFFECT)
            call TriggerAddAction(thistype.T, function thistype.Spelled)
            set thistype.T = CreateTrigger()
        endmethod
    
    endstruct  // you see, it's not bigger than this :)
    
    private struct UR  // unit recycling struct
        static group Temp = CreateGroup()
        static unit U = null
        
        static method FromDump takes nothing returns boolean
            if IsUnitInGroup(GetFilterUnit(), Heaven) and IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false then
                set thistype.U = GetFilterUnit()
            endif
            return false
        endmethod
        
        static method UseRecycled takes unit u returns unit
            local real x = GetUnitX(u)
            local real y = GetUnitY(u)
            local real f = GetUnitFacing(u)
            local real m = GetUnitState(u, UNIT_STATE_MANA)
            local player p = GetOwningPlayer(u)
            set thistype.U = null
            call GroupEnumUnitsOfTypeCounted(thistype.Temp, UnitId2String(GetUnitTypeId(u)), Condition(function thistype.FromDump), 1)
            if thistype.U != null then
                // debug call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 2, GetUnitName(thistype.U) + " is being reused...")
                call SetUnitInvulnerable(thistype.U, false)
                call GroupRemoveUnit(Heaven, thistype.U)
                call PauseUnit(thistype.U, true)
                call SetUnitPosition(thistype.U, x, y)
                call SetUnitFacing(thistype.U, f)
                call SetUnitOwner(thistype.U, p, true)
                call SetUnitState(thistype.U, UNIT_STATE_MANA, m)
                call SetUnitPathing(thistype.U, true)
                call PauseUnit(thistype.U, false)
                call RemoveUnit(u)
                set u = null
                return thistype.U
            else
                return u
            endif
        endmethod
        
        private static method onRecycle takes nothing returns boolean
            local unit u = GetTriggerUnit()
            if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and IsUnitType(u, UNIT_TYPE_SUMMONED) == false and GetWidgetLife(u) - GetEventDamage() <= MIN_LIFE then
                call Kill.Do(u, GetEventDamageSource())  // place a dummy to replace the unit
                                                         // and returns the corpse
                // debug call DisplayTimedTextFromPlayer(Player(15),0,0,2, GetUnitName(u) + " has been sent to the dump...")
            endif
            set u = null
            return false
        endmethod
        
        private static method onInit takes nothing returns nothing
            local rect r = GetWorldBounds()
            set Heaven = CreateGroup()
            call TriggerAddCondition(DD.T, Condition(function thistype.onRecycle))
            if AUTO_LOC then
                call MoveLocation(HEAVEN_POS, GetRectMinX(r), GetRectMinY(r))
            endif
            call RemoveRect(r)
            set r = null
        endmethod
    endstruct
    
    //===================
    // User functions... 
    //===================
    function RecycleUnit takes unit u returns unit
        return UR.UseRecycled(u)
    endfunction
    
    function CreateUnitEx takes player p, integer id, real x, real y, real f returns unit
        set UR.U = null
        call GroupEnumUnitsOfTypeCounted(UR.Temp, UnitId2String(id), Condition(function UR.FromDump), 1)
        if UR.U != null then
            // debug call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,2, GetUnitName(UR.U) + " is being reused...")
            call SetUnitInvulnerable(UR.U, false)
            call GroupRemoveUnit(Heaven, UR.U)
            call PauseUnit(UR.U, true)
            call SetUnitPosition(UR.U, x, y)
            call SetUnitFacing(UR.U, f)
            call SetUnitOwner(UR.U, p, true)
            call SetUnitState(UR.U, UNIT_STATE_MANA, GetUnitState(UR.U, UNIT_STATE_MAX_MANA) * MANA_FACTOR)
            call SetUnitPathing(UR.U, true)
            call PauseUnit(UR.U, false)
            return UR.U
        endif
        return CreateUnit(p, id, x, y, f)
    endfunction
    
    function KillUnitEx takes unit u returns nothing
        local unit d
        if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            set d = CreateUnit(GetOwningPlayer(u), GetUnitTypeId(u), GetUnitX(u), GetUnitY(u), GetUnitFacing(u))
            call Trigger.evaluate(u, d, null)
            call PrepareUnit(u)
            call PlaceDummy(d, u)
            call KillUnit(d)
            call MoveUnit(u)
        else
            call KillUnit(u)
        endif
        set d = null
    endfunction
    
    function RemoveUnitEx takes unit u returns nothing
        if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            call Trigger.evaluate(u, null, null)
            call PrepareUnit(u)
            call MoveUnit(u)
            // debug call Log("RemoveUnitEx: unit = " + GetUnitName(u))
        else
            call RemoveUnit(u)
        endif
    endfunction
    
    function IsUnitDead takes unit u returns boolean
        return IsUnitInGroup(u, Heaven)
    endfunction
    
    function ReplaceDummy takes unit u returns unit 
        local unit d
        if IsUnitType(u, UNIT_TYPE_HERO) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
            set d = CreateUnit(GetOwningPlayer(u), GetUnitTypeId(u), GetUnitX(u), GetUnitY(u), GetUnitFacing(u))
            call PlaceDummy(d, u)
            call SetWidgetLife(d, GetWidgetLife(u))
            call PrepareUnit(u)
            call MoveUnit(u)
            call SetUnitPathing(d, true)
        else
            set d = null
        endif
        return d
    endfunction
    
    function CreateDummy takes player p, integer id, real x, real y, real f returns unit
        local unit u = CreateUnit(p, id, x, y, f)
        call GroupAddUnit(Kill.corpse, u)
        return u
    endfunction
    
    // TriggerRecyclefunctions. this trigger happens before the triggered unit is going to die...
    function TriggerRegisterAnyUnitRecycleEvent takes trigger t returns nothing
        call Trigger.AddTrigger(t)
    endfunction
    
    constant function GetRecycledUnit takes nothing returns unit 
        // returns the recycled unit...
        return Trigger.R
    endfunction
    
    constant function GetRecycleDummyUnit takes nothing returns unit 
        // returns the dummy unit...
        return Trigger.D
    endfunction
    
    constant function GetRecycleAttacker takes nothing returns unit 
        // returns the attacker who "kills" the recycled unit...
        return Trigger.A
    endfunction
    
    constant function IsUnitDummy takes unit u returns boolean
        // Checks if a unit can be recycled or not. Dummy units are not recycled, they're used as placeholder...
        return IsUnitInGroup(u, Kill.corpse)
    endfunction
    
    constant function GetUnitsInHeaven takes nothing returns group
        // Checks if a unit can be recycled or not. Dummy units are not recycled, they're used as placeholder...
        return Heaven
    endfunction
    
    // Damage detection system functions...
    function AddDamageCondition takes boolexpr b returns nothing
        call TriggerAddCondition(DD.T, b)
    endfunction
    
    function DoNonDetectableDamage takes unit u, widget t, real damage, boolean attack, boolean ranged, attacktype AT, damagetype DT, weapontype WT returns boolean
        call DisableTrigger(DD.T)
        call TimerStart(DD.Tm, 0., false, function DD.AntiLoop)
        return UnitDamageTarget(u, t, damage, attack, ranged, AT, DT, WT)
    endfunction

    private function ShowDamage takes nothing returns boolean
        // This function is added with the AddDamageCondition() function in order to add a script that manages
        // the damaged units, in this case, it will show the damage received, just in the attack impact...
        // debug call Log((GOLD + I2S(R2I(GetEventDamage())) + "|r"))
        call ArcingTextTag.create((GOLD + I2S(R2I(GetEventDamage())) + "|r"), GetTriggerUnit())
        return false
    endfunction

    function UnitRecyclerInit takes nothing returns nothing
        set DDS = DD.T
        call AddDamageCondition(Condition(function ShowDamage))
    endfunction
    
endlibrary