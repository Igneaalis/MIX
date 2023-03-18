struct ZoomCommand
    static string command = "zoom"
    implement CommandModule

    static method run takes player p, string str returns string
        local string strValue = SubString(str, 6, StringLength(str))
        local string strResult = null
        local integer value = -1
        local boolean flag = true

        if flag and String.count(str, " ") != 1 then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-zoom|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 300 до 4000."
            set flag = false
        endif

        if flag and not String.IsRealNumber(strValue) then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-zoom|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 300 до 4000."
            set flag = false
        endif

        if String.IsRealNumber(strValue) then
            set value = S2I(strValue)
        endif

        if flag and (value >= 300 and value <= 4000) then
            call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, value, 0.5)
            return ""
        endif

        if flag then
            set strResult = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 300 до 4000."
        endif

        return C_DisplayTimedTextToPlayer(p, 0, 0, Commands.GetCmdDisplayTime.evaluate(), strResult)
    endmethod
endstruct

struct CamCommand
    static string command = "cam"
    implement CommandModule

    static method run takes player p, string str returns string
        local string strValue = SubString(str, 5, StringLength(str))
        local string strResult = null
        local integer value = -1
        local boolean flag = true

        if flag and String.count(str, " ") != 1 then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-cam|r" + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 300 до 4000."
            set flag = false
        endif

        if flag and not String.IsRealNumber(strValue) then
            set strResult = RED + "Внимание, ошибка|r: формат команды неверный. Используйте следующий формат: " + GOLD + "-cam|r " + GREEN + "#|r\nГде " + GREEN + "#|r - это число в диапазоне от 300 до 4000."
            set flag = false
        endif

        if String.IsRealNumber(strValue) then
            set value = S2I(strValue)
        endif

        if flag and (value >= 300 and value <= 4000) then
            call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, value, 0.5)
            return ""
        endif

        if flag then
            set strResult = RED + "Внимание, ошибка|r: данная команда принимает число в диапазоне от 300 до 4000."
        endif

        return C_DisplayTimedTextToPlayer(p, 0, 0, Commands.GetCmdDisplayTime.evaluate(), strResult)
    endmethod
endstruct