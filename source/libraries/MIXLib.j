library MIXLib initializer Init requires NokladrLib, Colors, ArcingTextTag

    globals
        
    endglobals

    function AddGemsToPlayer takes integer gems, player p returns nothing
        local integer lumber = gems
        call AddLumberToPlayer(lumber, p)
    endfunction

    private function Init takes nothing returns nothing
        
    endfunction

endlibrary
