extends Node2D

const Quest = preload("res://addons/com.brandonlamb.quest/domain/quest.gd")
const QuestStatus = Quest.Status
const QuestRepo = preload("res://addons/com.brandonlamb.quest/memory/quest_repository.gd")
const QuestFactory = preload("res://addons/com.brandonlamb.quest/memory/quest_factory.gd")

func _ready():
	var questRepo = QuestRepo.new(QuestFactory.create_from_static())

	for i in questRepo.find_all():
		i.connect("started", self, "_on_quest_started")
		i.start()
		_debug_quest(i)

	var quest = questRepo.find_by_id(1)
	quest.status = QuestStatus.FINISHED
	_debug_quest(quest)
	print("quest.to_string()=", quest.to_string())

func _on_quest_started(e):
	print("_on_quest_started: ", e.name)

func _debug_quest(q):
	print(q.to_string())
