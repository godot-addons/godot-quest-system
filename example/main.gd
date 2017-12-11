extends Node

const Quest = preload("res://addons/godot-quest-system/domain/quest.gd")
const QuestRepo = preload("res://addons/godot-quest-system/memory/quest_repository.gd")
const QuestFactory = preload("res://addons/godot-quest-system/memory/quest_factory.gd")

var quest_repo

func _ready():
	quest_repo = QuestRepo.new(QuestFactory.create_from_static())
	var quests = quest_repo.find_all()

	for i in quests:
		i.connect("started", self, "_on_quest_started")
		i.start()

	var quest = quest_repo.find_by_id(1)
	quest.status = "finished"
	print(quest.to_string())
	print("quest.to_string()=", quest.to_string())

	quests[2].status = "started"

	for i in quests:
		print(i.to_string())
		$ui/quests.add_item(i.name)

func _on_quest_started(e):
	print("_on_quest_started: ", e.name)

func _on_quests_item_selected( index ):
	var quests = quest_repo.find_all()
	$ui/quest_info.text = str("Quest: ", quests[index].description)
