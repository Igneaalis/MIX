// =============================================
// = Файл создал:       Nokladr                =
// = Discord:           ! ! Nokladr#2205       =
// = E-Mail:            Nostaleal.ru@yandex.ru =
// = Дата создания:     01.11.2020 18:28       =
// =============================================
//
// Главный и входной интерфейс карты.


native GetUnitGoldCost takes integer unitid returns integer
native GetUnitWoodCost takes integer unitid returns integer

scope Main initializer Init

    //-------------------------The very first function-------------------------
    // Starts map initialization
    private function Init takes nothing returns nothing
        call TriggerSleepAction(0)

        // Инициализируем хэш-таблицу
        // set hash = HashTable.create()
        // set TABLE = Table.create()
        // set TABLE_ARRAY = TableArray[0x1024]

        // NokladrLib.j
        call TriggerSleepAction(0)
        call C_SetComputers.execute()

        call TriggerSleepAction(0)
        call building_selling.execute()
        
        // Disable Damage Detection System
        // call DisableTrigger(DDS)
        
        call TriggerSleepAction(0)
        call Players_Init.execute()

        call TriggerSleepAction(0)
        call MIXMultiboard_Init.execute()

        call TriggerSleepAction(0)
        call faq_ini.execute() // Starts voting for faq guide

        debug call Log("Debug mode enabled!")
    endfunction

endscope
