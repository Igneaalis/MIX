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
        stop faq_active
    elif (cycle_i >= (players / 2)):
        set faq_status = True
        run faq_start
        stop faq_active
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

Trigger on Every 0.50 sec of game time.
// TODO

## gameset_owner

## scoreboard_ini

```python
# Мультиборд
set scoreboard = Last Created Multiboard
```
