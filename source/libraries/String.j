library String initializer Init  // String functions v1.04 by MaskedPoptart https://www.hiveworkshop.com/threads/133059/

    globals
        
    endglobals

    struct String

        static method count takes string str, string subString returns integer
            local integer count = 0
            local integer i = 0
            local integer strLength = StringLength(str)
            local integer ssLength = StringLength(subString)
            loop
                exitwhen (i + ssLength) > strLength
                if (SubString(str, i, i + ssLength) == subString) then
                    set count = count + 1
                endif
                set i = i + 1
            endloop
            return count
        endmethod

        static method findIndexFrom takes string str, string subString, integer start returns integer
            local integer strLength = StringLength(str)
            local integer ssLength = StringLength(subString)
            local integer i = start
            if (ssLength > strLength or i < 0) then
                return -1
            endif
            loop
                exitwhen i > strLength - ssLength
                if (SubString(str, i, i + ssLength) == subString) then
                    return i
                endif
                set i = i + 1
            endloop
            return -1
        endmethod
    
        static method findIndex takes string str, string subString returns integer
            return findIndexFrom(str, subString, 0)
        endmethod
      
        static method findLastIndexFrom takes string str, string subString, integer start returns integer
            local integer strLength = StringLength(str)
            local integer ssLength = StringLength(subString)
            local integer i = strLength - ssLength
            if (start < i) then
                set i = start
            endif
            if (ssLength > strLength) then
                return -1
            endif
            loop
                exitwhen i < 0
                if (SubString(str, i, i + ssLength) == subString) then
                    return i
                endif
                set i = i - 1
            endloop
            return -1
        endmethod
    
        static method findLastIndex takes string str, string subString returns integer
            return findLastIndexFrom(str, subString, 2147483647)
        endmethod

        static method IsSpace takes string s returns boolean
            return (s == " ") or (s == "\n")
        endmethod

        static method IsDigit takes string s returns boolean
            return (s == "0") or (s == "1") or (s == "2") or (s == "3") or (s == "4") or (s == "5") or (s == "6") or (s == "7") or (s == "8") or (s == "9")
        endmethod
            
        static method IsRealNumber takes string s returns boolean
            // To check if a '.' is found in given string. 
            local integer i = 1
            local boolean flagDot = false
            
            if (StringLength(s) == 0) then
                return false
            endif
            
            // if string is of length 1 and the only
            // character is not a digit
            if (StringLength(s) == 1 and not(IsDigit(SubString(s, 0, 1)))) then
                return false
            endif
            
            // If the 1st char is not '+', '-', '.' or digit
            if ((SubString(s, 0, 1) != "+") and (SubString(s, 0, 1) != "-") and (SubString(s, 0, 1) != ".") and (not(IsDigit(SubString(s, 0, 1))))) then
                return false
            endif
            
            loop
                exitwhen (i >= StringLength(s))
                // If any of the char does not belong to
                // {digit, +, -, .}
                if ((not(IsDigit(SubString(s, i, i + 1)))) and (SubString(s, i, i + 1) != "+") and (SubString(s, i, i + 1) != "-") and (SubString(s, i, i + 1) != ".")) then
                    return false
                endif
            
                if (SubString(s, i, i + 1) == ".") then
                    // If '.' is the last character.
                    if (i + 1 >= StringLength(s)) then
                        return false
                    endif
            
                    // if '.' is not followed by a digit.
                    if (not(IsDigit(SubString(s, i + 1, i + 2)))) then
                        return false
                    endif
                endif
            
                set i = i + 1
            endloop
            
            // If the string skips all above cases, then it is numeric
            return true
        endmethod

    endstruct

    private function Init takes nothing returns nothing
        
    endfunction

endlibrary