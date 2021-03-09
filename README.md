# MIX Warcraft 3 custom map

- [MIX Warcraft 3 custom map](#mix-warcraft-3-custom-map)
  - [Скачать](#скачать)
  - [Discord](#discord)
  - [Техническое задание](#техническое-задание)
    - [Тестеры](#тестеры)
    - [Картостроители](#картостроители)
    - [Балансеры](#балансеры)
      - [Что известно на данный момент](#что-известно-на-данный-момент)
        - [T1](#t1)
        - [T2](#t2)
    - [Геймдизайнеры](#геймдизайнеры)
    - [Кодеры](#кодеры)
      - [VS Code Extensions](#vs-code-extensions)
    - [Ревьюеры](#ревьюеры)
    - [Менторы](#менторы)

## Скачать

- [Скачать последнюю версию](https://github.com/Igneaalis/MIX/releases/latest)

## Discord

- [Приглашение в группу](https://discord.gg/kazvQVA2QN)

## Техническое задание

### Тестеры

- Посмотреть все видеоролики с канала 2kxaoc, посвящённые карте MIX. [**Ссылка на плейлист**](https://www.youtube.com/watch?v=odWMlFTXvPk&list=PLZT7fvvYlYfjlr2k8skAQxEA8ejtyYrh2&index=1).
- Поиграть во все мини-игры, протестить их, выделить наиболее интересные. Подготовить перечень и отправить их @Геймдизайнер
- Предложить новые **интересные** мини-игры с [**других карт**](https://drive.google.com/file/d/1oph-NyNd6Q-l006uiZpfg78kNwrWOVkk/view?usp=sharing). Подготовить описание по этим мини-играм и отправить их @Геймдизайнер.

### Картостроители

- Переработать ландшафт, сделать его более привлекательным под графику Reforged. Нужно убрать некрасивый обрыв в пучину океана за краями главной арены (можно добавить скалы, например).
- Не размещайте больше 5000 декораций на карте. От этого страдают старые ПК.
- Новую карту присылайте к @Ревьюер

### Балансеры

- Посмотреть все видеоролики с канала 2kxaoc, посвящённые карте MIX. [**Ссылка на плейлист**](https://www.youtube.com/watch?v=odWMlFTXvPk&list=PLZT7fvvYlYfjlr2k8skAQxEA8ejtyYrh2&index=1).
- Разобраться с валеркиной таблицей баланса. [**Таблица**](https://docs.google.com/spreadsheets/d/1JESRxvUaSlJmI5ktHuPT1H7ypWPLSlumywJk4_6lZGw/edit?usp=sharing).
- Подготовить перечень изменений для юнитов и отправить его @Геймдизайнер.

#### Что известно на данный момент

##### T1

- Ослабить воздух, особенно вертолёты
- Добавить пункт Air в таблице баланса
- Усилить high-tier юнитов
- Не хватает способов получения гемов

##### T2

- Можно попробовать добавить героев
- Перебалансировка спеллов
- Добавить больше пассивок/автокастов

### Геймдизайнеры

- Посмотреть все видеоролики с канала 2kxaoc, посвящённые карте MIX. [**Ссылка на плейлист**](https://www.youtube.com/watch?v=odWMlFTXvPk&list=PLZT7fvvYlYfjlr2k8skAQxEA8ejtyYrh2&index=1). И подготовить перечень моментов, на которые жалуются игроки.
- Выделить слабые места и скучные моменты в карте.
- Проработать новые методы получения гемов.
- Продумать новые автокасты юнитам.
- Продумать введение героев.
- Все идеи отправляйте оформленным списком/документом к @Ревьюер

### Кодеры

- Warcraft 3 Reforged: 1.32.9 (latest release)
- IDE: Visual Studio Code 1.53.2 (latest release)

- Нужно реализовать миниигры. Внимательно ознакомьтесь с существующими структурами: [README](source/README.md).
- Чтобы скомпилировать проект и запустить карту (или редактор карт), используйте [VS Code](.vscode/launch.json), **не забудьте** настроить [конфиг](\config.ini)!

#### VS Code Extensions

Я использую следующие расширения (`Ctrl+Shift+X`) для VS Code:

- **superjass**
- **PowerShell**
- **GitHub**
- **GitHub Pull Requests and Issues**
- Explorer Exclude
- Intellij IDEA Keybindings
- Markdown All in One
- markdownlint

### Ревьюеры

- Нужно принимать такие решения, которые по нраву большинству игроков, но предпочтение отдаём мнению Вадима.
- Рассматривать все входящие редакции от других тематических групп.
- По каждой идеи написать своего рода эссе (почему да, а почему нет)
- Вынести вердикт

### Менторы

- Быть вежливым, понимающим и политкорректным.
- Объяснить новым участникам проекта о задачах каждой роли.
- Найти каждому задачу для улучшения карты.
- Объяснить, как работает дискорд-группа, куда идти и с кем о чём говорить.
