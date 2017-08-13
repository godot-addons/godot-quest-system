extends Reference

class RequirementProcessor:
	var character_repo
	var trigger_repo
	var faction_repo

	func requirements_are_met(quest):
		for r in quest.requirements:
			if !r.is_met():
				return false
		return true

class Goal:
	var type
	var goal_int
	var goal_float
	var goal_vector

	func _init(type = GoalType.UNKNOWN, goal_int = 0, goal_float = 0.0, goal_vector = null):
		self.type = type
		self.goal_int = goal_int
		self.goal_float = goal_float
		self.goal_vector = goal_vector

enum GoalType {
	UNKNOWN
	ITEMS_HELD
	GOLD
	ENEMIES_KILLED
	DESTINATION_REACHED
	TRIGGER_ENABLED
}

class Quest:
	var id
	var name
	var description
	var status = QuestStatus.UNKNOWN setget set_status
	var rewards = []
	var requirements = []
	var goals = []

	signal on_started
	signal on_progress
	signal on_goals_complete
	signal on_finished

	func _init(id = 0, name = "", description = "", status = QuestStatus.UNKNOWN):
		self.id = id
		self.name = name
		self.description = description

	func start():
		emit_signal("on_started", self)

	func set_status(status):
#		for name in QuestStatus:
#			if status == v:
#				self.status = status
#				return

		print("invalid status")

const QuestStatus = {
	1: "UNKNOWN",
	2: "STARTED",
	3: "FINISHED",
	4: "FAILED"
}

class Requirement:
	var type
	var required_number
	var required_string

	func _init(type = RequirementType.UNKNOWN, required_number = 0, required_string = ""):
		self.type = type
		self.required_number = required_number
		self.required_string = required_string

enum RequirementType {
	UNKNOWN
	LEVEL
	CLASS
	RACE
	FACTION_SCORE
	TRIGGER_ACTIVE
	TRIGGER_DEACTIVE
	ITEM_HELD
}

class Reward:
	var type
	var reward_float
	var reward_int

	func _init(type = RewardType.UNKNOWN, reward_float = 0.0, reward_int = 0):
		self.type = type
		self.reward_float = reward_float
		self.reward_int = reward_int

enum RewardType {
	UNKNOWN
	EXPERIENCE
	ITEM
	TRIGGER_ACTIVATED
	TRIGGER_DEACTIVATED
	FACTION_SCORE
	GOLD
}
