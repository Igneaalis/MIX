# Порядок запуска триггеров

initialization -> wait 0.10 sec -> initialization_in_game -> faq_ini -> wait 0.10 sec -> faq_stop -> faq_active 6.00 sec ->

```python
if (!faq_status):
    run faq_start
    Hide faq_dialog
else:
    stop faq_active
```

-> faq_start -> (faq if faq_status == True else Nothing) -> 

## faq_start

```python
Turn on gameset_end
Start gameset_timer. Expires in gameset_time_first
if (gameset_time_first < 61):
    run gameset_owner
wait 53 sec
run scoreboard_ini
if (gameset_timer_first > 30):
    run gameset_owner
wait 10 sec
# Multiboard.
```

## faq_active

```python
if (faq_dialog.IsClicked):
    if (faq_key[0].IsClicked and faq_vote >= (players / 2)):
        set faq_status = True
        run faq_start
        run faq
        stop faq_active (this)
    elif (cycle_i >= (players / 2)):
        set faq_status = True
        run faq_start
        stop faq_active (this)
```

## faq

```python
# Гайд по игре.
wait 6 + 7 + 0.8 sec
Turn on faq_death
wait 11 + 8 + 5 + 6 + 8 sec
```

## gameset_end

Trigger on gameset_timer expires.
Turn on inc_colour
Turn off cmd_time
Turn off cmd_build
Turn off cmd_mode
Turn off cmd_point
Turn off cmd_arena
run set_wave_start_main
run set_wave_timer
run set_wave_region_rotate
run set_wave_unit_spawn

## inc_colour

Trigger on A unit dies.

## set_wave_start_main

Trigger on wave_timer expires.
Turn on building_inf
Turn on wave_castle_destr

```python
if (!boss_wave):
    wait 1.00 sec
    Turn on wave_end
```

## building_inf

Trigger on Every 1.00 sec of game time.

```python
if (wave_status):
    EveryBuilding.Invulnerable = True
```

## wave_castle_destr

```python
# При разрушении замка.
Trigger on A unit dies.
```

## wave_end

```python
Trigger on Every 0.50 sec of game time.
if (wave_units == 0):
    if (wave mod 3 == 0):
        run inc_upg
    if (wave == wave_mini[0]):
        Turn off hunter_time
        Turn on hunter_end
    set wave_status = False # Что такое wave status?
    Turn off inc_per_second
    Turn off wave_end_attack
    Turn off wave_castle_destr
    Turn off building_inf
    Turn off wave_end (this)
    set wave_winner = False
    set fastarena_time = 0
    run income_effects
    run wave_waiting_timer
    wait 0.10 sec
    run Whether (checking conditions)
    if (wave != wave_mini[0..13]):
        run wave_result_rotation
```

## inc_upg

set inc_pp[0] += 2
set inc_pp[1] += 1

## hunter_time

```python
# Миниигра с монетками.
Trigger on Every 1.30 sec of game time.
```

## hunter_end

```python
# Миниигра с монетками. Удаляем монетки с карты.
Trigger on Every 0.04 sec of game time.
```

## inc_per_second

```python
# Инком за шахты/флаги.
Trigger on Every 1.00 sec of game time.
```

## wave_end_attack

```python
# 12 игрок (коричневый) атакует рандомных юнитов из wave_units.
Trigger on Every 5.00 sec of game time.
```

## income_effects

```python
# Логика инкома при ticket и pillage.
set ticket_resources = 0
for i from 1 to 8:
    set ticket_resources += Player(i).gold + (Player(i).lumber * 10)
for i from 1 to 5:
    set ticket_gold = (ticket_resources * 0.9) * (0.06 - (0.01 * i))
    set ticket_lumber = (ticket_resources * 0.01) * (0.06 - (0.01 * i))
    set Player(i).gold += ticket_gold
    set Player(i).lumber += ticket_lumber

for player in Players:
    for i from 1 to 20:
        if (wave == (i * 3) and player.Research.(Драгоценные камни).level > 0):
            set player.lumber += 3 * player.Research.(Драгоценные камни).level

for i from 1 to 8:
    if (Player(i).Research(Грабёж).level > 0 and Player(i).IsPlaying):
        set pillage_player = Player(i)
        set pillage_resources = 0
        for j from 1 to 10:
            if (pillage_player == Player(i)):
                set pillage_player = Players.getRandomPlayer
        set pillage_resources += pillage_player.gold + (pillage_player.lumber * 10)
        set pillage_gold = (pillage_resources * 0.9) * (0.04 + (0.01 * Player(i).Research(Грабёж).level))
        set pillage_lumber = (pillage_resources * 0.01) * (0.04 + (0.01 * Player(i).Research(Грабёж).level))
        set pillage_player.gold -= pillage_gold
        set pillage_player.lumber -= pillage_lumber
        if (Player(i).Research(Грабёж).level == 5):
            set pillage_lumber += 1
        elif (Player(i).Research(Грабёж).level == 6):
            set pillage_lumber += 2
        set Player(i).gold += pillage_gold
        set Player(i).lumber += pillage_lumber
```

## gameset_owner

## scoreboard_ini

```python
# Мультиборд
set scoreboard = Last Created Multiboard
```
