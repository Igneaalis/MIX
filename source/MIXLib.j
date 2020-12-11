/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     02.11.2020 16:27       =
=============================================

Структуры данных.

*/

library MIXLib initializer MIXLibInit requires NokladrLib
    globals
        Playerdb pdb
        private DB array dbarr[8]
    endglobals

    struct DB
        private player p
        real scoreboard_result = 0
        integer income_gold = 240
        integer income_gems = 8
        real leader_coeff = 1.00
        integer leader_wins = 0
        integer arena_wins = 1
        integer change_set = 3
        boolean info = true // показывать команды/полезную инфу

        static method create takes player p returns DB
            local DB db = DB.allocate()
                set db.p = p
            return db
        endmethod
    endstruct

    struct Playerdb
        method operator [] takes player p returns DB
            return dbarr[GetPlayerId(p)]
        endmethod
    endstruct

    private function fill_dbarr takes nothing returns nothing
        set pdb = Playerdb.create()
        set dbarr[0] = DB.create(Player(0x00))
        set dbarr[1] = DB.create(Player(0x01))
        set dbarr[2] = DB.create(Player(0x02))
        set dbarr[3] = DB.create(Player(0x03))
        set dbarr[4] = DB.create(Player(0x04))
        set dbarr[5] = DB.create(Player(0x05))
        set dbarr[6] = DB.create(Player(0x06))
        set dbarr[7] = DB.create(Player(0x07))
    endfunction

    private function MIXLibInit takes nothing returns nothing
        call fill_dbarr()
    endfunction
endlibrary
