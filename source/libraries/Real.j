library Real initializer Init requires Logs

    globals
        private Table table
    endglobals

    struct Real extends IAssertable
        real r
        real rToAssert

        method assert takes nothing returns boolean
            if r != rToAssert then
                call Log(RED + "AssertionError|r:\n" + GOLD + "r|r = \"" + Real.toString(r) + "\"" + "\n" + GOLD + "rToAssert|r = \"" + Real.toString(rToAssert) + "\"")
            endif
            return r == rToAssert
        endmethod

        static method quickAssert takes real r1, real r2 returns boolean
            if r1 != r2 then
                call Log(RED + "AssertionError|r:\n" + GOLD + "r1|r = \"" + Real.toString(r1) + "\"" + "\n" + GOLD + "r2|r = \"" + Real.toString(r2) + "\"")
            endif
            return r1 == r2
        endmethod

        static method toString takes real rToString returns string
            return R2S(rToString)
        endmethod

        method getTable takes nothing returns Table
            set table.real[0] = r
            set table.real[1] = rToAssert
            return table
        endmethod
    
    endstruct

    private function Init takes nothing returns nothing
        set table = Table.create()
    endfunction

endlibrary
