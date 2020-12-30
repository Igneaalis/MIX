# JASS

- [JASS](#jass)
  - [Actions](#actions)
  - [Variables](#variables)
    - [trigger](#trigger)
    - [real](#real)
    - [integer](#integer)
    - [group](#group)
    - [force](#force)
  - [Units](#units)
  - [Structs](#structs)
    - [UnitDB](#unitdb)
      - [UnitDB methods](#unitdb-methods)
    - [UnitStruct](#unitstruct)
      - [UnitStruct methods](#unitstruct-methods)
    - [MIXMB](#mixmb)
      - [MIXMB methods](#mixmb-methods)
    - [MIXMBRow](#mixmbrow)
      - [MIXMBRow methods](#mixmbrow-methods)
    - [Playerdb](#playerdb)
      - [Playerdb methods](#playerdb-methods)
    - [PlayerStruct](#playerstruct)
      - [PlayerStruct fields](#playerstruct-fields)
      - [PlayerStruct methods](#playerstruct-methods)
  - [Interfaces](#interfaces)
    - [Minigame](#minigame)
      - [Minigame fields](#minigame-fields)
      - [Minigame methods](#minigame-methods)

## Actions

- Opt.begin / Opt. end - Оптимизировать: начало/конец. Ставится там, где нужна оптимизация кода.

## Variables

### trigger

- [DDS](libraries/UnitRecycler.j)
  - Damage Detection System trigger
  - Use DisableTrigger(DDS) or EnableTrigger(DDS) to switch trigger's state
  - Use `function AddDamageCondition takes boolexpr b returns nothing` to add actions to DDS

### real

- [settingsTimerTime](main/Settings.j)
  - Время, которое даётся на ввод команд настроек хостом в начале игры.
  - DEBUG: constant real debugSettingsTimerTime
- private [arenaTimerTime](waves/Arena.j)
  - Длительность Arena wave
  - DEBUG: private constant real debugArenaTimerTime
- private [fastArenaTimerTime](waves/FastArena.j)
  - Длительность FastArena wave
  - DEBUG: private constant real debugFastArenaTimerTime
- [minigame](waves/Minigames/MinigameInterface.j).timerTime
  - Длительность Minigame wave
  - DEBUG: private constant real debugMinigameTimerTime
- private constant [firePitPercentDamage](waves/FastArena.j)
  - Урон костра в процентах в быстрой битве

### integer

- array [time](libraries/NokladrLib.j)[3]
  - time[0]
    - Секунды
  - time[1]
    - Минуты
  - time[2]
    - Часы
- [finalWave](main/Settings.j)
  - Номер волны, после которой завершается игра
- constant [baseGold](main/Settings.j)
  - Количество золота в начале игры
- constant [baseGems](main/Settings.j)
  - Количество самоцветов в начале игры
- constant [debugGold](build/builder_select.j)
  - DEBUG: Количество золота после выбора расы
- constant [debugGems](build/builder_select.j)
  - DEBUG: Количество самоцветов после выбора расы
- [IncomeObjects_StartAmount](map/IncomeObjects/IncomeObjects.j)
  - Min amount of Income Objects per wave
- [IncomeObjects_EndAmount](map/IncomeObjects/IncomeObjects.j)
  - Max amount of Income Objects per wave
- [IncomeObjects_MaxAmount](map/IncomeObjects/IncomeObjects.j)
  - The upper limit of Income Objects per wave
- [curWave](waves/Waves.j)
  - Номер текущей волны

### group

- [IncomeObjects_group](map/IncomeObjects/IncomeObjects.j)
  - Group of Income Objects like:
    - bigMineRC
    - smallMineRC
    - flagRC
- [castles](map/Units/Castles.j)
  - Group of players' castles:
    - castleRC
- [waveUnits](map/Units/Units.j)
  - Group of all units in Arena waves
- [minigameUnits](waves/MinigameWaves.j)
  - Group of all units in Minigame waves
- [buildings](build/Build.j)
  - Group of all unit buildings which will be transformed and sent to Arena wave

### force

- [players](players/Players.j)
  - Force of all playing players

## Units

- 'eRez' - Dummy unit

## Structs

### [UnitDB](build/UnitDB.j)

- UnitDB udb

#### UnitDB methods

- method operator [] takes unit u returns UnitStruct

### [UnitStruct](build/UnitDB.j)

#### UnitStruct methods

- static method create takes integer unitTypeId, integer parentUnitTypeId returns UnitStruct
- method GetGold takes nothing returns integer
- method GetGems takes nothing returns integer
- method GetGoldRaw takes nothing returns real
- method GetGemsRaw takes nothing returns real

___

### [MIXMB](multiboard/Multiboard.j)

- MIXMB mb

#### MIXMB methods

- method operator [] takes player p returns MIXMBRow

### [MIXMBRow](multiboard/Multiboard.j)

#### MIXMBRow methods

- method operator icon= takes string icon returns nothing
- method operator name= takes string name returns nothing
- method operator kills= takes integer kills returns nothing
- method operator upgrades= takes integer upgrades returns nothing
- method operator castlesDestroyed= takes integer castlesDestroyed returns nothing
- method operator points= takes string points returns nothing
- method operator result= takes real result returns nothing

___

### [Playerdb](players/PlayerDB.j)

- Playerdb pdb

#### Playerdb methods

- method operator [] takes player p returns PlayerStruct

### [PlayerStruct](players/PlayerDB.j)

#### PlayerStruct fields

- private player p
- real leaderCoeff
- integer leaderWins
- integer arenaWins
- integer changeSet
- integer incomeGold
- integer incomeGems
- integer incomeBigMineGold
- integer incomeBigMinePoints
- integer incomeSmallMineGold
- integer incomeSmallMinePoints
- integer incomeFlagGold
- integer incomeFlagPoints
- real incomePoints
- boolean info
- integer kills
- integer upgrades
- integer castlesDestroyed
- real points

#### PlayerStruct methods

- method operator result takes nothing returns real

## Interfaces

### [Minigame](waves/Minigames/MinigameInterface.j)

#### Minigame fields

- string title
- string description
- real timerTime
- real x
- real y

#### Minigame methods

- method Fire takes nothing returns nothing
- method Finish takes nothing returns nothing
