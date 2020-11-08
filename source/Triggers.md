# 1. Triggers

- [1. Triggers](#1-triggers)
  - [1.1. Порядок запуска триггеров](#11-порядок-запуска-триггеров)
    - [1.1.1. faq_start](#111-faq_start)
    - [1.1.2. faq_active](#112-faq_active)
    - [1.1.3. faq](#113-faq)
    - [1.1.4. gameset_end](#114-gameset_end)
    - [1.1.5. inc_colour](#115-inc_colour)
    - [1.1.6. set_wave_start_main](#116-set_wave_start_main)
    - [1.1.7. building_inf](#117-building_inf)
    - [1.1.8. wave_castle_destr](#118-wave_castle_destr)
    - [1.1.9. wave_end](#119-wave_end)
    - [1.1.10. inc_upg](#1110-inc_upg)
    - [1.1.11. hunter_time](#1111-hunter_time)
    - [1.1.12. hunter_end](#1112-hunter_end)
    - [1.1.13. inc_per_second](#1113-inc_per_second)
    - [1.1.14. wave_end_attack](#1114-wave_end_attack)
    - [1.1.15. income_effects](#1115-income_effects)
    - [1.1.16. wave_waiting_timer](#1116-wave_waiting_timer)
    - [1.1.17. wave_notification](#1117-wave_notification)
    - [1.1.18. game_end](#1118-game_end)
    - [1.1.19. Weather](#1119-weather)
    - [1.1.20. wave_result_rotation](#1120-wave_result_rotation)
    - [1.1.21. set_wave_timer](#1121-set_wave_timer)
    - [1.1.22. set_wave_region_rotate](#1122-set_wave_region_rotate)
    - [1.1.23. set_wave_unit_spawn](#1123-set_wave_unit_spawn)
    - [1.1.24. gameset_owner](#1124-gameset_owner)
    - [1.1.25. scoreboard_ini](#1125-scoreboard_ini)

## 1.1. Порядок запуска триггеров

initialization -> wait 0.10 sec -> initialization_in_game -> faq_ini -> wait 0.10 sec -> faq_stop -> faq_active 6.00 sec ->

```python
if (!faq_status):
    run faq_start
    Hide faq_dialog
else:
    stop faq_active
```

-> faq_start -> (faq if faq_status == True else Nothing) -> gameset_owner -> wait 53.00 sec -> scoreboard_ini -> wait 7.00 sec -> gameset_end -> set_wave_start_main -> set_wave_timer -> set_wave_region_rotate -> set_wave_unit_spawn

### 1.1.1. faq_start

```python
Turn on gameset_end
Start gameset_timer. Expires in gameset_time_first
if (gameset_time_first < 61):
    run gameset_owner
wait 53 sec
run scoreboard_ini
if (gameset_time_first > 30):
    run gameset_owner
wait 10 sec
# Multiboard.
```

### 1.1.2. faq_active

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

### 1.1.3. faq

```python
# Гайд по игре.
wait 6 + 7 + 0.8 sec
Turn on faq_death
wait 11 + 8 + 5 + 6 + 8 sec
```

### 1.1.4. gameset_end

```python
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
```

### 1.1.5. inc_colour

```python
# Когда ломают шахту/флаг
Trigger on A unit dies.
```

### 1.1.6. set_wave_start_main

```python
Trigger on wave_timer expires.
Turn on building_inf
Turn on wave_castle_destr

if (!boss_wave):
    wait 1.00 sec
    Turn on wave_end
```

### 1.1.7. building_inf

```python
Trigger on Every 1.00 sec of game time.
if (wave_status):
    EveryBuilding.Invulnerable = True
```

### 1.1.8. wave_castle_destr

```python
# При разрушении замка.
Trigger on A unit dies.
```

### 1.1.9. wave_end

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
    run Weather (checking conditions)
    if (wave != wave_mini[0..13]):
        run wave_result_rotation
```

### 1.1.10. inc_upg

```python
set inc_pp[0] += 2
set inc_pp[1] += 1
```

### 1.1.11. hunter_time

```python
# Миниигра с монетками.
Trigger on Every 1.30 sec of game time.
```

### 1.1.12. hunter_end

```python
# Миниигра с монетками. Удаляем монетки с карты. Требует оптимизацию.
Trigger on Every 0.04 sec of game time.
```

### 1.1.13. inc_per_second

```python
# Инком за шахты/флаги.
Trigger on Every 1.00 sec of game time.
```

### 1.1.14. wave_end_attack

```python
# 12 игрок (коричневый) атакует рандомных юнитов из wave_units.
Trigger on Every 5.00 sec of game time.
```

### 1.1.15. income_effects

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

### 1.1.16. wave_waiting_timer

```python
set wave_winner = False
if (wave < gg):
    run wave_notification
    Start wave_timer. Expires in gameset_time.
else:
    wait 0.10 sec
    run game_end
```

### 1.1.17. wave_notification

```python
# Показывает инфу о следующей волне
wait 5.00 sec
```

### 1.1.18. game_end

```python
# Конец игры

# Выключить улучшение "Стабильность"
Turn off income_upgFa
Turn off income_upgFb
Turn off income_upgFe
```

### 1.1.19. Weather

```python
# Очищает все погодные условия.
Turn off Storm_effect
Turn off Armageddon_effect
Turn off Armageddon_effect_2
for player in Players:
    set weather[player.id] = 0
```

### 1.1.20. wave_result_rotation

```python
# Логика лидерства.
set rotation_value = 0
set leader_bool = False
set leader_num = 0
set leader_player[0] = Player.Neutral
set leader_player[1] = Player.Neutral
# TODO: проделать до конца.
```

### 1.1.21. set_wave_timer

```python
# Логика таймеров. wave_end_timer и wave_time
Trigger on wave_timer expires.
wait 0.10 sec
# timers
set wave += 1
set Player.Neutral.Research.(Укрепление).level = wave / 2
set wave_time += 2
if (leader_num == 2):
    # показывает лидеров в мультиборде
```

### 1.1.22. set_wave_region_rotate

```python
# Рандомное место спавна
Trigger on wave_timer expires.
wait 0.20 sec
for i from 1 to 8:
    set region_status[i] = False
    set region_player_status[i] = False
    set income_limit[i] = 0

for i from 1 to 8:
    if (Player(i) in players_group):
        for j from 1 to 100:
            if (!region_player_status[i]):
                set random = Random(1..8)
                if (!region_status[random]):
                    set region_status[random] = True
                    set region_player_status[i] = True
                    if (random == 1):
                        set region_spawn[i] = start1
                    if (random == 2):
                        set region_spawn[i] = start2
                    # And so on...
                    if (random == 8):
                        set region_spawn[i] = start8
```

### 1.1.23. set_wave_unit_spawn

```python
# Спавнит построенных юнитов, устанавливает погоду, начинает миниигры, расставляет Свечение.
Trigger on wave_timer expires.
wait 0.30 sec
```

### 1.1.24. gameset_owner

```python
# Выставляем game_owner
# game_owner : player
if ((time[2] * 60 + time[1]) < gameset_time_first and info[game_owner.id] == True):
    # Показываем команды
```

### 1.1.25. scoreboard_ini

```python
# Мультиборд
set scoreboard = Last Created Multiboard
```
