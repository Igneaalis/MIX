/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     20.11.2020 21:40       =
=============================================

gameset end Trigger

Starts main game loop

*/

function gameset_end takes nothing returns nothing
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    call DisableTrigger( gg_trg_cmd_time )
    call DisableTrigger( gg_trg_cmd_build )
    call DisableTrigger( gg_trg_cmd_mode )
    call DisableTrigger( gg_trg_cmd_point )
    call DisableTrigger( gg_trg_cmd_arena )
    call TriggerExecute( gg_trg_set_wave_start_main )
    call TriggerExecute( gg_trg_set_wave_timer )
    call TriggerExecute( gg_trg_set_wave_region_rotate )
    call TriggerExecute( gg_trg_set_wave_unit_spawn )
endfunction
