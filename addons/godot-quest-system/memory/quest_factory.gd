extends Reference

const Quest = preload("res://addons/godot-quest-system/domain/quest.gd")
const QuestStatus = Quest.Status

static func create_from_array(quests):
	# Take in array of data and convert into array of Quest
	pass

static func create_from_file(file):
	# Read file and parse as json, convert into array of Quest
	pass

static func create_from_static():
	var data = [
		[1, "Quest 1", "Description for quest 1", QuestStatus.STARTED],
		[2, "Quest 2", "Description for quest 2", QuestStatus.STARTED],
		[3, "Quest 3", "Description for quest 3", QuestStatus.STARTED],
		[4, "Quest 4", "Description for quest 4", QuestStatus.STARTED]
	]

	var quests = []

	for q in data:
		quests.append(Quest.new(q[0], q[1], q[2]))

	return quests
