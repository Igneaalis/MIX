scope MIXMultiboard

    globals
        Multiboard mbstruct
        MIXMB mb
        private integer curRow = 0
    endglobals

    struct MIXMB
        MIXMBRow array playerMIXMBRow[8]

        method operator [] takes player p returns MIXMBRow
            local integer playerId = GetPlayerId(p)
            return playerMIXMBRow[playerId]
        endmethod
    endstruct

    struct MIXMBRow
        integer row

        static method create takes integer playerRow returns MIXMBRow
            local MIXMBRow mmbrow = MIXMBRow.allocate()
            set mmbrow.row = playerRow
            return mmbrow
        endmethod

        method operator icon= takes string icon returns nothing
            set mbstruct[this.row][0].icon = icon
        endmethod

        method operator name= takes string name returns nothing
            set mbstruct[this.row][0].text = name
        endmethod

        method operator kills= takes integer kills returns nothing
            set mbstruct[this.row][1].text = I2S(kills)
        endmethod

        method operator upgrades= takes integer upgrades returns nothing
            set mbstruct[this.row][2].text = I2S(upgrades)
        endmethod
        
        method operator castlesDestroyed= takes integer castlesDestroyed returns nothing
            set mbstruct[this.row][3].text = I2S(castlesDestroyed)
        endmethod

        method operator points= takes string points returns nothing
            set mbstruct[this.row][4].text = points
        endmethod

        method operator result= takes real result returns nothing
            set mbstruct[this.row][5].text = I2S(R2I(result))
        endmethod

    endstruct

    private function CreateMIXMBRows takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer playerId = GetPlayerId(p)

        set curRow = curRow + 1
        set mb.playerMIXMBRow[playerId] = MIXMBRow.create(curRow)

        set p = null
    endfunction

    private function ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer playerId = GetPlayerId(p)

        set mb[p].name = C_IntToColor(playerId) + GetPlayerName(p) + "|r"

        set p = null
    endfunction

    private function Timer_ForPlayer takes nothing returns nothing
        local player p = GetEnumPlayer()
        
        set mbstruct.title = "Волна #" + I2S(curWave)
        set mb[p].kills = pdb[p].kills
        set mb[p].upgrades = pdb[p].upgrades
        set mb[p].castlesDestroyed = pdb[p].castlesDestroyed
        if pdb[p].incomePoints > 0 then
            set mb[p].points = I2S(R2I(pdb[p].points)) + " (" + GREEN + I2S(R2I(pdb[p].incomePoints)) + ")|r"
        else
            set mb[p].points = I2S(R2I(pdb[p].points))
        endif
        set mb[p].result = pdb[p].result

        // static if DEBUG_MODE then
        //     set mb[p].kills = 3333
        //     set mb[p].upgrades = 333
        //     set mb[p].castlesDestroyed = 33
        //     set mb[p].points = I2S(R2I(33333)) + " (" + GREEN + I2S(R2I(33)) + ")|r"
        //     set mb[p].result = 3333
        // endif

        set p = null
    endfunction

    private function Timer_OnTick takes nothing returns nothing
        call ForForce(players, function Timer_ForPlayer)
    endfunction

    public function Init takes nothing returns nothing
        local integer i
        local integer numberofPlayers = CountPlayersInForceBJ(players)

        set mbstruct = Multiboard.create(1 + numberofPlayers, 6)
        set mb = MIXMB.create()

        call mbstruct.setStyle(true, false)

        set mbstruct.title = "Волна #" + I2S(curWave)
        call mbstruct.row[0].setStyle(true, true)
        call mbstruct.column[0].setStyle(true, true)
        set mbstruct[0][0].text = "Имя игрока"
        call mbstruct[0][0].setStyle(true, false)
        set mbstruct.column[0].width = 0.12  // Name
        set mbstruct.column[1].width = 0.025  // Kills
        set mbstruct.column[2].width = 0.025  // Upgrades
        set mbstruct.column[3].width = 0.025  // Castles destroyed
        set mbstruct.column[4].width = 0.050  // Points
        set mbstruct.column[5].width = 0.025  // Result
        set mbstruct.column[0].icon = "ReplaceableTextures\\CommandButtons\\BTNRallyPoint.blp"
        set mbstruct[0][1].icon = "ReplaceableTextures\\CommandButtons\\BTNAttack.blp"
        set mbstruct[0][2].icon = "ReplaceableTextures\\CommandButtons\\BTNSpy.blp"
        set mbstruct[0][3].icon = "ReplaceableTextures\\CommandButtons\\BTNCastle.blp"
        set mbstruct[0][4].icon = "ReplaceableTextures\\CommandButtons\\BTNOrcCaptureFlag.blp"
        set mbstruct[0][5].icon = "ReplaceableTextures\\CommandButtons\\BTNTransmute.blp"
        
        call ForForce(players, function CreateMIXMBRows)
        call ForForce(players, function ForPlayer)
        
        set mbstruct.display = true

        call TimerStart(CreateTimer(), 0.033, true, function Timer_OnTick)
    endfunction

endscope