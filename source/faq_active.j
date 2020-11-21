function Trig_faq_active_Copy_Func001Func005Func005A takes nothing returns nothing
    call DialogDisplayBJ( false, udg_faq_dialog, GetEnumPlayer() )
    call CameraSetupApplyForPlayer( true, gg_cam_Camera_003, GetEnumPlayer(), 0 )
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0 )
    call SelectUnitForPlayerSingle( GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'ntav')), GetEnumPlayer() )
endfunction

function Trig_faq_active_Copy_Func001Func005C takes nothing returns boolean
    if ( not ( udg_cycle_i > ( CountPlayersInForceBJ(udg_players_group) / 2 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_active_Copy_Func001Func010Func005A takes nothing returns nothing
    call DialogDisplayBJ( false, udg_faq_dialog, GetEnumPlayer() )
endfunction

function Trig_faq_active_Copy_Func001Func010C takes nothing returns boolean
    if ( not ( udg_faq_vote >= ( CountPlayersInForceBJ(udg_players_group) / 2 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_faq_active_Copy_Func001C takes nothing returns boolean
    if ( not ( GetClickedButtonBJ() == udg_faq_key[0] ) ) then
        return false
    endif
    return true
endfunction

function faq_active takes nothing returns nothing
    if ( Trig_faq_active_Copy_Func001C() ) then
        set udg_faq_vote = ( udg_faq_vote + 1 )
        call DestroyTextTagBJ( udg_faq_text[2] )
        call CreateTextTagLocBJ( I2S(udg_faq_vote), GetRectCenter(gg_rct_guideyesvote), 0, 10.00, 100, 100, 100, 0 )
        set udg_faq_text[2] = GetLastCreatedTextTag()
        if ( Trig_faq_active_Copy_Func001Func010C() ) then
            set udg_gameset_time_first = 102.00
            set udg_faq_status = true
            call faq_start()
            call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl" , "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
            call ForForce( udg_players_group, function Trig_faq_active_Copy_Func001Func010Func005A )
            call DestroyTextTagBJ( udg_faq_text[0] )
            call DestroyTextTagBJ( udg_faq_text[1] )
            call DestroyTextTagBJ( udg_faq_text[2] )
            call DestroyTextTagBJ( udg_faq_text[3] )
            call TriggerExecute( gg_trg_faq )
            call DisableTrigger( GetTriggeringTrigger() )
            set udg_cycle_i = 0
            set udg_faq_vote = 0
        endif
    else
        set udg_cycle_i = ( udg_cycle_i + 1 )
        call DestroyTextTagBJ( udg_faq_text[3] )
        call CreateTextTagLocBJ( I2S(udg_cycle_i), GetRectCenter(gg_rct_guidenovote), 0, 10.00, 100, 100, 100, 0 )
        set udg_faq_text[3] = GetLastCreatedTextTag()
        if ( Trig_faq_active_Copy_Func001Func005C() ) then
            set udg_gameset_time_first = 60.00
            set udg_faq_status = true
            call faq_start()
            call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl" , "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
            call ForForce( udg_players_group, function Trig_faq_active_Copy_Func001Func005Func005A )
            call DestroyTextTagBJ( udg_faq_text[0] )
            call DestroyTextTagBJ( udg_faq_text[1] )
            call DestroyTextTagBJ( udg_faq_text[2] )
            call DestroyTextTagBJ( udg_faq_text[3] )
            call DisableTrigger( GetTriggeringTrigger() )
            set udg_cycle_i = 0
            set udg_faq_vote = 0
        endif
    endif
endfunction

//===========================================================================
function faq_active_init takes nothing returns nothing
    local trigger t = CreateTrigger()

    call TriggerRegisterDialogEventBJ(t, udg_faq_dialog)
    call TriggerAddAction(t, function faq_active)

    set t = null
endfunction

