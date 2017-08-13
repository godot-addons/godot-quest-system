extends Node2D

const QuestSystem = preload("res://addons/com.brandonlamb.quest/domain/quest_system.gd")
const Quest = QuestSystem.Quest
const QuestStatus = Quest.Status

func _ready():
	var quest = Quest.new(1, "Find the thing", "Help NPC find the thing they want")
	print("quest created")

	quest.connect("on_started", self, "_on_quest_started")
	quest.start()
	quest.set_status(QuestStatus.STARTED)
	quest.set_status(QuestStatus.XYZ)

func _on_quest_started(e):
	print("_on_quest_started: ", e.name)
