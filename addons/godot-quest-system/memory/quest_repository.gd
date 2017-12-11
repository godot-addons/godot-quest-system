extends "res://addons/godot-quest-system/domain/quest_repository.gd"

const Quest = preload("res://addons/godot-quest-system/domain/quest.gd")

const _quests = []
const _questsMap = {}

"""
Constructor - accepts an array of quests to initialize the repository with
@param Quest[] quests
"""
func _init(quests):
	if typeof(quests) == TYPE_ARRAY:
		_load_from_array(quests)

"""
Load quests from array of quests
@param Quest[] quests
"""
func _load_from_array(quests):
	for i in quests:
		_quests.append(i)
		_questsMap[i.id] = i

"""
@override
"""
func find_by_id(id):
	if _questsMap.has(id):
		return _questsMap[id]
	return Quest.new()

"""
@override
"""
func find_all():
	return _quests

"""
@override
"""
func clear():
	_quests = []
	_questsMap = {}

"""
@override
"""
func save(quest):
	pass

"""
@override
"""
func delete(quest):
	for i in range(0, _quests.size()):
		if _quests[i].id == quest.id:
			_quests.remove(i)

	if _questsMap.has(quest.id):
		_questsMap.erase(quest.id)

"""
@override
"""
func delete_by_id(id):
	for i in range(0, _quests.size()):
		if _quests[i].id == id:
			_quests.remove(i)

	if _questsMap.has(id):
		_questsMap.erase(id)
