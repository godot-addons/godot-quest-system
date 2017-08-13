extends Reference

var type = Type.UNKNOWN setget set_type
var goal_int
var goal_float
var goal_vector

func _init(type = Type.UNKNOWN, goal_int = 0, goal_float = 0.0, goal_vector = null):
	self.type = set_type(type)
	self.goal_int = goal_int
	self.goal_float = goal_float
	self.goal_vector = goal_vector

func set_type(value):
	# Support passing a Type enum
	if typeof(value) != TYPE_STRING:
		type = value
		return

	# Support passing a string, parse into a Type enum
	if typeof(value) == TYPE_STRING:
		value = value.to_lower()

		if value.match("unknown"):
			type = Type.UNKNOWN
		elif value.match("items_held"):
			type = Type.ITEMS_HELD
		elif value.match("gold"):
			type = Type.GOLD
		elif value.match("enemies_killed"):
			type = Type.ENEMIES_KILLED
		elif value.match("destination_reached"):
			type = Type.DESTINATION_REACHED
		elif value.match("trigger_enabled"):
			type = Type.TRIGGER_ENABLED
		else:
			print("Invalid goal type: ", value)

enum Type {
	UNKNOWN
	ITEMS_HELD
	GOLD
	ENEMIES_KILLED
	DESTINATION_REACHED
	TRIGGER_ENABLED
}
