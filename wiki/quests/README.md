# quests

## Описание
**Квесты** - последовательная цепочка действий, которые нужно выполнить игроку для прохождения уровня. Представляет из себя множество ресурсных файлов
и имеют связь с сценой, например как пересечение игрока с area. Есть возможность добавлять не линейный сюжет, но преимущественно один и одновременное
выполнение нескольких квестов не предусматривалась. Технически квесты из себя представляют граф квестов, переход между которыми контролируют кондишены, разбитые
на множество ресурсных классов, связанные с сценой.

## Класс quests
Класс на текущий момент в разработке, хранит ссылку на `quest_queue` ресурс и его запускает.
### Поля
- `_base_quest` - ссылка на `quest_queue` ресурс
### Методы
- `get_base_quest() -> quest_queue` - возвращает `_base_quest`.
- `update()` - обновляет `_base_quest`.
### Сигналы
В разработке...

## Класс quest
Класс, родителем которого является `Resource`. По условию кондишена может перейти в следующий квест, также может выполнить более системный функционал, 
например как `quest_queue`.
### Поля
- `_id` - идентификатор квеста. Представляет из себя **уникальное** имя квеста, при улучшении `quests` важно понимать, что по имени будут хранится выполненные квесты и с помощью него возможно взаимодействие с другими системами.
- `_condition` - кондишен. Если он выполнится, то будет переход к следующему квесту.
### Методы
