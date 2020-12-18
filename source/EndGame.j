/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 21:19       =
=============================================

Реализация окна победы/поражения.

*/


function defeat_quit takes nothing returns nothing
    call EndGame(true)
endfunction

function win takes player p returns nothing
    local trigger t = CreateTrigger()
    local dialog  d = DialogCreate()
    call RemovePlayer(p, PLAYER_GAME_RESULT_VICTORY)
    if (GetPlayerController(p) == MAP_CONTROL_USER) then
        call DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE"), GetLocalizedHotkey("GAMEOVER_CONTINUE")))
        call TriggerAddAction(t, function defeat_quit)
        set t = CreateTrigger()
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
        call TriggerAddAction(t, function defeat_quit)
        if (GetLocalPlayer() == p) then
            call EnableUserControl(true)
            call EnableUserUI(false)
        endif
        call DialogDisplay(p, d, true)
        if (GetLocalPlayer() == p) then
            call VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, 1.)
            call StartSound(bj_victoryDialogSound)
        endif
    endif
    set t = null
    set d = null
endfunction

function defeat takes player p returns nothing
    local trigger t = CreateTrigger()
    local dialog  d = DialogCreate()
    call RemovePlayer(p, PLAYER_GAME_RESULT_DEFEAT)
    if (GetPlayerController(p) == MAP_CONTROL_USER) then
        if (Locale.evaluate() == "RU") then
            call DialogSetMessage(d, "Вы проиграли!")
        else
            call DialogSetMessage(d, "You was defeated!")
        endif
        call TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
        call TriggerAddAction(t, function defeat_quit)
        if (GetLocalPlayer() == p) then
            call EnableUserControl(true)
            call EnableUserUI(false)
        endif
        call DialogDisplay(p, d, true)
        if (GetLocalPlayer() == p) then
            call VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, 1.)
            call StartSound(bj_defeatDialogSound)
        endif
    endif
    set t = null
    set d = null
endfunction