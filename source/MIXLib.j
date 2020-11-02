/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     02.11.2020 16:27       =
= Дата изменения:    02.11.2020 17:42       =
=============================================

Структуры данных.

*/

library MIXLib requires NokladrLib
    struct DB
        private player p
        public real scoreboard_result = 0

        static method create takes player p returns DB
            local DB db = DB.allocate()
                set db.p = p
            return db
        endmethod
    endstruct

    struct Playerdb
        private DB array dbarr[8]

        method fill_dbarr takes nothing returns nothing
            set this.dbarr[0] = DB.create(Player(0x00))
            set this.dbarr[1] = DB.create(Player(0x01))
            set this.dbarr[2] = DB.create(Player(0x02))
            set this.dbarr[3] = DB.create(Player(0x03))
            set this.dbarr[4] = DB.create(Player(0x04))
            set this.dbarr[5] = DB.create(Player(0x05))
            set this.dbarr[6] = DB.create(Player(0x06))
            set this.dbarr[7] = DB.create(Player(0x07))
        endmethod

        method operator [] takes player p returns DB
            return dbarr[GetPlayerId(p)]
        endmethod
    endstruct
endlibrary
