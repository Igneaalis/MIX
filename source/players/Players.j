/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     24.12.2020 16:33       =
=============================================

Инициализация для каждого игрока

*/

scope Players

    globals
        force players = CreateForce()
    endglobals
    
    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local real x = GetPlayerStartLocationX(p)
        local real y = GetPlayerStartLocationY(p)
        
        call CameraSetupApplyForPlayer(true, gg_cam_logic, p, 0)

        if (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER) then
            call SetPlayerState(p, PLAYER_STATE_GIVES_BOUNTY, 1)

            call ForceAddPlayer(players, p)

            call CreateUnitEx(p, 'ntav', x, y, bj_UNIT_FACING) // Таверна с расами на выбор
            call CreateUnitEx(p, 'h001', x, y, bj_UNIT_FACING) // Юнит "Выбор героя"
            call CreateUnitEx(p, 'h029', x, y, bj_UNIT_FACING) // Юнит "Не более 1 погодного эффекта в раунде"

            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_all, true, false)) // Поле битвы
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_minersregion, true, false)) // Миниигра "Минёры"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_fastarena, true, false)) // Миниарена
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_horseregion, true, false)) // Миниигра "Конные бега"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_roulette, true, false)) // Миниигра "Казино"
            call FogModifierStart(CreateFogModifierRect(p, FOG_OF_WAR_VISIBLE, gg_rct_HungryHungryKodos, true, false)) // Миниигра "Голодные Кодо"
        endif

        set p = null
    endfunction

    public function Init takes nothing returns nothing
        call ForForce(bj_FORCE_ALL_PLAYERS, function ForPlayer)
    endfunction

endscope