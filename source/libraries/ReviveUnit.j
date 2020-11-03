library ReviveUnit /* 2.0.0.0 https://www.hiveworkshop.com/threads/186696/
***************************************************
*
*   Resurrects a unit from his corpse, retaining
*   its handle ID, facing, and position.
*
***************************************************
*
*   ReviveUnit(unit whichUnit) returns boolean
*       - Resurrects the input unit.
*
***************************************************
*
*   Configurables
*       - Remove the ! from //! after saving.
*/
    //! external ObjectMerger w3a AHre URez anam "Dummy Resurrection" aher 0 acat "" atat "" Hre1 1 1 aare 1 0 aran 1 0 acdn 1 0 amcs 1 0 atar 1 "Air,Dead,Enemy,Friend,Ground,Neutral"
    //! external ObjectMerger w3u ushd eRez unam "Dummy" uabi "Aloc,Avul" ucbs 0 ucpt 0 umdl ".mdl" usca "0.01" ushu "None" umvh 0 umvs 0 ufoo 0 umpi 100000 umpm 100000 umpr 1000
       
    globals
        private constant integer DUMMY = 'eRez'
        private constant integer RESURRECT = 'URez'
    endglobals
/*
***************************************************
*
*   Notes
*       - Does not work on units without corpses.
*       - The resurrected unit's mana is determined
*         by the field: "Mana - Initial Amount"
*
***************************************************
*
*   Importing: Automatic
*       - Copy and paste this trigger.
*       - Save the map, close it, and reopen it
*       - Remove the exclamation ! from the object
*         merger lines above.
*
*   Importing: Manual
*       - Copy and paste this trigger.
*       - Copy and paste the dummy unit and resurrection
*         ability from the object editor.
*       - Change the configurable raw codes as necessary.
*
***************************************************/

    globals
        private unit reviver
        private real rx
        private real ry
    endglobals
   
    function ReviveUnit takes unit u returns boolean
        local boolean success
        if IsUnitType(u, UNIT_TYPE_HERO) == true then
            return ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        else
            call SetUnitX(reviver, GetUnitX(u))
            call SetUnitY(reviver, GetUnitY(u))
            set success = IssueImmediateOrderById(reviver, 852094)
            call SetUnitX(reviver, rx)
            call SetUnitY(reviver, ry)
        endif
        return success
    endfunction
   
    private module Init
        private static method onInit takes nothing returns nothing
            set rx = GetRectMaxX(bj_mapInitialPlayableArea) - 1
            set ry = GetRectMaxY(bj_mapInitialPlayableArea) - 1
            set reviver = CreateUnit(Player(15), DUMMY, rx, ry, 0)
            call SetUnitPathing(reviver, false)
            call UnitAddAbility(reviver, RESURRECT)
        endmethod
    endmodule
   
    struct Revive extends array
        /* For backwards compatibility */
        static method Unit takes unit whichUnit returns boolean
            return ReviveUnit(whichUnit)
        endmethod
       
        implement Init
    endstruct
endlibrary