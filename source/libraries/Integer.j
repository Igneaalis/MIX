library Integer initializer Init requires Logs

    globals
        private Table table
    endglobals

    struct Integer extends IAssertable
        integer int
        integer intToAssert

        method assert takes nothing returns boolean
            if int != intToAssert then
                call Log(RED + "AssertionError|r:\n" + GOLD + "int|r = \"" + Integer.toString(int) + "\"" + "\n" + GOLD + "intToAssert|r = \"" + Integer.toString(intToAssert) + "\"")
            endif
            return int == intToAssert
        endmethod

        static method quickAssert takes integer int1, integer int2 returns boolean
            if int1 != int2 then
                call Log(RED + "AssertionError|r:\n" + GOLD + "int1|r = \"" + Integer.toString(int1) + "\"" + "\n" + GOLD + "int2|r = \"" + Integer.toString(int2) + "\"")
            endif
            return int1 == int2
        endmethod

        static method toString takes integer intToString returns string
            return I2S(intToString)
        endmethod

        method getTable takes nothing returns Table
            set table.integer[0] = int
            set table.integer[1] = intToAssert
            return table
        endmethod
    
    endstruct

    private function Init takes nothing returns nothing
        set table = Table.create()
    endfunction

endlibrary
