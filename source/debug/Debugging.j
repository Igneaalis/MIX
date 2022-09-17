library Debugging initializer Init requires Commands, Table, Logs, Integer, String, Boolean

    globals
        
        private Table table
        private TableArray tableArray

    endglobals

    interface IAssertable

        method assert takes nothing returns boolean
        method getTable takes nothing returns Table 

    endinterface

    struct Debugging
        
        private integer index = 0
        private integer indexArray = 0
        private static string INT = "INT"
        private static string BOOLEAN = "BOOLEAN"
        private static string STRING = "STRING"

        method addCase takes IAssertable var, string str returns nothing
            local Table varTable = Table.create()
            set table.boolean[index] = var.assert()
            set table.string[index] = str
            set varTable = var.getTable()
            if var.getType() == Integer.typeid then
                set tableArray[index].string[indexArray] = INT
                set tableArray[index].integer[indexArray + 1] = varTable.integer[0]
                set tableArray[index].integer[indexArray + 2] = varTable.integer[1]
            endif
            if var.getType() == String.typeid then
                set tableArray[index].string[indexArray] = STRING
                set tableArray[index].string[indexArray + 1] = varTable.string[0]
                set tableArray[index].string[indexArray + 2] = varTable.string[1]
            endif
            if var.getType() == Boolean.typeid then
                set tableArray[index].string[indexArray] = BOOLEAN
                set tableArray[index].boolean[indexArray + 1] = varTable.boolean[0]
                set tableArray[index].boolean[indexArray + 2] = varTable.boolean[1]
            endif
            set indexArray = indexArray + 3
            set index = index + 1
        endmethod

        method getResults takes nothing returns nothing
            local integer i = 0
            local boolean IsAnyFailed = false

            for i = 0 to index - 1
                if not table.boolean[i] then
                    call Log(WHITE + "Test case|r " + GOLD + "#" + I2S(i + 1) + " |r " + RED + "failed|r!")
                    set IsAnyFailed = true
                else 
                call Log(WHITE + "Test case|r " + GOLD + "#" + I2S(i + 1) + " |r " + GREEN + "passed|r!")
                endif
            endfor

            if IsAnyFailed then
                call Log(RED + "Test failed|r!")
                return
            endif 

            call Log(GREEN + "All test cases passed|r!")
        endmethod
        
        method getFailedResults takes nothing returns nothing
            local integer i = 0
            local integer k = 0

            for i = 0 to index - 1
                if not table.boolean[i] then
                    call Log(WHITE + "Test case|r " + GOLD + "#" + I2S(i + 1) + "|r: \"" + GOLD + table.string[i] + "|r\"")
                    if tableArray[i].string[k] == INT then
                        call Log(RED + "AssertionError|r:\n" + GOLD + "int|r = \"" + Integer.toString(tableArray[i].integer[k + 1]) + "\"" + "\n" + GOLD + "intToAssert|r = \"" + Integer.toString(tableArray[i].integer[k + 2]) + "\"")
                    endif
                    if tableArray[i].string[k] == STRING then
                        call Log(RED + "AssertionError|r:\n" + GOLD + "str|r = \"" + tableArray[i].string[k + 1] + "\"" + "\n" + GOLD + "strToAssert|r = \"" + tableArray[i].string[k + 2] + "\"")
                    endif
                    if tableArray[i].string[k] == BOOLEAN then
                        call Log(RED + "AssertionError|r:\n" + GOLD + "bool|r = \"" + Boolean.toString(tableArray[i].boolean[k + 1]) + "\"" + "\n" + GOLD + "boolToAssert|r = \"" + Boolean.toString(tableArray[i].boolean[k + 2]) + "\"")
                    endif
                endif
                set k = k + 3
            endfor
        endmethod
        
    endstruct

    private function Init takes nothing returns nothing
        set table = Table.create()
        set tableArray = TableArray[0x2000]
    endfunction

endlibrary
