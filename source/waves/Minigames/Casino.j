// scope Casino initializer Init

//     globals
        
//     endglobals

//     private function Init takes nothing returns nothing
//         local integer i
//         local integer j
//         local unit lastCreatedUnit = null

//         // Миниигра казино
//         set udg_r = 0
//         set i = 1
//         loop
//             exitwhen i > 3
//             set j = 1
//             loop
//                 exitwhen j > 5
//                 set udg_r = udg_r + 1
//                 // Opt. begin
//                 // 'n001' - Circle of Power
//                 set lastCreatedUnit = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'n001', PolarProjectionBJ(PolarProjectionBJ(GetRectCenter(gg_rct_circle), (-256.00 + (256.00 * I2R(i))), 270.00), (-256.00 + (256.00 * I2R(j))), 0), bj_UNIT_FACING)
//                 call SetUnitUserData(lastCreatedUnit, udg_r)
//                 if (ModuloInteger(udg_r, 2) == 1) then
//                     // Z offset = 0
//                     // Font size = 11
//                     // Red =    100%
//                     // Green =  10%
//                     // Blue =   10%
//                     // Transparency = 0%
//                     call CreateTextTagUnitBJ(I2S(udg_r), lastCreatedUnit, 0, 11.00, 100, 10.00, 10.00, 0)
//                     call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), players)
//                     call SetUnitColor(lastCreatedUnit, PLAYER_COLOR_RED)
//                 else
//                     call CreateTextTagUnitBJ(I2S(udg_r), lastCreatedUnit, 0, 11.00, 10.00, 10.00, 10.00, 0)
//                     call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), players)
//                     call SetUnitColor(lastCreatedUnit, PLAYER_COLOR_MAROON)
//                 endif
//                 // Opt. end
//                 set j = j + 1
//             endloop
//             set i = i + 1
//         endloop

//         set lastCreatedUnit = null
//     endfunction

// endscope