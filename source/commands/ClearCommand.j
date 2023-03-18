struct ClearCommand
    static string command = "clear"
    implement CommandModule

    static method run takes player p, string str returns string
        if (GetLocalPlayer() == p) then
            call ClearTextMessages()
        endif

        return ""
    endmethod
endstruct

struct ClearCommand2
    static string command = "c"
    implement CommandModule

    static method run takes player p, string str returns string
        return ClearCommand.run.evaluate(p, str)
    endmethod
endstruct