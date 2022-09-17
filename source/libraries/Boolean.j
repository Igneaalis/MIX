library Boolean initializer Init requires Logs

    globals
        private Table table
    endglobals

    struct Boolean extends IAssertable
        boolean bool
        boolean boolToAssert

        method assert takes nothing returns boolean
            if bool != boolToAssert then
                call Log(RED + "AssertionError|r:\n" + GOLD + "bool|r = \"" + Boolean.toString(bool) + "\"" + "\n" + GOLD + "boolToAssert|r = \"" + Boolean.toString(boolToAssert) + "\"")
            endif
            return bool == boolToAssert
        endmethod

        static method quickAssert takes boolean bool1, boolean bool2 returns boolean
            if bool1 != bool2 then
                call Log(RED + "AssertionError|r:\n" + GOLD + "bool1|r = \"" + Boolean.toString(bool1) + "\"" + "\n" + GOLD + "bool2|r = \"" + Boolean.toString(bool2) + "\"")
            endif
            return bool1 == bool2
        endmethod

        static method toString takes boolean boolToString returns string
            if boolToString then
                return "true"
            endif
            return "false"
        endmethod

        method getTable takes nothing returns Table
            set table.boolean[0] = bool
            set table.boolean[1] = boolToAssert
            return table
        endmethod
    
    endstruct

    private function Init takes nothing returns nothing
        set table = Table.create()
    endfunction

endlibrary
