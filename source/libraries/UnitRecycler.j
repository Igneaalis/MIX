library UnitRecycler /* v1.4.1 https://www.hiveworkshop.com/threads/286701/


    */requires /*

    */ReviveUnit                        /*  https://www.hiveworkshop.com/threads/186696/
    */Table                             /*  https://www.hiveworkshop.com/threads/188084/
    */optional RegisterPlayerUnitEvent  /*  https://www.hiveworkshop.com/threads/250266/
    */optional ErrorMessage             /*  https://github.com/nestharus/JASS/blob/master/jass/Systems/ErrorMessage/main.j


    This system is important because CreateUnit() is one of the most processor-intensive function in
    the game and there are reports that even after they are removed, they still leave some bit of memory
    consumption (0.04 KB) on the RAM. Therefore, it would be very helpful if you can minimize unit
    creation or so. This system also allows you to recycle dead units to avoid permanent 0.04 KB memory
    leak for each future CreateUnit() call.

    As of v1.4, the system now takes into consideration the facing angle of units - like most dummy
    recycling systems do. But it is recommended to use DummyRecyclers for dummy units since they are
    specially made for such uses, and use this UnitRecycler for the other non-dummy units.


    [Credits]
        AGD - Author
        Aniki - For suggesting ideas on further improvements
        Other guys in the warcraft modding community - for discovering the permanent memory leak from units

    *///! novjass

    |-----|
    | API |
    |-----|

        function GetRecycledUnit takes player owner, integer rawCode, real x, real y, real facing returns unit/*
            - Returns unit of specified ID from the stock of recycled units. If there's none in the stock that
              matched the specified unit's rawcode, it will create a new unit instead
            - Returns null if the rawcode's unit-type is a hero or non-existent

      */function GetRecycledUnitEx takes player owner, integer rawCode, real x, real y, real facing returns unit/*
            - Works similar to GetRecycledUnit() except that if the input rawcode's unit-type is a hero, it will
              be created via CreateUnit() instead
            - You can use this as an alternative to CreateUnit()

      */function RecycleUnit takes unit u returns boolean/*
            - Recycles the specified unit and returns a boolean value depending on the success of the operation
            - Does nothing to hero units

      */function RecycleUnitEx takes unit u returns boolean/*
            - Works similar to RecycleUnit() except that if <u> is not recyclable, it will be removed via
              RemoveUnit() instead
            - You can use this as an alternative to RemoveUnit()

      */function RecycleUnitDelayed takes unit u, real delay returns nothing/*
            - Recycles the specified unit after <delay> seconds

      */function RecycleUnitDelayedEx takes unit u, real delay returns nothing/*
            - Works similar to RecycleUnitDelayed() except that it calls RecycleUnitEx() instead of RecycleUnit()

      */function UnitAddToStock takes integer rawCode returns boolean/*
            - Creates a unit of type ID and adds it to the stock of recycled units then returns a boolean value
              depending on the success of the operation

    *///! endnovjass

    //CONFIGURATION SECTION


    globals
    /*
        The owner of the stocked/recycled units                                         */
        private constant player OWNER               = Player(15)
    /*
        Determines if dead units will be automatically recycled
        after a delay designated by the <constant function
        DeathTime below>                                                                */
        private constant boolean AUTO_RECYCLE_DEAD  = true
    /*
        Angle group count per unit type
        If you don't need the precision in unit facing angles, you should set this
        value to 1
        (Note: The maximum number of different kinds of unit type that you can use
        with this system is limited to <8190/ANGLE_COUNT - 1> )                         */
        private constant integer ANGLE_COUNT = 8

    endglobals

    /* The delay before dead units will be automatically recycled in case when
       AUTO_RECYCLE_DEAD == true                                                        */
    static if AUTO_RECYCLE_DEAD then
        private function DeathTime takes unit u returns real
            /*if <condition> then
                  return someValue
              elseif <condition> then
                  return someValue
              endif                 */
            return 8.00
        endfunction
    endif

    // Filters units allowed for recycling
    private function UnitTypeFilter takes unit u returns boolean
        return not IsUnitIllusion(u) and not IsUnitType(u, UNIT_TYPE_SUMMONED)
    endfunction

    /* When recycling a unit back to the stock, these resets will be applied to the
       unit. You can add more actions to this or you can delete this module if you
       don't need it.                                                                   */
    private module UnitRecyclerResets
        call SetUnitScale(u, 1, 0, 0)
        call SetUnitVertexColor(u, 255, 255, 255, 255)
        call SetUnitFlyHeight(u, GetUnitDefaultFlyHeight(u), 0)
    endmodule


    //END OF CONFIGURATION

    //== Do not do changes below this line if you're not so sure on what you're doing ==
    native UnitAlive takes unit u returns boolean

    globals
        private constant real ANGLE_INTERVAL = 360.00/ANGLE_COUNT
        private constant real HALF_INTERVAL = ANGLE_INTERVAL/2.00
        private real unitCampX
        private real unitCampY
    endglobals

    private struct List extends array

        unit unit
        thistype recycler
        thistype prev
        thistype next
        debug static Table stocked

        static constant method operator head takes nothing returns thistype
            return 0
        endmethod

        method stockUnit takes unit u returns nothing
            local thistype node = head.recycler
            local thistype last = this.prev
            set head.recycler = node.recycler
            set this.prev = node
            set last.next = node
            set node.prev = last
            set node.next = this
            set node.unit = u
            call PauseUnit(u, true)
            call SetUnitX(u, unitCampX)
            call SetUnitY(u, unitCampY)
            debug set stocked.boolean[GetHandleId(u)] = true
        endmethod

        method addUnit takes unit u, real angle returns boolean
            if u != null and not IsUnitType(u, UNIT_TYPE_HERO) and UnitTypeFilter(u) then
                if not UnitAlive(u) and not ReviveUnit(u) then
                    static if LIBRARY_ErrorMessage then
                        debug call ThrowWarning(true, "UnitRecycler", "addUnit()", "thistype", GetHandleId(u), "Unable to recycle unit: Unable to revive dead unit")
                    endif
                    return false
                endif
                call this.stockUnit(u)
                call SetUnitFacing(u, angle)
                call SetUnitOwner(u, OWNER, true)
                call SetWidgetLife(u, GetUnitState(u, UNIT_STATE_MAX_LIFE))
                call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA))
                implement optional UnitRecyclerResets
                return true
            endif
            return false
        endmethod

        method getUnit takes player owner, integer id, real x, real y, real angle returns unit
            local thistype first
            local thistype next
            local real facing
            local real deltaAngle
            if not IsHeroUnitId(id) then
                set first = this.next
                set deltaAngle = RAbsBJ(GetUnitFacing(first.unit) - angle)
                if deltaAngle > 180.00 then
                    set deltaAngle = 360.00 - deltaAngle
                endif
                if first == this or deltaAngle > HALF_INTERVAL then
                    set bj_lastCreatedUnit = CreateUnit(owner, id, x, y, angle)
                else
                    set bj_lastCreatedUnit = first.unit
                    set first.unit = null
                    set next = first.next
                    set next.prev = this
                    set this.next = next
                    call SetUnitOwner(bj_lastCreatedUnit, owner, true)
                    call SetUnitPosition(bj_lastCreatedUnit, x, y)
                    call SetUnitFacing(bj_lastCreatedUnit, angle)
                    call PauseUnit(bj_lastCreatedUnit, false)
                    debug call stocked.boolean.remove(GetHandleId(bj_lastCreatedUnit))
                endif
                return bj_lastCreatedUnit
            endif
            return null
        endmethod

        static method init takes nothing returns nothing
            local thistype this = 0
            set thistype(8190).recycler = 0
            loop
                set this.recycler = this + 1
                set this = this + 1
                exitwhen this == 8190
            endloop
            debug set stocked = Table.create()
        endmethod

    endstruct

    private struct UnitRecycler extends array

        private static Table rawCodeIdTable
        private static Table timerTable
        private static integer rawCodeCount = 0
        private static integer array position
        private static integer array stackSize
        private static integer array indexStack
        private static List array head

        private static method getRawCodeId takes integer rawCode returns integer
            local integer i = rawCodeIdTable[rawCode]
            if i == 0 then
                set rawCodeCount = rawCodeCount + 1
                set rawCodeIdTable[rawCode] = rawCodeCount
                set i = rawCodeCount
            endif
            return i
        endmethod

        private static method getHead takes integer id, integer index returns List
            local List this = head[id*ANGLE_COUNT + index]
            if this == 0 then
                set this = List.head.recycler
                set List.head.recycler = this.recycler
                set this.prev = this
                set this.next = this
                set head[id*ANGLE_COUNT + index] = this
            endif
            return this
        endmethod

        private static method getListIndex takes integer id returns integer
            if stackSize[id] == 0 then
                if position[id] < ANGLE_COUNT - 1 then
                    set position[id] = position[id] + 1
                    return position[id]
                endif
                set position[id] = 0
                return 0
            endif
            set stackSize[id] = stackSize[id] - 1
            return indexStack[id*ANGLE_COUNT + stackSize[id]]
        endmethod

        static method stock takes integer rawCode returns boolean
            local integer id
            local integer index
            local unit u
            if not IsHeroUnitId(rawCode) then
                set id = getRawCodeId(rawCode)
                set index = getListIndex(id)
                set u = CreateUnit(OWNER, rawCode, 0.00, 0.00, index*ANGLE_INTERVAL)
                if u != null and not IsUnitType(u, UNIT_TYPE_HERO) and UnitTypeFilter(u) then
                    call getHead(id, index).stockUnit(u)
                    set u = null
                    return true
                endif
            endif
            return false
        endmethod

        static method add takes unit u returns boolean
            local integer id = getRawCodeId(GetUnitTypeId(u))
            local integer index = getListIndex(id)
            return getHead(id, index).addUnit(u, index*ANGLE_INTERVAL)
        endmethod

        static method get takes player owner, integer rawCode, real x, real y, real angle returns unit
            local integer id = getRawCodeId(rawCode)
            local integer index = R2I(angle/ANGLE_INTERVAL)
            if angle - ANGLE_INTERVAL*index > ANGLE_INTERVAL/2.00 then
                if index < ANGLE_COUNT - 1 then
                    set index = index + 1
                else
                    set index = 0
                endif
            endif
            set indexStack[id*ANGLE_COUNT + stackSize[id]] = index
            set stackSize[id] = stackSize[id] + 1
            return getHead(id, index).getUnit(owner, rawCode, x, y, angle)
        endmethod

        static method delayedRecycle takes nothing returns nothing
            local timer t = GetExpiredTimer()
            local integer key = GetHandleId(t)
            call add(timerTable.unit[key])
            call timerTable.unit.remove(key)
            call DestroyTimer(t)
            set t = null
        endmethod
        static method delayedRecycleEx takes nothing returns nothing
            local timer t = GetExpiredTimer()
            local integer key = GetHandleId(t)
            call add(timerTable.unit[key])
            call timerTable.unit.remove(key)
            call DestroyTimer(t)
            set t = null
        endmethod

        static method addDelayed takes unit u, real delay, code callback returns nothing
            local timer t = CreateTimer()
            set timerTable.unit[GetHandleId(t)] = u
            call TimerStart(t, delay, false, callback)
            set t = null
        endmethod

        static method init takes nothing returns nothing
            local rect bounds = GetWorldBounds()
            // Hide recycled units at the top of the map beyond reach of the camera
            set unitCampX = 0.00
            set unitCampY = GetRectMaxY(bounds) + 1000.00
            call RemoveRect(bounds)
            set bounds = null
            set rawCodeIdTable = Table.create()
            set timerTable = Table.create()
        endmethod

    endstruct

    //========================================================================================================

    function GetRecycledUnit takes player owner, integer rawCode, real x, real y, real facing returns unit
        static if DEBUG_MODE and LIBRARY_ErrorMessage then
            call UnitRecycler.get(owner, rawCode, x, y, facing)
            call ThrowError(bj_lastCreatedUnit == null, "UnitRecycler", "GetRecycledUnit()", "", 0, "Specified unit type does not exist")
            call ThrowError(IsHeroUnitId(rawCode), "UnitRecycler", "GetRecycledUnit()", GetUnitName(bj_lastCreatedUnit), 0, "Specified unit type is a hero")
            return bj_lastCreatedUnit
        else
            return UnitRecycler.get(owner, rawCode, x, y, facing)
        endif
    endfunction

    function GetRecycledUnitEx takes player owner, integer rawCode, real x, real y, real facing returns unit
        if not IsHeroUnitId(rawCode) then
            return UnitRecycler.get(owner, rawCode, x, y, facing)
        endif
        static if LIBRARY_ErrorMessage then
            debug call ThrowWarning(true, "UnitRecycler", "GetRecycledUnitEx()", "", 0, "Cannot retrieve a hero unit, creating new unit")
        endif
        return CreateUnit(owner, rawCode, x, y, facing)
    endfunction

    function RecycleUnit takes unit u returns boolean
        static if LIBRARY_ErrorMessage then
            debug call ThrowError(List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnit()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
            debug call ThrowWarning(u == null, "UnitRecycler", "RecycleUnit()", "", 0, "Attempted to recycle a null unit")
            debug call ThrowWarning(IsHeroUnitId(GetUnitTypeId(u)), "UnitRecycler", "RecycleUnit()", GetUnitName(u), 0, "Attempted to recycle a hero unit")
            debug call ThrowWarning(not UnitTypeFilter(u), "UnitRecycler", "RecycleUnit()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
        endif
        return UnitRecycler.add(u)
    endfunction

    function RecycleUnitEx takes unit u returns boolean
        static if LIBRARY_ErrorMessage then
            debug call ThrowError(List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnitEx()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
            debug call ThrowWarning(u == null, "UnitRecycler", "RecycleUnitEx()", "", 0, "Attempted to recycle a null unit")
            debug call ThrowWarning(not UnitTypeFilter(u), "UnitRecycler", "RecycleUnitEx()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
        endif
        if not UnitRecycler.add(u) then
            call RemoveUnit(u)
            static if LIBRARY_ErrorMessage then
                debug call ThrowWarning(u != null, "UnitRecycler", "RecycleUnitEx()", GetUnitName(u), 0, "Cannot recycle the specified unit, removing unit")
            endif
            return false
        endif
        return true
    endfunction

    function RecycleUnitDelayed takes unit u, real delay returns nothing
        static if LIBRARY_ErrorMessage then
            debug call ThrowError(List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnitDelayed()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
            debug call ThrowWarning(u == null, "UnitRecycler", "RecycleUnitDelayed()", "", 0, "Attempted to recycle a null unit")
            debug call ThrowWarning(IsHeroUnitId(GetUnitTypeId(u)), "UnitRecycler", "RecycleUnitDelayed()", GetUnitName(u), 0, "Attempted to recycle a hero unit")
            debug call ThrowWarning(not UnitTypeFilter(u), "UnitRecycler", "RecycleUnitDelayed()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
        endif
        call UnitRecycler.addDelayed(u, delay, function UnitRecycler.delayedRecycle)
    endfunction

    function RecycleUnitDelayedEx takes unit u, real delay returns nothing
        static if LIBRARY_ErrorMessage then
            debug call ThrowError(List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "RecycleUnitDelayedEx()", GetUnitName(u), 0, "Attempted to recycle an already recycled unit")
            debug call ThrowWarning(u == null, "UnitRecycler", "RecycleUnitDelayedEx()", "", 0, "Attempted to recycle a null unit")
            debug call ThrowWarning(not UnitTypeFilter(u), "UnitRecycler", "RecycleUnitDelayedEx()", GetUnitName(u), 0, "Attempted to recycle an invalid unit type")
        endif
        call UnitRecycler.addDelayed(u, delay, function UnitRecycler.delayedRecycleEx)
    endfunction

    function UnitAddToStock takes integer rawCode returns boolean
        static if LIBRARY_ErrorMessage then
            debug local unit u = CreateUnit(OWNER, rawCode, 0, 0, 0)
            debug call ThrowWarning(u == null, "UnitRecycler", "UnitAddToStock()", "", 0, "Attempted to stock a non-existent unit type")
            debug call ThrowWarning(IsHeroUnitId(rawCode), "UnitRecycler", "UnitAddToStock()", GetUnitName(u), 0, "Attempted to stock a hero unit")
            debug call ThrowWarning(not UnitTypeFilter(u), "UnitRecycler", "UnitAddToStock()", GetUnitName(u), 0, "Attempted to stock an invalid unit type")
            debug call RemoveUnit(u)
            debug set u = null
        endif
        return UnitRecycler.stock(rawCode)
    endfunction

    //========================================================================================================

    private module Init
        private static method onInit takes nothing returns nothing
            call init()
        endmethod
    endmodule

    private struct Initializer extends array

        static if AUTO_RECYCLE_DEAD then
            private static method onDeath takes nothing returns nothing
                local unit u = GetTriggerUnit()
                static if LIBRARY_ErrorMessage then
                    debug call ThrowError(List.stocked.boolean[GetHandleId(u)], "UnitRecycler", "", GetUnitName(u), 0, "A unit in stock has been killed!")
                endif
                if UnitTypeFilter(u) and not IsUnitType(u, UNIT_TYPE_HERO) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) then
                    call RecycleUnitDelayedEx(u, DeathTime(u))
                endif
                set u = null
            endmethod

            private static method autoRecycler takes nothing returns nothing
                static if AUTO_RECYCLE_DEAD then
                    static if LIBRARY_RegisterPlayerUnitEvent then
                        call RegisterAnyPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH, function thistype.onDeath)
                    else
                        local trigger t = CreateTrigger()
                        local code c = function thistype.onDeath
                        local integer i = 16
                        loop
                            set i = i - 1
                            call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_DEATH, null)
                            exitwhen i == 0
                        endloop
                        call TriggerAddCondition(t, Filter(c))
                        set t = null
                    endif
                endif
            endmethod
        endif

        private static method init takes nothing returns nothing
            call List.init()
            call UnitRecycler.init()
            static if AUTO_RECYCLE_DEAD then
                call autoRecycler()
            endif
            call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, "|CFFFFCC00UnitRecycler|R library is ready!")
        endmethod
        implement Init

    endstruct

    static if DEBUG_MODE and LIBRARY_ErrorMessage then
        private function DisplayError takes unit removedUnit returns nothing
            call ThrowError(List.stocked.boolean[GetHandleId(removedUnit)], "UnitRecycler", "RemoveUnit()", GetUnitName(removedUnit), 0, "Attempted to remove a stocked unit")
        endfunction

        hook RemoveUnit DisplayError
    endif


endlibrary