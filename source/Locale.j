/*

=============================================
= Файл создал:       Nokladr                =
= Discord:           ! ! Nokladr#2205       =
= E-Mail:            Nostaleal.ru@yandex.ru =
= Дата создания:     01.11.2020 18:30       =
= Дата изменения:    01.11.2020 18:30       =
=============================================

*/

function Locale takes nothing returns string
    local string s = GetLocalizedString("CHEATENABLED")
    if (s == "Чит включен!") then
        set s = "RU"
    else
        set s = "EN"
    endif
    return s

endfunction