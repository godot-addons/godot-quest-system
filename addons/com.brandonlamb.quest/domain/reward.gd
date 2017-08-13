extends Reference

var type = Type.UNKNOWN setget set_type
var reward_float
var reward_int

func _init(type = Type.UNKNOWN, reward_float = 0.0, reward_int = 0):
	set_type(type)
	self.reward_float = reward_float
	self.reward_int = reward_int

func _get_type():
	if type == Type.UNKNOWN:
		return "unknown"
	elif type == Type.EXPERIENCE:
		return "experience"
	elif type == Type.ITEM:
		return "item"
	elif type == Type.TRIGGER_ACTIVE:
		return "trigger_active"
	elif type == Type.TRIGGER_DEACTIVE:
		return "trigger_deactive"
	elif type == Type.FACTION_SCORE:
		return "faction_score"
	elif type == Type.GOLD:
		return "gold"

func to_string():
	return str(
		"type=", _get_type(),
		", reward_float=", reward_float,
		", reward_int=", reward_int
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
		elif value.match("experience"):
			type = Type.EXPERIENCE
		elif value.match("item"):
			type = Type.ITEM
		elif value.match("trigger_active"):
			type = Type.TRIGGER_ACTIVE
		elif value.match("trigger_deactive"):
			type = Type.TRIGGER_DEACTIVE
		elif value.match("faction_score"):
			type = Type.FACTION_SCORE
		elif value.match("gold"):
			type = Type.GOLD
		else:
			print("Invalid goal type: ", value)

enum Type {
	UNKNOWN
	EXPERIENCE
	ITEM
	TRIGGER_ACTIVATED
	TRIGGER_DEACTIVATED
	FACTION_SCORE
	GOLD
}
