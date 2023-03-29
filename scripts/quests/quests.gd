class_name quests extends Node

signal quests_started
signal quests_ended
signal quest_executed(quest)

export var _debug_id = "debug_id"
export (Resource) var _base_quest

# Возвращает базовую цепочку квестов
func get_base_quest() -> quest_queue:
	return _base_quest as quest_queue

# Функция вызывается при начале выполнения квестов
func on_start_quests():
	_print_debug("Start Quests")
	emit_signal("quests_started")
	
# Функция вызывается как только закончится выполнение квестов
func on_end_quests():
	_print_debug("End Quests")
	emit_signal("quests_ended")

# Функция вызывается при смене текущего квеста
func on_quest_executed(quest: quest):
	_print_debug("Execute Quest: %s" % quest.get_id())
	emit_signal("quest_executed", quest)

# Функция вызывается при обновлении квестов
func update():
	var base_quest = get_base_quest()
	if base_quest:
		base_quest.update_quests()
		
		var status = base_quest.get_update_status()
		match status:
			quest_queue.quests_update_status.NONE:
				pass
			quest_queue.quests_update_status.STARTED:
				on_start_quests()
			quest_queue.quests_update_status.ENDED:
				on_end_quests()
			quest_queue.quests_update_status.EXECUTED:
				on_quest_executed(base_quest.get_current_quest())

func _print_debug(message: String):
	print_debug("[%s] %s." % [ _debug_id, message ])

func _process(delta):
	update()
