// function Trig_inc_rotate_Copy_Func012Func002Func002Func001Func013A takes nothing returns nothing
    //     call ShowUnitShow(GetEnumUnit())
// endfunction

scope IncomeObjects initializer Init

    globals
        constant integer bigMineRC = 'n003'
        constant integer smallMineRC = 'n004'
        constant integer flagRC = 'n005'
        private rect array rectList
        private integer rectListSize = 9
        private rect array filledRectList
        group IncomeObjects_group = CreateGroup()
        minimapicon array IncomeObjects_minimapicons
        integer IncomeObjects_StartAmount = 3
        integer IncomeObjects_EndAmount = 6
    endglobals

    public function Shuffle takes nothing returns nothing
        local integer i
        local integer j
        local real x
        local real y
        local integer numberOfObjects
        local integer random
        local rect curRect
        local unit u

        set numberOfObjects = GetRandomInt(IncomeObjects_StartAmount, IncomeObjects_EndAmount)
        debug set numberOfObjects = 9

        for i = 1 to numberOfObjects
            set random = GetRandomInt(1, rectListSize)

            set j = i - 1
            while j > 0
                if (filledRectList[j] == rectList[random]) then
                    set random = GetRandomInt(1, rectListSize)
                    set j = i - 1
                else
                    set j = j - 1
                endif
            endwhile

            set filledRectList[i] = rectList[random]
            set curRect = filledRectList[i]
            set x = GetRectCenterX(curRect)
            set y = GetRectCenterY(curRect)

            if curRect == rectList[1] then
                set u = CreateUnitEx(Player(27), bigMineRC, x, y, 270)
                set IncomeObjects_minimapicons[i] = CreateMinimapIcon(x, y, 0xff, 0xff, 0xff, "UI\\Minimap\\MiniMap-Goldmine.mdl", FOG_OF_WAR_VISIBLE)
                // call UnitSetUsesAltIcon(u, true)
            else
                if ModuloInteger(random, 2) == 1 then
                    set u = CreateUnitEx(Player(27), smallMineRC, x, y, 270)
                    set IncomeObjects_minimapicons[i] = CreateMinimapIcon(x, y, 0xcc, 0x00, 0xff, "UI\\Minimap\\MiniMap-Hero.mdl", FOG_OF_WAR_VISIBLE)
                else
                    set u = CreateUnitEx(Player(27), flagRC, x, y, 270)
                    set IncomeObjects_minimapicons[i] = CreateMinimapIcon(x, y, 0xff, 0x00, 0x00, "UI\\Minimap\\MiniMap-Goldmine.mdl", FOG_OF_WAR_VISIBLE)
                endif
            endif

            call GroupAddUnit(IncomeObjects_group, u)

        endfor

        // call ForGroupBJ(udg_light[( udg_cycle_i - 1 )],function Trig_inc_rotate_Copy_Func012Func002Func002Func001Func013A)

        set curRect = null
        set u = null
    endfunction

    private function Init takes nothing returns nothing
        set rectList[1] = gg_rct_centreCENTRE
        // Clockwise
        set rectList[2] = gg_rct_upmid
        set rectList[3] = gg_rct_upright
        set rectList[4] = gg_rct_rightmid
        set rectList[5] = gg_rct_downright
        set rectList[6] = gg_rct_downmid
        set rectList[7] = gg_rct_downleft
        set rectList[8] = gg_rct_leftmid
        set rectList[9] = gg_rct_upleft

        // call SetAltMinimapIcon("UI\\Minimap\\minimap-gold.blp")
    endfunction

endscope