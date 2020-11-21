function Trig_faq_start_Copy_Func004C takes nothing returns boolean
    if ( not ( udg_gameset_time_first < 61.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func007C takes nothing returns boolean
    if ( not ( udg_gameset_time_first > 30.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_PEON) == true )
endfunction

function Trig_faq_start_Copy_Func010Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'hpea' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'h015' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'h01G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'h01U' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010Func005C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'h025' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'h02H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_start_Copy_Func010A takes nothing returns nothing
    if ( Trig_faq_start_Copy_Func010Func001C() ) then
        call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNPeasant.blp" )
    else
    endif
    if ( Trig_faq_start_Copy_Func010Func002C() ) then
        call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp" )
    else
    endif
    if ( Trig_faq_start_Copy_Func010Func003C() ) then
        call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNWisp.blp" )
    else
    endif
    if ( Trig_faq_start_Copy_Func010Func004C() ) then
        call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNPeon.blp" )
    else
    endif
    if ( Trig_faq_start_Copy_Func010Func005C() ) then
        call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNMurgalSlave.blp" )
    else
    endif
    if ( Trig_faq_start_Copy_Func010Func006C() ) then
        call MultiboardSetItemIconBJ( udg_scoreboard, 1, ( 1 + GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit())) ), "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp" )
    else
    endif
endfunction

function faq_start takes nothing returns nothing
    call TimerStart(udg_gameset_timer, udg_gameset_time_first, false, function gameset_end)
    call CreateTimerDialogBJ( udg_gameset_timer, "TRIGSTR_3815" )
    call TimerDialogDisplayBJ( true, GetLastCreatedTimerDialogBJ() )
    if ( Trig_faq_start_Copy_Func004C() ) then
        call gameset_owner()
    endif
    call TriggerSleepAction( 53.00 )
    call TriggerExecute( gg_trg_scoreboard_ini )
    if ( Trig_faq_start_Copy_Func007C() ) then
        call gameset_owner()
    endif
    call TriggerSleepAction( 10.00 )
    call DisplayTimedTextToForce( GetPlayersAll(), 60.00, "TRIGSTR_3816" )
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_faq_start_Copy_Func010001002)), function Trig_faq_start_Copy_Func010A )
endfunction

