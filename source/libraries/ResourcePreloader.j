library ResourcePreloader /* v1.5.0 https://www.hiveworkshop.com/threads/287358/


    */uses /*

    */optional BJObjectId   /*   http://www.hiveworkshop.com/threads/287128/
    */optional Table        /*   http://www.hiveworkshop.com/threads/188084/
    */optional UnitRecycler /*   http://www.hiveworkshop.com/threads/286701/


    *///! novjass

    [CREDITS]
    /*
        AGD - Author
        IcemanBo - for suggesting further improvements
        Silvenon - for the sound preloading method
        JAKEZINC - Suggestions

    */
    |-----|
    | API |
    |-----|

        function PreloadUnit takes integer rawcode returns nothing/*
            - Assigns a certain type of unit to be preloaded

      */function PreloadItem takes integer rawcode returns nothing/*
            - Assigns a certain type of item to be preloaded

      */function PreloadAbility takes integer rawcode returns nothing/*
            - Assigns a certain type of ability to be preloaded

      */function PreloadEffect takes string modelPath returns nothing/*
            - Assigns a certain type of effect to be preloaded

      */function PreloadSound takes string soundPath returns nothing/*
            - Assigns a certain type of sound to be preloaded


      The following functions requires the BJObjectId library:

      */function PreloadUnitEx takes integer start, integer end returns nothing/*
            - Assigns a range of units to be preloaded

      */function PreloadItemEx takes integer start, integer end returns nothing/*
            - Assigns a range of items to be preloaded

      */function PreloadAbilityEx takes integer start, integer end returns nothing/*
            - Assigns a range of abilities to be preloaded


    *///! endnovjass

    /*
    *   Configuration
    */
    globals
        /*
        *   Preload dummy unit type id
        */
        public integer PRELOAD_UNIT_TYPE_ID                     = 'uloc'
        /*
        *   Owner of the preload dummy
        */
        public player PRELOAD_UNIT_OWNER                        = Player(PLAYER_NEUTRAL_PASSIVE)
        /*
        *   Dummy unit's y-coordinate will be positioned at (Max Y of WorldBounds) + this value
        */
        public real PRELOAD_UNIT_Y_BOUNDS_EXTENSION             = 0.00
    endglobals

    /*========================================================================================================*/
    /*            Do not try to change below this line if you're not so sure on what you're doing.            */
    /*========================================================================================================*/

    private keyword S

    /*============================================== TextMacros ==============================================*/

    //! textmacro PRELOAD_TYPE takes NAME, ARG, TYPE, INDEX, I
    function Preload$NAME$ takes $ARG$ what returns nothing
        static if LIBRARY_Table then
            if S.tb[$I$].boolean[$INDEX$] then
                return
            endif
            set S.tb[$I$].boolean[$INDEX$] = true
            call Do$NAME$Preload(what)
        else
            if LoadBoolean(S.tb, $I$, $INDEX$) then
                return
            endif
            call SaveBoolean(S.tb, $I$, $INDEX$, true)
            call Do$NAME$Preload(what)
        endif
    endfunction
    //! endtextmacro

    //! textmacro RANGED_PRELOAD_TYPE takes NAME
    function Preload$NAME$Ex takes integer start, integer end returns nothing
        local boolean forward = start < end
        loop
            call Preload$NAME$(start)
            exitwhen start == end
            if forward then
                set start = BJObjectId(start).plus_1()
                exitwhen start > end
            else
                set start = BJObjectId(start).minus_1()
                exitwhen start < end
            endif
        endloop
    endfunction
    //! endtextmacro

    /*========================================================================================================*/

    private function DoUnitPreload takes integer id returns nothing
        static if LIBRARY_UnitRecycler then
            call RecycleUnitEx(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), id, 0, 0, 270))
        else
            call RemoveUnit(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), id, 0, 0, 0))
        endif
    endfunction

    private function DoItemPreload takes integer id returns nothing
        call RemoveItem(UnitAddItemById(S.dummy, id))
    endfunction

    private function DoAbilityPreload takes integer id returns boolean
        return UnitAddAbility(S.dummy, id) and UnitRemoveAbility(S.dummy, id)
    endfunction

    private function DoEffectPreload takes string path returns nothing
        call DestroyEffect(AddSpecialEffect(path, GetUnitX(S.dummy), GetUnitY(S.dummy)))
    endfunction

    private function DoSoundPreload takes string path returns nothing
        local sound s = CreateSound(path, false, false, false, 10, 10, "")
        call SetSoundVolume(s, 0)
        call StartSound(s)
        call KillSoundWhenDone(s)
        set s = null
    endfunction

    //! runtextmacro PRELOAD_TYPE("Unit", "integer", "unit", "what", "0")
    //! runtextmacro PRELOAD_TYPE("Item", "integer", "item", "what", "1")
    //! runtextmacro PRELOAD_TYPE("Ability", "integer", "ability", "what", "2")
    //! runtextmacro PRELOAD_TYPE("Effect", "string", "effect", "StringHash(what)", "3")
    //! runtextmacro PRELOAD_TYPE("Sound", "string", "sound", "StringHash(what)", "4")

    static if LIBRARY_BJObjectId then
    //! runtextmacro RANGED_PRELOAD_TYPE("Unit")
    //! runtextmacro RANGED_PRELOAD_TYPE("Item")
    //! runtextmacro RANGED_PRELOAD_TYPE("Ability")
    endif

    /*========================================================================================================*/

    private module Init
        private static method onInit takes nothing returns nothing
            local rect world = GetWorldBounds()
            static if LIBRARY_Table then
                set tb = TableArray[5]
            endif
            set dummy = CreateUnit(PRELOAD_UNIT_OWNER, PRELOAD_UNIT_TYPE_ID, 0, 0, 0)
            call SetUnitY(dummy, GetRectMaxY(world) + PRELOAD_UNIT_Y_BOUNDS_EXTENSION)
            call UnitAddAbility(dummy, 'AInv')
            call UnitAddAbility(dummy, 'Avul')
            call UnitRemoveAbility(dummy, 'Amov')
            call RemoveRect(world)
            set world = null
        endmethod
    endmodule

    private struct S extends array
        static if LIBRARY_Table then
            static TableArray tb
        else
            static hashtable tb = InitHashtable()
        endif
        static unit dummy
        implement Init
    endstruct


endlibrary