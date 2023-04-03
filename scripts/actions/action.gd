class_name action extends Resource

# Идентификатор
export var _id = "id"

# Кондишен на начало выполнения действия.
export (Resource) var _is_started_condition

# Кондишен на скип действия.
export (Resource) var _is_skipped_condition

# Кондишен на окончание выполнения действия.
export (Resource) var _is_executed_condition

# Производить ли мгновенный запуск экшена?
export var _is_force_execute = false

# Возвращает идентификатор.
func get_id() -> String:
	return _id

# Возвращает кондишен на начало выполнения действия.
func get_is_started_condition() -> condition:
	if _is_started_condition:
		return _is_started_condition as condition
	return null
	
# Возвращает кондишен на скип действия.
func get_is_skipped_condition() -> condition:
	if _is_skipped_condition:
		return _is_skipped_condition as condition
	return null
	
# Возвращает кондишен на окончание выполнения действия.
func get_is_executed_condition() -> condition:
	if _is_executed_condition:
		return _is_executed_condition as condition
	return null

# Начать ли выполнение действия.
func is_started():
	var cond = get_is_started_condition()
	if cond:
		return cond.is_success()
	return true
	
# Скипнуть ли выполнение действия.
func is_skipped():
	var cond = get_is_skipped_condition()
	if cond:
		return cond.is_success()
	return false

# Выполнение действия.
func execute():
	pass
	
# Было ли совершено действие.
func is_executed() -> bool:
	var cond = get_is_executed_condition()
	if cond:
		return cond.is_success()
	return true

# Обновление экшена.
func update():
	if _is_force_execute:
		execute()

# Производить ли мгновенный запуск экшена?
func is_force_execute() -> bool:
	return _is_force_execute
