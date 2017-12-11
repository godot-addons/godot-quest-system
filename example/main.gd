extends Node

const Quest = preload("res://addons/godot-quest-system/domain/quest.gd")
const QuestRepo = preload("res://addons/godot-quest-system/memory/quest_repository.gd")
const QuestFactory = preload("res://addons/godot-quest-system/memory/quest_factory.gd")

func _ready():
	var questRepo = QuestRepo.new(QuestFactory.create_from_static())
	var quests = questRepo.find_all()

	for i in quests:
		i.connect("started", self, "_on_quest_started")
		i.start()

	var quest = questRepo.find_by_id(1)
	quest.status = "finished"
	print(quest.to_string())
	print("quest.to_string()=", quest.to_string())

	quests[2].status = "started"

	for i in quests:
		print(i.to_string())

func _on_quest_started(e):
	print("_on_quest_started: ", e.name)
