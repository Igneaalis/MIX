/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:28       =
=============================================

Главный и входной интерфейс карты.

*/

native GetUnitGoldCost takes integer unitid returns integer
native GetUnitWoodCost takes integer unitid returns integer

scope Main initializer Init

    private function PostInit takes nothing returns nothing

        // NokladrLib.j
        call C_SetComputers.execute()
        call StartInitTimer.execute()

        call building_selling.execute()
        
        // Disable Damage Detection System until Fast Arena begins
        call DisableTrigger(DDS)
        
        call Players_Init.execute()
        call MIXMultiboard_Init.execute()
        call faq_ini.execute() // Starts voting for faq guide

        debug call Log("Post initialization complete!")
        
    endfunction

    //-------------------------The very first function-------------------------
    // Starts map initialization
    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()

        // Инициализируем хэш-таблицу
        set hash = HashTable.create()
        set table = Table.create()

        call TriggerRegisterTimerEventSingle(t, 0)
        call TriggerAddAction(t, function PostInit)

        set t = null
    endfunction

endscope
