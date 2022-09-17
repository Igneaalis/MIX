/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     25.12.2020 18:41       =
=============================================

Структура данных, помогающая расчитать ресурсы за продажу юнита.

*/

library UnitDatabase initializer Init requires Table
    
    globals
        UnitDB udb
        private UnitStruct array usarr[128]
        private integer usarrcounter = 1
        private Table table
    endglobals

    struct UnitStruct
        private integer gold
        private integer gems
        private real gold_raw
        private real gems_raw

        static method create takes integer unitTypeId, integer parentUnitTypeId returns UnitStruct
            local UnitStruct us = UnitStruct.allocate()
            set us.gold_raw = GetUnitGoldCost(unitTypeId) * 0.8
            set us.gems_raw = GetUnitWoodCost(unitTypeId) * 0.8
            if (usarr[table[parentUnitTypeId]] != null) then
                set us.gold_raw = us.gold_raw + usarr[table[parentUnitTypeId]].GetGoldRaw()
                set us.gems_raw = us.gems_raw + usarr[table[parentUnitTypeId]].GetGemsRaw()
                set us.gold = R2I(us.gold_raw)
                set us.gems = R2I(us.gems_raw)
            else
                set us.gold = R2I(GetUnitGoldCost(unitTypeId) * 0.8)
                set us.gems = R2I(GetUnitWoodCost(unitTypeId) * 0.8)
            endif
            set table[unitTypeId] = usarrcounter
            set usarr[usarrcounter] = us
            set usarrcounter = usarrcounter + 1
            return us
        endmethod

        method GetGold takes nothing returns integer
            return this.gold
        endmethod
        
        method GetGems takes nothing returns integer
            return this.gems
        endmethod

        method GetGoldRaw takes nothing returns real
            return this.gold_raw
        endmethod

        method GetGemsRaw takes nothing returns real
            return this.gems_raw
        endmethod

    endstruct

    struct UnitDB
        method operator [] takes unit u returns UnitStruct
            return usarr[table[GetUnitTypeId(u)]]
        endmethod
    endstruct

    private function Init takes nothing returns nothing
        
        set table = Table.create()

    endfunction

endlibrary