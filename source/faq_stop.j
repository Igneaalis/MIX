function Trig_faq_stop_Copy_Func012Func004A takes nothing returns nothing
    call DialogDisplayBJ( false, udg_faq_dialog, GetEnumPlayer() )
    call CameraSetupApplyForPlayer( true, gg_cam_Camera_003, GetEnumPlayer(), 0 )
    call PanCameraToTimedLocForPlayer( GetEnumPlayer(), GetPlayerStartLocationLoc(GetEnumPlayer()), 0 )
    call SelectUnitForPlayerSingle( GroupPickRandomUnit(GetUnitsOfPlayerAndTypeId(GetEnumPlayer(), 'ntav')), GetEnumPlayer() )
endfunction

function faq_stop takes nothing returns nothing
    if (udg_faq_status == false) then
        call TriggerExecute( gg_trg_faq_start )
        call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl" , "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
        call ForForce( udg_players_group, function Trig_faq_stop_Copy_Func012Func004A )
        set udg_faq_vote = 0
        set udg_cycle_i = 0
        call DestroyTextTagBJ( udg_faq_text[0] )
        call DestroyTextTagBJ( udg_faq_text[1] )
        call DestroyTextTagBJ( udg_faq_text[2] )
        call DestroyTextTagBJ( udg_faq_text[3] )
    endif
    call DisableTrigger( gg_trg_faq_active )
endfunction