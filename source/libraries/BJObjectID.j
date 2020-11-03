library BJObjectId // 1.0 http://www.hiveworkshop.com/threads/287128/

//! novjass

// creating:

    // from native object-id / integer
    set oid = BJObjectId('A000')

    // from string
    set oid = BJObjectId.from_str("I001")


// printing:

    call BJDebugMsg(oid.to_str())


// looping through a set of object-id(s)

    // forward
    local BJObjectId oid = BJObjectId('A000')
    local BJObjectId last_oid = BJObjectId('A010')
    loop
        exitwhen oid > last_oid
        // do stuff
        set oid = oid.plus_1()
    endloop

    // backward
    local BJObjectId oid = BJObjectId('A010')
    local BJObjectId last_oid = BJObjectId('A000')
    loop
        exitwhen oid < last_oid
        // do stuff
        set oid = oid.minus_1()
    endloop


// mapping BJObjectId(s) to array-indices / struct instances

    local integer index
    local MyStruct my_struct

    set index = BJObjectId('H000').to_unit_index()
    set my_struct = MyStruct( BJObjectId('h001').to_unit_index() )

    set index = BJObjectId('I000').to_item_index()
    set my_struct = BJObjectId('I001').to_item_index() // don't really need the MyStruct cast (because vJass =))

    set index = BJObjectId('B000').to_destructable_index()
    set my_struct = BJObjectId('B001').to_destructable_index()

    set index = BJObjectId('D000').to_doodad_index()
    set my_struct = BJObjectId('D001').to_doodad_index()

    set index = BJObjectId('A000').to_ability_index()
    set my_struct = BJObjectId('A001').to_ability_index()

    set index = BJObjectId('B000').to_buff_index()
    set my_struct = BJObjectId('B001').to_buff_index()

    set index = BJObjectId('R000').to_upgrade_index()
    set my_struct = BJObjectId('R001').to_upgrade_index()

    // for campaign objects the methods have a "c" after the "to_"
    set index = BJObjectId('A000').to_cunit_index()
    set index = BJObjectId('A000').to_cability_index()
    ...

// NOTE: the to_*_index methods break for object-id(s) > 'XXOZ', i.e
// 900 is the maximum number of objects you can have and still be able to use those methods;
// the reason is that the object-id(s) after 'XXOZ' have indices > 8190

