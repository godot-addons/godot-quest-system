extends Reference

const Quest = preload("res://addons/com.brandonlamb.quest/domain/quest.gd")

const _quests = []
const _questsMap = {}

func _init(quests):
	if typeof(quests) == TYPE_ARRAY:
		_load_from_array(quests)

func _load_from_array(quests):
	for i in quests:
		_quests.append(i)
		_questsMap[i.id] = i

func find_by_id(id):
	if _questsMap.has(id):
		return _questsMap[id]
	return Quest.new()

func find_all():
	return _quests

func save(quest):
	pass
