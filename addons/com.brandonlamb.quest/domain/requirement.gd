extends Reference

"""
Requirement
"""
var type = Type.UNKNOWN setget set_type
var required_number
var required_string

func _init(type = Type.UNKNOWN, required_number = 0, required_string = ""):
	set_type(type)
	self.required_number = required_number
	self.required_string = required_string

func _get_type():
	if type == Type.UNKNOWN:
		return "unknown"
	elif type == Type.LEVEL:
		return "level"
	elif type == Type.CLASS:
		return "class"
	elif type == Type.RACE:
		return "race"
	elif type == Type.FACTION_SCORE:
		return "faction_score"
	elif type == Type.TRIGGER_ACTIVE:
		return "trigger_active"
	elif type == Type.TRIGGER_DEACTIVE:
		return "trigger_deactive"
	elif type == Type.ITEM_HELD:
		return "item_held"

func to_string():
	return str(
		"type=", _get_type(),
		", required_number=", required_number,
		", required_string=", required_string
	)

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
		elif value.match("level"):
			type = Type.LEVEL
		elif value.match("class"):
			type = Type.CLASS
		elif value.match("race"):
			type = Type.RACE
		elif value.match("faction_score"):
			type = Type.FACTION_SCORE
		elif value.match("trigger_active"):
			type = Type.TRIGGER_ACTIVE
		elif value.match("trigger_deactive"):
			type = Type.TRIGGER_DEACTIVE
		elif value.match("item_held"):
			type = Type.ITEM_HELD
		else:
			print("Invalid goal type: ", value)

enum Type {
	UNKNOWN
	LEVEL
	CLASS
	RACE
	FACTION_SCORE
	TRIGGER_ACTIVE
	TRIGGER_DEACTIVE
	ITEM_HELD
}
