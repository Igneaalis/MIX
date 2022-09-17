module CommandModule
    private static method decoratorModule takes nothing returns nothing
        call thistype.run(GetTriggerPlayer(), GetEventPlayerChatString())
    endmethod

    private static method InitModule takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i
        for i = 0 to maxNumberOfPlayers - 1
            call TriggerRegisterPlayerChatEvent(t, Player(i), "-" + thistype.command, false)
        endfor
        call TriggerAddAction(t, function thistype.decoratorModule)
        set t = null
    endmethod

    private static method onInit takes nothing returns nothing
        call thistype.InitModule.execute()
    endmethod
endmodule