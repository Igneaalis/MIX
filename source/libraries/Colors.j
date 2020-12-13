library ColorsLib

    globals
        constant string GOLD =      "|cffffcc00"
        constant string WHITE =     "|cffffffff"

        constant string RED =       "|cffff0202"    // Player(0)  Player(0x00)
        constant string BLUE =      "|cff0041ff"    // Player(1)  Player(0x01)
        constant string TEAL =      "|cff1be5b8"    // Player(2)  Player(0x02)
        constant string PURPLE =    "|cff530080"    // Player(3)  Player(0x03)
        constant string YELLOW =    "|cffffff00"    // Player(4)  Player(0x04)
        constant string ORANGE =    "|cfffe890D"    // Player(5)  Player(0x05)
        constant string GREEN =     "|cff1fbf00"    // Player(6)  Player(0x06)
        constant string PINK =      "|cffe45aaa"    // Player(7)  Player(0x07)
        constant string GRAY =      "|cff949596"    // Player(8)  Player(0x08)
        constant string LB =        "|cff7dbef1"    // Player(9)  Player(0x09)
        constant string DG =        "|cff0f6145"    // Player(10) Player(0x0A)
        constant string BROWN =     "|cff4d2903"    // Player(11) Player(0x0B)

        constant string MAROON =    "|cff9c0000"    // Player(12) Player(0x0C)
        constant string NAVY =      "|cff0000c3"    // Player(13) Player(0x0D)
        constant string TURQUOISE = "|cff00ebff"    // Player(14) Player(0x0E)
        constant string VIOLET =    "|cffbd00ff"    // Player(15) Player(0x0F)
        constant string WHEAT =     "|cffecce87"    // Player(16) Player(0x10)
        constant string PEACH =     "|cfff7a58b"    // Player(17) Player(0x11)
        constant string MINT =      "|cffbfff81"    // Player(18) Player(0x12)
        constant string LAVENDER =  "|cffdbb8eb"    // Player(19) Player(0x13)
        constant string COAL =      "|cff4f5055"    // Player(20) Player(0x14)
        constant string SNOW =      "|cffecf0ff"    // Player(21) Player(0x15)
        constant string EMERALD =   "|cff00781e"    // Player(22) Player(0x16)
        constant string PEANUT =    "|cffa56f34"    // Player(23) Player(0x17)
        constant string BLACK =     "|cff2e2d2e"    // Player(24) Player(0x18)
    endglobals

    // Возвращает цвет игрока взависимости от его ID.
    function C_IntToColor takes integer i returns string
        if i == 0 then
            return RED
        elseif i == 1 then
            return BLUE
        elseif i == 2 then
            return TEAL
        elseif i == 3 then
            return PURPLE
        elseif i == 4 then
            return YELLOW
        elseif i == 5 then
            return ORANGE
        elseif i == 6 then
            return GREEN
        elseif i == 7 then
            return PINK
        elseif i == 8 then
            return GRAY
        elseif i == 9 then
            return LB
        elseif i == 10 then
            return DG
        elseif i == 11 then
            return BROWN
        elseif i == 12 then
            return MAROON
        elseif i == 13 then
            return NAVY
        elseif i == 14 then
            return TURQUOISE
        elseif i == 15 then
            return VIOLET
        elseif i == 16 then
            return WHEAT
        elseif i == 17 then
            return PEACH
        elseif i == 18 then
            return MINT
        elseif i == 19 then
            return LAVENDER
        elseif i == 20 then
            return COAL
        elseif i == 21 then
            return SNOW
        elseif i == 22 then
            return EMERALD
        elseif i == 23 then
            return PEANUT
        elseif i == 24 then
            return BLACK
        else
            return WHITE
        endif
    endfunction

    struct Color
        integer red
        integer blue
        integer green

        // Takes player and returns Color struct with red, green, blue integer fields in 0-255 range
        static method create takes player p returns Color
            local Color color = Color.allocate()
            local integer i = GetPlayerId(p)

            if i == 0 then
                set color.red = 0xff
                set color.green = 0x02
                set color.blue = 0x02
            elseif i == 1 then
                set color.red = 0x00
                set color.green = 0xff
                set color.blue = 0x41
            elseif i == 2 then
                set color.red = 0x1b
                set color.green = 0xe5
                set color.blue = 0xb8
            elseif i == 3 then
                set color.red = 0x53
                set color.green = 0x00
                set color.blue = 0x80
            elseif i == 4 then
                set color.red = 0xff
                set color.green = 0xff
                set color.blue = 0x00
            elseif i == 5 then
                set color.red = 0xfe
                set color.green = 0x89
                set color.blue = 0x0d
            elseif i == 6 then
                set color.red = 0x1f
                set color.green = 0xbf
                set color.blue = 0x00
            elseif i == 7 then
                set color.red = 0xe4
                set color.green = 0x5a
                set color.blue = 0xaa
            elseif i == 8 then
                set color.red = 0x94
                set color.green = 0x95
                set color.blue = 0x96
            elseif i == 9 then
                set color.red = 0x7d
                set color.green = 0xbe
                set color.blue = 0xf1
            elseif i == 10 then
                set color.red = 0x0f
                set color.green = 0x61
                set color.blue = 0x45
            elseif i == 11 then
                set color.red = 0x4d
                set color.green = 0x29
                set color.blue = 0x03
            elseif i == 12 then
                set color.red = 0x9c
                set color.green = 0x00
                set color.blue = 0x00
            elseif i == 13 then
                set color.red = 0x00
                set color.green = 0x00
                set color.blue = 0xc3
            elseif i == 14 then
                set color.red = 0x00
                set color.green = 0xeb
                set color.blue = 0xff
            elseif i == 15 then
                set color.red = 0xbd
                set color.green = 0x00
                set color.blue = 0xff
            elseif i == 16 then
                set color.red = 0xec
                set color.green = 0xce
                set color.blue = 0x87
            elseif i == 17 then
                set color.red = 0xf7
                set color.green = 0xa5
                set color.blue = 0x8b
            elseif i == 18 then
                set color.red = 0xbf
                set color.green = 0xff
                set color.blue = 0x81
            elseif i == 19 then
                set color.red = 0xdb
                set color.green = 0xb8
                set color.blue = 0xeb
            elseif i == 20 then
                set color.red = 0x4f
                set color.green = 0x50
                set color.blue = 0x55
            elseif i == 21 then
                set color.red = 0xec
                set color.green = 0xf0
                set color.blue = 0xff
            elseif i == 22 then
                set color.red = 0x00
                set color.green = 0x78
                set color.blue = 0x1e
            elseif i == 23 then
                set color.red = 0xa5
                set color.green = 0x6f
                set color.blue = 0x34
            elseif i == 24 then
                set color.red = 0x2e
                set color.green = 0x2d
                set color.blue = 0x2e
            else
                set color.red = 0xff
                set color.green = 0xff
                set color.blue = 0xff
            endif
            return color
        endmethod
    endstruct

endlibrary