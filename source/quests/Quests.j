scope Quests initializer Init
    
    globals
        
    endglobals
    
    private function Init takes nothing returns nothing
        local quest q = CreateQuest()
        local string s = GOLD + "Версия карты|r: " + GREEN + strVersion + " " + Version + "|r " + RED + strBuild_Time +"|r\n" + GOLD + "Создатель|r: " + ORANGE + "[Battle.net]|r Nokladr#2429, " + ORANGE + "[Discord]|r ! ! Nokladr#2205\n" + GOLD + "E-Mail:|r " + strEmail
        call QuestSetTitle(q, "Описание")
        call QuestSetDescription(q, s)
        call QuestSetIconPath(q, "ReplaceableTextures\\CommandButtons\\BTNNecromancerAdept.blp")
        call QuestSetRequired(q, true)
        call QuestSetDiscovered(q, true)
        call QuestSetCompleted(q, false)
        //==================================================
        set q = CreateQuest()
        call QuestSetTitle(q, "Благодарности")
        set s = GOLD + "Отдельная благодарность этим людям за помощь|r:\n" + LB + "quq_CCCP|r " + ORANGE + "[xgm.guru]|r (Помощь с кодом), " + LB + "valerianko|r (Валера, бывший разработчик карты), " + LB + "2kxaoc|r " + ORANGE + "[youtube.com/user/2kxaoc]|r (Вадим, с него всё началось), " + LB + "N7 Molot|r " + ORANGE + "[xgm.guru]|r (Константин, помощь с рекламой), " + LB + "Gladiator#3635|r " + ORANGE + "[Discord]|r (Помощь с кодом), " + LB + "lllePJIoK#5780|r " + ORANGE + "[Discord]|r (Помощь с модельками), " + LB + "♦XtaR♦#4014|r " + ORANGE + "[Discord]|r (Помощь в тестировании карты)."
        call QuestSetDescription(q, s)
        call QuestSetIconPath(q, "ReplaceableTextures\\CommandButtons\\BTNMedalionOfCourage.blp")
        call QuestSetRequired(q, false)
        call QuestSetDiscovered(q, true)
        call QuestSetCompleted(q, false)
        //==================================================
        set q = CreateQuest()
        call QuestSetTitle(q, "Ссылки")
        set s = GOLD + "Discord|r: " + LB + "https://discord.gg/kazvQVA2QN" + "|r\n" + GOLD + "Git|r: " + LB + "https://github.com/Igneaalis/MIX" + "|r\n" + GOLD + "Скачать последнюю версию|r: " + LB + "https://github.com/Igneaalis/MIX/releases/latest" + "|r\n" + GOLD + "EpicWar.com|r: " + LB + "https://www.epicwar.com/maps/312465/" + "|r\n" + GOLD + "Статья на xgm.guru|r: " + LB + "https://xgm.guru/p/wc3/mix" + "|r\n" + GOLD + "Статья на wc3.3dn.ru|r: " + LB + "http://wc3.3dn.ru/load/arena/mix_community_edition/54-1-0-17241" + "|r"
        call QuestSetDescription(q, s)
        call QuestSetIconPath(q, "ReplaceableTextures\\CommandButtons\\BTNManual2.blp")
        call QuestSetRequired(q, false)
        call QuestSetDiscovered(q, true)
        call QuestSetCompleted(q, false)
        set q = null
    endfunction
    
endscope