//! endnovjass

    struct BJObjectId extends array

        static method from_str takes string oid returns thistype
            // '0' = 48 .. '9' = 57,
            // 'A' = 65 .. 'Z' = 90
            // 'a' = 97 .. 'z' = 122
            //
            // index(<chr>):
            // '0' = 0; chr(0 + 48) = '0' = 48
            // 'A' = 17; chr(17 + 48) = 'A' = 65
            // 'a' = 49; chr(49 + 48) = 'a' = 97
            //
            local string chars = "0123456789.......ABCDEFGHIJKLMNOPQRSTUVWXYZ......abcdefghijklmnopqrstuvwxyz"
            local integer this = 0
            local integer i
            local integer j
            local integer ordinal
            local string chr
            local integer pow_256 = 1

            set i = 3
            loop
                exitwhen i < 0
                set chr = SubString(oid, i, i + 1)

                set j = 0
                loop
                    exitwhen j >= 75

                    if chr == SubString(chars, j, j + 1) then
                        set this = this + (j + 48) * pow_256
                        set pow_256 = pow_256 * 256
                        exitwhen true
                    endif

                    set j = j + 1
                endloop

                set i = i - 1
            endloop

            return this
        endmethod

        method to_str takes nothing returns string
            local string chars = "0123456789.......ABCDEFGHIJKLMNOPQRSTUVWXYZ......abcdefghijklmnopqrstuvwxyz"
            local integer t = this
            local integer i
            local integer b
            local string result = ""

            set i = t
            set t = i / 0x100
            set b = i - t * 0x100 - 48
            set result = SubString(chars, b, b + 1) + result

            set i = t
            set t = i / 0x100
            set b = i - t * 0x100 - 48
            set result = SubString(chars, b, b + 1) + result

            set i = t
            set t = i / 0x100
            set b = i - t * 0x100 - 48
            set result = SubString(chars, b, b + 1) + result

            set t = t - 48
            set result = SubString(chars, t, t + 1) + result

            return result
        endmethod

        method plus_1 takes nothing returns thistype
            local integer t = this
            local integer i
            local integer b1
            local integer b2
            local integer b3
            local integer b4

            set i = t
            set t = i / 0x100
            set b4 = i - t * 0x100

            if b4 < 'Z' then
                if b4 != '9' then
                    set i = i + 1
                else
                    set i = i + 8
                endif
            else

                set i = t
                set t = i / 0x100
                set b3 = i - t * 0x100
                if b3 < 'Z' then
                    if b3 != '9' then
                        set i = i * 0x00000100 + 0x00000100 + '0'
                    else
                        set i = i * 0x00000100 + 0x00000800 + '0'
                    endif
                else

                    set i = t
                    set t = i / 0x100
                    set b2 = i - t * 0x100
                    if b2 < 'Z' then
                        if b2 != '9' then
                            set i = i * 0x00010000 + 0x00010000 + '0' * 0x00000100 + '0'
                        else
                            set i = i * 0x00010000 + 0x00080000 + '0' * 0x00000100 + '0'
                        endif
                    else

                        set i = t
                        if i != '9' then
                            set i = i * 0x01000000 + 0x01000000 + '0' * 0x00010000 + '0' * 0x00000100 + '0'
                        else
                            set i = i * 0x01000000 + 0x08000000 + '0' * 0x00010000 + '0' * 0x00000100 + '0'
                        endif
                    endif
                endif
            endif

            return i
        endmethod

        method minus_1 takes nothing returns thistype
            local integer t = this
            local integer i
            local integer b1
            local integer b2
            local integer b3
            local integer b4

            set i = t
            set t = i / 0x100
            set b4 = i - t * 0x100
            if b4 > '0' then
                if b4 != 'A' then
                    set i = i - 1
                else
                    set i = i - 8
                endif
            else

                set i = t
                set t = i / 0x100
                set b3 = i - t * 0x100
                if b3 > '0' then
                    if b3 != 'A' then
                        set i = i * 0x00000100 - 0x00000100 + 'Z'
                    else
                        set i = i * 0x00000100 - 0x00000800 + 'Z'
                    endif
                else

                    set i = t
                    set t = i / 0x100
                    set b2 = i - t * 0x100
                    if b2 > '0' then
                        if b2 != 'A' then
                            set i = i * 0x00010000 - 0x00010000 + 'Z' * 0x00000100 + 'Z'
                        else
                            set i = i * 0x00010000 - 0x00080000 + 'Z' * 0x00000100 + 'Z'
                        endif
                    else

                        set i = t
                        if i != 'A' then
                            set i = i * 0x01000000 - 0x01000000 + 'Z' * 0x00010000 + 'Z' * 0x00000100 + 'Z'
                        else
                            set i = i * 0x01000000 - 0x08000000 + 'Z' * 0x00010000 + 'Z' * 0x00000100 + 'Z'
                        endif
                    endif
                endif
            endif

            return i
        endmethod

        method operator< takes thistype other returns boolean
            return integer(this) < integer(other)
        endmethod

        private static integer array first_unit_oid
        private static integer array first_cunit_oid
        private static method onInit takes nothing returns nothing
            set first_unit_oid['H'] = 'H000'
            set first_unit_oid['h'] = 'h000'
            set first_unit_oid['O'] = 'O000'
            set first_unit_oid['o'] = 'o000'
            set first_unit_oid['E'] = 'E000'
            set first_unit_oid['e'] = 'e000'
            set first_unit_oid['U'] = 'U000'
            set first_unit_oid['u'] = 'u000'
            set first_unit_oid['N'] = 'N000'
            set first_unit_oid['n'] = 'n000'

            set first_cunit_oid['H'] = 'H600'
            set first_cunit_oid['h'] = 'h600'
            set first_cunit_oid['O'] = 'O600'
            set first_cunit_oid['o'] = 'o600'
            set first_cunit_oid['E'] = 'E600'
            set first_cunit_oid['e'] = 'e600'
            set first_cunit_oid['U'] = 'U600'
            set first_cunit_oid['u'] = 'u600'
            set first_cunit_oid['N'] = 'N600'
            set first_cunit_oid['n'] = 'n600'
        endmethod

        method to_unit_index takes nothing returns integer
            return this - first_unit_oid[this / 0x01000000] + 1
        endmethod
        method to_cunit_index takes nothing returns integer
            return this - first_cunit_oid[this / 0x01000000] + 1
        endmethod

        method to_item_index takes nothing returns integer
            return this - 'I000' + 1
        endmethod
        method to_citem_index takes nothing returns integer
            return this - 'I600' + 1
        endmethod

        method to_destructable_index takes nothing returns integer
            return this - 'B000' + 1
        endmethod
        method to_cdestructable_index takes nothing returns integer
            return this - 'B600' + 1
        endmethod

        method to_doodad_index takes nothing returns integer
            return this - 'D000' + 1
        endmethod
        method to_cdoodad_index takes nothing returns integer
            return this - 'D600' + 1
        endmethod

        method to_ability_index takes nothing returns integer
            return this - 'A000' + 1
        endmethod
        method to_cability_index takes nothing returns integer
            return this - 'A600' + 1
        endmethod

        method to_buff_index takes nothing returns integer
            return this - 'B000' + 1
        endmethod
        method to_cbuff_index takes nothing returns integer
            return this - 'B600' + 1
        endmethod

        method to_upgrade_index takes nothing returns integer
            return this - 'R000' + 1
        endmethod
        method to_cupgrade_index takes nothing returns integer
            return this - 'R600' + 1
        endmethod

    endstruct

endlibrary