# JASS

## Actions

* Opt.begin / Opt. end - Оптимизировать: начало/конец. Ставится там, где нужна оптимизация кода.

## Variables

* gg : integer - волна, после которой закончится волна
* changeset : integer - сколько рабочих
* gameset - время для ввода команд
* gameset_time_first : real - когда должна начаться первая волна после faq_start
* game_owner : player - хост
* boss_wave : boolean - след. волна boss?
* wave_units : group - всего юнитов на арене
* wave_mini[] : integer - волна, на которой будет миниигра
* wave - номер текущей волны
* wave_time - длительность волны
* leader_num - кол-во текущих лидеров
* leader_player[] - первый и второй лидер
* scoreboard - мультиборд со статистикой

## Units

* 'eRez' - Dummy unit

## Triggers

* [Информация по триггерам](Triggers.md)
